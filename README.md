# fm26-rte

Football Manager 26 실행 프로세스(`fm.exe`)를 외부 앱에서 읽고 쓰는 선수 에디터 프로젝트입니다.

## 어디서 작업하나

현재 제품 앱은 여기입니다.

```powershell
cd apps/fm26-player-editor
npm run dev
```

빌드:

```powershell
cd apps/fm26-player-editor
npm run build
npm run exe:build
```

## 바로 실행할 파일

배포/확인용 산출물은 `artifacts/release/`에 있습니다.

- `artifacts/release/FM26-Player-Editor.exe`: 바로 실행 가능한 앱
- `artifacts/release/Run-FM26-Player-Editor-As-Admin.bat`: 관리자 권한 실행 helper
- `artifacts/release/FM26-Player-Editor-Setup.exe`: 설치 파일
- `artifacts/release/README.txt`: 실행 안내

FM26 메모리 접근은 일반 권한에서 실패할 수 있으니 관리자 권한 실행을 권장합니다.

## 폴더 지도

- `apps/fm26-player-editor/`: 현재 Tauri + React + Rust 앱
- `artifacts/release/`: 실행 파일, 설치 파일, 릴리스용 얼굴 폴더
- `docs/`: 인수인계와 프로젝트 문서
- `archive/`: 이전 구현, 백업, 참고용 외부 에디터
- `research/reverse-engineering/`: Cheat Table/Lua 분석 산출물과 Frida 트레이스
- `research/il2cpp-dump/`: IL2CPP 정적 분석 자산
- `research/cheat-table-tdg6661/`: 원본 Cheat Table 자료
- `tools/`: 로컬 분석 도구, JDK, Cheat Engine 소스
- `workspace/scratch/`: 일회성 실험 스크립트

## 더 자세한 맥락

- `docs/HANDOFF.md`: 프로젝트 히스토리, 분석 메모, 다음 작업
- `docs/ANALYSIS_GUIDE.md`: 다음 분석을 빠르게 시작하기 위한 검색 범위, 코드 지도, 주의점
- `apps/fm26-player-editor/README.md`: 앱 실행/검증/배포 안내
