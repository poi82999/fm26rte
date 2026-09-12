//! 전력 분석 룰 엔진.
//!
//! 디코딩된 능력치(1~20)·포지션·주발을 받아 "위협(threat)"과 "약점(weakness)" 태그를
//! 만들어 낸다. 메모리 접근은 lib.rs가 담당하고, 이 모듈은 순수 함수만 둔다(테스트 용이).
//!
//! `attrs`는 PATR 기준 상대 오프셋(0x00~0x35)으로 인덱싱한 디코딩 값 배열이다.
//! 인덱스 상수는 PLAYER_STATS_OFFSETS.md / read_scouting_abilities 와 동일하다.

use serde::Serialize;

// PATR 상대 인덱스 (디코딩된 1~20 값 배열의 인덱스)
pub(super) const DRIBBLING: usize = 0x01;
pub(super) const FINISHING: usize = 0x02;
pub(super) const HEADING: usize = 0x03;
pub(super) const LONG_SHOTS: usize = 0x04;
pub(super) const MARKING: usize = 0x05;
pub(super) const OFF_THE_BALL: usize = 0x06;
pub(super) const PASSING: usize = 0x07;
pub(super) const TACKLING: usize = 0x09;
pub(super) const VISION: usize = 0x0a;
pub(super) const HANDLING: usize = 0x0b;
pub(super) const DECISIONS: usize = 0x12;
pub(super) const ONE_ON_ONES: usize = 0x13;
pub(super) const REFLEXES: usize = 0x15;
pub(super) const TECHNIQUE: usize = 0x17;
pub(super) const LEFT_FOOT: usize = 0x18;
pub(super) const RIGHT_FOOT: usize = 0x19;
pub(super) const CORNERS: usize = 0x1b;
pub(super) const WORK_RATE: usize = 0x1d;
pub(super) const ACCELERATION: usize = 0x22;
pub(super) const FREE_KICKS: usize = 0x23;
pub(super) const STRENGTH: usize = 0x24;
pub(super) const STAMINA: usize = 0x25;
pub(super) const PACE: usize = 0x26;
pub(super) const JUMPING: usize = 0x27;
pub(super) const DIRTINESS: usize = 0x29;
pub(super) const BALANCE: usize = 0x2a;
pub(super) const AGGRESSION: usize = 0x2d;
pub(super) const AGILITY: usize = 0x2e;
pub(super) const COMPOSURE: usize = 0x34;
pub(super) const CONCENTRATION: usize = 0x35;
pub(super) const PENALTY: usize = 0x08;

pub(super) const ATTR_COUNT: usize = 0x36;

#[derive(Clone, Copy, PartialEq, Eq)]
pub(super) enum Role {
    Goalkeeper,
    CenterBack,
    FullBack,
    Midfielder,
    Wide,
    Forward,
    Unknown,
}

impl Role {
    pub(super) fn from_label(label: &str) -> Self {
        match label {
            "GK" => Role::Goalkeeper,
            "CB" | "SW" => Role::CenterBack,
            "LB" | "RB" | "LWB" | "RWB" => Role::FullBack,
            "DM" | "CM" => Role::Midfielder,
            "LW" | "RW" | "LM" | "RM" | "AM" => Role::Wide,
            "ST" => Role::Forward,
            _ => Role::Unknown,
        }
    }

    fn is_defender(self) -> bool {
        matches!(self, Role::CenterBack | Role::FullBack)
    }
}

#[derive(Clone, Serialize)]
#[serde(rename_all = "camelCase")]
pub(super) struct Tag {
    /// 짧은 라벨 (배지용). 예: "느린 수비", "측면 스피드"
    pub label: String,
    /// 공략/경계 코칭 문구.
    pub detail: String,
    /// "threat" | "weakness"
    pub kind: &'static str,
}

fn threat(label: &str, detail: &str) -> Tag {
    Tag {
        label: label.to_string(),
        detail: detail.to_string(),
        kind: "threat",
    }
}

fn weakness(label: &str, detail: &str) -> Tag {
    Tag {
        label: label.to_string(),
        detail: detail.to_string(),
        kind: "weakness",
    }
}

/// 주발 판정: "양발" / "왼발" / "오른발".
pub(super) fn foot_label(attrs: &[u8]) -> &'static str {
    let left = attrs[LEFT_FOOT];
    let right = attrs[RIGHT_FOOT];
    if left >= 14 && right >= 14 {
        "양발"
    } else if left > right {
        "왼발"
    } else {
        "오른발"
    }
}

/// 상대가 경계해야 할 위협 태그.
pub(super) fn threats(attrs: &[u8], role: Role) -> Vec<Tag> {
    let mut tags = Vec::new();
    let a = |i: usize| attrs[i];

    if matches!(role, Role::Wide | Role::FullBack | Role::Forward)
        && a(PACE) >= 15
        && a(ACCELERATION) >= 15
        && a(DRIBBLING) >= 14
    {
        tags.push(threat(
            "측면 스피드",
            "빠른 발과 드리블로 측면을 위협한다. 수비 뒷공간을 내주지 말고 한 박자 빨리 차단할 것.",
        ));
    }
    if a(HEADING) >= 15 && a(JUMPING) >= 15 && a(STRENGTH) >= 14 {
        tags.push(threat(
            "제공권",
            "세트피스·크로스 상황 제공권이 강하다. 박스 안에서 밀착 마크하고 크로스 자체를 줄여야 한다.",
        ));
    }
    if a(LONG_SHOTS) >= 15 && a(TECHNIQUE) >= 14 {
        tags.push(threat(
            "중거리 슛",
            "박스 외곽에서 슈팅 위협이 크다. 슈팅 각을 내주지 말고 적극적으로 압박할 것.",
        ));
    }
    if a(PASSING) >= 15 && a(VISION) >= 15 && a(DECISIONS) >= 14 {
        tags.push(threat(
            "전개 핵심",
            "팀 빌드업의 핵심 플레이메이커. 패스 길목을 차단하고 시간을 주지 말아야 한다.",
        ));
    }
    if a(FINISHING) >= 15 && a(OFF_THE_BALL) >= 15 && a(COMPOSURE) >= 14 {
        tags.push(threat(
            "박스 침투",
            "오프 더 볼 침투와 마무리가 위협적이다. 라인 뒷공간 침투를 끝까지 따라붙어 마크할 것.",
        ));
    }
    if a(DRIBBLING) >= 16 && a(AGILITY) >= 15 && a(BALANCE) >= 14 {
        tags.push(threat(
            "드리블",
            "1:1 드리블 돌파가 위협적이다. 무리한 태클 대신 지연 수비로 동료 커버를 기다릴 것.",
        ));
    }
    if a(CORNERS) >= 15 || a(FREE_KICKS) >= 15 || a(PENALTY) >= 16 {
        tags.push(threat(
            "세트피스 키커",
            "세트피스 키커. 직접 슛·정확한 키로 위협하니 벽 배치와 키커 견제에 신경 쓸 것.",
        ));
    }
    tags
}

/// 우리가 공략할 수 있는 약점 태그.
pub(super) fn weaknesses(attrs: &[u8], role: Role) -> Vec<Tag> {
    let mut tags = Vec::new();
    let a = |i: usize| attrs[i];

    if role.is_defender() && a(PACE) <= 11 && a(ACCELERATION) <= 11 {
        tags.push(weakness(
            "느린 수비",
            "발이 느리다. 뒷공간 침투 패스와 측면 스피드로 등 뒤를 직접 공략하라.",
        ));
    }
    if matches!(role, Role::CenterBack | Role::Goalkeeper) && a(JUMPING) <= 10 && a(HEADING) <= 10 {
        tags.push(weakness(
            "제공권 약점",
            "공중볼 경합에 약하다. 세트피스와 측면 크로스로 제공권을 노려라.",
        ));
    }
    if role == Role::Goalkeeper && (a(HANDLING) <= 10 || a(ONE_ON_ONES) <= 10 || a(REFLEXES) <= 11)
    {
        tags.push(weakness(
            "불안한 GK",
            "골키퍼가 핸들링·1:1·반응에 약하다. 원온원 상황을 적극 유도하고 슛을 많이 시도하라.",
        ));
    }
    if role == Role::FullBack && a(TACKLING) <= 9 && a(MARKING) <= 10 {
        tags.push(weakness(
            "수비 약한 풀백",
            "수비 대인 능력이 떨어진다. 그 측면에 윙어를 배치해 1:1로 집중 공략하라.",
        ));
    }
    if a(CONCENTRATION) <= 9 || a(COMPOSURE) <= 9 {
        tags.push(weakness(
            "멘탈 기복",
            "집중력·침착성이 낮다. 후반·세트피스·압박 상황에서 실수를 유도하라.",
        ));
    }
    if (a(DIRTINESS) >= 15 || a(AGGRESSION) >= 16) && a(COMPOSURE) <= 11 {
        tags.push(weakness(
            "카드 유도",
            "거칠고 흥분하기 쉽다. 빠른 드리블로 파울과 경고를 유도하라.",
        ));
    }
    if a(WORK_RATE) <= 9 || a(STAMINA) <= 10 {
        tags.push(weakness(
            "체력 약점",
            "활동량·지구력이 부족하다. 후반 체력 소모전으로 끌고 가라.",
        ));
    }

    let left = a(LEFT_FOOT);
    let right = a(RIGHT_FOOT);
    let (strong, weak, side) = if left >= right {
        (left, right, "오른발")
    } else {
        (right, left, "왼발")
    };
    if strong >= 14 && weak + 7 <= strong {
        tags.push(weakness(
            "한 발 의존",
            &format!("{side} 사용을 꺼린다. 그쪽으로 몰아 슛·패스 선택지를 차단하라."),
        ));
    }

    tags
}

/// PPRM 비트필드(person + 0xc0)에서 전술적으로 의미 있는 특성만 추린 표.
/// (byte_offset, bit, 한글 라벨). 출처: PLAYER_STATS_OFFSETS.md.
const TRAITS: &[(usize, u8, &str)] = &[
    (0x00, 0, "왼쪽 측면 드리블 전개"),
    (0x00, 1, "오른쪽 측면 드리블 전개"),
    (0x00, 2, "중앙 드리블 전개"),
    (0x00, 3, "상대 박스 침투"),
    (0x00, 4, "채널 침투"),
    (0x00, 5, "적극적인 전진"),
    (0x00, 6, "짧고 간결한 패스"),
    (0x00, 7, "킬패스 시도"),
    (0x01, 0, "중거리 슛 즐김"),
    (0x01, 1, "강한 슛"),
    (0x01, 2, "구석 노린 슛"),
    (0x01, 3, "감아 차기"),
    (0x01, 4, "키퍼 제치기 시도"),
    (0x01, 7, "상대 밀착 마크"),
    (0x02, 2, "등지고 플레이"),
    (0x02, 3, "내려와 볼 받기"),
    (0x02, 4, "원투 플레이"),
    (0x03, 3, "상대 제치고 치고 달리기"),
    (0x04, 1, "항상 뒤에 머무름"),
    (0x04, 3, "트릭 시도"),
    (0x04, 5, "거친 태클"),
    (0x04, 7, "양 측면서 안으로 파고듦"),
    (0x05, 6, "반복적인 1:1 돌파"),
    (0x07, 1, "왼쪽서 안으로 파고듦"),
    (0x07, 2, "오른쪽서 안으로 파고듦"),
    (0x07, 3, "얼리 크로스"),
];

/// PATR 상대 인덱스(0x00~0x35)별 한글 능력치 라벨.
const ATTR_LABELS: [&str; ATTR_COUNT] = [
    "크로스",
    "드리블",
    "골 결정력",
    "헤더",
    "중거리 슛",
    "마크",
    "오프 더 볼",
    "패스",
    "페널티 킥",
    "태클",
    "시야",
    "핸들링",
    "공중 장악력",
    "장악력",
    "수비 조율",
    "킥",
    "던지기",
    "예측력",
    "판단력",
    "일대일 방어",
    "위치 선정",
    "반사 신경",
    "퍼스트 터치",
    "개인기",
    "왼발",
    "오른발",
    "천재성",
    "코너킥",
    "팀워크",
    "활동량",
    "롱 스로",
    "돌출성",
    "뛰쳐나가기",
    "펀칭",
    "가속력",
    "프리킥",
    "몸싸움",
    "지구력",
    "주력",
    "점프 거리",
    "리더십",
    "거친 플레이",
    "균형 감각",
    "대담성",
    "기복 없음",
    "적극성",
    "민첩성",
    "빅매치",
    "부상 빈도",
    "다재다능",
    "타고난 체력",
    "투지",
    "침착성",
    "집중력",
];

#[derive(Clone, Serialize)]
#[serde(rename_all = "camelCase")]
pub(super) struct AttrValue {
    pub label: &'static str,
    pub value: u8,
}

/// 14 이상인 능력치를 값 내림차순으로 최대 8개 (주발 제외 — 별도 표기).
pub(super) fn standout(attrs: &[u8]) -> Vec<AttrValue> {
    let mut values: Vec<AttrValue> = ATTR_LABELS
        .iter()
        .enumerate()
        .filter(|(i, _)| *i != LEFT_FOOT && *i != RIGHT_FOOT)
        .map(|(i, label)| AttrValue {
            label,
            value: attrs[i],
        })
        .filter(|a| a.value >= 14)
        .collect();
    values.sort_by(|a, b| b.value.cmp(&a.value));
    values.truncate(8);
    values
}

/// PPRM 바이트들에서 활성 특성 라벨을 뽑는다.
pub(super) fn active_traits(bytes: &[u8]) -> Vec<String> {
    TRAITS
        .iter()
        .filter_map(|(byte, bit, label)| {
            let b = *bytes.get(*byte)?;
            ((b & (1 << bit)) != 0).then(|| label.to_string())
        })
        .collect()
}
