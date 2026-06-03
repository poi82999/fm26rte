# FM2026 유소년 입단 시스템 조사 & 세이브 파일 편집 리서치 노트

> **목표:** FM2026의 유소년 입단(youth intake) 메커니즘을 이해하고, 궁극적으로 세이브 파일을 직접 편집해 인테이크 결과를 의도대로 바꾸는 것.
> **독자:** IDA/Ghidra, 구조체 분석, 포인터 체인 추적에 익숙한 숙련자.
> **작성일:** 2026-05-17

---

## 1. 조사 범위 & 가정

- 다루는 범위
  - 유소년 생성 메커니즘(intake 시점, CA/PA 결정, 국적/포지션/성격 분배)
  - 유소년 코치/시설/HoYD가 인테이크 결과에 끼치는 영향
  - 세이브 파일(`.fm`) 포맷과 편집 도구 생태계
  - 인테이크 직전 단계에서 세이브를 편집해 결과를 조작하는 실전 워크플로
- 다루지 않는 범위
  - 실시간 메모리 패칭(원래 후보였으나 사용자가 "세이브 파일 편집"으로 좁힘 — 필요 시 보강용으로만 언급)
  - 멀티플레이/네트워크 세이브(FMSE 계열은 의도적으로 미지원)

---

## 2. 유소년 입단 시스템 — 게임 메커니즘

### 2.1 인테이크의 큰 그림
- 매년 한 차례, 클럽의 주니어 팀에서 신규 선수(**newgen**)가 유스 팀으로 진급한다.
- 등장 시점은 국가별로 다르며 FM2026에서도 동일하게 유지된다(예: 그리스 클럽 — 3/9~3/15).
- 시작 연령은 14~16세가 일반적이지만 최대 21세까지 가능.
- 게임 내부적으로 newgen은 인테이크 한참 전(보통 약 3개월 전)에 풀(pool)로 생성되어 있고, 인테이크 당일에 클럽으로 "고정"된다 — **이 시차가 세이브 편집 윈도우의 핵심**이다.

### 2.2 국가 단위 입력값 (숨김)
- **Youth Rating**: 그 국가에서 배출되는 유스의 평균 수준 floor를 결정. 남미가 높은 이유.
- **Game Importance**: 그 나라에서 축구가 차지하는 위상(스페인 ↑, 미국 ↓).
- 둘 다 hidden, 인게임에서는 노출되지 않음 — 사전 편집기(Pre-Game Editor)로 확인/수정 가능한 영역.

### 2.3 클럽 단위 입력값
| 항목 | 영향 | 메모 |
| --- | --- | --- |
| Youth Facilities | newgen의 CA/PA가 "인테이크 당일까지" 형성되는 단계에 영향 | SI 공식 설명은 "PA에도 영향" 쪽. 단 FM-Arena 등 커뮤니티 실험에서는 **시설이 PA에는 실측 영향이 없다**는 반론 존재 — 검증 필요 |
| Junior Coaching | newgen이 도착 시점에 갖춰지는 기술·정신 속성에 영향 | 직접 코치를 뽑을 수 없고 보드 요청(Club Vision → Facilities)으로만 개선 |
| Youth Recruitment | 클럽이 도달할 수 있는 후보의 폭/잠재력 한계 | 풀의 입구를 키워줌. PA 캡과는 별개 |
| Youth Importance | 인테이크 결과 자체에는 직접 영향 없음 | 보드 요청 승인 확률을 높여 시설 개선을 쉽게 만듦 |

### 2.4 HoYD(Head of Youth Development) 효과
- **선호 포메이션**: HoYD가 선호하는 시스템이 어떤 포지션의 newgen이 더 많이 등장할지에 영향(예: 5-3-2 → 윙백/중미 풍부, 4-3-3 → 윙어 풍부).
- **성격 전이**: 인테이크 한 명 한 명에 대해 HoYD의 성격(또는 일부 측면)을 물려받을 확률이 존재. 권장 타입: Model Citizen, Perfectionist, Model Professional, Professional.
- **숨김 속성 영향**: Operation Sports의 800명 newgen 실험에서 HoYD Professionalism 10 → 15로 올리면 평균 속성이 4점 이상 상승(가장 큰 도약 구간). Professionalism/Ambition/Loyalty/Pressure 같은 mental hidden 어트리뷰트가 인테이크 **하루 전까지도** 리롤된다고 보고됨 — 즉 "직전 세이브"가 편집 윈도우.
- **인테이크 품질을 좌우하는 HoYD 능력치**: Judging Player Ability, Judging Player Potential, Working with Youngsters.

### 2.5 timing 모델 (실용적 정리)
1. 약 3개월 전: newgen 풀 생성, CA/PA의 1차 결정.
2. 그 사이 기간: 시설·코칭·HoYD 영향이 누적되며 일부 속성 보정.
3. 인테이크 **D-1**: 성격 계열 hidden 속성 일부가 마지막으로 리롤. (← 세이브 편집을 끼워넣을 수 있는 가장 늦은 지점)
4. 인테이크 당일: 값 확정, 선수가 유스팀에 노출.

### 2.6 미해결 쟁점 (검증 후 메모 추가 예정)
- 시설 등급이 정말 PA 상한을 끌어올리는가, 아니면 CA 가속/속성 분포만 바꾸는가? (FM-Arena 실험 vs SI 공식 설명)
- "선호 포메이션 → 포지션 분포" 가중치의 실제 크기.
- HoYD 성격 전이 확률의 base rate.

---

## 3. 세이브 파일 편집 — 도구 생태계

### 3.1 공식 도구
- **Pre-Game Editor (FM26)**: 무료. 세이브 시작 전 DB(선수/스태프/구단/리그/Youth Rating·Game Importance 등 국가 hidden 포함) 편집. Steam·Epic·MS Store.
- **In-Game Editor (FM26)**: 유료(\$8.99). 세이브가 굴러가는 도중에 선수 속성, 이적, 사기, 재정 등 live edit. PC/Mac만, 콘솔 미지원. 단점은 자동화·대량 편집·관계형 검색이 빈약.

### 3.2 커뮤니티 RTE/스카우트
- **FMRTE 26**: 50+ feature의 실시간 편집기. 무료 스카우트, 저장은 라이선스 필요. 26.1.2까지 지원. Win 우선, macOS/Steam은 후속. 관계형 검색·매스 에디트·프리셋 강함.
- **FM Live Editor 26 (FMScout)**: Pending/Undo + Edit History 시스템이 차별점. 무료로 편집 UI를 다 써보고 저장 단계에서만 라이선스 결제(€5.99 / £5.49 / \$6.99).
- **FM Genie Scout 26**: 편집보다는 스카우트·hidden attribute 가시화. PA, 잠재 성장, 관계 등 노출. 무료(광고 포함) / 후원판.
- 위 도구들 모두 **싱글플레이어 세이브 전용**이 원칙(네트워크 세이브 미지원이 정책).

### 3.3 리버스 엔지니어링 자산 (숙련자용)
- **FMScoutFramework** (ThanosSiopoudis, GPL-2.0): C#/.NET·Mono. `FMScoutFramework.Core` / `Core.Entities.InGame` 네임스페이스로 게임 메모리의 엔터티(Player, Club 등)를 LINQ로 조회·수정. 공식 지원은 FM2014~2016이지만 메모리 레이아웃 추적의 출발점으로 여전히 유효.
- **robeady/fm-explorer**: FMScoutFramework.dll(=FMSE 번들 내장)에 의존하는 실험적 dumper + WinForms editor(`fmedit`). 선수 UID 입력 → 속성/포지션 편집 → Save Attributes. CSV 덤프(`fmdump`)도 포함.
- **littleblue / FMSX** (구 GoogleCode → MagnificentS/fmsx 미러): 오리지널 .fm 디시리얼라이저. 최신 버전 호환은 깨졌지만 **헤더·블록 순서**의 토대 자료.
- **929505/FMMTOOLS**: FM Mobile 세이브 분석 — 데스크탑 포맷과는 다르지만 SI 류의 직렬화 패턴 비교용.
- 그 외: FearlessRevolution / Cheat Engine 포럼의 FM26용 테이블(현행 26.3.0)이 있고, 메모리 상 선수 attribute가 5~100 스케일로 표현된다는 등 현행 버전 정보가 축적되어 있음.

### 3.4 세이브 파일 자체에 대한 사실
- 저장 위치: Windows = `Documents\Sports Interactive\Football Manager 26\games\` (Mac은 `~/Library/Application Support/Sports Interactive/Football Manager 26/`).
- 캐시는 별도 — `%LOCALAPPDATA%\Sports Interactive\…`. 세이브와 무관.
- 포맷: 바이너리, **순서·청크 의존**. SI 공식 문서 없음. 압축 적용(역사적으로 비공개 컨테이너 + 내부 압축; LZMA 사용설은 커뮤니티 추정으로 머무름 — 직접 확인 필요).
- 따라서 hex editor만으로 시작하는 접근(HxD/010 Editor/ImHex)은 헤더 식별 → 디컴프 → 블록 매핑의 단계가 필수.

---

## 4. 유스 관련 데이터가 세이브에서 어디 사는가 — 방법론

> 이 섹션은 "검증된 오프셋 표"가 아니라 **숙련자가 스스로 찾아내기 위한 작업 흐름**이다. FM은 매년 구조체가 미세하게 바뀌므로 26용 오프셋은 직접 추출하는 것이 정답.

### 4.1 작전 전 준비
1. **두 개의 인접 세이브** 확보:
   - `A.fm`: 인테이크 D-1, 한 번도 인테이크 메시지를 본 적 없는 상태.
   - `B.fm`: A에서 하루만 진행해 인테이크 결과가 확정된 상태.
2. 같은 세이브를 베이스로 hex diff → 어떤 영역이 인테이크 직전에 변하는지 좁힌다.
3. 추가로 시설/HoYD만 다른 평행 세이브를 만들어 동일한 D-1/D 페어를 더 모으면 **풀 후보 영역**과 **확정 결과 영역**을 분리하기 쉬워진다.

### 4.2 컨테이너 풀기
1. 헤더 시그니처 확인(처음 16~32바이트, magic + version).
2. 알려진 파일포맷 (zlib, LZ4, LZMA, SI 자체 wrapper 후보) 시그니처 후보 매칭. `binwalk -E`로 엔트로피 슬라이스 검사.
3. 인접 청크의 길이 필드 패턴(little-endian uint32 길이 + payload)이 보이면 SI의 전형적인 청크 직렬화.
4. 풀린 청크를 카테고리(스태프/플레이어/구단/리그/유스 풀 등)로 라벨링 — 청크 첫 8~16바이트의 type tag/id로 식별.

### 4.3 Ghidra / IDA에서 정적 분석
1. `Football Manager 26.exe`를 로드. 함수 이름/symbol은 거의 stripped — 진입점은 문자열 cross-ref가 가장 빠름.
2. 인테이크와 직접 관련된 문자열을 앵커로 사용:
   - "Youth Intake", "Head of Youth Development", "junior_coaching", "youth_rating", "youth_recruitment", newgen 생성 직후 보이는 인터페이스 문자열 ("Youth Candidate", "Newgen Faces" 등).
3. 해당 문자열을 참조하는 함수에서 위로 거슬러 newgen 생성/속성 결정 함수를 찾는다 — 인자로 들고 다니는 구조체가 곧 **PlayerEntity / IntakePool** 후보.
4. RTTI/vtable이 살아 있으면 (MSVC 빌드라면 보통 살아있음) `Player`, `Person`, `YouthCandidate` 등 클래스명이 그대로 노출되는 경우도 있음 — 가장 큰 단서.

### 4.4 동적 분석 (런타임)
1. Cheat Engine 또는 x64dbg로 게임을 attach한 상태에서, In-Game Editor로 알려진 newgen의 CA를 1만큼 바꾼다.
2. write breakpoint를 걸어 어떤 코드 경로가 그 값을 만지는지 추적 → CA를 보관하는 구조체 base의 +offset를 확정.
3. 같은 베이스에서 일정 offset 떨어진 영역에 다른 attribute(전체 ~50개의 visible + hidden attribute)가 연속해서 박혀 있는지 sliding window로 검사. FM은 대부분 1바이트 또는 2바이트 정수의 연속 배열.
4. 메모리에서 찾아낸 구조체 시그니처(연속된 속성 패턴 + UID + 이름 포인터)를 **세이브 파일에서 패턴 검색** → 메모리/디스크 매핑 완성.

### 4.5 유스 풀(아직 클럽에 들어오지 않은 후보) 찾기
- 인테이크 며칠 전 세이브를 두 벌 떠서, 한 쪽만 하루 진행 → 새 풀이 생성/변경된 영역을 diff.
- 풀 후보 객체는 보통 클럽 hierarchy 아래 "junior team" 컨테이너에 매달려 있거나, 별도 글로벌 array에 묶여있고 클럽 id를 참조하는 형태. 어느 쪽인지는 위 4.3 정적분석에서 확인.

### 4.6 시설/HoYD 관련 값 찾기
- Pre-Game Editor에서 같은 클럽의 Youth Facilities 1단계만 바꾼 두 DB로 인테이크 직전까지 동일 시드로 진행 → 메모리/세이브의 어디가 다른지 diff.
- HoYD의 personality 필드 → newgen에 전이된 결과를 추적할 수 있게, HoYD만 personality가 극단(예: Spineless vs Model Professional)인 평행 세이브 페어를 준비.

---

## 5. 실제 편집 플랜 (세이브 파일 기준)

목표를 달성하는 데 추천하는 우선순위:

1. **국가 단위 풀의 ceiling을 올리고 싶다** → Pre-Game Editor로 해당 국가의 Youth Rating/Game Importance를 영구 조정. 세이브 시작 전 단계. 가장 안정적이고 깨질 위험이 적음.
2. **특정 클럽이 매년 받는 인테이크의 평균 품질을 올리고 싶다** → Pre-Game Editor로 시설/Junior Coaching/Youth Recruitment 영구 상향. HoYD를 좋은 personality + 원하는 선호 포메이션으로 교체.
3. **이번 시즌 인테이크 한 회의 결과만 조작하고 싶다** → 인테이크 직전 세이브 보관 → 인테이크 진행 → FMRTE 26 / FM Live Editor 26으로 결과 newgen들의 CA/PA/personality/포지션을 사후 편집. 가장 ROI 높은 경로.
4. **풀 단계의 hidden 속성을 D-1에 바꿔서 결과를 흔들고 싶다** → 본 문서의 4번 섹션 워크플로로 풀 영역을 식별 후 hex 패치. 가장 침습적이고 무결성 깨질 위험 큼 → 백업 필수.

### 주의
- FM의 CA 시스템은 weighted: attribute를 raw로 올리면 내부 CA가 재계산돼 나머지 속성이 자동 보정될 수 있다. FMRTE에 있는 "Calculate CA"류 옵션을 의식하고, 직접 패치 시에는 CA·attribute 모두 모순 없이 갱신해야 한다.
- PA는 일반적으로 "고정 천장"으로 동작 — CA만 올리고 PA를 그대로 두면 자연 성장으로는 어차피 못 넘는다. 두 값을 함께 만져야 의도대로 동작.
- 매 패치(26.1, 26.2, 26.3 …)마다 구조체 오프셋이 바뀔 수 있다 — 패치 단위로 dumper를 다시 돌리는 워크플로를 두는 게 안전.

---

## 6. 다음에 검증할 항목 (open questions)

- [ ] FM26 26.x 세이브 헤더 시그니처 / 컨테이너 확인 (LZMA인지 LZ4인지 SI 자체 wrapper인지).
- [ ] FMRTE 26 / FM Live Editor 26의 "Youth Intake" 메뉴가 노출하는 필드 목록 == 풀 객체의 외부 surface 추정에 활용.
- [ ] 시설 PA 영향 — FM-Arena 실험을 26 데이터로 재현해 결론 짓기.
- [ ] HoYD 선호 포메이션이 포지션 분포에 끼치는 영향의 정량 측정 (Anguilla 등 빈 국가에서 800+ newgen 재현).
- [ ] PreGame Editor `.fmf` 포맷 ↔ 런타임 메모리 ↔ `.fm` 세이브 사이의 매핑 표 작성.

---

## 7. 출처

### 공식
- [Developing and Maximising Your Youth Intakes in FM26 — Football Manager 공식](https://www.footballmanager.com/the-dugout/developing-and-maximising-your-youth-intakes-fm26)
- [Top Tips for Youth Development in FM26 — Football Manager 공식](https://www.footballmanager.com/the-dugout/top-tips-youth-development-fm26)
- [FAQ — FM26 Save Game Compatibility (Football Manager 공식)](https://www.footballmanager.com/help/savegamefaq)
- [Football Manager 26 In-Game Editor (Steam)](https://store.steampowered.com/app/3551410/Football_Manager_26_InGame_Editor/)
- [FM26 Pre-Game Editor (Microsoft Store)](https://apps.microsoft.com/detail/9phw2h8xk62l)
- [Where can I find my Football Manager save game files? — SEGA Support](https://support.sega.com/hc/en-gb/articles/19452660515857-Where-can-I-find-my-Football-Manager-save-game-files)

### 커뮤니티 분석 & 가이드
- [Football Manager 2026 Youth Intake Dates — Passion4FM](https://www.passion4fm.com/football-manager-youth-intake-dates/)
- [Youth Intake — An In-depth Guide on How Clubs Produce Newgens — Passion4FM](https://www.passion4fm.com/youth-intake-guide-how-clubs-produce-newgens/)
- [Best FM26 Head of Youth Development — Passion4FM](https://www.passion4fm.com/best-head-of-youth-development/)
- [Does a Head of Youth Development Actually Matter in FM26? 800 Newgens Analyzed — Operation Sports](https://www.operationsports.com/does-a-head-of-youth-development-actually-matter-in-fm26-one-player-analyzed-800-newgens/)
- [FM26: 800 talents discovered by the Youth Development Manager — FPFrance](https://fpfrance.com/en/the-role-of-the-youth-development-manager-in-fm26-analysis-of-800-new-talents-under-scrutiny/)
- [FM26 Best Youth Academies — Ingenuity Fantasy Football](https://ingenuityfantasy.com/feature-articles/fm26-best-youth-academies/)
- [FM26 Best Youth Academies — Football Manager Blog](https://www.footballmanagerblog.org/2025/11/fm26-best-youth-academies.html)
- [Newgen mechanics revisited — Youth Facilities still don't affect PA (FM-Arena)](https://fm-arena.com/thread/15782-newgen-mechanics-revisited-youth-facilities-still-don-t-affect-pa/)
- [FM26 Youth Ratings — sortitoutsi](https://sortitoutsi.net/football-manager-2026-youth-ratings)
- [FM26 Player Personality Guide — sortitoutsi](https://sortitoutsi.net/content/75646/fm26-player-personality-guide)

### 편집 도구
- [FMRTE 26 (공식)](https://www.fmrte.com/)
- [FM26/FMRTE26 Release 스레드 — FMRTE 포럼](https://www.fmrte.com/forums/topic/12529-fm26-fmrte26-releaseread-opening-post-before-posting/)
- [FM Live Editor 26 — FMScout](https://www.fmscout.com/a-fm-live-editor-26.html)
- [FM Live Editor 26 — 공식 사이트](https://fmeditor.com/)
- [FM Genie Scout 26 — FMScout](https://www.fmscout.com/a-fm-genie-scout-26.html)
- [FM26 Pre-Game Editor 설치 안내 — sortitoutsi](https://sortitoutsi.net/content/74982/how-to-install-fm26-pre-game-editor-pge)
- [The story behind FM Scout Editor](https://www.fmscout.com/a-the-story-behind-fmse.html)

### 리버스 엔지니어링 자산
- [ThanosSiopoudis/FMScoutFramework — GitHub](https://github.com/ThanosSiopoudis/FMScoutFramework)
- [robeady/fm-explorer — GitHub](https://github.com/robeady/fm-explorer)
- [929505/FMMTOOLS — GitHub (FM Mobile 세이브 분석)](https://github.com/929505/FMMTOOLS)
- [How to read a .fm file — FM Scout 포럼 (littleblue/fmsx 언급)](https://www.fmscout.com/q-2459-How-to-read-a-fm-file.html)
- [Cheat Engine — Football Manager 26 테이블 (FearlessRevolution)](https://fearlessrevolution.com/viewtopic.php?t=37900)
- [Memory Scanning / Cheat Engine — sortitoutsi (FM26)](https://sortitoutsi.net/content/74613/memory-scanning-cheat-engine)
- [Working on Football Manager — guidedhacking](https://guidedhacking.com/threads/working-on-football-manager-help-tracking-variable-data.9106/)
