# fm26-rte 인수인계 문서

작성일: 2026-05-02

## 2026-05-12 분석 최적화 메모

- ✅ 반복 작업 런북을 `docs/ANALYSIS_GUIDE.md` 상단에 정리했다. 다음 유사 작업은 이 순서만 따라도 된다:
  1. 요청 분류: UI/배포/메모리/스카우팅
  2. `rg`로 관련 지점만 검색
  3. `App.tsx`/`App.css`/`appData.ts` 또는 `src-tauri/src/*.rs`만 좁게 수정
  4. `npm run lint && npm run build`
  5. EXE 필요 시 `npm run exe:build`, 설치 파일 필요 시 `npm run installer:build`
- ✅ `docs/ANALYSIS_GUIDE.md` 추가: 다음 분석자는 이 문서를 먼저 보고 빠른 검색 범위/코드 지도를 확인할 것.
- ✅ 루트 `.ignore` 추가: `rg --files`, `rg -n ...` 기본 검색에서 `node_modules`, Rust `target`, JDK, Cheat Engine 소스, IL2CPP 덤프, trace log, release exe를 제외.
- ✅ 현재 실제 앱은 `apps/fm26-player-editor/` 기준이며, `src-tauri/src/lib.rs`에는 기존 MVP 외에 스카우팅 리포트, 클럽 식별, 선수 얼굴, 스카우팅 예산 관련 command까지 들어가 있다.
- ✅ EXE 안정화: `exe:build`는 `cargo build --release` 직접 호출 대신 `tauri build --no-bundle --ci`를 사용한다. release EXE가 `localhost:1420` 개발 서버가 아니라 내장된 `dist`를 로드하게 하기 위함.
- ✅ 설치 파일 갱신 안정화: `npm run installer:build`를 추가해 release EXE 빌드 후 `src-tauri/manual-installer.nsi`로 NSIS 설치 파일을 만들고 `artifacts/release/`에 복사한다.
- 주의: 이 폴더는 현재 `.git`이 없는 작업 폴더라 변경 추적은 `git status`가 아니라 파일 직접 확인이 필요하다.

빠른 시작:

```powershell
Get-Content docs/ANALYSIS_GUIDE.md
rg --files
rg -n "connect_fm|scan_player|read_field|apply_changes" apps/fm26-player-editor
```

## 목표

Football Manager 26의 실행 중인 fm.exe 프로세스 메모리에 외부 EXE에서 직접 접근(`OpenProcess` + `ReadProcessMemory` + `WriteProcessMemory`)해서 선수 능력치를 조회/수정하는 도구. **BepInEx / DLL 인젝션 안 씀** — 사용자 요구사항.

참고 도구: `FMKEDT26-v2.0-win-x64-standalone/FMKEDT26.exe` (FMKOREA.COM 학원장 작품). 같은 일을 하는 .NET 10 NativeAOT 빌드의 외부 에디터.

## 현재 상태 (요약)

- ✅ 정적 분석으로 FMKEDT26은 **NativeAOT** 확인 — 일반 디컴파일러 무력. Ghidra 풀 RE는 비용 큼.
- ✅ Frida로 **동적 트레이스** 환경 구축, 1차 캡처 완료 (`research/reverse-engineering/trace/trace_no_writes.log`, 12만 이벤트). RPM/VQE 패턴은 잡혔지만 **WPM 누락** (Apply가 비활성).
- ✅ 트레이스 분석으로 fmkedt26의 알고리즘 파악:
  1. `OpenProcess(fm.exe, access=0x438)` (= VM_READ|VM_WRITE|VM_OPERATION|QUERY_INFO)
  2. VirtualQueryEx로 commited region 워크 (~6,400개)
  3. 64KB~1MB 청크로 RPM bulk scan (~6,500회)
  4. 어떤 패턴 매치 후 `0xFA___` 영역의 한 위치에서 IL2CPP 힙 포인터(`0x26F___`) 추출
  5. IL2CPP 힙 안에서 8바이트 포인터 체인 따라가기 → 필드 읽기
  6. 모든 RPM이 단일 caller `0x7ff767c99685`에서 호출됨 (한 디스패처 함수)
- ✅ **v0 외부 에디터 빌드 완료 & 동작** (`archive/legacy-winforms-rte/`):
  - 사용자가 관리자 권한으로 실행 → fm.exe 연결 성공 (Win32 5 access denied 해결됨)
  - UID `2002074288` (David Beedle) 검색 → **413 hits**
  - 단, 어떤 hit가 진짜 Person 레코드인지 모름 (필드 오프셋 정보 부족)
- 🔵 **NEXT**: 사용자가 fmkedt26 쓰기 방법을 새로 알아냈다고 함. **WPM 재캡처**가 즉시 다음 작업.

## 2026-05-05 업데이트

- ✅ tdg6661 FM26 Cheat Table의 임베디드 Lua를 디코드/정규화/디컴파일 완료 (`research/reverse-engineering/ce_lua_decompiled/`).
- ✅ CT 전체 수정 가능 항목을 추출해 표로 정리:
  - `research/reverse-engineering/FM26_CE_EDITABLE_ITEMS.md`
  - `research/reverse-engineering/FM26_CE_VALUE_RECORDS.csv`
  - `research/reverse-engineering/FM26_CE_SCRIPT_RECORDS.csv`
  - `research/reverse-engineering/extract_ce_editable_items.py`
- ✅ 선수 핵심 오프셋 정리:
  - `research/reverse-engineering/PLAYER_STATS_OFFSETS.md`
  - `ptrPlayer`: CA/PA, 능력치, 포지션 적합도, 체력/사기
  - `ptrPerson`: 선호 플레이/Player Traits bitfield
- ✅ 새 MVP 방향 확정:
  - UID로 선수 찾기
  - 카테고리 우선 UI
  - 필드 값은 클릭 시에만 lazy read
  - 한 필드씩 apply/revert
- ✅ 새 CT 기준 필드/코덱 기반 추가:
  - `archive/legacy-winforms-rte/PlayerEditModel.cs`
  - `archive/legacy-winforms-rte/PlayerPointerScanner.cs`
  - `archive/legacy-winforms-rte/MvpMainForm.cs`
  - `archive/legacy-winforms-rte/MVP_FOUNDATION.md`
- ✅ `Program.cs` 기본 실행 폼을 새 MVP UI인 `MvpMainForm`으로 전환.
- ✅ 기본 UI 언어를 한국어로 전환:
  - `archive/legacy-winforms-rte/MvpMainForm.cs`: 버튼/상태/섹션/메시지 한국어화
  - `archive/legacy-winforms-rte/PlayerEditModel.cs`: 선수 능력치/포지션/선호 플레이 라벨 한국어화
- ✅ 배포용 앱 방향을 **Tauri + React**로 전환:
  - `apps/fm26-player-editor/`: React/TypeScript/Vite/Tauri 2 기반 새 앱 셸
  - 첫 화면은 랜딩 페이지가 아니라 실제 선수 편집 작업공간
  - 능력치: 기술/정신/신체 3열 구성
  - 포지션 적합도: 피치 위 실제 포지션 위치 기반 배치
  - 선호 플레이: 종류별 태그 그룹
  - 비공개/숨김 수치: 사용자가 명시적으로 열 때만 표시
  - 현재는 mock UI이며, 실제 fm.exe 메모리 R/W 백엔드는 아직 연결 전

- ✅ Tauri/Rust 백엔드 MVP 연결 추가:
  - `connect_fm`: `fm.exe` 프로세스 탐색 및 R/W 핸들 열기
  - `scan_player`: UID 기반 `ptrPerson`/`ptrPlayer` 탐색
  - `read_field`: 개별 필드 lazy read
  - `apply_changes`: 변경 대기 항목 메모리 쓰기
- ✅ 실행 가능한 산출물 생성:
  - 사용자가 바로 확인할 파일은 `artifacts/release/`에 복사해 둠
  - 본체: `artifacts/release/FM26-Player-Editor.exe`
  - 관리자 실행 helper: `artifacts/release/Run-FM26-Player-Editor-As-Admin.bat`
  - 설치 파일: `artifacts/release/FM26-Player-Editor-Setup.exe`

주의: Rust toolchain, Visual Studio C++ Build Tools, NSIS가 설치되었다. Tauri 자체 NSIS 번들러는 GitHub NSIS 패키지 다운로드 타임아웃이 있어 `src-tauri/manual-installer.nsi`로 수동 설치 파일을 생성했다.

## 2026-05-05 폴더 정리

- ✅ 이전 WinForms 실험 폴더를 `archive/legacy-winforms-rte/`에 보관.
- ✅ 참고용 외부 에디터를 `archive/reference-FMKEDT26-v3.0-win-x64-standalone/`에 보관.
- ✅ 무거운 빌드 캐시 삭제:
  - `apps/fm26-player-editor/src-tauri/target/` 삭제
  - 필요하면 `cargo build --release`로 재생성
- ✅ 루트 `README.md` 추가:
  - 현재 앱 위치, release 파일, 보관 폴더 안내

## 2026-05-09 폴더 재정리

- ✅ 현재 앱을 `apps/fm26-player-editor/`로 이동.
- ✅ 실행 산출물을 `artifacts/release/`로 이동.
- ✅ 인수인계 문서를 `docs/HANDOFF.md`로 이동.
- ✅ 리버스엔지니어링 자료를 `research/reverse-engineering/`, `research/il2cpp-dump/`, `research/cheat-table-tdg6661/`로 분리.
- ✅ 이전 구현/백업은 `archive/`, 로컬 분석 도구는 `tools/`, 일회성 실험은 `workspace/scratch/`로 분리.
- ✅ Rust 빌드 캐시 `apps/fm26-player-editor/src-tauri/target/`는 구조 이동 후 stale 절대 경로가 남아 삭제.

주의: 기존 `archive/legacy-winforms-rte/PlayerFields.cs`는 UID 주소 기준 실험용/legacy 필드맵이다. 새 MVP UI는 `PlayerEditModel.cs`의 `PlayerEditCatalog`를 기준으로 구현할 것.

주의: 앞으로 UI는 `archive/legacy-winforms-rte/` WinForms를 계속 확장하지 말고 `apps/fm26-player-editor/`를 기준으로 진행한다. `archive/legacy-winforms-rte/`의 값 카탈로그, UID 스캐너, CT 기반 코덱은 이미 Rust/Tauri backend에 1차 포팅되었고, 누락 필드/검증 보강 시 참고 소스로만 사용한다.

## 빌드된 것

### `archive/legacy-winforms-rte/` — 새 외부 에디터 (v0)

- C# 12 / .NET 8 (`net8.0-windows`) / WinForms / x64 / 외부 의존성 0
- `Native.cs` — kernel32/advapi32 P/Invoke + SeDebugPrivilege enable 헬퍼
- `Target.cs` — 프로세스 핸들 보유, 타입별 R/W, region enumeration. **fallback access flag 시도 + 진단 메시지** 내장
- `PlayerFields.cs` — Person Record 필드 오프셋 단일 정의 (FieldDef + FieldCat + AllFields). MainForm/InspectorForm 모두 여기 참조
- `MainForm.cs` — fm.exe 자동 연결, UID 입력 → CA/PA/BirthYear 휴리스틱 검증으로 진짜 Person Record 1개 자동 픽, 카테고리별 필드 에디터 패널 (Core/Hidden/PPM/Attr/Position)
- `InspectorForm.cs` — hex viewer (64B 앞 + 256B 뒤), 디코드 (uint8/16/32, int, float, ptr), 클릭-바이트로 편집 + 확인 다이얼로그 후 WPM. Known Fields 패널은 PlayerFields의 Core/PPM 서브셋 자동 표시
- `Program.cs` — WinForms 엔트리

빌드: `cd archive/legacy-winforms-rte && dotnet build -c Debug` → `archive/legacy-winforms-rte/bin/Debug/net8.0-windows/FM26RTE.exe`
**관리자 권한으로 실행 필요** (fm.exe 메모리 R/W가 일반 사용자로 막힘 — Win32 5).

### `apps/fm26-player-editor/` — 새 배포용 앱 UI

- React 19 / TypeScript / Vite / Tauri 2 / lucide-react
- 실행:
  ```powershell
  cd apps/fm26-player-editor
  npm run dev
  ```
- 브라우저 확인 URL: `http://127.0.0.1:1420`
- 검증 완료:
  ```powershell
  npm run lint
  npm run build
  ```
- 빌드 안정화를 위해 Vite 7 계열로 고정했다. Vite 8 설치 상태에서는 Windows/Node 24 조합에서 변환 후 종료 코드 1로 조용히 실패하는 현상이 있었다.
- Tauri 네이티브 실행:
  ```powershell
  npm run tauri:dev
  ```
  단, Rust toolchain 설치 후 가능.

다음 포팅 순서:
1. `archive/legacy-winforms-rte/PlayerEditModel.cs`의 필드 카탈로그/코덱을 TypeScript 또는 Rust shared schema로 옮긴다.
2. `archive/legacy-winforms-rte/Target.cs`의 `OpenProcess`/`ReadProcessMemory`/`WriteProcessMemory`를 Rust backend 명령으로 포팅한다.
3. `archive/legacy-winforms-rte/PlayerPointerScanner.cs`의 UID -> `ptrPerson`/`ptrPlayer` 스캔 로직을 Rust backend로 포팅한다.
4. React에서는 `connect_fm`, `scan_player`, `read_field`, `apply_changes` Tauri command만 호출하게 유지한다.

### `research/reverse-engineering/trace/` — Frida 동적 분석 하니스

- `hook.js` — kernel32 + ntdll 메모리 R/W API 23개 후크 (RPM/WPM/OpenProcess/VQE/VPE 등). 자기 프로세스 핸들 (-1) 노이즈 필터링, GetProcAddress 디듀프, RPC `mark` 익스포트로 페이즈 마커
- `run.py` — Frida 하니스. spawn 또는 attach 모드. 사용자가 Enter 누를 때마다 phase 마커 (`startup` / `connect` / `load_player` / `apply` / `done`)를 트레이스에 주입. JSONL을 `trace.log`에 line-buffered로 씀
- `trace.log`, `trace_no_writes.log` — 캡처 결과 (1차는 Apply 미동작)

> 일회용 분석 스크립트 (analyze*.py, diag_scan*.py, dump_*.py 등)와 fmkedt26 PE 추출 잔재 (`extract/`, `extracted/`, `extractor/`, `imports.txt`, `strings_*.txt`)는 2026-05-02 정리에서 제거됨. NativeAOT 정적 분석은 비용 대비 효과 없음으로 결론.

### `research/il2cpp-dump/` — 사전 IL2CPP 분석 자산 (귀중)

이전 BepInEx 단계의 산출물. **건드리지 말 것**.
- `il2cpp.h` (56MB) — IL2CPP 타입 C struct 레이아웃
- `script.json` (126MB) — 타입/메서드/RVA/필드 오프셋
- `dumpperson.txt` 등 — 핵심 타입(`PersonReference`, `DataKey`, `InteropReference`) 메서드/필드 덤프
- 핵심 사실: **`PersonReference`는 데이터 소유자가 아님** — 단지 `{m_index: int32, _Type: enum}` 래퍼. 실제 데이터는 native `TryGetProperty(uid, out value)` 룩업이 글로벌 DB에서 가져옴. 외부 에디터는 글로벌 DB 위치 + m_index → row 매핑을 풀어야 함.

### `tools/` — 로컬 분석 도구

Cheat Engine 소스, JDK, Lua 디컴파일 도구 등 로컬 분석용 도구 보관. 앱 런타임 경로는 아님.

## 환경

- Windows 11
- Python 3.14 (`py` launcher 권장. `python` 은 Microsoft Store stub 문제 있음) + `frida-tools 14.8.2` + `frida 17.9.3`
- .NET 8 SDK (.NET 10 SDK 없음 — fmkedt26 빌드는 못 함, 우리 자체 도구는 net8 타깃이라 OK)
- x64dbg 설치됨 (winget) — 미사용
- ilspycmd 8.2 설치됨 (.NET 10 NativeAOT엔 무력)
- Ghidra/IDA 미설치
- PowerShell 한글 콘솔 — taskkill 출력 깨짐 정도 외엔 영향 없음. `py -u` 로 unbuffered 권장.

## 즉시 다음 작업

**WPM 재캡처.** 사용자가 fmkedt26 Apply 작동 방법 알아냄.

1. fmkedt26 / FM26RTE 인스턴스 모두 종료 (관리자 권한 인스턴스라 IDE/터미널에서 못 죽임 — 사용자 직접 종료 필요)
2. FM26은 띄운 채로, 세이브 로드 상태 유지
3. ```bash
   cd c:/Users/신민석/dev/fm26-rte/research/reverse-engineering/trace
   py run.py spawn
   ```
4. fmkedt26에서 Connect → Load Player → 값 변경 → **Apply (이번엔 진짜로 동작)** → Ctrl+C
5. 매 단계 후 터미널 Enter로 phase 마커 찍을 것 (`startup`/`connect`/`load_player`/`apply`/`done`)
6. **반드시 받을 것**: 사용자가 어떤 필드를 어떤 값에서 어떤 값으로 바꿨는지 (예: "Squad Number 5→99")

WPM 한두 번 잡히면 즉시:
- 절대 쓰기 주소 → 필드 오프셋 확정
- 그 주소를 포함하는 region이 진짜 Person 레코드 위치
- v0 (`archive/legacy-winforms-rte/`)의 413 hits 중 그 주소 포함하는 hit가 정답
- 추출된 (offset, type, label) 튜플들을 `archive/legacy-winforms-rte/`에 "알려진 필드 맵"으로 하드코딩 → v1로 진화

## 알려진 함정

- **fm.exe 메모리 R/W는 관리자 권한 필요.** 일반 권한이면 OpenProcess 0x438이 Win32 5 (access denied)로 실패. fm.exe DACL 보호 추정. SeDebugPrivilege 자동 enable 코드 있지만 일반 사용자 토큰엔 해당 특권 없어서 실효 없음. 사용자한테 우클릭 → 관리자 실행 안내가 정답.
- **Frida 17 API 변경**: `Module.findExportByName` 제거됨. 대신 `Process.findModuleByName(...).findExportByName(...)` 또는 `Module.findGlobalExportByName(...)` 사용.
- **fmkedt26 디컴파일 시도하지 말 것** — NativeAOT라 ilspycmd / dnSpy 다 무력. 시간 낭비. 동적 분석(Frida)이 정도.
- **자기 프로세스 핸들 노이즈**: NtRPM/NtQVM 호출 중 handle == -1 (`0xffffffffffffffff`)인 것은 .NET 런타임 자체의 self-process 액세스. cross-process 분석에선 필터링 필수 (이미 `hook.js`에 반영됨).
- **413 hits는 정상.** UID는 fm.exe 메모리에 수십~수백 군데 박힘 (스쿼드 리스트, 매치, 계약 등). 진짜 데이터 1~3개 + 참조 다수. WPM 트레이스로 좁혀야 함.
- **research/il2cpp-dump/ 폴더는 정적 분석 자산.** 절대 지우거나 변형하지 말 것. il2cpp.h / script.json은 v1 작업의 핵심 참조 자료.
- **세이브 백업.** WPM 실험 시 잘못 쓰면 세이브 손상 가능. 사용자에게 매번 안내.

## 사용자 컨텍스트

- 한국어 사용. 짧고 직설적인 보고 선호.
- 관리자 권한 실행 등 시스템 차원의 액션은 명확히 안내해야 함.
- fmkedt26을 reverse engineering 한다는 점 명시적으로 허가됨 (사용자 본인의 사용 목적, 자신의 세이브에 한정).
- BepInEx 방식 명시적으로 거부함 — 외부 메모리 R/W 외 다른 접근 제안 금지.

## 메모리 파일 (Claude `/memory/`)

- `project_pivot.md` — BepInEx → 외부 EXE 전환 배경
- `fmkedt26_packaging.md` — NativeAOT 진단 결과
- `dump_folder_value.md` — research/il2cpp-dump/ 자료 가치
- `v0_architecture.md` — archive/legacy-winforms-rte/ 설계

