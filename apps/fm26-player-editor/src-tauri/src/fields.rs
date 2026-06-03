use serde::Serialize;
use serde_json::{json, Value};

use super::{process::Target, PlayerPointers};

#[derive(Clone, Copy)]
enum BaseKind {
    Person,
    Player,
}

#[derive(Clone, Copy, Serialize)]
#[serde(rename_all = "snake_case")]
#[allow(dead_code)]
pub(super) enum ValueKind {
    Byte,
    Int16,
    UInt16,
    FmAttribute,
    Bit,
}

#[derive(Clone, Copy)]
#[allow(dead_code)]
pub(super) struct FieldDef {
    key: &'static str,
    label: &'static str,
    category: &'static str,
    base: BaseKind,
    offset: usize,
    kind: ValueKind,
    size: usize,
    bit: i32,
    min: i32,
    max: i32,
}

#[derive(Serialize)]
#[serde(rename_all = "camelCase")]
pub(super) struct FieldDescriptor {
    key: &'static str,
    label: &'static str,
    category: &'static str,
    kind: ValueKind,
    min: i32,
    max: i32,
}

macro_rules! field {
    ($key:literal, $label:literal, $category:literal, $base:ident, $offset:expr, $kind:ident, $size:expr, $bit:expr, $min:expr, $max:expr) => {
        FieldDef {
            key: $key,
            label: $label,
            category: $category,
            base: BaseKind::$base,
            offset: $offset,
            kind: ValueKind::$kind,
            size: $size,
            bit: $bit,
            min: $min,
            max: $max,
        }
    };
}

pub(super) const PATR: usize = 0x15f;
pub(super) const PPOS: usize = 0x150;
const PPRM: usize = 0x0c0;
pub(super) const PADA: usize = 0x70;

pub(super) static FIELDS: &[FieldDef] = &[
    field!(
        "ca",
        "현재 능력",
        "hidden",
        Player,
        0x264,
        Int16,
        2,
        -1,
        1,
        200
    ),
    field!(
        "pa",
        "잠재 능력",
        "hidden",
        Player,
        0x266,
        Int16,
        2,
        -1,
        1,
        200
    ),
    field!(
        "current_rep",
        "현재 명성",
        "hidden",
        Player,
        0x260,
        Int16,
        2,
        -1,
        0,
        10000
    ),
    field!(
        "home_rep",
        "국내 명성",
        "hidden",
        Player,
        0x25e,
        Int16,
        2,
        -1,
        0,
        10000
    ),
    field!(
        "world_rep",
        "세계 명성",
        "hidden",
        Player,
        0x262,
        Int16,
        2,
        -1,
        0,
        10000
    ),
    field!("height", "키", "hidden", Player, 0x22e, Int16, 2, -1, 0, 250),
    field!(
        "left_foot",
        "왼발",
        "hidden",
        Player,
        PATR + 0x18,
        FmAttribute,
        1,
        -1,
        1,
        20
    ),
    field!(
        "right_foot",
        "오른발",
        "hidden",
        Player,
        PATR + 0x19,
        FmAttribute,
        1,
        -1,
        1,
        20
    ),
    field!("morale", "사기", "hidden", Player, 0x26c, Byte, 1, -1, 1, 20),
    field!(
        "condition",
        "몸 상태",
        "hidden",
        Player,
        0x258,
        Int16,
        2,
        -1,
        0,
        10000
    ),
    field!(
        "match_sharpness",
        "경기 감각",
        "hidden",
        Player,
        0x25c,
        Int16,
        2,
        -1,
        0,
        10000
    ),
    field!(
        "fatigue",
        "피로도",
        "hidden",
        Player,
        0x25a,
        Int16,
        2,
        -1,
        0,
        10000
    ),
    field!(
        "crossing",
        "크로스",
        "technical",
        Player,
        PATR,
        FmAttribute,
        1,
        -1,
        1,
        20
    ),
    field!(
        "dribbling",
        "드리블",
        "technical",
        Player,
        PATR + 0x01,
        FmAttribute,
        1,
        -1,
        1,
        20
    ),
    field!(
        "finishing",
        "골 결정력",
        "technical",
        Player,
        PATR + 0x02,
        FmAttribute,
        1,
        -1,
        1,
        20
    ),
    field!(
        "heading",
        "헤더",
        "technical",
        Player,
        PATR + 0x03,
        FmAttribute,
        1,
        -1,
        1,
        20
    ),
    field!(
        "long_shots",
        "중거리 슛",
        "technical",
        Player,
        PATR + 0x04,
        FmAttribute,
        1,
        -1,
        1,
        20
    ),
    field!(
        "marking",
        "마크",
        "technical",
        Player,
        PATR + 0x05,
        FmAttribute,
        1,
        -1,
        1,
        20
    ),
    field!(
        "passing",
        "패스",
        "technical",
        Player,
        PATR + 0x07,
        FmAttribute,
        1,
        -1,
        1,
        20
    ),
    field!(
        "penalty_taking",
        "페널티 킥",
        "technical",
        Player,
        PATR + 0x08,
        FmAttribute,
        1,
        -1,
        1,
        20
    ),
    field!(
        "tackling",
        "태클",
        "technical",
        Player,
        PATR + 0x09,
        FmAttribute,
        1,
        -1,
        1,
        20
    ),
    field!(
        "first_touch",
        "퍼스트 터치",
        "technical",
        Player,
        PATR + 0x16,
        FmAttribute,
        1,
        -1,
        1,
        20
    ),
    field!(
        "technique",
        "개인기",
        "technical",
        Player,
        PATR + 0x17,
        FmAttribute,
        1,
        -1,
        1,
        20
    ),
    field!(
        "corners",
        "코너킥",
        "technical",
        Player,
        PATR + 0x1b,
        FmAttribute,
        1,
        -1,
        1,
        20
    ),
    field!(
        "free_kick_taking",
        "프리킥",
        "technical",
        Player,
        PATR + 0x23,
        FmAttribute,
        1,
        -1,
        1,
        20
    ),
    field!(
        "long_throws",
        "롱 스로인",
        "technical",
        Player,
        PATR + 0x1e,
        FmAttribute,
        1,
        -1,
        1,
        20
    ),
    field!(
        "off_the_ball",
        "오프 더 볼",
        "mental",
        Player,
        PATR + 0x06,
        FmAttribute,
        1,
        -1,
        1,
        20
    ),
    field!(
        "vision",
        "시야",
        "mental",
        Player,
        PATR + 0x0a,
        FmAttribute,
        1,
        -1,
        1,
        20
    ),
    field!(
        "anticipation",
        "예측력",
        "mental",
        Player,
        PATR + 0x11,
        FmAttribute,
        1,
        -1,
        1,
        20
    ),
    field!(
        "decisions",
        "판단력",
        "mental",
        Player,
        PATR + 0x12,
        FmAttribute,
        1,
        -1,
        1,
        20
    ),
    field!(
        "positioning",
        "위치 선정",
        "mental",
        Player,
        PATR + 0x14,
        FmAttribute,
        1,
        -1,
        1,
        20
    ),
    field!(
        "flair",
        "천재성",
        "mental",
        Player,
        PATR + 0x1a,
        FmAttribute,
        1,
        -1,
        1,
        20
    ),
    field!(
        "teamwork",
        "팀워크",
        "mental",
        Player,
        PATR + 0x1c,
        FmAttribute,
        1,
        -1,
        1,
        20
    ),
    field!(
        "work_rate",
        "활동량",
        "mental",
        Player,
        PATR + 0x1d,
        FmAttribute,
        1,
        -1,
        1,
        20
    ),
    field!(
        "leadership",
        "리더십",
        "mental",
        Player,
        PATR + 0x28,
        FmAttribute,
        1,
        -1,
        1,
        20
    ),
    field!(
        "bravery",
        "대담성",
        "mental",
        Player,
        PATR + 0x2b,
        FmAttribute,
        1,
        -1,
        1,
        20
    ),
    field!(
        "aggression",
        "적극성",
        "mental",
        Player,
        PATR + 0x2d,
        FmAttribute,
        1,
        -1,
        1,
        20
    ),
    field!(
        "determination",
        "승부욕",
        "mental",
        Player,
        PATR + 0x33,
        FmAttribute,
        1,
        -1,
        1,
        20
    ),
    field!(
        "composure",
        "침착성",
        "mental",
        Player,
        PATR + 0x34,
        FmAttribute,
        1,
        -1,
        1,
        20
    ),
    field!(
        "concentration",
        "집중력",
        "mental",
        Player,
        PATR + 0x35,
        FmAttribute,
        1,
        -1,
        1,
        20
    ),
    field!(
        "acceleration",
        "순간 속도",
        "physical",
        Player,
        PATR + 0x22,
        FmAttribute,
        1,
        -1,
        1,
        20
    ),
    field!(
        "strength",
        "몸싸움",
        "physical",
        Player,
        PATR + 0x24,
        FmAttribute,
        1,
        -1,
        1,
        20
    ),
    field!(
        "stamina",
        "지구력",
        "physical",
        Player,
        PATR + 0x25,
        FmAttribute,
        1,
        -1,
        1,
        20
    ),
    field!(
        "pace",
        "주력",
        "physical",
        Player,
        PATR + 0x26,
        FmAttribute,
        1,
        -1,
        1,
        20
    ),
    field!(
        "jumping_reach",
        "점프 거리",
        "physical",
        Player,
        PATR + 0x27,
        FmAttribute,
        1,
        -1,
        1,
        20
    ),
    field!(
        "balance",
        "균형 감각",
        "physical",
        Player,
        PATR + 0x2a,
        FmAttribute,
        1,
        -1,
        1,
        20
    ),
    field!(
        "agility",
        "민첩성",
        "physical",
        Player,
        PATR + 0x2e,
        FmAttribute,
        1,
        -1,
        1,
        20
    ),
    field!(
        "natural_fitness",
        "타고난 체력",
        "physical",
        Player,
        PATR + 0x32,
        FmAttribute,
        1,
        -1,
        1,
        20
    ),
    field!(
        "handling",
        "핸들링",
        "goalkeeping",
        Player,
        PATR + 0x0b,
        FmAttribute,
        1,
        -1,
        1,
        20
    ),
    field!(
        "aerial_reach",
        "공중 장악력",
        "goalkeeping",
        Player,
        PATR + 0x0c,
        FmAttribute,
        1,
        -1,
        1,
        20
    ),
    field!(
        "command_of_area",
        "장악력",
        "goalkeeping",
        Player,
        PATR + 0x0d,
        FmAttribute,
        1,
        -1,
        1,
        20
    ),
    field!(
        "communication",
        "수비 조율",
        "goalkeeping",
        Player,
        PATR + 0x0e,
        FmAttribute,
        1,
        -1,
        1,
        20
    ),
    field!(
        "kicking",
        "킥",
        "goalkeeping",
        Player,
        PATR + 0x0f,
        FmAttribute,
        1,
        -1,
        1,
        20
    ),
    field!(
        "throwing",
        "던지기",
        "goalkeeping",
        Player,
        PATR + 0x10,
        FmAttribute,
        1,
        -1,
        1,
        20
    ),
    field!(
        "one_on_ones",
        "일대일 방어",
        "goalkeeping",
        Player,
        PATR + 0x13,
        FmAttribute,
        1,
        -1,
        1,
        20
    ),
    field!(
        "reflexes",
        "반사 신경",
        "goalkeeping",
        Player,
        PATR + 0x15,
        FmAttribute,
        1,
        -1,
        1,
        20
    ),
    field!(
        "eccentricity",
        "돌발 행동",
        "goalkeeping",
        Player,
        PATR + 0x1f,
        FmAttribute,
        1,
        -1,
        1,
        20
    ),
    field!(
        "rushing_out",
        "뛰쳐나가기",
        "goalkeeping",
        Player,
        PATR + 0x20,
        FmAttribute,
        1,
        -1,
        1,
        20
    ),
    field!(
        "punching",
        "펀칭 빈도",
        "goalkeeping",
        Player,
        PATR + 0x21,
        FmAttribute,
        1,
        -1,
        1,
        20
    ),
    field!(
        "dirtiness",
        "더티 플레이",
        "hidden",
        Player,
        PATR + 0x29,
        FmAttribute,
        1,
        -1,
        1,
        20
    ),
    field!(
        "consistency",
        "꾸준함",
        "hidden",
        Player,
        PATR + 0x2c,
        FmAttribute,
        1,
        -1,
        1,
        20
    ),
    field!(
        "important_matches",
        "중요 경기",
        "hidden",
        Player,
        PATR + 0x2f,
        FmAttribute,
        1,
        -1,
        1,
        20
    ),
    field!(
        "injury_proneness",
        "부상 빈도",
        "hidden",
        Player,
        PATR + 0x30,
        FmAttribute,
        1,
        -1,
        1,
        20
    ),
    field!(
        "versatility",
        "다재다능",
        "hidden",
        Player,
        PATR + 0x31,
        FmAttribute,
        1,
        -1,
        1,
        20
    ),
    field!(
        "adaptability",
        "적응력",
        "hidden",
        Person,
        PADA,
        Byte,
        1,
        -1,
        1,
        20
    ),
    field!(
        "ambition",
        "야망",
        "hidden",
        Person,
        PADA + 0x01,
        Byte,
        1,
        -1,
        1,
        20
    ),
    field!(
        "loyalty",
        "충성심",
        "hidden",
        Person,
        PADA + 0x02,
        Byte,
        1,
        -1,
        1,
        20
    ),
    field!(
        "pressure",
        "압박감 대처",
        "hidden",
        Person,
        PADA + 0x03,
        Byte,
        1,
        -1,
        1,
        20
    ),
    field!(
        "professionalism",
        "프로의식",
        "hidden",
        Person,
        PADA + 0x04,
        Byte,
        1,
        -1,
        1,
        20
    ),
    field!(
        "sportsmanship",
        "스포츠맨십",
        "hidden",
        Person,
        PADA + 0x05,
        Byte,
        1,
        -1,
        1,
        20
    ),
    field!(
        "temperament",
        "참을성",
        "hidden",
        Person,
        PADA + 0x06,
        Byte,
        1,
        -1,
        1,
        20
    ),
    field!(
        "controversy",
        "논쟁성",
        "hidden",
        Person,
        PADA + 0x07,
        Byte,
        1,
        -1,
        1,
        20
    ),
    field!(
        "pos_gk",
        "골키퍼",
        "positions",
        Player,
        PPOS,
        Byte,
        1,
        -1,
        1,
        20
    ),
    field!(
        "pos_sw",
        "스위퍼",
        "positions",
        Player,
        PPOS + 0x01,
        Byte,
        1,
        -1,
        1,
        20
    ),
    field!(
        "pos_dl",
        "왼쪽 수비수",
        "positions",
        Player,
        PPOS + 0x02,
        Byte,
        1,
        -1,
        1,
        20
    ),
    field!(
        "pos_dc",
        "중앙 수비수",
        "positions",
        Player,
        PPOS + 0x03,
        Byte,
        1,
        -1,
        1,
        20
    ),
    field!(
        "pos_dr",
        "오른쪽 수비수",
        "positions",
        Player,
        PPOS + 0x04,
        Byte,
        1,
        -1,
        1,
        20
    ),
    field!(
        "pos_dm",
        "수비형 미드필더",
        "positions",
        Player,
        PPOS + 0x05,
        Byte,
        1,
        -1,
        1,
        20
    ),
    field!(
        "pos_ml",
        "왼쪽 미드필더",
        "positions",
        Player,
        PPOS + 0x06,
        Byte,
        1,
        -1,
        1,
        20
    ),
    field!(
        "pos_mc",
        "중앙 미드필더",
        "positions",
        Player,
        PPOS + 0x07,
        Byte,
        1,
        -1,
        1,
        20
    ),
    field!(
        "pos_mr",
        "오른쪽 미드필더",
        "positions",
        Player,
        PPOS + 0x08,
        Byte,
        1,
        -1,
        1,
        20
    ),
    field!(
        "pos_aml",
        "왼쪽 윙어",
        "positions",
        Player,
        PPOS + 0x09,
        Byte,
        1,
        -1,
        1,
        20
    ),
    field!(
        "pos_amc",
        "공격형 미드필더",
        "positions",
        Player,
        PPOS + 0x0a,
        Byte,
        1,
        -1,
        1,
        20
    ),
    field!(
        "pos_amr",
        "오른쪽 윙어",
        "positions",
        Player,
        PPOS + 0x0b,
        Byte,
        1,
        -1,
        1,
        20
    ),
    field!(
        "pos_st",
        "스트라이커",
        "positions",
        Player,
        PPOS + 0x0c,
        Byte,
        1,
        -1,
        1,
        20
    ),
    field!(
        "pos_wbl",
        "왼쪽 윙백",
        "positions",
        Player,
        PPOS + 0x0d,
        Byte,
        1,
        -1,
        1,
        20
    ),
    field!(
        "pos_wbr",
        "오른쪽 윙백",
        "positions",
        Player,
        PPOS + 0x0e,
        Byte,
        1,
        -1,
        1,
        20
    ),
    field!(
        "preferred_central_position",
        "선호 중앙 위치",
        "positions",
        Player,
        0x276,
        Byte,
        1,
        -1,
        0,
        7
    ),
    field!(
        "trait_run_left",
        "왼쪽 측면 돌파 선호",
        "traits",
        Person,
        PPRM,
        Bit,
        1,
        0,
        0,
        1
    ),
    field!(
        "trait_run_right",
        "오른쪽 측면 돌파 선호",
        "traits",
        Person,
        PPRM,
        Bit,
        1,
        1,
        0,
        1
    ),
    field!(
        "trait_run_center",
        "중앙 돌파 선호",
        "traits",
        Person,
        PPRM,
        Bit,
        1,
        2,
        0,
        1
    ),
    field!(
        "trait_gets_into_area",
        "상대 박스 침투 선호",
        "traits",
        Person,
        PPRM,
        Bit,
        1,
        3,
        0,
        1
    ),
    field!(
        "trait_moves_channels",
        "측면 공간 침투 선호",
        "traits",
        Person,
        PPRM,
        Bit,
        1,
        4,
        0,
        1
    ),
    field!(
        "trait_gets_forward",
        "틈날 때마다 전방 침투",
        "traits",
        Person,
        PPRM,
        Bit,
        1,
        5,
        0,
        1
    ),
    field!(
        "trait_short_simple_passes",
        "짧고 간단한 패스 선호",
        "traits",
        Person,
        PPRM,
        Bit,
        1,
        6,
        0,
        1
    ),
    field!(
        "trait_killer_balls",
        "침투 패스 자주 시도",
        "traits",
        Person,
        PPRM,
        Bit,
        1,
        7,
        0,
        1
    ),
    field!(
        "trait_shoots_distance",
        "먼 거리에서 슛 선호",
        "traits",
        Person,
        PPRM + 1,
        Bit,
        1,
        0,
        0,
        1
    ),
    field!(
        "trait_shoots_power",
        "강슛 선호",
        "traits",
        Person,
        PPRM + 1,
        Bit,
        1,
        1,
        0,
        1
    ),
    field!(
        "trait_places_shots",
        "정확한 슛 선호",
        "traits",
        Person,
        PPRM + 1,
        Bit,
        1,
        2,
        0,
        1
    ),
    field!(
        "trait_curls_ball",
        "감아차기 선호",
        "traits",
        Person,
        PPRM + 1,
        Bit,
        1,
        3,
        0,
        1
    ),
    field!(
        "trait_round_keeper",
        "골키퍼 제치기 선호",
        "traits",
        Person,
        PPRM + 1,
        Bit,
        1,
        4,
        0,
        1
    ),
    field!(
        "trait_break_offside_trap",
        "오프사이드 트랩 돌파",
        "traits",
        Person,
        PPRM + 1,
        Bit,
        1,
        5,
        0,
        1
    ),
    field!(
        "trait_outside_foot",
        "아웃사이드 킥 사용",
        "traits",
        Person,
        PPRM + 1,
        Bit,
        1,
        6,
        0,
        1
    ),
    field!(
        "trait_marks_tightly",
        "상대 밀착 마크",
        "traits",
        Person,
        PPRM + 1,
        Bit,
        1,
        7,
        0,
        1
    ),
    field!(
        "trait_winds_up",
        "상대 자극",
        "traits",
        Person,
        PPRM + 2,
        Bit,
        1,
        0,
        0,
        1
    ),
    field!(
        "trait_argues_officials",
        "심판에게 항의",
        "traits",
        Person,
        PPRM + 2,
        Bit,
        1,
        1,
        0,
        1
    ),
    field!(
        "trait_back_to_goal",
        "등지고 플레이",
        "traits",
        Person,
        PPRM + 2,
        Bit,
        1,
        2,
        0,
        1
    ),
    field!(
        "trait_comes_deep",
        "공 받으러 내려옴",
        "traits",
        Person,
        PPRM + 2,
        Bit,
        1,
        3,
        0,
        1
    ),
    field!(
        "trait_one_twos",
        "2대1 패스 선호",
        "traits",
        Person,
        PPRM + 2,
        Bit,
        1,
        4,
        0,
        1
    ),
    field!(
        "trait_lob_keeper",
        "골키퍼 넘기는 슛 선호",
        "traits",
        Person,
        PPRM + 2,
        Bit,
        1,
        5,
        0,
        1
    ),
    field!(
        "trait_dictates_tempo",
        "템포 조절",
        "traits",
        Person,
        PPRM + 2,
        Bit,
        1,
        6,
        0,
        1
    ),
    field!(
        "trait_overhead_kicks",
        "오버헤드킥 시도",
        "traits",
        Person,
        PPRM + 2,
        Bit,
        1,
        7,
        0,
        1
    ),
    field!(
        "trait_pass_not_score",
        "슛보다 패스 선호",
        "traits",
        Person,
        PPRM + 3,
        Bit,
        1,
        0,
        0,
        1
    ),
    field!(
        "trait_no_through_balls",
        "스루 패스 자제",
        "traits",
        Person,
        PPRM + 3,
        Bit,
        1,
        1,
        0,
        1
    ),
    field!(
        "trait_stops_play",
        "플레이 템포를 끊음",
        "traits",
        Person,
        PPRM + 3,
        Bit,
        1,
        2,
        0,
        1
    ),
    field!(
        "trait_knocks_past",
        "공 차놓고 제치기",
        "traits",
        Person,
        PPRM + 3,
        Bit,
        1,
        3,
        0,
        1
    ),
    field!(
        "trait_right_foot_dribble",
        "드리블 전 오른발로 옮김",
        "traits",
        Person,
        PPRM + 3,
        Bit,
        1,
        4,
        0,
        1
    ),
    field!(
        "trait_left_foot_dribble",
        "드리블 전 왼발로 옮김",
        "traits",
        Person,
        PPRM + 3,
        Bit,
        1,
        5,
        0,
        1
    ),
    field!(
        "trait_dwells_ball",
        "공을 오래 끔",
        "traits",
        Person,
        PPRM + 3,
        Bit,
        1,
        6,
        0,
        1
    ),
    field!(
        "trait_arrives_late",
        "상대 박스 늦게 침투",
        "traits",
        Person,
        PPRM + 3,
        Bit,
        1,
        7,
        0,
        1
    ),
    field!(
        "trait_play_out_trouble",
        "위기에서 공 몰고 탈출",
        "traits",
        Person,
        PPRM + 4,
        Bit,
        1,
        0,
        0,
        1
    ),
    field!(
        "trait_stays_back",
        "항상 후방에 머무름",
        "traits",
        Person,
        PPRM + 4,
        Bit,
        1,
        1,
        0,
        1
    ),
    field!(
        "trait_avoids_weaker_foot",
        "약한 발 사용 회피",
        "traits",
        Person,
        PPRM + 4,
        Bit,
        1,
        2,
        0,
        1
    ),
    field!(
        "trait_tries_tricks",
        "개인기 시도",
        "traits",
        Person,
        PPRM + 4,
        Bit,
        1,
        3,
        0,
        1
    ),
    field!(
        "trait_long_free_kicks",
        "장거리 프리킥 시도",
        "traits",
        Person,
        PPRM + 4,
        Bit,
        1,
        4,
        0,
        1
    ),
    field!(
        "trait_dives_tackles",
        "태클에 적극적으로 뛰어듦",
        "traits",
        Person,
        PPRM + 4,
        Bit,
        1,
        5,
        0,
        1
    ),
    field!(
        "trait_no_dives_tackles",
        "무리한 태클 자제",
        "traits",
        Person,
        PPRM + 4,
        Bit,
        1,
        6,
        0,
        1
    ),
    field!(
        "trait_cuts_inside_both",
        "양쪽 측면에서 안쪽 침투",
        "traits",
        Person,
        PPRM + 4,
        Bit,
        1,
        7,
        0,
        1
    ),
    field!(
        "trait_hugs_line",
        "터치라인 따라 움직임",
        "traits",
        Person,
        PPRM + 5,
        Bit,
        1,
        0,
        0,
        1
    ),
    field!(
        "trait_gets_crowd_going",
        "관중 호응 유도",
        "traits",
        Person,
        PPRM + 5,
        Bit,
        1,
        1,
        0,
        1
    ),
    field!(
        "trait_first_time_shots",
        "논스톱 슛 시도",
        "traits",
        Person,
        PPRM + 5,
        Bit,
        1,
        2,
        0,
        1
    ),
    field!(
        "trait_long_passes",
        "긴 패스 시도",
        "traits",
        Person,
        PPRM + 5,
        Bit,
        1,
        3,
        0,
        1
    ),
    field!(
        "trait_ball_into_feet",
        "발밑 패스 선호",
        "traits",
        Person,
        PPRM + 5,
        Bit,
        1,
        4,
        0,
        1
    ),
    field!(
        "trait_fk_power",
        "강한 프리킥 선호",
        "traits",
        Person,
        PPRM + 5,
        Bit,
        1,
        5,
        0,
        1
    ),
    field!(
        "trait_beat_man_repeatedly",
        "상대 반복 돌파 선호",
        "traits",
        Person,
        PPRM + 5,
        Bit,
        1,
        6,
        0,
        1
    ),
    field!(
        "trait_switch_flank",
        "반대편 측면 전환 선호",
        "traits",
        Person,
        PPRM + 5,
        Bit,
        1,
        7,
        0,
        1
    ),
    field!(
        "trait_long_flat_throw",
        "빠르고 낮은 장거리 스로인",
        "traits",
        Person,
        PPRM + 6,
        Bit,
        1,
        2,
        0,
        1
    ),
    field!(
        "trait_runs_often",
        "공을 자주 몰고 전진",
        "traits",
        Person,
        PPRM + 6,
        Bit,
        1,
        3,
        0,
        1
    ),
    field!(
        "trait_runs_rarely",
        "공 몰고 전진 자제",
        "traits",
        Person,
        PPRM + 6,
        Bit,
        1,
        4,
        0,
        1
    ),
    field!(
        "trait_no_moves_channels",
        "측면 공간 침투 자제",
        "traits",
        Person,
        PPRM + 6,
        Bit,
        1,
        6,
        0,
        1
    ),
    field!(
        "trait_long_throw_counters",
        "긴 스로인으로 역습 시작",
        "traits",
        Person,
        PPRM + 6,
        Bit,
        1,
        7,
        0,
        1
    ),
    field!(
        "trait_no_long_shots",
        "중거리 슛 자제",
        "traits",
        Person,
        PPRM + 7,
        Bit,
        1,
        0,
        0,
        1
    ),
    field!(
        "trait_cuts_inside_left",
        "왼쪽에서 안쪽 침투",
        "traits",
        Person,
        PPRM + 7,
        Bit,
        1,
        1,
        0,
        1
    ),
    field!(
        "trait_cuts_inside_right",
        "오른쪽에서 안쪽 침투",
        "traits",
        Person,
        PPRM + 7,
        Bit,
        1,
        2,
        0,
        1
    ),
    field!(
        "trait_crosses_early",
        "이른 크로스 시도",
        "traits",
        Person,
        PPRM + 7,
        Bit,
        1,
        3,
        0,
        1
    ),
    field!(
        "trait_brings_ball_out",
        "수비 지역에서 공 몰고 나옴",
        "traits",
        Person,
        PPRM + 7,
        Bit,
        1,
        4,
        0,
        1
    ),
    field!(
        "trait_plays_ball_feet",
        "발로 플레이 선호",
        "traits",
        Person,
        PPRM + 7,
        Bit,
        1,
        7,
        0,
        1
    ),
];

pub(super) fn field_descriptors() -> Vec<FieldDescriptor> {
    FIELDS
        .iter()
        .map(|field| FieldDescriptor {
            key: field.key,
            label: field.label,
            category: field.category,
            kind: field.kind,
            min: field.min,
            max: field.max,
        })
        .collect()
}

pub(super) fn find_field(key: &str) -> Option<&'static FieldDef> {
    FIELDS.iter().find(|field| field.key == key)
}

fn field_addr(pointers: &PlayerPointers, field: &FieldDef) -> usize {
    match field.base {
        BaseKind::Person => pointers.person + field.offset,
        BaseKind::Player => pointers.player + field.offset,
    }
}

pub(super) fn read_field_value(
    target: &Target,
    pointers: &PlayerPointers,
    field: &FieldDef,
) -> Result<Value, String> {
    let addr = field_addr(pointers, field);
    match field.kind {
        ValueKind::Byte => Ok(json!(target.read_u8(addr)?)),
        ValueKind::Int16 => Ok(json!(target.read_i16(addr)?)),
        ValueKind::UInt16 => Ok(json!(target.read_u16(addr)?)),
        ValueKind::FmAttribute => {
            let raw = target.read_u8(addr)? as f64;
            Ok(json!((raw / 5.0 + 0.5).floor() as i32))
        }
        ValueKind::Bit => {
            let raw = target.read_u8(addr)?;
            Ok(json!((raw & (1u8 << field.bit)) != 0))
        }
    }
}

pub(super) fn write_field_value(
    target: &Target,
    pointers: &PlayerPointers,
    field: &FieldDef,
    value: &Value,
) -> Result<(), String> {
    let addr = field_addr(pointers, field);
    match field.kind {
        ValueKind::Bit => {
            let enabled = value
                .as_bool()
                .ok_or("boolean 값을 기대했습니다.".to_string())?;
            let raw = target.read_u8(addr)?;
            let mask = 1u8 << field.bit;
            let next = if enabled { raw | mask } else { raw & !mask };
            target.write(addr, &[next])
        }
        ValueKind::Byte => {
            let next = clamp_i64(value, field.min, field.max)? as u8;
            target.write(addr, &[next])
        }
        ValueKind::FmAttribute => {
            let next = clamp_i64(value, field.min, field.max)? as u8 * 5;
            target.write(addr, &[next])
        }
        ValueKind::Int16 => {
            let next = clamp_i64(value, field.min, field.max)? as i16;
            target.write(addr, &next.to_le_bytes())
        }
        ValueKind::UInt16 => {
            let next = clamp_i64(value, field.min, field.max)? as u16;
            target.write(addr, &next.to_le_bytes())
        }
    }
}

fn clamp_i64(value: &Value, min: i32, max: i32) -> Result<i64, String> {
    let n = value
        .as_i64()
        .ok_or("정수 값을 기대했습니다.".to_string())?;
    Ok(n.clamp(min as i64, max as i64))
}
