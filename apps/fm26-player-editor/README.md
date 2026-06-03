# FM26 선수 에디터 - Tauri UI

FM26 실행 중 `fm.exe` 메모리를 읽고 쓰는 외부 선수 에디터의 새 배포용 앱입니다.

현재 상태는 Tauri/Rust 백엔드 MVP까지 연결된 빌드입니다.

## 실행

```powershell
npm install
npm run dev
```

개발 서버: `http://127.0.0.1:1420`

## 검증

```powershell
npm run lint
npm run build
```

`npm run build`는 현재 Windows/Node/Vite 조합에서 반복 빌드가 안정적으로 되도록 `dist` 폴더를 먼저 정리합니다.

## 최신 실행 파일 빌드

```powershell
npm run exe:build
```

빌드가 끝나면 Tauri가 `dist`를 내장한 release EXE를 만들고, 최신 실행 파일이 프로젝트 루트와 릴리스 폴더에 복사됩니다.

```text
../../FM26-Player-Editor.exe
../../artifacts/release/FM26-Player-Editor.exe
```

## Tauri 실행

```powershell
npm run tauri:dev
```

네이티브 빌드에는 Rust toolchain과 Visual Studio C++ Build Tools가 필요합니다.

## 배포 산출물

직접 실행 가능한 앱 본체:

```text
../../artifacts/release/FM26-Player-Editor.exe
```

설치/제거와 바로가기를 포함한 수동 NSIS 설치 파일:

```text
../../artifacts/release/FM26-Player-Editor-Setup.exe
```

관리자 권한 실행용 helper:

```text
../../artifacts/release/Run-FM26-Player-Editor-As-Admin.bat
```

Tauri 자체 NSIS 번들러가 GitHub에서 NSIS 3.11 패키지를 받다가 타임아웃되는 환경이 있어 `src-tauri/manual-installer.nsi`를 추가했습니다. 필요하면 아래처럼 설치 파일을 다시 만들 수 있습니다.

```powershell
npm run installer:build
```

## UI 원칙

- 기본 언어는 한국어.
- 첫 화면은 랜딩 페이지가 아니라 실제 편집 작업공간.
- 능력치는 FM 화면처럼 `기술 / 정신 / 신체` 3열로 표시.
- 포지션 적합도는 피치 위 실제 위치에 배치.
- 선호 플레이는 체크박스 대신 종류별 태그로 표시.
- 게임 내에서 직접 보이지 않는 수치는 사용자가 `값 보기`를 눌렀을 때만 노출.
- 변경사항은 즉시 쓰지 않고 `변경 대기`에 쌓은 뒤 일괄 적용.

## 백엔드

React UI는 Tauri command만 호출하고, 메모리 접근은 Rust backend에 둡니다.

구현된 command:

- `connect_fm()`: `fm.exe` 프로세스 열기
- `scan_player(uid)`: UID로 `ptrPerson`/`ptrPlayer` 찾기
- `read_field(field_key)`: 특정 필드 lazy read
- `apply_changes(changes)`: 대기 중 변경사항 메모리에 쓰기

참고 소스:

- `../../archive/legacy-winforms-rte/PlayerEditModel.cs`: 필드 카탈로그, 오프셋, 값 코덱
- `../../archive/legacy-winforms-rte/PlayerPointerScanner.cs`: UID 기반 선수 포인터 스캔
- `../../archive/legacy-winforms-rte/Target.cs`: Windows process memory R/W
