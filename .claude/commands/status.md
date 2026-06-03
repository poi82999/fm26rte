# /status — 프로젝트 현재 상태 한눈에

이 프로젝트의 현재 상태를 토큰 최소화로 요약한다.

## 실행 (모두 병렬)

1. 최신 exe 빌드 날짜:
   ```bash
   ls -lh artifacts/release/FM26-Player-Editor.exe
   ```

2. 소스 최근 변경 파일:
   ```bash
   find apps/fm26-player-editor/src -newer artifacts/release/FM26-Player-Editor.exe -name "*.rs" -o -name "*.tsx" -o -name "*.ts" 2>/dev/null
   ```
   → exe보다 새로운 소스 파일이 있으면 "빌드 필요" 표시

3. 미확인 오프셋 확인:
   ```
   Grep "unverified\|TODO.*offset\|0x14[^0-9]" in lib.rs
   ```

## 출력 형식

```
## FM26 에디터 상태

빌드: FM26-Player-Editor.exe (8.5MB, 2026-05-09)
소스 변경: 없음 / [빌드 필요] N개 파일 변경됨

미확인 오프셋:
- SCOUTING_BALANCE_OFFSET (0x150) — 검증 필요
- (없으면 "모두 확인됨")
```
