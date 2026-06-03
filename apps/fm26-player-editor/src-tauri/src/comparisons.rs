use super::{PositionGroup, ScoutedPlayer, StrengthProfile};

struct ComparisonRef {
    min_pa: u16,
    max_pa: u16,
    position: PositionGroup,
    strength: StrengthProfile,
    players: &'static [ComparisonPlayer],
}

struct ComparisonPlayer {
    name: &'static str,
    nation: &'static str,
}

struct EliteIcon {
    name: &'static str,
    nation: &'static str,
    positions: &'static [PositionGroup],
    strengths: &'static [StrengthProfile],
}

macro_rules! comparison_ref {
    ($min:expr, $max:expr, $position:ident, $strength:ident, [$(($name:literal, $nation:literal)),+ $(,)?]) => {
        ComparisonRef {
            min_pa: $min,
            max_pa: $max,
            position: PositionGroup::$position,
            strength: StrengthProfile::$strength,
            players: &[$(ComparisonPlayer { name: $name, nation: $nation }),+],
        }
    };
}

static ELITE_ICONS: &[EliteIcon] = &[
    EliteIcon {
        name: "리오넬 메시",
        nation: "아르헨티나",
        positions: &[
            PositionGroup::Forward,
            PositionGroup::RightWinger,
            PositionGroup::AttackingMidfielder,
        ],
        strengths: &[StrengthProfile::Technical, StrengthProfile::Mental],
    },
    EliteIcon {
        name: "크리스티아누 호날두",
        nation: "포르투갈",
        positions: &[
            PositionGroup::Forward,
            PositionGroup::LeftWinger,
            PositionGroup::Striker,
        ],
        strengths: &[StrengthProfile::Mental, StrengthProfile::Physical],
    },
    EliteIcon {
        name: "펠레",
        nation: "브라질",
        positions: &[
            PositionGroup::Forward,
            PositionGroup::Striker,
            PositionGroup::AttackingMidfielder,
        ],
        strengths: &[StrengthProfile::Technical, StrengthProfile::Physical],
    },
    EliteIcon {
        name: "디에고 마라도나",
        nation: "아르헨티나",
        positions: &[
            PositionGroup::Midfielder,
            PositionGroup::AttackingMidfielder,
            PositionGroup::LeftWinger,
        ],
        strengths: &[StrengthProfile::Technical, StrengthProfile::Mental],
    },
    EliteIcon {
        name: "요한 크루이프",
        nation: "네덜란드",
        positions: &[
            PositionGroup::Midfielder,
            PositionGroup::AttackingMidfielder,
            PositionGroup::Forward,
            PositionGroup::Striker,
        ],
        strengths: &[StrengthProfile::Technical, StrengthProfile::Mental],
    },
    EliteIcon {
        name: "프란츠 베켄바워",
        nation: "독일",
        positions: &[
            PositionGroup::Midfielder,
            PositionGroup::DefensiveMidfielder,
            PositionGroup::CenterBack,
        ],
        strengths: &[StrengthProfile::Technical, StrengthProfile::Mental],
    },
    EliteIcon {
        name: "파비오 칸나바로",
        nation: "이탈리아",
        positions: &[PositionGroup::Defender, PositionGroup::CenterBack],
        strengths: &[StrengthProfile::Mental, StrengthProfile::Physical],
    },
    EliteIcon {
        name: "카푸",
        nation: "브라질",
        positions: &[PositionGroup::Defender, PositionGroup::RightBack],
        strengths: &[StrengthProfile::Physical, StrengthProfile::Technical],
    },
    EliteIcon {
        name: "레프 야신",
        nation: "러시아",
        positions: &[PositionGroup::Goalkeeper],
        strengths: &[
            StrengthProfile::Technical,
            StrengthProfile::Mental,
            StrengthProfile::Physical,
        ],
    },
    EliteIcon {
        name: "파올로 말디니",
        nation: "이탈리아",
        positions: &[PositionGroup::LeftBack],
        strengths: &[StrengthProfile::Technical, StrengthProfile::Mental],
    },
];

static COMPARISON_REFS: &[ComparisonRef] = &[
    // 슬롯 추가 형식: comparison_ref!(PA_MIN, PA_MAX, PositionGroup, StrengthProfile, [(이름, 국적), ...])
    // 상세 포지션 슬롯이 없으면 DF/MF/FW 광역 슬롯으로 자동 폴백한다.
    comparison_ref!(190, 194, Goalkeeper, Technical, [("노이어", "독일")]),
    comparison_ref!(
        190,
        194,
        Goalkeeper,
        Mental,
        [("올리버 칸", "독일"), ("이케르 카시야스", "스페인")]
    ),
    comparison_ref!(
        190,
        194,
        Goalkeeper,
        Physical,
        [("피터 슈마이켈", "덴마크")]
    ),
    comparison_ref!(
        190,
        194,
        LeftBack,
        Physical,
        [("로베르토 카를루스", "브라질")]
    ),
    comparison_ref!(
        190,
        194,
        LeftBack,
        Technical,
        [
            ("말디니", "이탈리아"),
            ("자친토 파케티", "이탈리아"),
            ("루드 크롤", "네덜란드")
        ]
    ),
    comparison_ref!(
        150,
        159,
        Goalkeeper,
        Technical,
        [
            ("우나이 시몬", "스페인"),
            ("알폰스 아레올라", "프랑스"),
            ("루이 파트리시우", "포르투갈")
        ]
    ),
    comparison_ref!(
        150,
        159,
        Goalkeeper,
        Mental,
        [
            ("카스퍼 슈마이켈", "덴마크"),
            ("무슬레라", "우루과이"),
            ("브라드 프리델", "미국")
        ]
    ),
    comparison_ref!(
        150,
        159,
        Goalkeeper,
        Physical,
        [
            ("네투", "브라질"),
            ("에밀리아노 마르티네스", "아르헨티나"),
            ("팀 하워드", "미국")
        ]
    ),
    comparison_ref!(
        150,
        159,
        LeftBack,
        Technical,
        [("나가토모 유토", "일본"), ("이영표", "대한민국")]
    ),
    comparison_ref!(150, 159, LeftBack, Mental, [("벤 데이비스", "웨일스")]),
    comparison_ref!(
        150,
        159,
        CenterBack,
        Mental,
        [
            ("에릭 다이어", "잉글랜드"),
            ("마티아스 긴터", "독일"),
            ("로랑 코시엘니", "프랑스"),
            ("메흐디 베나티아", "모로코"),
            ("제이미 캐러거", "잉글랜드"),
            ("요시다 마야", "일본"),
            ("김영권", "대한민국")
        ]
    ),
    comparison_ref!(
        150,
        159,
        CenterBack,
        Physical,
        [
            ("해리 매과이어", "잉글랜드"),
            ("니클라스 쥘레", "독일"),
            ("에릭 바이", "코트디부아르"),
            ("크리스 스몰링", "잉글랜드")
        ]
    ),
    comparison_ref!(
        150,
        159,
        RightBack,
        Technical,
        [("나초 페르난데스", "스페인")]
    ),
    comparison_ref!(
        150,
        159,
        RightBack,
        Physical,
        [
            ("세르주 오리에", "코트디부아르"),
            ("엘세이드 히사이", "알바니아"),
            ("에크토르 벨레린", "스페인"),
            ("세르히뇨 데스트", "미국")
        ]
    ),
    comparison_ref!(
        150,
        159,
        DefensiveMidfielder,
        Mental,
        [
            ("하세베 마코토", "일본"),
            ("파레데스", "아르헨티나"),
            ("유상철", "대한민국")
        ]
    ),
    comparison_ref!(
        150,
        159,
        DefensiveMidfielder,
        Physical,
        [("엔도 와타루", "일본")]
    ),
    comparison_ref!(
        150,
        159,
        CentralMidfielder,
        Technical,
        [("기성용", "대한민국"), ("마테오 코바치치", "크로아티아")]
    ),
    comparison_ref!(
        150,
        159,
        CentralMidfielder,
        Mental,
        [
            ("주앙 무티뉴", "포르투갈"),
            ("엑토르 에레라", "멕시코"),
            ("마르셀 자비처", "오스트리아"),
            ("조던 헨더슨", "잉글랜드")
        ]
    ),
    comparison_ref!(
        150,
        159,
        CentralMidfielder,
        Physical,
        [
            ("그라니트 자카", "스위스"),
            ("코랑탱 톨리소", "프랑스"),
            ("아론 램지", "웨일스"),
            ("마루앙 펠라이니", "벨기에")
        ]
    ),
    comparison_ref!(
        150,
        159,
        AttackingMidfielder,
        Technical,
        [
            ("이강인", "대한민국"),
            ("카마다 다이치", "일본"),
            ("하킴 지예흐", "모로코")
        ]
    ),
    comparison_ref!(
        150,
        159,
        LeftWinger,
        Technical,
        [
            ("멤피스 데파이", "네덜란드"),
            ("윌프리드 자하", "코트디부아르"),
            ("필리페 쿠티뉴", "브라질"),
            ("베르나르", "브라질")
        ]
    ),
    comparison_ref!(
        150,
        159,
        RightWinger,
        Technical,
        [
            ("이청용", "대한민국"),
            ("마르코 아센시오", "스페인"),
            ("말컴", "브라질")
        ]
    ),
    comparison_ref!(
        150,
        159,
        AttackingMidfielder,
        Mental,
        [("미나미노 타쿠미", "일본")]
    ),
    comparison_ref!(
        150,
        159,
        Striker,
        Mental,
        [
            ("황의조", "대한민국"),
            ("티무 푸키", "핀란드"),
            ("히샤를리송", "브라질")
        ]
    ),
    comparison_ref!(
        150,
        159,
        Striker,
        Physical,
        [
            ("라울 히메네스", "멕시코"),
            ("메흐디 타레미", "이란"),
            ("알렉산다르 미트로비치", "세르비아"),
            ("도미닉 칼버트르윈", "잉글랜드"),
            ("루이스 사하", "프랑스")
        ]
    ),
    comparison_ref!(
        160,
        169,
        Goalkeeper,
        Technical,
        [
            ("오나나", "카메룬"),
            ("돈나룸마", "이탈리아"),
            ("케일러 나바스", "코스타리카")
        ]
    ),
    comparison_ref!(
        160,
        169,
        Goalkeeper,
        Mental,
        [
            ("슈체스니", "폴란드"),
            ("한다노비치", "슬로베니아"),
            ("호세 레이나", "스페인")
        ]
    ),
    comparison_ref!(
        160,
        169,
        Goalkeeper,
        Physical,
        [
            ("세바스티앙 프레이", "프랑스"),
            ("팀 비제", "독일"),
            ("빅토르 발데스", "스페인")
        ]
    ),
    comparison_ref!(
        160,
        169,
        CenterBack,
        Technical,
        [
            ("알레시오 로마뇰리", "이탈리아"),
            ("파우 토레스", "스페인"),
            ("존 스톤스", "잉글랜드"),
            ("보누치", "이탈리아"),
            ("마르키뉴스", "브라질"),
            ("더리흐트", "네덜란드")
        ]
    ),
    comparison_ref!(
        160,
        169,
        CenterBack,
        Mental,
        [("슈크리니아르", "슬로바키아"), ("더브레이", "네덜란드")]
    ),
    comparison_ref!(
        160,
        169,
        CenterBack,
        Physical,
        [
            ("도마고이 비다", "크로아티아"),
            ("니콜라스 오타멘디", "아르헨티나"),
            ("김민재", "대한민국"),
            ("쿨리발리", "세네갈"),
            ("뤼디거", "독일")
        ]
    ),
    comparison_ref!(
        160,
        169,
        RightBack,
        Technical,
        [("넬송 세메두", "포르투갈")]
    ),
    comparison_ref!(
        160,
        169,
        RightBack,
        Mental,
        [("스테판 리히트슈타이너", "스위스")]
    ),
    comparison_ref!(
        160,
        169,
        LeftBack,
        Technical,
        [
            ("루카스 디뉴", "프랑스"),
            ("세르지오 고메스", "스페인"),
            ("알렉스 텔레스", "브라질")
        ]
    ),
    comparison_ref!(
        160,
        169,
        LeftBack,
        Physical,
        [
            ("페를랑 멘디", "프랑스"),
            ("데스티니 우도지", "잉글랜드"),
            ("마르크 쿠쿠렐라", "스페인"),
            ("키어런 티어니", "스코틀랜드")
        ]
    ),
    comparison_ref!(
        160,
        169,
        DefensiveMidfielder,
        Mental,
        [("브로조비치", "크로아티아"), ("클로드 마켈렐레", "프랑스")]
    ),
    comparison_ref!(
        160,
        169,
        CentralMidfielder,
        Technical,
        [
            ("베라티", "이탈리아"),
            ("귄도안", "독일"),
            ("프렌키 더용", "네덜란드"),
            ("워렌 자이르-에메리", "프랑스")
        ]
    ),
    comparison_ref!(
        160,
        169,
        CentralMidfielder,
        Mental,
        [("마시모 암브로시니", "이탈리아")]
    ),
    comparison_ref!(
        160,
        169,
        CentralMidfielder,
        Physical,
        [
            ("아드리앙 라비오", "프랑스"),
            ("웨스턴 매케니", "미국"),
            ("마티아스 베시노", "우루과이"),
            ("라드야 나잉골란", "벨기에")
        ]
    ),
    comparison_ref!(
        160,
        169,
        AttackingMidfielder,
        Technical,
        [
            ("카가와 신지", "일본"),
            ("클린트 뎀프시", "미국"),
            ("리야드 마레즈", "알제리"),
            ("하메스 로드리게스", "콜롬비아")
        ]
    ),
    comparison_ref!(160, 169, LeftWinger, Technical, [("그릴리쉬", "잉글랜드")]),
    comparison_ref!(160, 169, LeftWinger, Physical, [("래시포드", "잉글랜드")]),
    comparison_ref!(
        160,
        169,
        RightWinger,
        Physical,
        [("크리스티안 풀리식", "미국"), ("그나브리", "독일")]
    ),
    comparison_ref!(
        160,
        169,
        AttackingMidfielder,
        Mental,
        [("구자철", "대한민국")]
    ),
    comparison_ref!(160, 169, Striker, Technical, [("디발라", "아르헨티나")]),
    comparison_ref!(
        160,
        169,
        Striker,
        Mental,
        [
            ("하비에르 에르난데스", "멕시코"),
            ("에딘 제코", "보스니아 헤르체고비나"),
            ("라우타로", "아르헨티나"),
            ("제이미 바디", "잉글랜드"),
            ("임모빌레", "이탈리아"),
            ("알바로 모라타", "스페인")
        ]
    ),
    comparison_ref!(160, 169, Striker, Physical, [("디에고 코스타", "스페인")]),
    comparison_ref!(
        170,
        179,
        Goalkeeper,
        Technical,
        [
            ("알리송", "브라질"),
            ("에데르송", "브라질"),
            ("데헤아", "스페인"),
            ("테어슈테겐", "독일"),
            ("에드윈 반데르사르", "네덜란드")
        ]
    ),
    comparison_ref!(
        170,
        179,
        Goalkeeper,
        Mental,
        [
            ("오블락", "슬로베니아"),
            ("클라우디오 브라보", "칠레"),
            ("옌스 레만", "독일")
        ]
    ),
    comparison_ref!(
        170,
        179,
        Goalkeeper,
        Physical,
        [
            ("파비앵 바르테즈", "프랑스"),
            ("조 하트", "잉글랜드"),
            ("프란체스코 톨도", "이탈리아")
        ]
    ),
    comparison_ref!(
        170,
        179,
        LeftBack,
        Technical,
        [
            ("조르디 알바", "스페인"),
            ("알렉스 그리말도", "스페인"),
            ("테오 에르난데스", "프랑스"),
            ("올렉산드르 진첸코", "우크라이나"),
            ("루크 쇼", "잉글랜드"),
            ("알라바", "오스트리아")
        ]
    ),
    comparison_ref!(
        170,
        179,
        LeftBack,
        Mental,
        [
            ("비셴테 리사라수", "프랑스"),
            ("크리스티안 키부", "루마니아"),
            ("나초 몬레알", "스페인"),
            ("알렉스 산드루", "브라질")
        ]
    ),
    comparison_ref!(
        170,
        179,
        LeftBack,
        Physical,
        [
            ("벤 칠웰", "잉글랜드"),
            ("알폰소 데이비스", "캐나다"),
            ("누누 멘데스", "포르투갈"),
            ("알레한드로 발데", "스페인")
        ]
    ),
    comparison_ref!(
        170,
        179,
        CenterBack,
        Technical,
        [
            ("라파엘 마르케스", "멕시코"),
            ("라포르트", "스페인"),
            ("알레산드로 바스토니", "이탈리아")
        ]
    ),
    comparison_ref!(
        170,
        179,
        CenterBack,
        Mental,
        [
            ("히카르두 카르발류", "포르투갈"),
            ("디에고 고딘", "우루과이"),
            ("토비 알데르베이럴트", "벨기에"),
            ("얀 베르통언", "벨기에"),
            ("후벵 디아스", "포르투갈"),
            ("로랑 블랑", "프랑스"),
            ("이반 코르도바", "콜롬비아"),
            ("티아고 실바", "브라질"),
            ("페페", "포르투갈"),
            ("마츠 후멜스", "독일"),
            ("사미 히피아", "핀란드"),
            ("치로 페라라", "이탈리아")
        ]
    ),
    comparison_ref!(
        170,
        179,
        CenterBack,
        Physical,
        [
            ("마르틴 데미첼리스", "아르헨티나"),
            ("윌리엄 살리바", "프랑스"),
            ("조나단 타", "독일"),
            ("페어 메르테사커", "독일"),
            ("릴리앙 튀랑", "프랑스"),
            ("솔 캠벨", "잉글랜드"),
            ("야프 스탐", "네덜란드"),
            ("다요트 우파메카노", "프랑스"),
            ("이브라힘 코나테", "프랑스"),
            ("가브리에우 마갈량이스", "브라질"),
            ("호날드 아라우호", "우루과이"),
            ("콜로 투레", "코트디부아르"),
            ("에데르 밀리탕", "브라질"),
            ("쥘 쿤데", "프랑스"),
            ("크리스티안 로메로", "아르헨티나"),
            ("요슈코 그바르디올", "크로아티아"),
            ("글레이송 브레메르", "브라질"),
            ("호세 마리아 히메네스", "우루과이")
        ]
    ),
    comparison_ref!(
        170,
        179,
        RightBack,
        Technical,
        [
            ("키어런 트리피어", "잉글랜드"),
            ("주앙 칸셀루", "포르투갈"),
            ("트렌트 알렉산더-아놀드", "잉글랜드"),
            ("다니 알베스", "브라질")
        ]
    ),
    comparison_ref!(
        170,
        179,
        RightBack,
        Mental,
        [
            ("게리 네빌", "잉글랜드"),
            ("마리오 페르난데스", "러시아"),
            ("세자르 아스필리쿠에타", "스페인"),
            ("벤야민 파바르", "프랑스"),
            ("마우로 타소티", "이탈리아"),
            ("호세 안토니오 카마초", "스페인"),
            ("브라니슬라프 이바노비치", "세르비아")
        ]
    ),
    comparison_ref!(
        170,
        179,
        RightBack,
        Physical,
        [
            ("마이콩", "브라질"),
            ("카일 워커", "잉글랜드"),
            ("아슈라프 하키미", "모로코"),
            ("리스 제임스", "잉글랜드")
        ]
    ),
    comparison_ref!(
        170,
        179,
        DefensiveMidfielder,
        Technical,
        [
            ("조르지뉴", "이탈리아"),
            ("미켈 아르테타", "스페인"),
            ("마이클 캐릭", "잉글랜드")
        ]
    ),
    comparison_ref!(
        170,
        179,
        DefensiveMidfielder,
        Mental,
        [
            ("은골로 캉테", "프랑스"),
            ("하비 마르티네스", "스페인"),
            ("나이젤 더용", "네덜란드"),
            ("윌프리드 은디디", "나이지리아"),
            ("파비뉴", "브라질"),
            ("다니엘레 데 로시", "이탈리아"),
            ("에스테반 캄비아소", "아르헨티나"),
            ("마우로 시우바", "브라질"),
            ("둥가", "브라질"),
            ("지우베르투 시우바", "브라질"),
            ("마르코스 세나", "스페인"),
            ("오렐리앵 추아메니", "프랑스"),
            ("데클란 라이스", "잉글랜드"),
            ("마르틴 수비멘디", "스페인")
        ]
    ),
    comparison_ref!(
        170,
        179,
        DefensiveMidfielder,
        Physical,
        [
            ("카세미루", "브라질"),
            ("아르투로 비달", "칠레"),
            ("무사 시소코", "프랑스"),
            ("체이크 티오테", "코트디부아르"),
            ("에마뉘엘 프티", "프랑스"),
            ("젠나로 가투소", "이탈리아"),
            ("마이클 에시앙", "가나"),
            ("라미레스", "브라질"),
            ("페르난지뉴", "브라질"),
            ("에드가 다비즈", "네덜란드"),
            ("에메르송", "브라질")
        ]
    ),
    comparison_ref!(
        170,
        179,
        CentralMidfielder,
        Technical,
        [
            ("페드리", "스페인"),
            ("페데리코 발베르데", "우루과이"),
            ("루카스 파케타", "브라질"),
            ("토니 크로스", "독일"),
            ("미랄렘 퍄니치", "보스니아 헤르체고비나"),
            ("토니뉴 세레주", "브라질"),
            ("데메트리오 알베르티니", "이탈리아"),
            ("비티냐", "포르투갈")
        ]
    ),
    comparison_ref!(
        170,
        179,
        CentralMidfielder,
        Mental,
        [
            ("니콜로 바렐라", "이탈리아"),
            ("하칸 찰하노글루", "튀르키예"),
            ("엔조 페르난데스", "아르헨티나"),
            ("키미히", "독일"),
            ("데쿠", "포르투갈"),
            ("슈테판 에펜베르크", "독일"),
            ("알렉시스 맥 알리스터", "아르헨티나"),
            ("가비", "스페인"),
            ("브루노 기마랑이스", "브라질"),
            ("필리프 코쿠", "네덜란드")
        ]
    ),
    comparison_ref!(
        170,
        179,
        CentralMidfielder,
        Physical,
        [
            ("포그바", "프랑스"),
            ("고레츠카", "독일"),
            ("밀린코비치-사비치", "세르비아"),
            ("블레즈 마튀디", "프랑스"),
            ("무사 뎀벨레", "벨기에"),
            ("루이스 페르난데즈", "프랑스"),
            ("에두아르도 카마빙가", "프랑스")
        ]
    ),
    comparison_ref!(
        170,
        179,
        AttackingMidfielder,
        Technical,
        [
            ("카이 하베르츠", "독일"),
            ("요시프 일리치치", "슬로베니아"),
            ("크리스토퍼 은쿤쿠", "프랑스"),
            ("필 포든", "잉글랜드"),
            ("브루노 페르난데스", "포르투갈"),
            ("글렌 호들", "잉글랜드")
        ]
    ),
    comparison_ref!(
        170,
        179,
        AttackingMidfielder,
        Mental,
        [
            ("마렉 함식", "슬로바키아"),
            ("토마시 로시츠키", "체코"),
            ("다비 클라선", "네덜란드"),
            ("마르틴 외데고르", "노르웨이"),
            ("야리 리트마넨", "핀란드"),
            ("히데토시 나카타", "일본"),
            ("토마스 뮐러", "독일")
        ]
    ),
    comparison_ref!(
        170,
        179,
        AttackingMidfielder,
        Physical,
        [
            ("라파엘 판데르파르트", "네덜란드"),
            ("모하메드 쿠두스", "가나")
        ]
    ),
    comparison_ref!(
        170,
        179,
        LeftWinger,
        Technical,
        [
            ("루이스 디아스", "콜롬비아"),
            ("야닉 카라스코", "벨기에"),
            ("미켈 오야르사발", "스페인"),
            ("로베르 피레스", "프랑스"),
            ("마르크 오버르마르스", "네덜란드"),
            ("손흥민", "대한민국"),
            ("흐비차 크바라츠헬리아", "조지아")
        ]
    ),
    comparison_ref!(
        170,
        179,
        LeftWinger,
        Mental,
        [
            ("디미트리 파예", "프랑스"),
            ("이반 페리시치", "크로아티아"),
            ("안드레 쉬얼레", "독일"),
            ("다비드 지놀라", "프랑스"),
            ("해리 키웰", "호주")
        ]
    ),
    comparison_ref!(
        170,
        179,
        LeftWinger,
        Physical,
        [
            ("아다마 트라오레", "스페인"),
            ("알랑 생막시맹", "프랑스"),
            ("라힘 스털링", "잉글랜드")
        ]
    ),
    comparison_ref!(
        170,
        179,
        RightWinger,
        Technical,
        [
            ("앙헬 디 마리아", "아르헨티나"),
            ("부카요 사카", "잉글랜드"),
            ("도메니코 베라르디", "이탈리아"),
            ("제이제이 오코차", "나이지리아"),
            ("베르나르두 실바", "포르투갈"),
            ("브리안 라우드루프", "덴마크")
        ]
    ),
    comparison_ref!(
        170,
        179,
        RightWinger,
        Mental,
        [
            ("박지성", "대한민국"),
            ("루카스 모우라", "브라질"),
            ("안토니오 칸드레바", "이탈리아"),
            ("헤수스 나바스", "스페인"),
            ("프레디 융베리", "스웨덴"),
            ("디르크 카윗", "네덜란드")
        ]
    ),
    comparison_ref!(
        170,
        179,
        RightWinger,
        Physical,
        [
            ("페드로 네투", "포르투갈"),
            ("무사 디아비", "프랑스"),
            ("하피냐", "브라질")
        ]
    ),
    comparison_ref!(
        170,
        179,
        Striker,
        Technical,
        [
            ("주앙 펠릭스", "포르투갈"),
            ("호아킨 코레아", "아르헨티나"),
            ("호베르투 솔다도", "스페인"),
            ("에밀리오 부트라게뇨", "스페인"),
            ("다보르 슈케르", "크로아티아"),
            ("지안프랑코 졸라", "이탈리아")
        ]
    ),
    comparison_ref!(
        170,
        179,
        Striker,
        Mental,
        [
            ("마리오 만주키치", "크로아티아"),
            ("디에고 밀리토", "아르헨티나"),
            ("클라우디오 피사로", "페루"),
            ("로비 킨", "아일랜드"),
            ("개리 리네커", "잉글랜드"),
            ("이언 러시", "웨일스"),
            ("필리포 인자기", "이탈리아"),
            ("미로슬라프 클로제", "독일"),
            ("다비드 트레제게", "프랑스"),
            ("카바니", "우루과이"),
            ("디에고 포를란", "우루과이"),
            ("곤살로 이구아인", "아르헨티나"),
            ("라다멜 팔카오", "콜롬비아"),
            ("헨릭 라르손", "스웨덴"),
            ("알란 시몬센", "덴마크"),
            ("로이 마카이", "네덜란드")
        ]
    ),
    comparison_ref!(
        170,
        179,
        Striker,
        Physical,
        [
            ("빅터 오시멘", "나이지리아"),
            ("알렉산더 이사크", "스웨덴"),
            ("두샨 블라호비치", "세르비아"),
            ("카를로스 테베스", "아르헨티나"),
            ("디미타르 베르바토프", "불가리아"),
            ("이언 라이트", "잉글랜드"),
            ("페르난도 토레스", "스페인"),
            ("크리스티안 비에리", "이탈리아"),
            ("패트릭 클루이베르트", "네덜란드"),
            ("오바메양", "가봉"),
            ("루카쿠", "벨기에")
        ]
    ),
    comparison_ref!(
        180,
        189,
        Goalkeeper,
        Technical,
        [("레네 이기타", "콜롬비아")]
    ),
    comparison_ref!(
        180,
        189,
        Goalkeeper,
        Mental,
        [
            ("페트르 체흐", "체코"),
            ("이케르 카시야스", "스페인"),
            ("부폰", "이탈리아")
        ]
    ),
    comparison_ref!(
        180,
        189,
        Goalkeeper,
        Physical,
        [
            ("쿠르투아", "벨기에"),
            ("다비드 시먼", "잉글랜드"),
            ("안젤로 페루치", "이탈리아")
        ]
    ),
    // PA 180-189 세부 포지션 슬롯 (해당 슬롯이 없으면 위 generic Defender/Midfielder/Forward로 폴백)
    comparison_ref!(
        180,
        189,
        LeftBack,
        Technical,
        [
            ("필리페 루이스", "브라질"),
            ("에릭 아비달", "프랑스"),
            ("레이턴 베인스", "잉글랜드"),
            ("마르셀로", "브라질"),
            ("애슐리 콜", "잉글랜드"),
            ("안드레아스 브레메", "독일")
        ]
    ),
    comparison_ref!(
        180,
        189,
        LeftBack,
        Mental,
        [
            ("파트리스 에브라", "프랑스"),
            ("폴 브라이트너", "독일"),
            ("스투아르트 피어스", "잉글랜드")
        ]
    ),
    comparison_ref!(
        180,
        189,
        LeftBack,
        Physical,
        [
            ("루카스 에르난데스", "프랑스"),
            ("앤디 로버트슨", "스코틀랜드"),
            ("리카르도 로드리게스", "스위스")
        ]
    ),
    comparison_ref!(
        180,
        189,
        CenterBack,
        Technical,
        [
            ("리오 퍼디난드", "잉글랜드"),
            ("하비에르 마스체라노", "아르헨티나"),
            ("마르틴 스쿠르텔", "슬로바키아"),
            ("로날드 쿠만", "네덜란드"),
            ("다비드 루이스", "브라질"),
            ("제라르 피케", "스페인"),
            ("제롬 보아텡", "독일")
        ]
    ),
    comparison_ref!(
        180,
        189,
        CenterBack,
        Mental,
        [
            ("뱅상 콤파니", "벨기에"),
            ("대니 블라인트", "네덜란드"),
            ("세르히오 라모스", "스페인"),
            ("존 테리", "잉글랜드"),
            ("카를레스 푸욜", "스페인"),
            ("알레산드로 네스타", "이탈리아"),
            ("마르셀 드사이", "프랑스"),
            ("로베르토 아얄라", "아르헨티나"),
            ("알레산드로 코스타쿠르타", "이탈리아"),
            ("클라우디오 젠틸레", "이탈리아"),
            ("토니 아담스", "잉글랜드"),
            ("조르조 키엘리니", "이탈리아"),
            ("아우다이르", "브라질"),
            ("윌리엄 갈라스", "프랑스")
        ]
    ),
    comparison_ref!(
        180,
        189,
        CenterBack,
        Physical,
        [
            ("조엘 마티프", "카메룬"),
            ("발테르 사무엘", "아르헨티나"),
            ("페어 메르테자커", "독일"),
            ("반다이크", "네덜란드"),
            ("라파엘 바란", "프랑스"),
            ("루시우", "브라질"),
            ("네마냐 비디치", "세르비아"),
            ("페르난도 이에로", "스페인"),
            ("유르겐 콜러", "독일")
        ]
    ),
    comparison_ref!(
        180,
        189,
        RightBack,
        Technical,
        [
            ("리카르도 페레이라", "포르투갈"),
            ("세르지 로베르토", "스페인"),
            ("필립 람", "독일"),
            ("카푸", "브라질"),
            ("잔루카 잠브로타", "이탈리아")
        ]
    ),
    comparison_ref!(
        180,
        189,
        RightBack,
        Mental,
        [
            ("다니 카르바할", "스페인"),
            ("파블로 자발레타", "아르헨티나"),
            ("스티브 핀난", "아일랜드"),
            ("하비에르 사네티", "아르헨티나"),
            ("데니스 어윈", "아일랜드")
        ]
    ),
    comparison_ref!(
        180,
        189,
        RightBack,
        Physical,
        [("안토니오 발렌시아", "에콰도르"), ("후안프란", "스페인")]
    ),
    comparison_ref!(
        180,
        189,
        DefensiveMidfielder,
        Technical,
        [
            ("티아고 알칸타라", "스페인"),
            ("파비안 루이스", "스페인"),
            ("알투르", "브라질"),
            ("세르히오 부스케츠", "스페인"),
            ("안드레아 피를로", "이탈리아"),
            ("사비 알론소", "스페인"),
            ("펩 과르디올라", "스페인"),
            ("페르난도 레돈도", "아르헨티나")
        ]
    ),
    comparison_ref!(
        180,
        189,
        DefensiveMidfielder,
        Mental,
        [
            ("디에고 시메오네", "아르헨티나"),
            ("마르크 반 보멀", "네덜란드"),
            ("디디에 데샹", "프랑스")
        ]
    ),
    comparison_ref!(
        180,
        189,
        DefensiveMidfielder,
        Physical,
        [
            ("토마스 파르티", "가나"),
            ("파트리크 비에이라", "프랑스"),
            ("살리프 케이타", "말리")
        ]
    ),
    comparison_ref!(
        180,
        189,
        CentralMidfielder,
        Technical,
        [
            ("이스코", "스페인"),
            ("크리스티안 에릭센", "덴마크"),
            ("후안 마타", "스페인"),
            ("이니에스타", "스페인"),
            ("모드리치", "크로아티아"),
            ("폴 스콜스", "잉글랜드"),
            ("클라렌스 세이도르프", "네덜란드"),
            ("디디", "브라질"),
            ("소크라테스", "브라질"),
            ("팔캉", "브라질"),
            ("제르송", "브라질"),
            ("세스크 파브레가스", "스페인")
        ]
    ),
    comparison_ref!(
        180,
        189,
        CentralMidfielder,
        Mental,
        [
            ("메수트 외질", "독일"),
            ("줄리앙 와이날덤", "네덜란드"),
            ("바스티안 슈바인슈타이거", "독일"),
            ("프랭크 램파드", "잉글랜드"),
            ("스티븐 제라드", "잉글랜드"),
            ("데이비드 베컴", "잉글랜드"),
            ("브라이언 롭슨", "잉글랜드"),
            ("마르코 타르델리", "이탈리아"),
            ("요제프 보지크", "헝가리"),
            ("오브둘리오 바렐라", "우루과이"),
            ("지투", "브라질"),
            ("루이스 몬티", "아르헨티나"),
            ("호세 레안드로 안드라데", "우루과이"),
            ("대니 블랑슈플라워", "북아일랜드"),
            ("빌리 브렘너", "스코틀랜드")
        ]
    ),
    comparison_ref!(
        180,
        189,
        CentralMidfielder,
        Physical,
        [
            ("야야 투레", "코트디부아르"),
            ("이반 라키티치", "크로아티아"),
            ("나비 케이타", "기니"),
            ("플로렌트 말루다", "프랑스"),
            ("로이 킨", "아일랜드"),
            ("미하엘 발락", "독일"),
            ("주드 벨링엄", "잉글랜드"),
            ("프랑크 레이카르트", "네덜란드"),
            ("그레엄 수네스", "스코틀랜드"),
            ("장 티가나", "프랑스"),
            ("던컨 에드워즈", "잉글랜드")
        ]
    ),
    comparison_ref!(
        180,
        189,
        AttackingMidfielder,
        Technical,
        [
            ("다비드 실바", "스페인"),
            ("알레한드로 고메스", "아르헨티나"),
            ("후안 로만 리켈메", "아르헨티나"),
            ("루이 코스타", "포르투갈"),
            ("엔조 프란체스콜리", "우루과이"),
            ("폴 개스코인", "잉글랜드"),
            ("토티", "이탈리아"),
            ("레이몽 코파", "프랑스"),
            ("오마르 시보리", "아르헨티나"),
            ("라슬로 쿠발라", "헝가리")
        ]
    ),
    comparison_ref!(
        180,
        189,
        AttackingMidfielder,
        Mental,
        [
            ("파블로 아이마르", "아르헨티나"),
            ("산티 카소를라", "스페인"),
            ("후안 세바스티안 베론", "아르헨티나")
        ]
    ),
    comparison_ref!(
        180,
        189,
        AttackingMidfielder,
        Physical,
        [
            ("마리오 괴체", "독일"),
            ("에릭 칸토나", "프랑스"),
            ("윌리안", "브라질")
        ]
    ),
    comparison_ref!(
        180,
        189,
        LeftWinger,
        Technical,
        [
            ("프랑크 리베리", "프랑스"),
            ("지우", "브라질"),
            ("로렌조 인시녜", "이탈리아"),
            ("아자르", "벨기에"),
            ("티에리 앙리", "프랑스"),
            ("비니시우스 주니오르", "브라질"),
            ("파벨 네드베드", "체코"),
            ("라이언 긱스", "웨일스"),
            ("흐리스토 스토이치코프", "불가리아"),
            ("프란시스코 헨토", "스페인"),
            ("드라간 자이치", "세르비아"),
            ("올레크 블로힌", "우크라이나")
        ]
    ),
    comparison_ref!(
        180,
        189,
        LeftWinger,
        Mental,
        [
            ("마르코 로이스", "독일"),
            ("더글라스 코스타", "브라질"),
            ("호아킨", "스페인")
        ]
    ),
    comparison_ref!(
        180,
        189,
        LeftWinger,
        Physical,
        [
            ("레로이 자네", "독일"),
            ("킹스리 코망", "프랑스"),
            ("안토니", "브라질"),
            ("마네", "세네갈")
        ]
    ),
    comparison_ref!(
        180,
        189,
        RightWinger,
        Technical,
        [
            ("페드로", "스페인"),
            ("페데리코 키에사", "이탈리아"),
            ("우스만 뎀벨레", "프랑스"),
            ("살라", "이집트"),
            ("루이스 피구", "포르투갈"),
            ("차범근", "대한민국"),
            ("아르옌 로벤", "네덜란드"),
            ("스탠리 매튜스", "잉글랜드")
        ]
    ),
    comparison_ref!(
        180,
        189,
        RightWinger,
        Mental,
        [
            ("다비드 사라비아", "스페인"),
            ("호베르토 피르미노", "브라질"),
            ("호세 안토니오 레예스", "스페인")
        ]
    ),
    comparison_ref!(
        180,
        189,
        RightWinger,
        Physical,
        [
            ("루이스 나니", "포르투갈"),
            ("드리스 메르턴스", "벨기에"),
            ("안드레이 칸첼스키스", "러시아"),
            ("베일", "웨일스")
        ]
    ),
    comparison_ref!(
        180,
        189,
        Striker,
        Technical,
        [
            ("에르난 크레스포", "아르헨티나"),
            ("루카 토니", "이탈리아"),
            ("알레산드로 델피에로", "이탈리아"),
            ("즐라탄 이브라히모비치", "스웨덴"),
            ("세르히오 아구에로", "아르헨티나"),
            ("데니스 베르캄프", "네덜란드"),
            ("장-피에르 파팽", "프랑스"),
            ("산드로 코치시", "헝가리"),
            ("베베토", "브라질")
        ]
    ),
    comparison_ref!(
        180,
        189,
        Striker,
        Mental,
        [
            ("웨인 루니", "잉글랜드"),
            ("올리비에 지루", "프랑스"),
            ("에이야르 구드욘센", "아이슬란드"),
            ("케인", "잉글랜드"),
            ("벤제마", "프랑스"),
            ("수아레스", "우루과이"),
            ("앙투안 그리즈만", "프랑스"),
            ("로빈 판페르시", "네덜란드"),
            ("알란 시어러", "잉글랜드"),
            ("케니 달글리시", "스코틀랜드"),
            ("우고 산체스", "멕시코"),
            ("호마리우", "브라질"),
            ("라울 곤살레스", "스페인"),
            ("쥐스트 퐁텐", "프랑스"),
            ("지미 그리브스", "잉글랜드"),
            ("호세 알타피니", "브라질"),
            ("위르겐 클린스만", "독일")
        ]
    ),
    comparison_ref!(
        180,
        189,
        Striker,
        Physical,
        [
            ("디디에 드로그바", "코트디부아르"),
            ("사뮈엘 에토", "카메룬"),
            ("안드리 셰브첸코", "우크라이나"),
            ("홀란드", "노르웨이"),
            ("가브리엘 바티스투타", "아르헨티나"),
            ("다비드 비야", "스페인"),
            ("뤼트 판니스텔루이", "네덜란드"),
            ("마이클 오언", "잉글랜드"),
            ("조지 웨아", "라이베리아"),
            ("군나르 노르달", "스웨덴"),
            ("실비오 피올라", "이탈리아"),
            ("루이지 리바", "이탈리아"),
            ("마리오 켐페스", "아르헨티나")
        ]
    ),
    comparison_ref!(
        190,
        194,
        CenterBack,
        Mental,
        [
            ("프랑코 바레시", "이탈리아"),
            ("파비오 칸나바로", "이탈리아"),
            ("보비 무어", "잉글랜드"),
            ("엘리아스 피게로아", "칠레"),
            ("가에타노 시레아", "이탈리아"),
            ("다니엘 파사레야", "아르헨티나")
        ]
    ),
    comparison_ref!(190, 194, CenterBack, Physical, [("마티아스 잠머", "독일")]),
    comparison_ref!(
        190,
        194,
        DefensiveMidfielder,
        Mental,
        [("로드리", "스페인")]
    ),
    comparison_ref!(
        190,
        194,
        CentralMidfielder,
        Technical,
        [("차비 에르난데스", "스페인"), ("보비 찰턴", "잉글랜드")]
    ),
    comparison_ref!(
        190,
        194,
        CentralMidfielder,
        Mental,
        [("더 브라위너", "벨기에"), ("로타어 마테우스", "독일")]
    ),
    comparison_ref!(
        190,
        194,
        CentralMidfielder,
        Physical,
        [("루드 굴리트", "네덜란드"), ("요한 네이스켄스", "네덜란드")]
    ),
    comparison_ref!(
        190,
        194,
        AttackingMidfielder,
        Technical,
        [
            ("카카", "브라질"),
            ("미셸 플라티니", "프랑스"),
            ("지코", "브라질"),
            ("지네딘 지단", "프랑스"),
            ("로베르토 바조", "이탈리아"),
            ("미카엘 라우드루프", "덴마크"),
            ("요제프 마소푸스트", "체코"),
            ("루이스 수아레스 미라몬테스", "스페인"),
            ("호나우지뉴", "브라질")
        ]
    ),
    comparison_ref!(
        190,
        194,
        LeftWinger,
        Technical,
        [
            ("네이마르", "브라질"),
            ("히바우두", "브라질"),
            ("킬리안 음바페", "프랑스")
        ]
    ),
    comparison_ref!(
        190,
        194,
        RightWinger,
        Technical,
        [
            ("가린샤", "브라질"),
            ("조지 베스트", "북아일랜드"),
            ("자이르지뉴", "브라질")
        ]
    ),
    comparison_ref!(
        190,
        194,
        Striker,
        Mental,
        [
            ("레반도프스키", "폴란드"),
            ("게르트 뮐러", "독일"),
            ("페렌츠 푸스카스", "헝가리")
        ]
    ),
    comparison_ref!(
        190,
        194,
        Striker,
        Physical,
        [
            ("마르코 판 바스턴", "네덜란드"),
            ("에우제비우", "포르투갈"),
            ("호나우두", "브라질")
        ]
    ),
    // ── PA 150-159 보완 슬롯 ──────────────────────────────────────────────
    comparison_ref!(
        150,
        159,
        LeftBack,
        Physical,
        [
            ("파비우 코엔트랑", "포르투갈"),
            ("마르코스 알론소", "스페인")
        ]
    ),
    comparison_ref!(
        150,
        159,
        CenterBack,
        Technical,
        [("미카엘 실베스트르", "프랑스"), ("타이론 밍스", "잉글랜드")]
    ),
    comparison_ref!(
        150,
        159,
        RightBack,
        Mental,
        [
            ("바실리스 토로시디스", "그리스"),
            ("주앙 페레이라", "포르투갈")
        ]
    ),
    comparison_ref!(
        150,
        159,
        DefensiveMidfielder,
        Technical,
        [("빌리 길모어", "스코틀랜드"), ("마누 코네", "프랑스")]
    ),
    comparison_ref!(
        150,
        159,
        AttackingMidfielder,
        Physical,
        [("안소 파티", "스페인"), ("마티스 텔", "독일")]
    ),
    comparison_ref!(
        150,
        159,
        LeftWinger,
        Mental,
        [("파블로 사라비아", "스페인"), ("노아 랑", "네덜란드")]
    ),
    comparison_ref!(
        150,
        159,
        LeftWinger,
        Physical,
        [
            ("미하일로 무드리크", "우크라이나"),
            ("아마두 도", "네덜란드")
        ]
    ),
    comparison_ref!(
        150,
        159,
        RightWinger,
        Mental,
        [("셰르단 샤키리", "스위스"), ("나세르 샤들리", "벨기에")]
    ),
    comparison_ref!(
        150,
        159,
        RightWinger,
        Physical,
        [
            ("에마뉘엘 데니스", "나이지리아"),
            ("안와르 엘 가지", "모로코")
        ]
    ),
    comparison_ref!(
        150,
        159,
        Striker,
        Technical,
        [("루카 요비치", "세르비아"), ("디보크 오리기", "벨기에")]
    ),
    // ── PA 160-169 보완 슬롯 ──────────────────────────────────────────────
    comparison_ref!(
        160,
        169,
        LeftBack,
        Mental,
        [
            ("알베르토 모레노", "스페인"),
            ("그레고리 반더빌", "네덜란드")
        ]
    ),
    comparison_ref!(
        160,
        169,
        RightBack,
        Physical,
        [
            ("세드릭 소아레스", "포르투갈"),
            ("오드리 모고스", "루마니아")
        ]
    ),
    comparison_ref!(
        160,
        169,
        DefensiveMidfielder,
        Technical,
        [("프레드", "브라질"), ("코클랭", "프랑스")]
    ),
    comparison_ref!(
        160,
        169,
        DefensiveMidfielder,
        Physical,
        [("이드리사 게예", "세네갈"), ("아마두 오나나", "벨기에")]
    ),
    comparison_ref!(
        160,
        169,
        AttackingMidfielder,
        Physical,
        [("레온 베일리", "자메이카"), ("엄원상", "대한민국")]
    ),
    comparison_ref!(
        160,
        169,
        LeftWinger,
        Mental,
        [("제레미 메네스", "프랑스"), ("하비 반 힐렌", "네덜란드")]
    ),
    comparison_ref!(
        160,
        169,
        RightWinger,
        Technical,
        [("앙헬 코레아", "아르헨티나"), ("안와르 엘 가지", "모로코")]
    ),
    comparison_ref!(
        160,
        169,
        RightWinger,
        Mental,
        [("후안 콰드라도", "콜롬비아"), ("다름 엘라리브", "모로코")]
    ),
    // ── PA 190-194 보완 슬롯 ──────────────────────────────────────────────
    comparison_ref!(
        190,
        194,
        Goalkeeper,
        Physical,
        [("고든 뱅크스", "잉글랜드"), ("질마르", "브라질")]
    ),
    comparison_ref!(
        190,
        194,
        LeftBack,
        Mental,
        [("자친토 파케티", "이탈리아"), ("애슐리 콜", "잉글랜드")]
    ),
    comparison_ref!(
        190,
        194,
        CenterBack,
        Technical,
        [("프란코 바레시", "이탈리아"), ("로날드 쿠만", "네덜란드")]
    ),
    comparison_ref!(
        190,
        194,
        RightBack,
        Mental,
        [
            ("하비에르 사네티", "아르헨티나"),
            ("카를루스 아우베르투", "브라질")
        ]
    ),
    comparison_ref!(
        190,
        194,
        RightBack,
        Physical,
        [("다니 알베스", "브라질"), ("마이콩", "브라질")]
    ),
    comparison_ref!(
        190,
        194,
        DefensiveMidfielder,
        Technical,
        [
            ("안드레아 피를로", "이탈리아"),
            ("세르히오 부스케츠", "스페인")
        ]
    ),
    comparison_ref!(
        190,
        194,
        DefensiveMidfielder,
        Physical,
        [
            ("파트리크 비에이라", "프랑스"),
            ("야야 투레", "코트디부아르")
        ]
    ),
    comparison_ref!(
        190,
        194,
        AttackingMidfielder,
        Mental,
        [("지네딘 지단", "프랑스"), ("데니스 베르캄프", "네덜란드")]
    ),
    comparison_ref!(
        190,
        194,
        AttackingMidfielder,
        Physical,
        [("에릭 칸토나", "프랑스"), ("루드 굴리트", "네덜란드")]
    ),
    comparison_ref!(
        190,
        194,
        LeftWinger,
        Mental,
        [
            ("라이언 긱스", "웨일스"),
            ("흐리스토 스토이치코프", "불가리아")
        ]
    ),
    comparison_ref!(
        190,
        194,
        LeftWinger,
        Physical,
        [("킬리안 음바페", "프랑스"), ("티에리 앙리", "프랑스")]
    ),
    comparison_ref!(
        190,
        194,
        RightWinger,
        Mental,
        [("루이스 피구", "포르투갈"), ("아르옌 로벤", "네덜란드")]
    ),
    comparison_ref!(
        190,
        194,
        RightWinger,
        Physical,
        [
            ("조지 베스트", "북아일랜드"),
            ("크리스티아누 호날두", "포르투갈")
        ]
    ),
    comparison_ref!(
        190,
        194,
        Striker,
        Technical,
        [
            ("즐라탄 이브라히모비치", "스웨덴"),
            ("알레산드로 델피에로", "이탈리아")
        ]
    ),
    // ── PA 195-200 포지션별 전담 슬롯 ─────────────────────────────────────
    comparison_ref!(
        195,
        200,
        Goalkeeper,
        Technical,
        [("레프 야신", "러시아"), ("고든 뱅크스", "잉글랜드")]
    ),
    comparison_ref!(
        195,
        200,
        Goalkeeper,
        Mental,
        [("피터 슈마이켈", "덴마크"), ("이케르 카시야스", "스페인")]
    ),
    comparison_ref!(
        195,
        200,
        Goalkeeper,
        Physical,
        [("디노 조프", "이탈리아"), ("세프 마이어", "독일")]
    ),
    comparison_ref!(
        195,
        200,
        LeftBack,
        Technical,
        [("파올로 말디니", "이탈리아"), ("자친토 파케티", "이탈리아")]
    ),
    comparison_ref!(
        195,
        200,
        LeftBack,
        Mental,
        [("애슐리 콜", "잉글랜드"), ("파트리스 에브라", "프랑스")]
    ),
    comparison_ref!(
        195,
        200,
        LeftBack,
        Physical,
        [("로베르토 카를루스", "브라질"), ("닐슨 산투스", "브라질")]
    ),
    comparison_ref!(
        195,
        200,
        CenterBack,
        Technical,
        [("프란코 바레시", "이탈리아"), ("로날드 쿠만", "네덜란드")]
    ),
    comparison_ref!(
        195,
        200,
        CenterBack,
        Mental,
        [("보비 무어", "잉글랜드"), ("파비오 칸나바로", "이탈리아")]
    ),
    comparison_ref!(
        195,
        200,
        CenterBack,
        Physical,
        [("야프 스탐", "네덜란드"), ("마티아스 잠머", "독일")]
    ),
    comparison_ref!(
        195,
        200,
        RightBack,
        Technical,
        [("카푸", "브라질"), ("다니 알베스", "브라질")]
    ),
    comparison_ref!(
        195,
        200,
        RightBack,
        Mental,
        [
            ("카를루스 아우베르투", "브라질"),
            ("하비에르 사네티", "아르헨티나")
        ]
    ),
    comparison_ref!(
        195,
        200,
        RightBack,
        Physical,
        [("카푸", "브라질"), ("조지 코헨", "잉글랜드")]
    ),
    comparison_ref!(
        195,
        200,
        DefensiveMidfielder,
        Technical,
        [("안드레아 피를로", "이탈리아"), ("사비 알론소", "스페인")]
    ),
    comparison_ref!(
        195,
        200,
        DefensiveMidfielder,
        Mental,
        [("로드리", "스페인"), ("클로드 마켈렐레", "프랑스")]
    ),
    comparison_ref!(
        195,
        200,
        DefensiveMidfielder,
        Physical,
        [
            ("파트리크 비에이라", "프랑스"),
            ("야야 투레", "코트디부아르")
        ]
    ),
    comparison_ref!(
        195,
        200,
        CentralMidfielder,
        Technical,
        [
            ("차비 에르난데스", "스페인"),
            ("안드레스 이니에스타", "스페인")
        ]
    ),
    comparison_ref!(
        195,
        200,
        CentralMidfielder,
        Mental,
        [("더 브라위너", "벨기에"), ("로타어 마테우스", "독일")]
    ),
    comparison_ref!(
        195,
        200,
        CentralMidfielder,
        Physical,
        [("루드 굴리트", "네덜란드"), ("야야 투레", "코트디부아르")]
    ),
    comparison_ref!(
        195,
        200,
        AttackingMidfielder,
        Technical,
        [("지네딘 지단", "프랑스"), ("호나우지뉴", "브라질")]
    ),
    comparison_ref!(
        195,
        200,
        AttackingMidfielder,
        Mental,
        [("미셸 플라티니", "프랑스"), ("데니스 베르캄프", "네덜란드")]
    ),
    comparison_ref!(
        195,
        200,
        AttackingMidfielder,
        Physical,
        [("디에고 마라도나", "아르헨티나"), ("에릭 칸토나", "프랑스")]
    ),
    comparison_ref!(
        195,
        200,
        LeftWinger,
        Technical,
        [("리오넬 메시", "아르헨티나"), ("네이마르", "브라질")]
    ),
    comparison_ref!(
        195,
        200,
        LeftWinger,
        Mental,
        [
            ("라이언 긱스", "웨일스"),
            ("흐리스토 스토이치코프", "불가리아")
        ]
    ),
    comparison_ref!(
        195,
        200,
        LeftWinger,
        Physical,
        [("킬리안 음바페", "프랑스"), ("티에리 앙리", "프랑스")]
    ),
    comparison_ref!(
        195,
        200,
        RightWinger,
        Technical,
        [("가린샤", "브라질"), ("조지 베스트", "북아일랜드")]
    ),
    comparison_ref!(
        195,
        200,
        RightWinger,
        Mental,
        [("루이스 피구", "포르투갈"), ("아르옌 로벤", "네덜란드")]
    ),
    comparison_ref!(
        195,
        200,
        RightWinger,
        Physical,
        [
            ("크리스티아누 호날두", "포르투갈"),
            ("자이르지뉴", "브라질")
        ]
    ),
    comparison_ref!(
        195,
        200,
        Striker,
        Technical,
        [("펠레", "브라질"), ("에우제비우", "포르투갈")]
    ),
    comparison_ref!(
        195,
        200,
        Striker,
        Mental,
        [("게르트 뮐러", "독일"), ("레반도프스키", "폴란드")]
    ),
    comparison_ref!(
        195,
        200,
        Striker,
        Physical,
        [("호나우두", "브라질"), ("마르코 판 바스턴", "네덜란드")]
    ),
];

pub(super) fn comparison_phrase(player: &ScoutedPlayer) -> Option<String> {
    if player.pa < 150 || !matches!(player.age, Some(age) if age <= 24) {
        return None;
    }

    let position = position_group(&player.position);
    let player_nation = player.nation.as_deref().unwrap_or("이 나라");

    if player.pa >= 195 {
        // 195-200 COMPARISON_REFS 슬롯 우선 확인
        let fallback = comparison_fallback_group(position);
        let ref195 = COMPARISON_REFS
            .iter()
            .find(|r| {
                player.pa >= r.min_pa
                    && player.pa <= r.max_pa
                    && r.position == position
                    && r.strength == player.strength_profile
            })
            .or_else(|| {
                COMPARISON_REFS.iter().find(|r| {
                    player.pa >= r.min_pa
                        && player.pa <= r.max_pa
                        && r.position == fallback
                        && r.strength == player.strength_profile
                })
            });
        if let Some(reference) = ref195 {
            if let Some(comp) = select_comparison_player(reference, player, position) {
                let seed = comparison_seed(player, position);
                let same_nation = player
                    .nation
                    .as_deref()
                    .map(|n| nation_matches(n, comp.nation))
                    .unwrap_or(false);
                let phrases: &[&str] = if same_nation {
                    &[
                        "{nation}의 전설적인 {comp}의 뒤를 이을 차세대 유망주입니다. 이 수준의 재능은 한 세대에 한 번 나올까 말까 합니다.",
                        "{nation}이 낙은 위대한 {comp}의 후계자로 불릴 만한 역대급 재능입니다.",
                        "{nation} 축구 역사에서 {comp}에 비견될 수 있는 특별한 원석이 발견되었습니다.",
                    ]
                } else {
                    &[
                        "{nation}의 차세대 {comp}{ro} 불릴 만한 역대급 재능을 보여주고 있습니다.",
                        "{comp}의 전성기를 연상케 하는 재능이 {nation}에서 발견되었습니다. 즉각적인 확보가 필요합니다.",
                        "{nation}에서 {comp}급의 임팩트를 낼 수 있는 특급 유망주가 포착되었습니다.",
                    ]
                };
                let idx = seeded_index(seed, phrases.len());
                let phrase = phrases[idx]
                    .replace("{nation}", player_nation)
                    .replace("{comp}", comp.name)
                    .replace("{ro}", josa_ro(comp.name));
                return Some(phrase);
            }
        }
        // COMPARISON_REFS 슬롯 미스 시 ELITE_ICONS 폴백
        let icon = select_elite_icon(player, position)?;
        let seed = comparison_seed(player, position);
        let same_nation = player
            .nation
            .as_deref()
            .map(|n| nation_matches(n, icon.nation))
            .unwrap_or(false);

        let phrases: &[&str] = if same_nation {
            &[
                "{nation}의 전설적인 {comp}의 뒤를 이을 차세대 유망주입니다. 이 수준의 재능은 한 세대에 한 번 나올까 말까 합니다.",
                "{nation}이 낳은 위대한 {comp}의 후계자로 불릴 만한 역대급 재능입니다.",
                "{nation} 축구 역사에서 {comp}에 비견될 수 있는 특별한 원석이 발견되었습니다.",
            ]
        } else {
            &[
                "{nation}의 차세대 {comp}{ro} 불릴 만한 역대급 재능을 보여주고 있습니다.",
                "{comp}의 전성기를 연상케 하는 재능이 {nation}에서 발견되었습니다. 즉각적인 확보가 필요합니다.",
                "{nation}에서 {comp}급의 임팩트를 낼 수 있는 특급 유망주가 포착되었습니다.",
            ]
        };
        let idx = seeded_index(seed, phrases.len());
        let phrase = phrases[idx]
            .replace("{nation}", player_nation)
            .replace("{comp}", icon.name)
            .replace("{ro}", josa_ro(icon.name));
        return Some(phrase);
    }

    let fallback = comparison_fallback_group(position);
    let detail_reference = COMPARISON_REFS.iter().find(|r| {
        player.pa >= r.min_pa
            && player.pa <= r.max_pa
            && r.position == position
            && r.strength == player.strength_profile
    });
    let fallback_reference = COMPARISON_REFS.iter().find(|r| {
        player.pa >= r.min_pa
            && player.pa <= r.max_pa
            && r.position == fallback
            && r.strength == player.strength_profile
    });
    let reference = detail_reference.or(fallback_reference)?;
    let comp = select_comparison_player(reference, player, position)?;

    let same_nation = player
        .nation
        .as_deref()
        .map(|n| nation_matches(n, comp.nation))
        .unwrap_or(false);
    let seed = comparison_seed(player, position);

    let phrase = match player.pa {
        185.. if same_nation => {
            let templates = [
                "{nation}의 전설적인 {comp}의 뒤를 이을 차세대 유망주의 잠재력을 가지고 있습니다. 이미 최정상급 경지에 근접해 있습니다.",
                "{nation}이 배출한 {comp}의 계보를 이을 수 있는 특별한 재능입니다. 경쟁 클럽보다 먼저 움직여야 합니다.",
                "{comp}의 황금기를 재현할 수 있는 {nation}의 새로운 보석입니다. 조기 확보가 핵심입니다.",
            ];
            templates[seeded_index(seed, templates.len())]
                .replace("{nation}", player_nation)
                .replace("{comp}", comp.name)
        }
        185.. => {
            let templates = [
                "{nation}의 차세대 {comp}{ro} 성장할 잠재력이 충분합니다. 이미 최정상급 경지에 근접해 있습니다.",
                "{comp}에 필적하는 재능이 {nation}에서 두각을 나타내고 있습니다. 성장 곡선이 가파릅니다.",
                "전성기의 {comp}을(를) 연상케 하는 플레이로 {nation} 축구의 미래를 밝히고 있습니다.",
            ];
            templates[seeded_index(seed, templates.len())]
                .replace("{nation}", player_nation)
                .replace("{comp}", comp.name)
                .replace("{ro}", josa_ro(comp.name))
        }
        170.. if same_nation => {
            let templates = [
                "{nation}의 전설적인 {comp}의 뒤를 이을 차세대 유망주의 잠재력을 가지고 있습니다.",
                "{comp}의 발자취를 따라가는 {nation}의 떠오르는 신성입니다.",
                "{nation}에서 {comp}의 후계자로 지목받을 만한 성장 잠재력이 확인됩니다.",
            ];
            templates[seeded_index(seed, templates.len())]
                .replace("{nation}", player_nation)
                .replace("{comp}", comp.name)
        }
        170.. => {
            let templates = [
                "{nation}의 차세대 {comp}{ro} 성장할 가능성이 있습니다.",
                "{comp}와(과) 유사한 특성을 갖춘 {nation} 출신의 유망주입니다. 집중 관찰이 필요합니다.",
                "{nation}에서 발굴된 이 선수는 {comp}을(를) 떠올리게 하는 잠재력을 지니고 있습니다.",
            ];
            templates[seeded_index(seed, templates.len())]
                .replace("{nation}", player_nation)
                .replace("{comp}", comp.name)
                .replace("{ro}", josa_ro(comp.name))
        }
        _ if same_nation => {
            let templates = [
                "{nation}의 {comp}을(를) 연상케 하는 플레이 스타일이며, 환경이 뒷받침된다면 그 수준에 근접할 수 있습니다.",
                "{comp}의 초기 커리어와 닮은 궤적을 보이고 있으며, {nation}에서 주목받는 유망주입니다.",
            ];
            templates[seeded_index(seed, templates.len())]
                .replace("{nation}", player_nation)
                .replace("{comp}", comp.name)
        }
        _ => {
            let templates = [
                "{comp}을(를) 연상케 하는 플레이 스타일을 갖추고 있으며, 잘 성장한다면 그 수준에 근접할 수 있습니다.",
                "{comp}의 플레이 패턴과 유사한 특성이 관찰됩니다. 장기적 관점에서 추적할 가치가 있습니다.",
            ];
            templates[seeded_index(seed, templates.len())].replace("{comp}", comp.name)
        }
    };

    Some(phrase)
}

fn josa_ro(name: &str) -> &'static str {
    if let Some(last) = name.chars().last() {
        let code = last as u32;
        if (0xAC00..=0xD7A3).contains(&code) {
            let final_consonant = (code - 0xAC00) % 28;
            return if final_consonant == 0 {
                "로"
            } else {
                "으로"
            };
        }
    }
    "로"
}

pub(super) fn comparison_references(player: &ScoutedPlayer) -> Vec<String> {
    if player.pa < 150 {
        return Vec::new();
    }

    let position = position_group(&player.position);
    if player.pa >= 195 {
        // 195-200 COMPARISON_REFS 슬롯 우선 확인
        let fallback = comparison_fallback_group(position);
        if let Some(reference) = COMPARISON_REFS
            .iter()
            .find(|r| {
                player.pa >= r.min_pa
                    && player.pa <= r.max_pa
                    && r.position == position
                    && r.strength == player.strength_profile
            })
            .or_else(|| {
                COMPARISON_REFS.iter().find(|r| {
                    player.pa >= r.min_pa
                        && player.pa <= r.max_pa
                        && r.position == fallback
                        && r.strength == player.strength_profile
                })
            })
        {
            return select_comparison_player(reference, player, position)
                .map(|comp| vec![comp.name.to_string()])
                .unwrap_or_default();
        }
        // COMPARISON_REFS 슬롯 미스 시 ELITE_ICONS 폴백
        return select_elite_icon(player, position)
            .map(|icon| vec![icon.name.to_string()])
            .unwrap_or_default();
    }

    let fallback = comparison_fallback_group(position);
    let detail_reference = || {
        COMPARISON_REFS.iter().find(|reference| {
            player.pa >= reference.min_pa
                && player.pa <= reference.max_pa
                && reference.position == position
                && reference.strength == player.strength_profile
        })
    };
    let fallback_reference = || {
        COMPARISON_REFS.iter().find(|reference| {
            player.pa >= reference.min_pa
                && player.pa <= reference.max_pa
                && reference.position == fallback
                && reference.strength == player.strength_profile
        })
    };

    let reference = detail_reference().or_else(fallback_reference);

    let Some(reference) = reference else {
        return Vec::new();
    };

    select_comparison_player(reference, player, position)
        .map(|comparison| vec![comparison.name.to_string()])
        .unwrap_or_default()
}

fn select_elite_icon(
    player: &ScoutedPlayer,
    position: PositionGroup,
) -> Option<&'static EliteIcon> {
    let fallback = comparison_fallback_group(position);
    let seed = comparison_seed(player, position);
    let mut candidates = ELITE_ICONS
        .iter()
        .filter(|icon| {
            icon_matches_position(icon, position, fallback)
                && icon.strengths.contains(&player.strength_profile)
        })
        .collect::<Vec<_>>();

    if candidates.is_empty() {
        candidates = ELITE_ICONS
            .iter()
            .filter(|icon| icon_matches_position(icon, position, fallback))
            .collect::<Vec<_>>();
    }

    if candidates.is_empty() {
        candidates = ELITE_ICONS.iter().collect::<Vec<_>>();
    }

    if let Some(nation) = player.nation.as_deref() {
        let same_nation = candidates
            .iter()
            .copied()
            .filter(|icon| nation_matches(nation, icon.nation))
            .collect::<Vec<_>>();
        if !same_nation.is_empty() {
            return Some(same_nation[seeded_index(seed, same_nation.len())]);
        }
    }

    Some(candidates[seeded_index(seed, candidates.len())])
}

fn icon_matches_position(
    icon: &EliteIcon,
    position: PositionGroup,
    fallback: PositionGroup,
) -> bool {
    icon.positions.contains(&position) || icon.positions.contains(&fallback)
}

fn position_group(position: &str) -> PositionGroup {
    match position {
        "GK" => PositionGroup::Goalkeeper,
        "LB" | "LWB" | "WBL" | "DL" | "D/L" | "WB/L" => PositionGroup::LeftBack,
        "CB" | "SW" | "DC" | "D/C" => PositionGroup::CenterBack,
        "RB" | "RWB" | "WBR" | "DR" | "D/R" | "WB/R" => PositionGroup::RightBack,
        "DM" => PositionGroup::DefensiveMidfielder,
        "CM" => PositionGroup::CentralMidfielder,
        "LW" | "LM" => PositionGroup::LeftWinger,
        "AM" => PositionGroup::AttackingMidfielder,
        "RW" | "RM" => PositionGroup::RightWinger,
        "ST" => PositionGroup::Striker,
        _ => PositionGroup::CentralMidfielder,
    }
}

fn comparison_fallback_group(position: PositionGroup) -> PositionGroup {
    match position {
        PositionGroup::Goalkeeper => PositionGroup::Goalkeeper,
        PositionGroup::LeftBack | PositionGroup::CenterBack | PositionGroup::RightBack => {
            PositionGroup::Defender
        }
        PositionGroup::DefensiveMidfielder
        | PositionGroup::CentralMidfielder
        | PositionGroup::AttackingMidfielder => PositionGroup::Midfielder,
        PositionGroup::LeftWinger | PositionGroup::RightWinger | PositionGroup::Striker => {
            PositionGroup::Forward
        }
        PositionGroup::Defender => PositionGroup::Defender,
        PositionGroup::Midfielder => PositionGroup::Midfielder,
        PositionGroup::Forward => PositionGroup::Forward,
    }
}

fn select_comparison_player<'a>(
    reference: &'a ComparisonRef,
    player: &ScoutedPlayer,
    position: PositionGroup,
) -> Option<&'a ComparisonPlayer> {
    let players = reference.players.iter().collect::<Vec<_>>();
    select_from_comparison_players(&players, player, position)
}

fn select_from_comparison_players<'a>(
    players: &[&'a ComparisonPlayer],
    player: &ScoutedPlayer,
    position: PositionGroup,
) -> Option<&'a ComparisonPlayer> {
    if players.is_empty() {
        return None;
    }

    let seed = comparison_seed(player, position);
    if let Some(nation) = player.nation.as_deref() {
        let same_nation = players
            .iter()
            .copied()
            .filter(|comparison| nation_matches(nation, comparison.nation))
            .collect::<Vec<_>>();
        if !same_nation.is_empty() {
            return Some(same_nation[seeded_index(seed, same_nation.len())]);
        }
    }

    Some(players[seeded_index(seed, players.len())])
}

fn comparison_seed(player: &ScoutedPlayer, position: PositionGroup) -> u64 {
    let mut seed = player.uid as u64;
    seed ^= (player.pa as u64) << 16;
    seed ^= (position_seed(position) as u64) << 32;
    seed ^= (strength_seed(player.strength_profile) as u64) << 40;
    seed
}

fn seeded_index(seed: u64, len: usize) -> usize {
    let mixed = seed
        .wrapping_mul(6364136223846793005)
        .wrapping_add(1442695040888963407)
        ^ seed.rotate_left(17);
    (mixed as usize) % len
}

fn position_seed(position: PositionGroup) -> u8 {
    match position {
        PositionGroup::Goalkeeper => 1,
        PositionGroup::LeftBack => 2,
        PositionGroup::CenterBack => 3,
        PositionGroup::RightBack => 4,
        PositionGroup::DefensiveMidfielder => 5,
        PositionGroup::CentralMidfielder => 6,
        PositionGroup::LeftWinger => 7,
        PositionGroup::AttackingMidfielder => 8,
        PositionGroup::RightWinger => 9,
        PositionGroup::Striker => 10,
        PositionGroup::Defender => 11,
        PositionGroup::Midfielder => 12,
        PositionGroup::Forward => 13,
    }
}

fn strength_seed(strength: StrengthProfile) -> u8 {
    match strength {
        StrengthProfile::Technical => 1,
        StrengthProfile::Mental => 2,
        StrengthProfile::Physical => 3,
    }
}

fn nation_matches(left: &str, right: &str) -> bool {
    normalize_nation_key(left) == normalize_nation_key(right)
}

fn normalize_nation_key(raw: &str) -> String {
    let key = raw.trim().to_lowercase();
    let normalized = match key.as_str() {
        "argentina" | "argentine" | "아르헨티나" => "아르헨티나",
        "algeria" | "algerian" | "알제리" => "알제리",
        "austria" | "austrian" | "오스트리아" => "오스트리아",
        "australia" | "australian" | "호주" => "호주",
        "belgium" | "belgian" | "벨기에" => "벨기에",
        "bosnia & herzegovina" | "bosnia and herzegovina" | "bosnian" | "보스니아 헤르체고비나" => {
            "보스니아 헤르체고비나"
        }
        "brazil" | "brazilian" | "브라질" => "브라질",
        "bulgaria" | "bulgarian" | "불가리아" => "불가리아",
        "cameroon" | "cameroonian" | "카메룬" => "카메룬",
        "canada" | "canadian" | "캐나다" => "캐나다",
        "chile" | "chilean" | "칠레" => "칠레",
        "colombia" | "colombian" | "콜롬비아" => "콜롬비아",
        "costa rica" | "costa rican" | "코스타리카" => "코스타리카",
        "croatia" | "croatian" | "크로아티아" => "크로아티아",
        "czech republic" | "czechia" | "czech" | "체코" => "체코",
        "denmark" | "danish" | "덴마크" => "덴마크",
        "egypt" | "egyptian" | "이집트" => "이집트",
        "ecuador" | "ecuadorian" | "에콰도르" => "에콰도르",
        "england" | "english" | "잉글랜드" => "잉글랜드",
        "finland" | "finnish" | "핀란드" => "핀란드",
        "france" | "french" | "프랑스" => "프랑스",
        "gabon" | "gabonese" | "가봉" => "가봉",
        "germany" | "german" | "독일" => "독일",
        "ghana" | "ghanaian" | "가나" => "가나",
        "guinea" | "guinean" | "기니" => "기니",
        "hungary" | "hungarian" | "헝가리" => "헝가리",
        "iceland" | "icelandic" | "아이슬란드" => "아이슬란드",
        "italy" | "italian" | "이탈리아" => "이탈리아",
        "ivory coast" | "cote d'ivoire" | "cote divoire" | "ivorian" | "코트디부아르" => {
            "코트디부아르"
        }
        "japan" | "japanese" | "일본" => "일본",
        "liberia" | "liberian" | "라이베리아" => "라이베리아",
        "mali" | "malian" | "말리" => "말리",
        "mexico" | "mexican" | "멕시코" => "멕시코",
        "montenegro" | "montenegrin" | "몬테네그로" => "몬테네그로",
        "morocco" | "moroccan" | "모로코" => "모로코",
        "netherlands" | "holland" | "dutch" | "네덜란드" => "네덜란드",
        "nigeria" | "nigerian" | "나이지리아" => "나이지리아",
        "northern ireland" | "northern irish" | "북아일랜드" => "북아일랜드",
        "norway" | "norwegian" | "노르웨이" => "노르웨이",
        "paraguay" | "paraguayan" | "파라과이" => "파라과이",
        "peru" | "peruvian" | "페루" => "페루",
        "poland" | "polish" | "폴란드" => "폴란드",
        "portugal" | "portuguese" | "포르투갈" => "포르투갈",
        "republic of ireland" | "ireland" | "irish" | "아일랜드" => "아일랜드",
        "romania" | "romanian" | "루마니아" => "루마니아",
        "russia" | "russian" | "러시아" => "러시아",
        "scotland" | "scottish" | "스코틀랜드" => "스코틀랜드",
        "senegal" | "senegalese" | "세네갈" => "세네갈",
        "serbia" | "serbian" | "세르비아" => "세르비아",
        "slovakia" | "slovak" | "슬로바키아" => "슬로바키아",
        "slovenia" | "slovenian" | "슬로베니아" => "슬로베니아",
        "south korea" | "korea republic" | "korean" | "대한민국" => "대한민국",
        "spain" | "spanish" | "스페인" => "스페인",
        "sweden" | "swedish" | "스웨덴" => "스웨덴",
        "switzerland" | "swiss" | "스위스" => "스위스",
        "turkey" | "turkiye" | "turkish" | "튀르키예" | "터키" => "튀르키예",
        "ukraine" | "ukrainian" | "우크라이나" => "우크라이나",
        "united states" | "usa" | "american" | "미국" => "미국",
        "uruguay" | "uruguayan" | "우루과이" => "우루과이",
        "wales" | "welsh" | "웨일스" => "웨일스",
        _ => raw.trim(),
    };

    normalized.to_string()
}
