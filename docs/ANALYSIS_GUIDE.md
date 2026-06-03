# FM26 RTE 빠른 분석 가이드

작성일: 2026-05-12

이 문서는 다음 분석자가 `node_modules`, Rust `target`, JDK, Cheat Engine 소스, IL2CPP 덤프에 시간을 쓰지 않고 바로 핵심으로 들어가기 위한 출발점이다.

## 토큰 절약 작업 루프

반복 작업은 아래 순서로 처리한다. 전체 파일을 길게 읽지 말고 `rg`로 지점만 잡은 뒤 필요한 블록만 연다.

1. 요청 분류:
   - UI/문구/번역: `src/App.tsx`, `src/App.css`, `src/appData.ts`
   - EXE/localhost/배포: `package.json`, `vite.config.ts`, `src-tauri/tauri.conf.json`, `scripts/`
   - 메모리 R/W/필드: `src-tauri/src/lib.rs`, `process.rs`, `fields.rs`
   - 스카우팅: `src-tauri/src/scouting.rs`, `comparisons.rs`, `src/App.tsx`
2. 검색:
   ```powershell
   rg -n "사용자문구|관련키|command명" apps/fm26-player-editor/src apps/fm26-player-editor/src-tauri/src
   ```
3. 수정 범위:
   - UI는 가능하면 `App.tsx` 구조 유지, 큰 리팩터링 금지.
   - 라벨/목록은 `appData.ts` 우선.
   - 크기/밀도/간격은 `App.css` 우선.
   - EXE 안정화는 `cargo build` 직접 호출 금지, npm script만 사용.
4. 검증:
   ```powershell
   cd apps/fm26-player-editor
   npm run lint
   npm run build
   ```
5. 사용자가 EXE 결과를 기대하면:
   ```powershell
   npm run exe:build
   ```
   설치 파일까지 말했거나 release 산출물 갱신이 필요하면:
   ```powershell
   npm run installer:build
   ```

## 반복 작업별 지름길

### UI 밀도/문구/번역

- 먼저 찾기:
  ```powershell
  rg -n "표시문구|trait_|PageTitle|AttributesView|PrivateView|TraitsView" apps/fm26-player-editor/src
  ```
- 주로 고치는 곳:
  - `App.tsx`: 화면 제목, 탭 이름, 상태 문구, JSX 구조.
  - `App.css`: 폰트 크기, input 크기, grid columns, padding/gap.
  - `appData.ts`: 능력치/포지션/선호 플레이 라벨과 그룹.
- 선호 플레이는 `appData.ts`의 `traitGroups`와 `src-tauri/src/fields.rs`의 `trait_*` 키가 맞아야 한다. backend에 없는 키는 UI에 추가하지 않는다.

### CA/PA 노출 제어

- 선수 에디터에서 직접 노출 금지. `ca`, `pa`는 `appData.ts`의 hidden field로만 둔다.
- `scan_player`가 반환하는 `ca`, `pa`는 스캔 검증/스카우팅용으로 유지 가능.
- 사이드바, 최근 검색, 즐겨찾기에서 CA/PA 표시나 저장을 새로 만들지 않는다.
- 스카우팅 센터는 기존처럼 CA/PA 구간/수치를 사용할 수 있다.

### EXE가 localhost를 찾는 문제

- 원인 후보: `cargo build --release` 직접 호출, `dist` 미내장, Vite 절대 asset path.
- 확인 지점:
  ```powershell
  rg -n "exe:build|tauri build|cargo build|base:|frontendDist|devUrl" apps/fm26-player-editor
  ```
- 원칙:
  - `vite.config.ts`는 `base: './'`.
  - `exe:build`는 `tauri build --no-bundle --ci`.
  - release EXE는 `npm run exe:build`로 만든다.
  - 설치 파일은 `npm run installer:build`.

### EXE 복사 실패 `EBUSY`

- 대개 기존 EXE가 실행 중이다.
  ```powershell
  Get-CimInstance Win32_Process | Where-Object { $_.ExecutablePath -like '*FM26-Player-Editor.exe' -or $_.ExecutablePath -like '*fm26-rte.exe' } | Select-Object ProcessId,Name,ExecutablePath
  ```
- 해당 앱 프로세스만 종료 후 복사 스크립트 재실행:
  ```powershell
  Stop-Process -Id <pid> -Force
  node scripts/copy-latest-exe.mjs
  ```

### 문서 갱신 기준

- 반복될 함정은 `docs/ANALYSIS_GUIDE.md`에 짧게 추가한다.
- 장기 히스토리/주의점만 `docs/HANDOFF.md`에 추가한다.
- 사용자가 바로 써야 하는 명령은 `apps/fm26-player-editor/README.md`에도 반영한다.

## 먼저 볼 것

1. `README.md` - 프로젝트 지도와 실행 파일 위치.
2. `docs/HANDOFF.md` - 히스토리, 제약, 리버스엔지니어링 맥락.
3. `apps/fm26-player-editor/README.md` - 현재 Tauri 앱 실행/빌드/배포.
4. 이 문서 - 빠른 검색 범위와 현재 코드 지도.

## 빠른 검색

루트에 `.ignore`를 추가했다. 일반 분석은 아래 명령으로 시작하면 무거운 폴더를 피한다.

```powershell
rg --files
rg -n "connect_fm|scan_player|read_field|apply_changes" apps/fm26-player-editor
rg -n "TODO|FIXME|NEXT|panic!|unwrap\(|expect\(" apps/fm26-player-editor docs research/reverse-engineering
```

대형 덤프나 vendored 도구까지 검색해야 할 때만 명시적으로 ignore를 끈다.

```powershell
rg --no-ignore -n "PersonReference" research/il2cpp-dump
```

## 현재 제품 앱

현재 작업 기준은 `apps/fm26-player-editor/`다. `archive/legacy-winforms-rte/`는 참고 구현이고 새 기능의 주 작업 대상이 아니다.

```powershell
cd apps/fm26-player-editor
npm run lint
npm run build
npm run exe:build
```

주의: release EXE는 `cargo build --release`를 직접 호출하지 말고 `npm run exe:build`로 만든다. 그래야 Tauri가 `dist`를 내장해서 실행 시 `localhost:1420` 개발 서버를 찾지 않는다.

설치 파일까지 갱신할 때는 아래 명령을 쓴다.

```powershell
npm run installer:build
```

개발 실행:

```powershell
cd apps/fm26-player-editor
npm run dev
```

Tauri 네이티브 실행:

```powershell
cd apps/fm26-player-editor
npm run tauri:dev
```

## 코드 지도

- `apps/fm26-player-editor/src/App.tsx` - React UI 본체. 현재 큰 단일 파일이다. UID 검색, 선수 편집, 스카우팅, 클럽/예산 관련 화면 상태가 함께 있다.
- `apps/fm26-player-editor/src/appData.ts` - 프론트 필드 정의와 UI용 정적 데이터.
- `apps/fm26-player-editor/src/App.css` - 앱 전체 스타일.
- `apps/fm26-player-editor/src-tauri/src/lib.rs` - Tauri command와 메모리 분석/스캔 오케스트레이션. 가장 중요한 백엔드 진입점.
- `apps/fm26-player-editor/src-tauri/src/process.rs` - Windows `OpenProcess`/`ReadProcessMemory`/`WriteProcessMemory`, region enumeration.
- `apps/fm26-player-editor/src-tauri/src/fields.rs` - CT 기반 필드 카탈로그, 오프셋, 읽기/쓰기 코덱.
- `apps/fm26-player-editor/src-tauri/src/scouting.rs` - 스카우팅 리포트 계산/요약.
- `apps/fm26-player-editor/src-tauri/src/comparisons.rs` + `comparison_map.txt` - 비교 문구/참조 데이터.
- `apps/fm26-player-editor/src-tauri/src/media.rs` - 선수 얼굴 파일 탐색.
- `apps/fm26-player-editor/src-tauri/src/noise.rs` - 스카우터 능력 기반 표시값 오차.

## Tauri command 표면

`src-tauri/src/lib.rs`의 `tauri::generate_handler!`가 현재 프론트에서 호출 가능한 백엔드 API 목록이다.

- `app_status`, `list_fields`, `set_game_date`
- `connect_fm`, `scan_player`, `read_field`, `read_all_fields`, `apply_changes`
- `collect_club_player_uids`, `identify_club`, `build_scouting_report`
- `read_player_face`
- `read_club_balance`, `read_scouting_budget`, `deduct_scouting_budget`, `deduct_scouting_cost`

## 리버스엔지니어링 자료 사용법

- `research/reverse-engineering/PLAYER_STATS_OFFSETS.md` - 선수 필드 오프셋을 확인할 때 최우선.
- `research/reverse-engineering/FM26_CE_EDITABLE_ITEMS.md` - Cheat Table에서 추출한 수정 가능 항목 전체 표.
- `research/reverse-engineering/FM26_CE_VALUE_RECORDS.csv` / `FM26_CE_SCRIPT_RECORDS.csv` - 자동 처리나 diff용 원천 표.
- `research/reverse-engineering/ce_lua_decompiled/` - CT Lua 디컴파일 결과. 크지만 텍스트라 필요 시 검색 가능.
- `research/reverse-engineering/trace/` - Frida 하니스. `trace.log`류는 기본 검색에서 제외했다.
- `research/il2cpp-dump/` - 매우 큰 정적 분석 자산. 일반 분석에서는 제외하고, 타입/메서드/RVA 확인이 필요할 때만 직접 지정해서 검색한다.

## 현재 주의점

- 이 디렉터리는 현재 `.git`이 없는 작업 폴더라 `git status`로 변경 추적이 되지 않는다.
- `fm.exe` 메모리 R/W는 관리자 권한 실행이 필요하다.
- BepInEx/DLL 인젝션은 프로젝트 방향에서 제외되어 있다. 외부 프로세스 메모리 R/W만 사용한다.
- `archive/legacy-winforms-rte/PlayerEditModel.cs`, `PlayerPointerScanner.cs`, `Target.cs`는 새 Rust/Tauri 구현 검증용 참고 소스로만 본다.
- 대형 파일 검색은 의식적으로 범위를 좁힌다. 특히 `script.json`, `il2cpp.h`, `trace_no_writes.log`, `node_modules`, `target`는 기본 검색 대상이 아니다.
