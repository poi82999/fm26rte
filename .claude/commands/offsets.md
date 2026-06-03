# /offsets — FM26 메모리 오프셋 현황

lib.rs의 모든 메모리 오프셋 상수를 한 번에 보여준다.

## 실행

`apps/fm26-player-editor/src-tauri/src/lib.rs`에서 `const` 선언부만 grep:

```
Grep pattern: "^const [A-Z_]+: usize ="
File: apps/fm26-player-editor/src-tauri/src/lib.rs
```

## 출력 형식

```
## FM26 메모리 오프셋 (lib.rs)

### Person/Player
PERSON_CA      = 0x???
PERSON_PA      = 0x???
...

### Club/Team
CLUB_BALANCE   = 0x???
TEAM_CLUB      = 0x???
...

### 검증 상태
- ✓ 확인됨: ...
- ? 미확인: ...
```

검증 상태는 코드 주석(`// verified`, `// unverified`, `// TODO`) 기반으로 표시.

## 주의사항
- lib.rs 전체를 읽지 않는다 — const 선언 줄만 grep
- 오프셋 수정 요청이 오면 Edit 툴로 해당 줄만 변경
