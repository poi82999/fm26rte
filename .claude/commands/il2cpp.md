# /il2cpp — IL2CPP 덤프에서 타입/메서드 검색

`$ARGUMENTS`로 받은 키워드를 FM26 IL2CPP 덤프에서 검색한다.

## 덤프 파일 위치
- `dump/il2cpp.h` — C++ 헤더 형식 타입/필드/메서드 정의
- `dump/script.json` — 메서드 주소 매핑
- `dump/` 내 기타 타입 덤프 파일들

## 실행 순서

1. `il2cpp.h`에서 키워드 검색 (대소문자 무시):
   - 클래스 정의: `class $ARGUMENTS`
   - 필드: `$ARGUMENTS` 포함 줄
   - 메서드: `$ARGUMENTS` 포함 줄

2. `script.json`에서 메서드 주소 확인:
   - `$ARGUMENTS` 포함 항목 grep

3. 결과 출력:
   ```
   ## IL2CPP 검색: $ARGUMENTS

   ### 클래스 정의 (il2cpp.h)
   class PlayerObject : MonoBehaviour {
     int32_t currentAbility;  // 0x??
     ...
   }

   ### 메서드 주소 (script.json)
   GetPlayerData: 0x1234567
   ```

## 주의사항
- 덤프 파일 전체를 읽지 않는다 — grep 결과 ±10줄만
- 결과가 많으면 클래스 정의 우선 표시, 메서드는 개수만
- 오프셋 발견 시 lib.rs의 관련 const와 비교 제안
