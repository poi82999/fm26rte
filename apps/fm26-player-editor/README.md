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

## 포토 스튜디오

내 구단 선수단을 페이스팩 얼굴 대신 **구단 유니폼을 입은 실사 인물 사진**으로 바꾸는 화면입니다.
이미지 생성은 앱이 하지 않습니다. 앱은 선수 데이터를 프롬프트로 조립해 주고, 사용자가 구독 중인
모델(ChatGPT / Gemini 등)에서 받은 결과물을 다시 앱에 넣는 구조입니다.

### 쓰는 순서

1. 접속 화면에서 내 구단 ID를 확인한 뒤 `포토 스튜디오` 탭으로 갑니다.
2. **유니폼 참조 이미지**를 등록합니다. FM 안의 킷 화면 캡처면 충분합니다.
   골키퍼 킷을 따로 등록하지 않으면, GK는 필드 킷의 구단 색만 빌려 다른 킷으로 그리라는
   지시가 프롬프트에 들어갑니다.
3. 선수단(1군/전체/U21…)을 골라 `스쿼드 불러오기`를 누릅니다.
4. 선수를 고르고 `프롬프트 복사`, 또는 `전체 내보내기`로 폴더를 만듭니다.
5. 모델 대화창에 **얼굴 이미지 → 유니폼 참조** 순서로 첨부하고 프롬프트를 붙여넣습니다.
6. 받은 이미지를 카드에 끌어다 놓거나(드래그 앤 드롭), 카드를 고른 상태에서 `Ctrl+V`로
   붙여넣습니다. 그 뒤로는 스카우팅 카드와 선수 편집 화면에서도 얼굴 대신 이 이미지가 나옵니다.

### 프롬프트가 담는 것

- 나이대별 얼굴 묘사(주름·피부결·수염·머리색)와 체격. FM의 나이/키/몸무게를 그대로 반영합니다.
- 포지션별 실루엣 힌트(GK 장신, CB 벌크, 윙어 슬림 등).
- 첨부한 얼굴 이미지와 **같은 사람으로 보이게** 유지하라는 지시. 미화·인종 변경·나이 조작 금지.
- 유니폼 참조 재현 지시. 스폰서 문구와 브랜드 로고는 비우도록 지시합니다.

선수 이름은 프롬프트 본문에 넣지 않습니다. 실존 선수 이름이 들어가면 모델이 참조 이미지 대신
자기가 아는 얼굴로 끌고 가거나 초상 정책에 걸립니다. 이름은 폴더명과 목록 파일에만 남습니다.

페이스팩에 얼굴이 없는 선수는 프롬프트가 국적·나이 서술로 대체되고, 카드에 `얼굴 없음` 배지가
붙습니다. 이 경우 생성할 때마다 다른 얼굴이 나옵니다.

### 파일 위치

```text
%USERPROFILE%\Documents\FM26 Player Editor\studio\
  kit\field.png          필드 유니폼 참조
  kit\keeper.png         골키퍼 유니폼 참조 (선택)
  generated\<uid>.png    생성 결과 — 이게 있으면 얼굴 대신 표시된다
  export\<구단>-<시각>\  내보낸 프롬프트 + 얼굴 이미지
```

`generated\<uid>.png`를 지우면 원래 페이스팩 얼굴로 돌아갑니다. 앱에서는 `되돌리기` 버튼입니다.

## 백엔드

React UI는 Tauri command만 호출하고, 메모리 접근은 Rust backend에 둡니다.

구현된 command:

- `connect_fm()`: `fm.exe` 프로세스 열기
- `scan_player(uid)`: UID로 `ptrPerson`/`ptrPlayer` 찾기
- `read_field(field_key)`: 특정 필드 lazy read
- `apply_changes(changes)`: 대기 중 변경사항 메모리에 쓰기
- `analyze_squad(club_id, squad_kind)`: 스쿼드 전원의 능력치/신체/특성 도시에
- `build_portrait_prompts(request)` / `export_portrait_prompts(request, label)`: 포토 스튜디오 프롬프트 생성과 폴더 내보내기
- `read_player_portrait(uid)`: 생성 이미지 우선, 없으면 페이스팩 얼굴

참고 소스:

- `../../archive/legacy-winforms-rte/PlayerEditModel.cs`: 필드 카탈로그, 오프셋, 값 코덱
- `../../archive/legacy-winforms-rte/PlayerPointerScanner.cs`: UID 기반 선수 포인터 스캔
- `../../archive/legacy-winforms-rte/Target.cs`: Windows process memory R/W
