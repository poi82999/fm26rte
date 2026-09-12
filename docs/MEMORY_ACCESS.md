# FM26 런타임 메모리 접근 — 데이터 오프셋 정리

> Football Manager 26 (`fm.exe`, EXE `26.3.0.0`, 모듈 `game_plugin.dll` `26.3.0`)이
> **실행 중일 때** 외부 프로세스에서 게임 내 객체(선수·구단·국가 등)에 접근하는 방법과
> 검증된 메모리 오프셋을 정리한 문서.
>
> 구현 코드: [apps/fm26-player-editor/src-tauri/src/](../apps/fm26-player-editor/src-tauri/src/)
> 오프셋 1차 출처: FMCET 치트테이블 디컴파일 (`research/cheat-table-tdg6661/lib/FMCETableEnums.lua`).

---

## 1. 전체 아키텍처

BepInEx/IL2CPP 인젝션을 쓰지 않는다. **별도 프로세스에서 `fm.exe`를 열어 메모리를
직접 R/W**하는 방식이다 (Cheat Engine 과 동일한 접근, AOB 패치 없이 데이터만 읽고 씀).

```
[Tauri/Rust 앱]  --OpenProcess-->  [fm.exe]
      |                                 |
      |  ReadProcessMemory  ----------> | IL2CPP 객체 그래프
      |  WriteProcessMemory ----------> | (Person/Player/Club/Nation...)
```

게임은 IL2CPP(Unity) 빌드이므로 모든 게임 객체는 **vtable 포인터로 시작하는 C++ 스타일
레코드**다. 절대 주소는 ASLR로 매 실행마다 바뀌므로, **고정 주소 대신 UID를 메모리에서
스캔**해 객체 베이스를 찾는다 (4절).

핵심 모듈:

| 파일 | 역할 |
|---|---|
| [process.rs](../apps/fm26-player-editor/src-tauri/src/process.rs) | OpenProcess / R·W / 영역 열거 / 권한 / AOB 스캔 |
| [lib.rs](../apps/fm26-player-editor/src-tauri/src/lib.rs) | UID 스캔, 객체 해석, 오프셋 상수, Tauri 커맨드 |
| [fields.rs](../apps/fm26-player-editor/src-tauri/src/fields.rs) | 편집 가능 필드 정의(오프셋·타입·범위), FM Attribute 인코딩 |

---

## 2. 프로세스 연결과 권한

[process.rs](../apps/fm26-player-editor/src-tauri/src/process.rs) 기준.

1. **프로세스 탐색** — `CreateToolhelp32Snapshot` + `Process32First/NextW`로 `fm.exe`의 PID를 찾는다.
2. **권한 상승** — `SeDebugPrivilege` 활성화 시도 (`OpenProcessToken` → `AdjustTokenPrivileges`).
   실패해도 진행은 하되, 보통 **앱을 관리자 권한으로 실행**해야 핸들이 열린다.
3. **핸들 오픈** — `OpenProcess`를 권한 강도 순서로 시도. R/W 편집에는 다음 조합이 필요:
   ```
   PROCESS_VM_READ | PROCESS_VM_WRITE | PROCESS_VM_OPERATION | PROCESS_QUERY_INFORMATION  (= 0x438)
   ```
   읽기 전용으로 떨어지면 편집 불가 → 사용자에게 관리자 실행 안내.
4. **R/W 프리미티브** — `ReadProcessMemory` / `WriteProcessMemory` 래퍼:
   `read_u8/u16/i16/u32/i32/usize`, `write`. 모두 little-endian. 8바이트 = 포인터(x64).

**메모리 영역 열거** (`readable_regions`): `VirtualQueryEx`로 전 주소 공간을 훑어
`MEM_COMMIT` & 읽기 가능(`PAGE_GUARD` 제외) 영역만 수집한다. UID 스캔의 탐색 범위가 된다.

---

## 3. 객체 모델 (IL2CPP 레코드)

모든 게임 객체는 다음 공통 구조를 가진다:

```
object + 0x00 : vtable 포인터  ──┐
object + 0x0c : UID (u32, "DUNI") │ OBJ_DUNI = 0x0c
                                  │
vtable - 0x08 : 메타데이터 포인터 ─┘
   meta + 0x04 : dynamic offset (i32)   ← Person↔Player 보정값
```

- `OBJ_DUNI = 0x0c` — 객체 베이스로부터 UID 위치. 스캔의 기준점.
- **dynamic offset** (`read_dynamic_offset`): `vtable-8`의 메타 포인터에서 `+4`의 i32를 읽는다.
  같은 사람이라도 "선수냐 스태프냐"에 따라 Person→Player/Staff 베이스 간 거리가 다르므로,
  이 값으로 객체 종류를 판별하고 베이스를 역산한다.

### Person ↔ Player ↔ Staff 보정 (dynamic offset 값)

| 상수 | 값 | 의미 |
|---|---:|---|
| `PLAYER_OFFSET` | `0x288` | 순수 선수: `player = person - 0x288` |
| `STAFF_OFFSET` | `0x100` | 스태프 |
| `PLAYER_STAFF_OFFSET` | `0x380` | 선수 겸 스태프 |
| `HUMAN_MANAGER_OFFSET` | `0x450` | 유저(인간) 감독 |

즉 UID로 찾은 주소는 **Person 베이스**이고, dynamic offset을 빼면 **Player 베이스**가 된다.
선수 스탯(CA/PA/능력치)은 Player 베이스 기준, 성격·특성·이름은 Person 베이스 기준이다.

---

## 4. UID-as-signature 스캔

`fmkedt26` 리버싱이 막혀 있어, **UID를 4바이트 시그니처로 메모리에서 직접 검색**한다.
([lib.rs](../apps/fm26-player-editor/src-tauri/src/lib.rs) `find_player_by_uid` / `find_players_by_uids`)

알고리즘:
1. `readable_regions`로 후보 영역 수집 (256MB 초과 영역은 스킵).
2. 영역 바이트를 읽어 UID(LE u32)와 일치하는 위치를 찾는다.
3. 일치 지점 `i`에서 `person = base + i - OBJ_DUNI` (UID는 객체 +0x0c에 있으므로).
4. `try_resolve_from_person`으로 **검증**:
   - `person + 0x0c`의 UID가 다시 일치하는지 재확인,
   - dynamic offset이 `PLAYER_OFFSET(0x288)` 또는 `PLAYER_STAFF_OFFSET(0x380)`인지,
   - 역산한 `player + 0x264`(CA) / `+0x266`(PA)이 `1..=200` 범위인지.
   - 세 조건을 통과해야 진짜 선수 레코드로 인정 (false positive 제거).

구단/팀/국가도 동일한 "UID 스캔 + vtable·필드 이중 검증" 패턴을 쓴다
(`find_club_by_uid`, `find_team_by_uid`, `find_nation_candidates`).

---

## 5. 객체별 오프셋 표

> 출처: [lib.rs](../apps/fm26-player-editor/src-tauri/src/lib.rs) 상단 `const` 선언부.
> `/offsets` 스킬로 항상 최신 값 확인 가능.

### 5.1 공통

| 상수 | 값 | 설명 |
|---|---:|---|
| `OBJ_DUNI` | `0x0c` | 객체 → UID(u32) |

### 5.2 Person (사람 — 이름·국적·생일·성격)

| 상수 | 값 | 설명 |
|---|---:|---|
| `PERSON_FIRST_NAME` | `0x50` | 이름 (중첩 문자열) |
| `PERSON_SECOND_NAME` | `0x58` | 성 |
| `PERSON_COMMON_NAME` | `0x60` | 통용명 (있으면 우선) |
| `PERSON_NATION` | `0x68` | 국가 객체 포인터 |
| `PERSON_DOB` | `0x88` | 생년월일 |
| `PPRM` (fields.rs) | `0xc0` | 선수 특성 비트필드 베이스 (Person 기준) |

### 5.3 Player (선수 — 스탯, Player 베이스 기준)

| 항목 | 오프셋 | 타입 | 비고 |
|---|---:|---|---|
| CA (현재 능력) | `0x264` | i16 | 1–200 |
| PA (잠재 능력) | `0x266` | i16 | 1–200 |
| 현재 명성 | `0x260` | i16 | |
| 국내 명성 | `0x25e` | i16 | |
| 월드 명성 | `0x262` | i16 | |
| 컨디션 | `0x258` | i16 | |
| 경기 샤프니스 | `0x25c` | i16 | |
| 피로도 | `0x25a` | i16 | |
| 사기(morale) | `0x26c` | u8 | |
| `PATR` 능력치 베이스 | `0x15f` | u8×N | 각 능력치 = `player + 0x15f + stat_offset` |
| `PPOS` 포지션 베이스 | `0x150` | u8×N | 포지션 적합도 = `player + 0x150 + pos_offset` |
| 선호 중앙 포지션 | `0x276` | u8 | |

→ 능력치/포지션/특성의 **세부 오프셋 전표**는 [PLAYER_STATS_OFFSETS.md](../research/reverse-engineering/PLAYER_STATS_OFFSETS.md) 참조.

### 5.4 Nation (국가)

| 상수 | 값 | 설명 |
|---|---:|---|
| `NATION_REAL_NAME` | `0x18` | 진짜 국가 이름 (nato.Nnam) |
| `NATION_SHORT_NAME` | `0x20` | 약칭 |
| `NATION_NAME` | `0x30` | 국적명 (nato.Nnty — "이름"과는 다름) |
| `NATION_NTCT_PTR` | `0x108` | Ntct 서브구조체 포인터 |

**Ntct 서브구조체** (`nation + 0x108`을 역참조한 뒤):

| 상수 | 값 | 설명 |
|---|---:|---|
| `NTCT_YOUTH_RATING` | `0x864` | 유스 레이팅 (u8) |
| `NTCT_GAME_IMPORTANCE` | `0x79d` | 게임 importance (u8) |

### 5.5 Club / Team (구단·팀)

| 상수 | 값 | 설명 |
|---|---:|---|
| `CLUB_TEAMS` | `0x18` | 팀 목록(포인터 배열) |
| `CLUB_RECRUITMENT_TEAM` | `0x90` | 스카우팅 팀 |
| `CLUB_NAME` | `0xc0` | 구단명 |
| `CLUB_SHORT_NAME` | `0xc8` | 구단 약칭 |
| `TEAM_TYPE` | `0x28` | 팀 종류(1군/리저브/U21…, `team_type_label`) |
| `TEAM_CLUB` | `0x30` | 소속 구단 포인터 |
| `TEAM_PLAYERS` | `0x38` | 선수 목록(포인터 배열) |
| `TEAM_MANAGER` | `0x80` | 감독 |

### 5.6 Manager / Staff (감독·스카우팅 예산) — ⚠️ 미검증

| 상수 | 값 | 설명 |
|---|---:|---|
| `STAFF_ATTRS` | `0x10` | 스태프 능력치 베이스 |
| `MANAGER_SCOUTING_CENTRE` | `0x370` | 스카우팅 센터 |
| `MANAGER_SCOUTING_BUDGET` | `0xde0` | 시즌 스카우팅 예산 |
| `MANAGER_RECRUITMENT_PACKAGE` | `0xdec` | 영입 패키지 |
| `MANAGER_FLAGS_1` | `0x404` | 매니저 플래그 |

---

## 6. 문자열 읽기 규칙

FM의 문자열은 **포인터를 한두 번 역참조한 뒤 +4 위치부터 null-terminated UTF-8**로 저장된다.
([lib.rs](../apps/fm26-player-editor/src-tauri/src/lib.rs) `read_fm_*_string`)

- **중첩(nested) 문자열** (이름 등): `addr → *addr(outer) → *outer(inner) → inner+4`부터 읽음.
- **간접(indirect) 문자열** (국가명 등): `addr → *addr(ptr) → ptr+4`부터 읽음.
- 앞 4바이트는 길이/메타로 추정되며, 실제 텍스트는 `+4`부터 시작. 최대 128바이트, null에서 종료.

---

## 7. FM Attribute 인코딩 (×5 규칙)

`PATR` 영역의 능력치 바이트는 **표시값의 5배**로 저장된다.
([fields.rs](../apps/fm26-player-editor/src-tauri/src/fields.rs), `ValueKind::FmAttribute`)

```
표시값 읽기:  display = round(raw_byte / 5)      // floor(raw/5 + 0.5)
표시값 쓰기:  raw_byte = display * 5
```

예: 능력치 14 → 메모리에는 `70(0x46)` 저장. 명성·CA·PA 등 i16 값은 이 변환을 쓰지 않는다.

---

## 8. 검증 상태

| 분류 | 상태 | 근거 |
|---|---|---|
| Player CA/PA/명성/능력치/포지션/특성 | ✅ 검증됨 | FMCET 치트테이블 활성 레코드 + 스캔 검증 통과 (`PLAYER_STATS_OFFSETS.md`) |
| Person 이름/국적/생일 | ✅ 검증됨 | 실제 이름 출력 확인 |
| Nation Youth Rating / Game Importance | ✅ 검증됨 | FMCET lua `nato`/`Ntct` 심볼표에서 추출, 편집기 동작 확인 |
| Club/Team 구조 (팀 목록·선수단·종류) | ✅ 검증됨 | 선수단 UID 수집 동작 |
| Manager 스카우팅 예산 `0xde0`/`0x14`/`0x150` 등 | ❓ 미검증 | 코드 주석상 unverified, 실제 게임 대조 필요 |

> 검증 상태는 코드 주석(`// verified` / `// unverified` / `TODO`)과 메모리 노트 기준.
> 오프셋 수정은 [lib.rs](../apps/fm26-player-editor/src-tauri/src/lib.rs)의 해당 `const` 줄만 Edit.

---

## 9. 출처 추적 (Source Trail)

- **1차 오프셋 출처**: FMCET 치트테이블 디컴파일 — `research/cheat-table-tdg6661/lib/FMCETableEnums.lua`
  (`plao`/`nato`/구단 오프셋), `FMCETableHelpers.lua` (`readFMAttribute` 등).
  분석 노트: [research/reverse-engineering/ANALYSIS.md](../research/reverse-engineering/ANALYSIS.md)
- **선수 스탯 전표**: [research/reverse-engineering/PLAYER_STATS_OFFSETS.md](../research/reverse-engineering/PLAYER_STATS_OFFSETS.md)
- **편집 가능 항목 목록**: research/reverse-engineering/FM26_CE_EDITABLE_ITEMS.md
- **IL2CPP 덤프**: `research/il2cpp-dump/`, `dump/` (타입/메서드 시그니처 대조용)
- **게임 버전 고정**: `fm.exe 26.3.0.0` / `game_plugin.dll 26.3.0`. 버전이 바뀌면 오프셋이
  깨질 수 있으므로 패치 시 FMCET 테이블 갱신본과 재대조 필요.
</content>
</invoke>
