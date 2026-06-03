# /build — FM26 에디터 빌드

Tauri 앱을 빌드하고 artifacts/release에 exe를 배포한다.

## 실행

```bash
cd C:/Users/신민석/dev/fm26-rte/apps/fm26-player-editor
npm run tauri:build 2>&1 | tail -20
```

빌드 성공 후:
- 빌드 exe 경로: `apps/fm26-player-editor/src-tauri/target/release/fm26-rte.exe`
- copy-latest-exe.mjs가 자동으로 `FM26-Player-Editor.exe` (repo root)에 복사

## 실패 시
- Rust 컴파일 에러: 에러 메시지 전체 출력 후 원인 분석
- EBUSY 에러: 기존 exe가 실행 중 → 수동으로 `artifacts/release/`에 복사
  ```bash
  cp apps/fm26-player-editor/src-tauri/target/release/fm26-rte.exe artifacts/release/FM26-Player-Editor.exe
  ```

## 출력 형식
```
빌드 성공 ✓
- exe: artifacts/release/FM26-Player-Editor.exe (X.X MB)
- 빌드 시간: Xs
```
