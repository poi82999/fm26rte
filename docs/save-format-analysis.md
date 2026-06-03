# FM26 세이브 파일 포맷 분석 — 도구 & 워크플로우

## 현황

### 구현 완료
- **`analyze_save_file()` Tauri command**: 세이브 파일 헤더 + 컨테이너 포맷 + 초기 청크 분석
- **압축 포맷 감지**:
  - LZMA (시그니처: `5D 00 00 00 xx`)
  - LZ4 (시그니처: `04 22 4D 18`)
  - zlib (시그니처: `78 9C` 또는 `78 01`)
  - SI 커스텀 래퍼 (추정)
- **청크 스캔**: 파일 1MB 또는 20청크까지 chunk length + type tag 패턴 감지

### 출력 형식 (JSON)
```json
{
  "magic": [0x5D, ...],
  "magic_hex": "5d 00 00 00 ...",
  "file_size": 12345678,
  "compression": "LZMA",
  "chunks_preview": [
    {
      "offset": 0,
      "length": 1024,
      "type_tag": 0x00001234,
      "preview": "offset=0 len=1024 tag=0x00001234 data=xx xx xx xx ..."
    }
  ]
}
```

---

## 다음 단계 (세이브 편집 가능하게)

### Phase 1: 컨테이너 압축 해제 (필수)
**목표**: LZMA 또는 LZ4 스트림을 디코드하고, 내부 청크 구조를 완전히 매핑하기.

1. **도구 추가**:
   - `decompress_save()` 함수 (LZMA 지원, 나중에 LZ4도)
   - 사용 라이브러리: `lzma-rs` crate (이미 Cargo.toml에 추가 가능)

2. **검증**:
   - 테스트 세이브 파일에서 압축 해제 후 헤더 확인
   - 풀린 바이트가 타당한 청크 구조인지 검증

3. **예상 청크 태입** (커뮤니티 문서 + 직관):
   - `0x0000...`: 메타/버전
   - `0x000C`: OBJ_DUNI (게임 엔터티: 국가, 클럽, 선수 등)
   - 유스 관련: 풀 객체 배열 (아직 매핑 필요)

### Phase 2: 유스 풀 & 인테이크 데이터 위치 파악
**목표**: 세이브 파일 내 유스 인테이크 관련 데이터(풀 + 결과)의 정확한 오프셋을 찾기.

1. **이진 비교 (binary diff)**:
   - `A.fm`: 인테이크 D-1 (풀 생성됨, 아직 확정 안 됨)
   - `B.fm`: A에서 하루 진행 (인테이크 확정)
   - 둘을 hex diff → 변경된 영역 좁히기
   - 추가로 시설/HoYD만 다른 평행 세이브 페어 2~3개 더 수집

2. **정적 분석 (IDA/Ghidra)**:
   - `Football Manager 26.exe`에서 "Youth Intake", "Newgen", "Head of Youth Development" 문자열 크로스 ref
   - 해당 함수 흐름 추적 → 인테이크 로직 및 데이터 구조 파악
   - 메모리 오프셋(PADA=0x150, PATR=0x15F, CA=0x264, PA=0x266 등)을 세이브 구조에 매핑

3. **구현**:
   - `save_analysis.rs`에 `FindYouthIntakeData` 함수 추가
   - 입력: 풀린 세이브 바이트 + 두 세이브의 diff
   - 출력: `YouthPoolOffset`, `IntakeResultOffset`, `PersonAttributeLayout` 등

### Phase 3: 세이브 파일 편집기 (selective patching)
**목표**: 유스 인테이크 결과를 선택적으로 수정.

1. **UI/명령어**:
   - 세이브 파일 경로 입력
   - "인테이크 직전" 세이브와 "인테이크 후" 세이브 페어 업로드
   - 변경할 newgen 선택 (UID 기반)
   - 원하는 CA/PA/포지션/성격 입력
   - "Apply Patch" → 결과 세이브 다운로드

2. **안전성**:
   - 원본 세이브는 수정하지 않음 (copy + patch)
   - 패치 전 체크섬/백업 경고
   - 메모리 구조 변경 감지 → 패치 버전/FM버전 호환성 확인

3. **구현**:
   - `patch_youth_intakes()` 함수
   - 입력: 풀린 바이트 + [(uid, new_ca, new_pa, ...)] 리스트
   - CA/PA 변경 시 속성 보정 (weighted CA 재계산)
   - 재압축 + 헤더 갱신

---

## 현재 메모리 오프셋 (참고)

> 아래는 **런타임 메모리** 기준. 세이브 파일의 구조는 다를 수 있음.

### Player
| 필드 | 오프셋 | 크기 | 설명 |
| --- | --- | --- | --- |
| Person pointer | - | - | 개인 데이터 링크 |
| Attributes (Crossing~) | +0x15F | 54바이트 | 기술/정신 50개 어트리뷰트 (1바이트씩) |
| Position suitability (GK~WBR) | +0x150 | 15바이트 | 포지션 적성 (0-20 스케일) |
| CA (Current Ability) | +0x264 | 2바이트 | 현재 능력 (5~500 스케일) |
| PA (Potential Ability) | +0x266 | 2바이트 | 잠재 능력 (5~500 스케일) |

### Person (심리 속성)
| 필드 | 오프셋 | 크기 | 설명 |
| --- | --- | --- | --- |
| Player Traits (preference moves) | +0xC0 | 8바이트 | 선호 플레이 스타일 (비트 필드) |

---

## 테스트 케이스

1. **세이브 헤더 분석** ✓ (구현됨)
   - 다양한 FM26 세이브에서 헤더 시그니처 확인
   - LZMA 감지 검증

2. **압축 해제** (다음)
   - 실제 세이브 파일 LZMA 디코드
   - 디코드 후 청크 패턴 검증

3. **이진 비교** (병렬)
   - D-1 + D 세이브 페어에서 변경 영역 비교
   - 변경 크기, 패턴 분석

4. **정적 분석** (병렬)
   - Ghidra에서 "Youth Intake" 함수 재현
   - 메모리 구조 매핑

---

## 파일 레이아웃

```
fm26-rte/
├── docs/
│   ├── research-youth-intake.md        ← 게임 메커니즘 & 도구 생태계
│   └── save-format-analysis.md          ← 이 파일 (세이브 포맷 분석 진행상황)
├── apps/fm26-player-editor/src-tauri/src/
│   ├── save_analysis.rs                 ← 헤더 분석, 압축 감지, 청크 스캔
│   └── lib.rs                           ← analyze_save_file Tauri command
├── research/reverse-engineering/
│   ├── PLAYER_STATS_OFFSETS.md          ← 런타임 메모리 오프셋 (참고)
│   └── ANALYSIS.md                      ← CE 테이블 분석
└── ...
```

---

## 참고 문서

- [research-youth-intake.md](research-youth-intake.md) — 게임 메커니즘, 도구 생태계, 작업 방법론
- [PLAYER_STATS_OFFSETS.md](../research/reverse-engineering/PLAYER_STATS_OFFSETS.md) — 메모리 오프셋
- [FM26 세이브 파일 위치](#) (메모 추가 예정)
