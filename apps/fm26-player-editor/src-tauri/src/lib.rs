use base64::engine::general_purpose::STANDARD as BASE64;
use base64::Engine;
use serde::{Deserialize, Serialize};
use serde_json::Value;
use std::collections::{HashMap, HashSet};
use std::fs;
use std::sync::Mutex;

mod analysis;
mod comparisons;
mod fields;
mod media;
mod noise;
mod portrait;
mod portrait_prompt;
mod process;
mod save_analysis;
mod scouting;

use comparisons::{comparison_phrase, comparison_references};
use fields::{
    field_descriptors, find_field, read_field_value, write_field_value, FieldDescriptor, PADA,
    PATR, PPOS,
};
use media::find_face_file;
use process::{
    find_process_id, open_process_rw, readable_regions, try_enable_se_debug_privilege, Target,
};
use save_analysis::{
    analyze_decompressed, analyze_save_header, DecompressionResult, SaveFileHeader,
};
use scouting::{
    count_positions, count_rating_bands, development_band, generate_summary_narrative, rating_band,
    recommendation_hint,
};

const OBJ_DUNI: usize = 0x0c;
const PLAYER_OFFSET: i32 = 0x288;
const STAFF_OFFSET: i32 = 0x100;
const PLAYER_STAFF_OFFSET: i32 = 0x380;
const PERSON_FIRST_NAME: usize = 0x50;
const PERSON_SECOND_NAME: usize = 0x58;
const PERSON_COMMON_NAME: usize = 0x60;
const PERSON_NATION: usize = 0x68;
const PERSON_DOB: usize = 0x88;
const NATION_SHORT_NAME: usize = 0x20;
const NATION_NAME: usize = 0x30;
// FMCET 디컴파일된 lua의 nato 심볼표에서 가져온 오프셋.
// nation_ptr + 0x108 에서 Ntct 서브구조체 포인터를 읽고, 그 위에서
// Youth Rating(+0x864) / Game Importance(+0x79d) 바이트를 읽는다.
const NATION_NTCT_PTR: usize = 0x108;
const NTCT_YOUTH_RATING: usize = 0x864;
const NTCT_GAME_IMPORTANCE: usize = 0x79d;
// nato.Nnam = 24. NATION_NAME(0x30)은 실제로는 Nationality Name(Nnty)에 해당하므로
// "진짜 국가 이름"을 읽으려면 이쪽이 더 정확하다.
const NATION_REAL_NAME: usize = 0x18;
const CLUB_TEAMS: usize = 0x18;
const CLUB_NAME: usize = 0xc0;
const CLUB_SHORT_NAME: usize = 0xc8;
const CLUB_RECRUITMENT_TEAM: usize = 0x90;
const TEAM_TYPE: usize = 0x28;
const TEAM_CLUB: usize = 0x30;
const TEAM_PLAYERS: usize = 0x38;
const TEAM_MANAGER: usize = 0x80;
const HUMAN_MANAGER_OFFSET: i32 = 0x450;
const STAFF_ATTRS: usize = 0x10;
const MANAGER_SCOUTING_CENTRE: usize = 0x370;
const MANAGER_SCOUTING_BUDGET: usize = 0xde0;
const MANAGER_RECRUITMENT_PACKAGE: usize = 0xdec;
const MANAGER_FLAGS_1: usize = 0x404;
// FMCET plao 심볼표(FMCETableEnums.lua)에서 추출. plao.Phes=558, plao.Pwes=332.
const PLAYER_HEIGHT: usize = 0x22e; // 2바이트, cm (편집항목 Height로 확인됨)
const PLAYER_WEIGHT: usize = 0x14c; // plao.Pwes, kg 추정 (미검증)
const PERSON_PPRM: usize = 0xc0; // 선수 특성 비트필드 (Person 기준)

#[derive(Default)]
struct AppState {
    target: Mutex<Option<Target>>,
    player: Mutex<Option<PlayerPointers>>,
    nation: Mutex<Option<NationPointers>>,
    scouting_cache: Mutex<HashMap<u32, PlayerPointers>>,
    game_date: Mutex<GameDate>,
}

#[derive(Clone, Copy, Serialize)]
struct PlayerPointers {
    person: usize,
    player: usize,
}

#[derive(Clone, Copy, Serialize)]
struct NationPointers {
    nation: usize,
    ntct: usize,
}

#[derive(Serialize, Clone)]
#[serde(rename_all = "camelCase")]
struct NationCandidate {
    /// 국가 객체 주소 ("0x..." hex). 선택 시 select_nation으로 되돌려준다.
    nation: String,
    ntct: String,
    uid: u32,
    name: Option<String>,
    youth_rating: u8,
    game_importance: u8,
    /// 같은 vtable을 공유하는 후보 수. 높을수록 진짜 Nation일 확률이 높다(정렬용).
    vtable_votes: usize,
}

#[derive(Serialize)]
#[serde(rename_all = "camelCase")]
struct NationScanResult {
    uid: u32,
    youth_rating: u8,
    game_importance: u8,
    hit_count: usize,
    name: Option<String>,
    /// 검증을 통과한 모든 진짜 국가 후보. needs_selection일 때 사용자가 고른다.
    candidates: Vec<NationCandidate>,
    /// 후보가 2개 이상이라 사용자 선택이 필요한지 여부.
    needs_selection: bool,
    /// 단일 국가가 확정되어 state에 저장되었는지 여부.
    selected: bool,
}

#[derive(Clone, Copy)]
struct GameDate {
    year: i32,
    day_of_year: u16,
}

impl Default for GameDate {
    fn default() -> Self {
        Self {
            year: 2026,
            day_of_year: 1,
        }
    }
}

#[derive(Serialize)]
#[serde(rename_all = "camelCase")]
struct ConnectResult {
    pid: u32,
    process_name: &'static str,
    se_debug_enabled: bool,
}

#[derive(Serialize)]
#[serde(rename_all = "camelCase")]
struct ScanResult {
    uid: u32,
    name: Option<String>,
    person: usize,
    player: usize,
    ca: u16,
    pa: u16,
    dynamic_offset: i32,
    hit_count: usize,
}

#[derive(Serialize)]
#[serde(rename_all = "camelCase")]
struct FieldValue {
    key: String,
    value: Value,
}

#[derive(Deserialize)]
#[serde(rename_all = "camelCase")]
struct FieldChange {
    key: String,
    value: Value,
}

#[derive(Serialize)]
#[serde(rename_all = "camelCase")]
struct ApplyResult {
    key: String,
    ok: bool,
    value: Option<Value>,
    error: Option<String>,
}

#[derive(Deserialize)]
#[serde(rename_all = "camelCase")]
struct ScoutingRequest {
    team_name: String,
    squad_kind: String,
    knowledge_level: u8,
    player_uids: Vec<u32>,
    /// 스카우터의 "현재 능력 판단" 수치 (1~20). None이면 오차 없이 실제 값 표시.
    scout_jca: Option<u8>,
    /// 스카우터의 "성장 가능성 판단" 수치 (1~20). None이면 오차 없이 실제 값 표시.
    scout_jpa: Option<u8>,
}

#[derive(Deserialize)]
#[serde(rename_all = "camelCase")]
struct PlayerDetailRequest {
    player_uid: u32,
    /// 4단계(밀착 스카우팅) 또는 5단계(동행 관찰).
    knowledge_level: u8,
    /// 팀 보고서의 후보 배열 내 인덱스. 호명 라벨("최우선 추적 대상" 등)에 쓰인다.
    rank_index: usize,
    scout_jca: Option<u8>,
    scout_jpa: Option<u8>,
}

#[derive(Serialize)]
#[serde(rename_all = "camelCase")]
struct PlayerDetailReport {
    player_uid: u32,
    knowledge_level: u8,
    candidate: ScoutingCandidate,
    narrative: String,
}

#[derive(Serialize)]
#[serde(rename_all = "camelCase")]
struct ScoutingReport {
    team_name: String,
    squad_kind: String,
    knowledge_level: u8,
    total_requested: usize,
    resolved_players: usize,
    prospect_count: usize,
    senior_count: usize,
    pa_bands: Vec<ScoutingBand>,
    ca_bands: Vec<ScoutingBand>,
    position_counts: Vec<ScoutingBand>,
    prospect_candidates: Vec<ScoutingCandidate>,
    senior_candidates: Vec<ScoutingCandidate>,
    candidates: Vec<ScoutingCandidate>,
    unresolved_uids: Vec<u32>,
    summary_narrative: String,
    prospect_summary_narrative: String,
    senior_summary_narrative: String,
    /// 팀 보고서의 유망주 본문을 prologue + per-candidate 단락으로 분리한 구조.
    /// 프론트는 prologue 뒤에 paragraphs를 이어 붙이되, 특정 uid에 드릴다운 결과가 있으면
    /// 해당 단락만 교체해서 표시한다.
    prospect_summary_prologue: String,
    prospect_paragraphs: Vec<scouting::NarrativeParagraph>,
    senior_summary_prologue: String,
    senior_paragraphs: Vec<scouting::NarrativeParagraph>,
    /// 배정된 스카우터의 JCA. None이면 스카우터 미배정 (정밀 분석 모드).
    scout_jca: Option<u8>,
    /// 배정된 스카우터의 JPA.
    scout_jpa: Option<u8>,
}

#[derive(Serialize)]
#[serde(rename_all = "camelCase")]
struct ScoutingBand {
    label: String,
    count: usize,
}

#[derive(Clone, Serialize)]
#[serde(rename_all = "camelCase")]
struct ScoutingCandidate {
    label: String,
    uid: Option<u32>,
    position: String,
    age: Option<u16>,
    nation: Option<String>,
    ca: u16,
    pa: u16,
    ca_band: String,
    pa_band: String,
    abilities: Vec<ScoutingAbility>,
    comparisons: Vec<String>,
    development_band: Option<String>,
    comparison_phrase: Option<String>,
    personality_hint: Option<String>,
    personality_notes: Vec<String>,
    hidden_notes: Vec<String>,
    risk_hint: Option<String>,
    risk_details: Option<ScoutingRiskDetails>,
    recommendation: Option<String>,
}

#[derive(Clone, Serialize)]
#[serde(rename_all = "camelCase")]
struct ScoutingAbility {
    label: &'static str,
    category: &'static str,
    value: u8,
}

#[derive(Clone, Serialize)]
#[serde(rename_all = "camelCase")]
struct ScoutingRiskDetails {
    injury: String,
    consistency: String,
    big_matches: String,
    pressure: String,
    weakest_axis: String,
    note: String,
}

/// 전력 분석 도시에 — 상대(또는 우리) 스쿼드 전체의 진짜 정보 + 공략 분석.
#[derive(Serialize)]
#[serde(rename_all = "camelCase")]
struct SquadDossier {
    team_name: String,
    nation: Option<String>,
    reputation: Option<u16>,
    squad_kind: String,
    player_count: usize,
    /// CA 내림차순 정렬.
    players: Vec<DossierPlayer>,
    /// 위협 태그가 있는 핵심 선수 UID (하이라이트용).
    key_player_uids: Vec<u32>,
    /// 선발 추정 XI(상위 11명)에서 모은 공략 포인트(중복 제거).
    team_weaknesses: Vec<analysis::Tag>,
}

#[derive(Serialize)]
#[serde(rename_all = "camelCase")]
struct DossierPlayer {
    uid: u32,
    name: Option<String>,
    position: String,
    /// 소속 팀 종류 라벨 (1군/리저브/U21…). 스쿼드 지위 신호.
    squad_label: String,
    age: Option<u16>,
    nation: Option<String>,
    height_cm: Option<u16>,
    weight_kg: Option<u16>,
    ca: u16,
    pa: u16,
    foot: &'static str,
    /// 14 이상 능력치 상위 8개.
    standout: Vec<analysis::AttrValue>,
    traits: Vec<String>,
    threats: Vec<analysis::Tag>,
    weaknesses: Vec<analysis::Tag>,
}

#[derive(Serialize)]
#[serde(rename_all = "camelCase")]
struct ClubPlayerUidsResult {
    input_id: u32,
    source_kind: String,
    team_name: String,
    nation: Option<String>,
    reputation: Option<u16>,
    squad_kind: String,
    team_count: usize,
    player_uids: Vec<u32>,
    squads: Vec<ClubSquadPlayers>,
}

#[derive(Serialize)]
#[serde(rename_all = "camelCase")]
struct ClubIdentityResult {
    input_id: u32,
    source_kind: String,
    name: String,
    nation: Option<String>,
    reputation: Option<u16>,
    team_count: usize,
    player_count: usize,
    squad_label: String,
}

#[derive(Serialize)]
#[serde(rename_all = "camelCase")]
struct ScoutingBudgetResult {
    club_ptr: usize,
    team_ptr: usize,
    manager_ptr: usize,
    manager_person_ptr: usize,
    manager_uid: Option<u32>,
    recruitment_package: Option<u8>,
    season_budget: i64,
    remaining_budget: i64,
    unlimited_scouting: bool,
    source: String,
}

#[derive(Serialize)]
#[serde(rename_all = "camelCase")]
struct UserClubScoutsResult {
    club_ptr: usize,
    club_name: String,
    recruitment_team_count: usize,
    imported_count: usize,
    scouts: Vec<UserClubScout>,
    source: String,
}

#[derive(Clone, Serialize)]
#[serde(rename_all = "camelCase")]
struct UserClubScout {
    name: String,
    jca: u8,
    jpa: u8,
    adaptability: Option<u8>,
}

#[derive(Serialize)]
#[serde(rename_all = "camelCase")]
struct ClubSquadPlayers {
    team_type: u8,
    team_type_label: String,
    player_count: usize,
    player_uids: Vec<u32>,
}

#[derive(Clone)]
struct ScoutedPlayer {
    uid: u32,
    name: Option<String>,
    ca: u16,
    pa: u16,
    position: String,
    pointers: PlayerPointers,
    strength_profile: StrengthProfile,
    age: Option<u16>,
    nation: Option<String>,
}

#[derive(Clone, Copy, PartialEq, Eq)]
enum PositionGroup {
    Goalkeeper,
    LeftBack,
    CenterBack,
    RightBack,
    DefensiveMidfielder,
    CentralMidfielder,
    LeftWinger,
    AttackingMidfielder,
    RightWinger,
    Striker,
    Defender,
    Midfielder,
    Forward,
}

#[derive(Clone, Copy, PartialEq, Eq)]
enum StrengthProfile {
    Technical,
    Mental,
    Physical,
}

struct PersonalityProfile {
    summary: String,
    notes: Vec<String>,
}

#[tauri::command]
fn app_status() -> String {
    "프론트엔드 준비 완료".to_string()
}

/// 창을 항상 위로 고정/해제. 경기 전 라인업·전술 화면 위에 도시에를 띄워두기 위함.
#[tauri::command]
fn set_window_on_top(on: bool, window: tauri::Window) -> Result<(), String> {
    window
        .set_always_on_top(on)
        .map_err(|err| format!("창 고정 설정 실패: {err}"))
}

#[tauri::command]
fn list_fields() -> Vec<FieldDescriptor> {
    field_descriptors()
}

#[tauri::command]
fn set_game_date(
    year: i32,
    month: u8,
    day: u8,
    state: tauri::State<'_, AppState>,
) -> Result<(), String> {
    let day_of_year = day_of_year(year, month, day)?;
    let mut game_date = state
        .game_date
        .lock()
        .map_err(|_| "게임 날짜 상태 잠금 실패")?;
    *game_date = GameDate { year, day_of_year };
    Ok(())
}

#[tauri::command]
fn connect_fm(state: tauri::State<'_, AppState>) -> Result<ConnectResult, String> {
    let se_debug_enabled = try_enable_se_debug_privilege();
    let pid = find_process_id("fm.exe").ok_or("fm.exe 프로세스를 찾을 수 없습니다.")?;
    let fm = open_process_rw(pid)?;

    let mut target = state.target.lock().map_err(|_| "프로세스 상태 잠금 실패")?;
    *target = Some(fm);

    let mut player = state.player.lock().map_err(|_| "선수 상태 잠금 실패")?;
    *player = None;

    let mut scouting_cache = state
        .scouting_cache
        .lock()
        .map_err(|_| "스카우팅 캐시 잠금 실패")?;
    scouting_cache.clear();

    Ok(ConnectResult {
        pid,
        process_name: "fm.exe",
        se_debug_enabled,
    })
}

#[tauri::command]
fn scan_player(uid: u32, state: tauri::State<'_, AppState>) -> Result<ScanResult, String> {
    let target = state.target.lock().map_err(|_| "프로세스 상태 잠금 실패")?;
    let target = target.as_ref().ok_or("먼저 fm.exe에 연결해야 합니다.")?;

    let hits = find_player_by_uid(target, uid, 16)?;
    let hit = hits
        .first()
        .copied()
        .ok_or("UID에 해당하는 선수 레코드를 찾지 못했습니다.")?;

    let mut player = state.player.lock().map_err(|_| "선수 상태 잠금 실패")?;
    *player = Some(hit.pointers);
    let name = read_person_name(target, hit.pointers.person).unwrap_or(None);
    if let Ok(mut scouting_cache) = state.scouting_cache.lock() {
        scouting_cache.insert(uid, hit.pointers);
    }

    Ok(ScanResult {
        uid,
        name,
        person: hit.pointers.person,
        player: hit.pointers.player,
        ca: hit.ca,
        pa: hit.pa,
        dynamic_offset: hit.dynamic_offset,
        hit_count: hits.len(),
    })
}

#[tauri::command]
fn read_field(key: String, state: tauri::State<'_, AppState>) -> Result<FieldValue, String> {
    let field = find_field(&key).ok_or_else(|| format!("알 수 없는 필드입니다: {key}"))?;
    let target = state.target.lock().map_err(|_| "프로세스 상태 잠금 실패")?;
    let player = state.player.lock().map_err(|_| "선수 상태 잠금 실패")?;
    let target = target.as_ref().ok_or("먼저 fm.exe에 연결해야 합니다.")?;
    let pointers = player.as_ref().ok_or("먼저 선수를 검색해야 합니다.")?;
    let value = read_field_value(target, pointers, field)?;

    Ok(FieldValue { key, value })
}

#[tauri::command]
fn apply_changes(
    changes: Vec<FieldChange>,
    state: tauri::State<'_, AppState>,
) -> Result<Vec<ApplyResult>, String> {
    let target = state.target.lock().map_err(|_| "프로세스 상태 잠금 실패")?;
    let player = state.player.lock().map_err(|_| "선수 상태 잠금 실패")?;
    let target = target.as_ref().ok_or("먼저 fm.exe에 연결해야 합니다.")?;
    let pointers = player.as_ref().ok_or("먼저 선수를 검색해야 합니다.")?;

    let mut results = Vec::with_capacity(changes.len());
    for change in changes {
        let Some(field) = find_field(&change.key) else {
            results.push(ApplyResult {
                key: change.key,
                ok: false,
                value: None,
                error: Some("알 수 없는 필드입니다.".to_string()),
            });
            continue;
        };

        match write_field_value(target, pointers, field, &change.value)
            .and_then(|_| read_field_value(target, pointers, field))
        {
            Ok(value) => results.push(ApplyResult {
                key: change.key,
                ok: true,
                value: Some(value),
                error: None,
            }),
            Err(error) => results.push(ApplyResult {
                key: change.key,
                ok: false,
                value: None,
                error: Some(error),
            }),
        }
    }

    Ok(results)
}

#[tauri::command]
fn read_all_fields(
    keys: Vec<String>,
    state: tauri::State<'_, AppState>,
) -> Result<Vec<FieldValue>, String> {
    let target = state.target.lock().map_err(|_| "프로세스 상태 잠금 실패")?;
    let player = state.player.lock().map_err(|_| "선수 상태 잠금 실패")?;
    let target = target.as_ref().ok_or("먼저 fm.exe에 연결해야 합니다.")?;
    let pointers = player.as_ref().ok_or("먼저 선수를 검색해야 합니다.")?;

    Ok(keys
        .into_iter()
        .filter_map(|key| {
            let field = find_field(&key)?;
            let value = read_field_value(target, pointers, field).ok()?;
            Some(FieldValue { key, value })
        })
        .collect())
}

#[tauri::command]
fn collect_club_player_uids(
    club_id: u32,
    squad_kind: String,
    state: tauri::State<'_, AppState>,
) -> Result<ClubPlayerUidsResult, String> {
    let target = state.target.lock().map_err(|_| "프로세스 상태 잠금 실패")?;
    let target = target.as_ref().ok_or("먼저 fm.exe에 연결해야 합니다.")?;

    if club_id == 0 {
        return Err("클럽/팀 ID를 입력하세요.".to_string());
    }

    let mut lookup_notes = Vec::new();
    let mut best_result: Option<ClubPlayerUidsResult> = None;
    let mut best_count = 0usize;

    // club 경로와 team 경로를 모두 시도해서 선수 수가 더 많은 쪽을 선택한다.
    if let Some(club) = find_club_by_uid(target, club_id)? {
        match collect_squads_from_club(target, club, &squad_kind).and_then(|(squads, pointers)| {
            let team_name =
                read_club_name(target, club).unwrap_or_else(|| format!("구단 ID {club_id}"));
            let nation = read_club_nation_name(target, club);
            let reputation = read_club_reputation(target, club);
            let result = build_uid_result(
                club_id,
                "club",
                team_name,
                nation,
                reputation,
                squad_kind.clone(),
                squads,
            )?;
            store_scouting_cache(&state, pointers)?;
            Ok(result)
        }) {
            Ok(result) => {
                best_count = result.player_uids.len();
                best_result = Some(result);
                // 충분한 선수 수라면 team 경로 스캔 불필요
                if best_count >= 20 {
                    return Ok(best_result.unwrap());
                }
            }
            Err(error) => lookup_notes.push(format!("club 경로: {error}")),
        }
    }

    if let Some(team) = find_team_by_uid(target, club_id)? {
        let team_type = target.read_u8(team + TEAM_TYPE).unwrap_or(255);
        let club = target.read_usize(team + TEAM_CLUB).unwrap_or(0);
        match read_player_uids_from_team(target, team).and_then(|(player_uids, pointers)| {
            let squads = vec![ClubSquadPlayers {
                team_type,
                team_type_label: team_type_label(team_type).to_string(),
                player_count: player_uids.len(),
                player_uids,
            }];
            let team_name = read_team_display_name(target, club, team_type)
                .unwrap_or_else(|| format!("팀 ID {club_id}"));
            let nation = read_club_nation_name(target, club);
            let reputation = read_club_reputation(target, club);
            let result = build_uid_result(
                club_id,
                "team",
                team_name,
                nation,
                reputation,
                squad_kind.clone(),
                squads,
            )?;
            store_scouting_cache(&state, pointers)?;
            Ok(result)
        }) {
            Ok(result) => {
                if result.player_uids.len() > best_count {
                    best_result = Some(result);
                }
            }
            Err(error) => lookup_notes.push(format!("team 경로: {error}")),
        }
    }

    if let Some(result) = best_result {
        return Ok(result);
    }

    if lookup_notes.is_empty() {
        Err("해당 ID의 클럽/팀 객체를 찾지 못했습니다.".to_string())
    } else {
        Err(format!(
            "팀/구단 객체는 찾았지만 선수단 데이터를 해석하지 못했습니다. {}",
            lookup_notes.join(" / ")
        ))
    }
}

#[tauri::command]
fn analyze_squad(
    club_id: u32,
    squad_kind: String,
    state: tauri::State<'_, AppState>,
) -> Result<SquadDossier, String> {
    let target = state.target.lock().map_err(|_| "프로세스 상태 잠금 실패")?;
    let target = target.as_ref().ok_or("먼저 fm.exe에 연결해야 합니다.")?;
    let game_date = *state
        .game_date
        .lock()
        .map_err(|_| "게임 날짜 상태 잠금 실패")?;

    if club_id == 0 {
        return Err("클럽/팀 ID를 입력하세요.".to_string());
    }

    // club 경로 우선, 실패 시 team 경로로 스쿼드를 해석한다.
    let (team_name, nation, reputation, squads) = if let Some(club) =
        find_club_by_uid(target, club_id)?
    {
        let (squads, _) = collect_squads_from_club(target, club, &squad_kind)?;
        (
            read_club_name(target, club).unwrap_or_else(|| format!("구단 ID {club_id}")),
            read_club_nation_name(target, club),
            read_club_reputation(target, club),
            squads,
        )
    } else if let Some(team) = find_team_by_uid(target, club_id)? {
        let team_type = target.read_u8(team + TEAM_TYPE).unwrap_or(255);
        let club = target.read_usize(team + TEAM_CLUB).unwrap_or(0);
        let (player_uids, _) = read_player_uids_from_team(target, team)?;
        let squads = vec![ClubSquadPlayers {
            team_type,
            team_type_label: team_type_label(team_type).to_string(),
            player_count: player_uids.len(),
            player_uids,
        }];
        (
            read_team_display_name(target, club, team_type)
                .unwrap_or_else(|| format!("팀 ID {club_id}")),
            read_club_nation_name(target, club),
            read_club_reputation(target, club),
            squads,
        )
    } else {
        return Err("해당 ID의 클럽/팀 객체를 찾지 못했습니다.".to_string());
    };

    // uid → 소속 team_type 매핑 (중복 시 첫 등장 유지).
    let mut order = Vec::new();
    let mut team_type_of = HashMap::new();
    for squad in &squads {
        for uid in &squad.player_uids {
            if team_type_of.insert(*uid, squad.team_type).is_none() {
                order.push(*uid);
            }
        }
    }

    if order.is_empty() {
        return Err("선수단 데이터를 찾지 못했습니다.".to_string());
    }

    let hits = find_players_by_uids(target, &order)?;
    let mut players = Vec::new();
    for uid in &order {
        let Some(hit) = hits.get(uid).copied() else {
            continue;
        };
        if let Ok(mut cache) = state.scouting_cache.lock() {
            cache.insert(*uid, hit.pointers);
        }
        let team_type = team_type_of.get(uid).copied().unwrap_or(255);
        if let Some(player) = read_dossier_player(target, *uid, hit.pointers, game_date, team_type) {
            players.push(player);
        }
    }

    players.sort_by(|a, b| b.ca.cmp(&a.ca));

    let key_player_uids = players
        .iter()
        .filter(|player| !player.threats.is_empty())
        .take(6)
        .map(|player| player.uid)
        .collect::<Vec<_>>();

    // 선발 추정 XI(상위 11명)의 약점을 라벨 기준 중복 제거해 모은다.
    let mut seen_labels = HashSet::new();
    let team_weaknesses = players
        .iter()
        .take(11)
        .flat_map(|player| player.weaknesses.iter().cloned())
        .filter(|tag| seen_labels.insert(tag.label.clone()))
        .collect::<Vec<_>>();

    Ok(SquadDossier {
        team_name,
        nation,
        reputation,
        squad_kind,
        player_count: players.len(),
        players,
        key_player_uids,
        team_weaknesses,
    })
}

fn read_dossier_player(
    target: &Target,
    uid: u32,
    pointers: PlayerPointers,
    game_date: GameDate,
    team_type: u8,
) -> Option<DossierPlayer> {
    if target.read_u32(pointers.person + OBJ_DUNI).ok()? != uid {
        return None;
    }
    let ca = target.read_u16(pointers.player + 0x264).ok()?;
    let pa = target.read_u16(pointers.player + 0x266).ok()?;
    if !(1..=200).contains(&ca) || !(1..=200).contains(&pa) {
        return None;
    }

    // PATR 능력치를 디코딩(1~20)해 배열로.
    let mut attrs = [0u8; analysis::ATTR_COUNT];
    for (i, slot) in attrs.iter_mut().enumerate() {
        *slot = read_fm_attribute(target, pointers.player + PATR + i).unwrap_or(0);
    }

    let position = read_best_position(target, pointers.player).unwrap_or_else(|| "N/A".to_string());
    let role = analysis::Role::from_label(&position);

    let traits = match target.read(pointers.person + PERSON_PPRM, 8) {
        Ok(bytes) => analysis::active_traits(&bytes),
        Err(_) => Vec::new(),
    };

    let height_cm = target
        .read_u16(pointers.player + PLAYER_HEIGHT)
        .ok()
        .filter(|h| (140..=220).contains(h));
    let weight_kg = target
        .read_u16(pointers.player + PLAYER_WEIGHT)
        .ok()
        .filter(|w| (40..=150).contains(w));

    Some(DossierPlayer {
        uid,
        name: read_person_name(target, pointers.person).unwrap_or(None),
        position,
        squad_label: team_type_label(team_type).to_string(),
        age: read_player_age(target, pointers.person, game_date),
        nation: read_person_nation_name(target, pointers.person),
        height_cm,
        weight_kg,
        ca,
        pa,
        foot: analysis::foot_label(&attrs),
        standout: analysis::standout(&attrs),
        traits,
        threats: analysis::threats(&attrs, role),
        weaknesses: analysis::weaknesses(&attrs, role),
    })
}

#[tauri::command]
fn identify_club(
    club_id: u32,
    state: tauri::State<'_, AppState>,
) -> Result<ClubIdentityResult, String> {
    let target = state.target.lock().map_err(|_| "프로세스 상태 잠금 실패")?;
    let target = target.as_ref().ok_or("먼저 fm.exe에 연결해야 합니다.")?;

    if club_id == 0 {
        return Err("클럽/팀 ID를 입력하세요.".to_string());
    }

    if let Some(club) = find_club_by_uid(target, club_id)? {
        let (squads, _) = collect_squads_from_club(target, club, "전체")?;
        return Ok(build_club_identity(target, club_id, "club", club, squads));
    }

    if let Some(team) = find_team_by_uid(target, club_id)? {
        let team_type = target.read_u8(team + TEAM_TYPE).unwrap_or(255);
        let club = target
            .read_usize(team + TEAM_CLUB)
            .map_err(|_| "팀에서 클럽 포인터를 읽지 못했습니다.")?;
        let (player_uids, _) = read_player_uids_from_team(target, team)?;
        return Ok(ClubIdentityResult {
            input_id: club_id,
            source_kind: "team".to_string(),
            name: read_team_display_name(target, club, team_type)
                .unwrap_or_else(|| format!("팀 ID {club_id}")),
            nation: read_club_nation_name(target, club),
            reputation: read_club_reputation(target, club),
            team_count: 1,
            player_count: player_uids.len(),
            squad_label: team_type_label(team_type).to_string(),
        });
    }

    Err("해당 ID의 클럽/팀 객체를 찾지 못했습니다.".to_string())
}

#[tauri::command]
fn build_scouting_report(
    request: ScoutingRequest,
    state: tauri::State<'_, AppState>,
) -> Result<ScoutingReport, String> {
    let target = state.target.lock().map_err(|_| "프로세스 상태 잠금 실패")?;
    let target = target.as_ref().ok_or("먼저 fm.exe에 연결해야 합니다.")?;
    let game_date = *state
        .game_date
        .lock()
        .map_err(|_| "게임 날짜 상태 잠금 실패")?;

    // 팀 단위 보고서는 L3까지만 생성된다. L4/L5는 개별 선수 드릴다운 전용.
    let knowledge_level = request.knowledge_level.clamp(1, 3);
    let mut seen = HashSet::new();
    let player_uids = request
        .player_uids
        .into_iter()
        .filter(|uid| *uid > 0 && seen.insert(*uid))
        .collect::<Vec<_>>();

    let mut players = Vec::new();
    let mut unresolved_uids = Vec::new();
    let cached_pointers = {
        let scouting_cache = state
            .scouting_cache
            .lock()
            .map_err(|_| "스카우팅 캐시 잠금 실패")?;
        player_uids
            .iter()
            .filter_map(|uid| {
                scouting_cache
                    .get(uid)
                    .copied()
                    .map(|pointers| (*uid, pointers))
            })
            .collect::<HashMap<_, _>>()
    };

    let mut missing_uids = Vec::new();
    for uid in &player_uids {
        if let Some(pointers) = cached_pointers.get(uid).copied() {
            if let Some(player) = read_scouted_player(target, *uid, pointers, game_date) {
                players.push(player);
                continue;
            }
        }

        missing_uids.push(*uid);
    }

    let fallback_hits = find_players_by_uids(target, &missing_uids)?;
    for uid in missing_uids {
        if let Some(hit) = fallback_hits.get(&uid).copied() {
            if let Ok(mut scouting_cache) = state.scouting_cache.lock() {
                scouting_cache.insert(uid, hit.pointers);
            }
            if let Some(player) = read_scouted_player(target, uid, hit.pointers, game_date) {
                players.push(player);
            } else {
                unresolved_uids.push(uid);
            }
        } else {
            unresolved_uids.push(uid);
        }
    }

    // 스카우터 능력치에 따른 정규분포 샘플링 적용.
    // PA는 JPA, CA는 JCA가 담당하며, CA는 표시 PA를 넘으면 경계에서 반사한다.
    let jca = request.scout_jca.map(|v| v.clamp(1, 20));
    let jpa = request.scout_jpa.map(|v| v.clamp(1, 20));
    if jca.is_some() || jpa.is_some() {
        for player in &mut players {
            let observed_pa = if let Some(attr) = jpa {
                let seed = noise::scout_seed(player.uid, attr, 1);
                noise::apply_potential_noise(player.pa, attr, seed)
            } else {
                player.pa
            };
            let mut observed_ca = if let Some(attr) = jca {
                let seed = noise::scout_seed(player.uid, attr, 0);
                noise::apply_current_noise(player.ca, attr, seed, observed_pa)
            } else {
                player.ca
            };

            observed_ca = observed_ca.min(observed_pa);
            player.ca = observed_ca;
            player.pa = observed_pa;
        }
    }

    let pa_bands = count_rating_bands(players.iter().map(|player| player.pa), knowledge_level);
    let ca_bands = count_rating_bands(players.iter().map(|player| player.ca), knowledge_level);
    let mut position_counts = count_positions(&players);
    position_counts.truncate(8);

    // 유망주 풀(집계용): 24세 이하 전원. 집계 통계는 이 풀 기준으로 계산한다.
    let mut prospects = players
        .iter()
        .filter(|player| matches!(player.age, Some(age) if age <= 24))
        .collect::<Vec<_>>();
    prospects.sort_by(|a, b| b.pa.cmp(&a.pa).then_with(|| b.ca.cmp(&a.ca)));

    // 시니어 풀(집계용): 25세 이상 또는 나이 미상.
    let mut seniors = players
        .iter()
        .filter(|player| player.age.map_or(true, |age| age > 24))
        .collect::<Vec<_>>();
    seniors.sort_by(|a, b| b.ca.cmp(&a.ca).then_with(|| b.pa.cmp(&a.pa)));

    // 게임 내 날짜를 시드로 사용. 같은 날짜의 다른 세션은 같은 문구가 재현되고,
    // 날짜가 바뀌면 새 관찰 보고처럼 문구가 갈린다.
    let date_seed = (i64::from(game_date.year) * 400 + i64::from(game_date.day_of_year)) as u64;

    // 유망주 카드/개별 호명 대상: 컴패리즌이 부여되는 PA 범위(>=150) 안에 들어오는 선수 전원.
    // PA 임계치는 comparisons::comparison_phrase / comparison_references 와 동일하게 150.
    let prospect_candidates: Vec<_> = prospects
        .iter()
        .copied()
        .filter(|player| player.pa >= 150)
        .enumerate()
        .map(|(index, player)| {
            build_prospect_candidate(target, player, index, knowledge_level, date_seed)
        })
        .collect();

    // 시니어 카드/개별 호명 대상: 1군 top 10.
    let senior_candidates: Vec<_> = seniors
        .iter()
        .copied()
        .take(10)
        .enumerate()
        .map(|(index, player)| build_senior_candidate(target, player, index, knowledge_level))
        .collect();

    let team_name = request.team_name.trim().to_string();
    let prospect_players = prospects.into_iter().cloned().collect::<Vec<_>>();
    let senior_players = seniors.into_iter().cloned().collect::<Vec<_>>();
    let prospect_summary_narrative = generate_summary_narrative(
        &team_name,
        &request.squad_kind,
        knowledge_level,
        &prospect_candidates,
        &prospect_players,
    );
    let senior_summary_narrative = scouting::generate_senior_summary_narrative(
        &team_name,
        &request.squad_kind,
        knowledge_level,
        &senior_candidates,
        &senior_players,
    );
    // 구조화된 prologue + per-candidate paragraphs.
    // 빈 candidates 슬라이스로 narrative를 다시 만들면 per-candidate 루프가 생략돼 prologue만 남는다.
    let prospect_summary_prologue = generate_summary_narrative(
        &team_name,
        &request.squad_kind,
        knowledge_level,
        &[],
        &prospect_players,
    );
    let senior_summary_prologue = scouting::generate_senior_summary_narrative(
        &team_name,
        &request.squad_kind,
        knowledge_level,
        &[],
        &senior_players,
    );
    let prospect_paragraphs =
        scouting::build_prospect_paragraphs(&prospect_candidates, knowledge_level);
    let senior_paragraphs = scouting::build_senior_paragraphs(&senior_candidates, knowledge_level);
    let summary_narrative = [
        (!prospect_players.is_empty()).then_some(prospect_summary_narrative.as_str()),
        (!senior_players.is_empty()).then_some(senior_summary_narrative.as_str()),
    ]
    .into_iter()
    .flatten()
    .collect::<Vec<_>>()
    .join("\n\n");
    let candidates = prospect_candidates.clone();

    Ok(ScoutingReport {
        team_name,
        squad_kind: request.squad_kind,
        knowledge_level,
        total_requested: player_uids.len(),
        resolved_players: players.len(),
        prospect_count: prospect_players.len(),
        senior_count: senior_players.len(),
        pa_bands,
        ca_bands,
        position_counts,
        prospect_candidates,
        senior_candidates,
        candidates,
        unresolved_uids,
        summary_narrative,
        prospect_summary_narrative,
        senior_summary_narrative,
        prospect_summary_prologue,
        prospect_paragraphs,
        senior_summary_prologue,
        senior_paragraphs,
        scout_jca: jca,
        scout_jpa: jpa,
    })
}

#[tauri::command]
fn scout_player_detail(
    request: PlayerDetailRequest,
    state: tauri::State<'_, AppState>,
) -> Result<PlayerDetailReport, String> {
    let target = state.target.lock().map_err(|_| "프로세스 상태 잠금 실패")?;
    let target = target.as_ref().ok_or("먼저 fm.exe에 연결해야 합니다.")?;
    let game_date = *state
        .game_date
        .lock()
        .map_err(|_| "게임 날짜 상태 잠금 실패")?;

    let knowledge_level = request.knowledge_level.clamp(4, 5);

    // 캐시된 포인터 우선 사용, 없으면 fallback 검색.
    let cached_pointer = {
        let cache = state
            .scouting_cache
            .lock()
            .map_err(|_| "스카우팅 캐시 잠금 실패")?;
        cache.get(&request.player_uid).copied()
    };

    let pointers = match cached_pointer {
        Some(p) => p,
        None => {
            let hits = find_players_by_uids(target, &[request.player_uid])?;
            let hit = hits.get(&request.player_uid).copied().ok_or(
                "해당 선수를 찾지 못했습니다. 팀 보고서를 먼저 생성한 뒤 다시 시도하세요.",
            )?;
            if let Ok(mut cache) = state.scouting_cache.lock() {
                cache.insert(request.player_uid, hit.pointers);
            }
            hit.pointers
        }
    };

    let mut player = read_scouted_player(target, request.player_uid, pointers, game_date)
        .ok_or("선수 데이터를 읽지 못했습니다.")?;

    // 팀 보고서와 동일한 스카우터 노이즈 적용. 카드에 표시된 CA/PA와 일관성 유지.
    let jca = request.scout_jca.map(|v| v.clamp(1, 20));
    let jpa = request.scout_jpa.map(|v| v.clamp(1, 20));
    if jca.is_some() || jpa.is_some() {
        let observed_pa = if let Some(attr) = jpa {
            let seed = noise::scout_seed(player.uid, attr, 1);
            noise::apply_potential_noise(player.pa, attr, seed)
        } else {
            player.pa
        };
        let mut observed_ca = if let Some(attr) = jca {
            let seed = noise::scout_seed(player.uid, attr, 0);
            noise::apply_current_noise(player.ca, attr, seed, observed_pa)
        } else {
            player.ca
        };
        observed_ca = observed_ca.min(observed_pa);
        player.ca = observed_ca;
        player.pa = observed_pa;
    }

    let date_seed = (i64::from(game_date.year) * 400 + i64::from(game_date.day_of_year)) as u64;

    let candidate = build_prospect_candidate(
        target,
        &player,
        request.rank_index,
        knowledge_level,
        date_seed,
    );

    let narrative = scouting::render_player_drilldown_narrative(
        &candidate,
        knowledge_level,
        request.rank_index,
    );

    Ok(PlayerDetailReport {
        player_uid: request.player_uid,
        knowledge_level,
        candidate,
        narrative,
    })
}

fn build_prospect_candidate(
    target: &Target,
    player: &ScoutedPlayer,
    index: usize,
    knowledge_level: u8,
    date_seed: u64,
) -> ScoutingCandidate {
    let reveal_identity = knowledge_level >= 2;
    let comparisons = if knowledge_level >= 3 {
        comparison_references(player)
    } else {
        vec![]
    };
    let risk_profile = (knowledge_level >= 5)
        .then(|| read_risk_profile(target, player.pointers))
        .flatten();
    let personality_profile = (knowledge_level >= 4)
        .then(|| read_personality_profile(target, player.pointers, player.uid, date_seed))
        .flatten();
    let hidden_notes = (knowledge_level >= 4)
        .then(|| read_hidden_intel_notes(target, player.pointers, player.uid, date_seed))
        .unwrap_or_default();

    ScoutingCandidate {
        label: candidate_label(player, index, knowledge_level, "유망주 후보"),
        uid: reveal_identity.then_some(player.uid),
        position: player.position.clone(),
        age: player.age,
        nation: player.nation.clone(),
        ca: player.ca,
        pa: player.pa,
        ca_band: rating_band(player.ca, knowledge_level),
        pa_band: rating_band(player.pa, knowledge_level),
        abilities: (knowledge_level >= 3)
            .then(|| read_scouting_abilities(target, player.pointers))
            .unwrap_or_default(),
        comparisons,
        development_band: (knowledge_level >= 3)
            .then(|| development_band(player.ca, player.pa, player.age)),
        comparison_phrase: (knowledge_level >= 3)
            .then(|| comparison_phrase(player))
            .flatten(),
        personality_hint: personality_profile
            .as_ref()
            .map(|profile| profile.summary.clone()),
        personality_notes: personality_profile
            .map(|profile| profile.notes)
            .unwrap_or_default(),
        hidden_notes,
        risk_hint: risk_profile.as_ref().map(|profile| profile.0.clone()),
        risk_details: risk_profile.map(|profile| profile.1),
        recommendation: (knowledge_level >= 3).then(|| recommendation_hint(player)),
    }
}

fn build_senior_candidate(
    target: &Target,
    player: &ScoutedPlayer,
    index: usize,
    knowledge_level: u8,
) -> ScoutingCandidate {
    ScoutingCandidate {
        label: candidate_label(player, index, knowledge_level, "전성기 후보"),
        uid: (knowledge_level >= 2).then_some(player.uid),
        position: player.position.clone(),
        age: player.age,
        nation: player.nation.clone(),
        ca: player.ca,
        pa: player.pa,
        ca_band: rating_band(player.ca, knowledge_level),
        pa_band: rating_band(player.pa, knowledge_level),
        abilities: (knowledge_level >= 3)
            .then(|| read_scouting_abilities(target, player.pointers))
            .unwrap_or_default(),
        comparisons: vec![],
        development_band: None,
        comparison_phrase: None,
        personality_hint: None,
        personality_notes: Vec::new(),
        hidden_notes: Vec::new(),
        risk_hint: None,
        risk_details: None,
        recommendation: None,
    }
}

fn candidate_label(
    player: &ScoutedPlayer,
    index: usize,
    knowledge_level: u8,
    hidden_prefix: &str,
) -> String {
    if knowledge_level >= 2 {
        player
            .name
            .clone()
            .unwrap_or_else(|| format!("UID {}", player.uid))
    } else {
        format!("{hidden_prefix} {}", index + 1)
    }
}

fn read_scouting_abilities(target: &Target, pointers: PlayerPointers) -> Vec<ScoutingAbility> {
    const ABILITIES: &[(&str, &str, usize)] = &[
        ("크로스", "technical", 0x00),
        ("드리블", "technical", 0x01),
        ("골 결정력", "technical", 0x02),
        ("헤더", "technical", 0x03),
        ("중거리 슛", "technical", 0x04),
        ("마크", "technical", 0x05),
        ("패스", "technical", 0x07),
        ("태클", "technical", 0x09),
        ("퍼스트 터치", "technical", 0x16),
        ("개인기", "technical", 0x17),
        ("오프 더 볼", "mental", 0x06),
        ("시야", "mental", 0x0a),
        ("예측력", "mental", 0x11),
        ("판단력", "mental", 0x12),
        ("위치 선정", "mental", 0x14),
        ("천재성", "mental", 0x1a),
        ("팀워크", "mental", 0x1c),
        ("활동량", "mental", 0x1d),
        ("대담성", "mental", 0x2b),
        ("승부욕", "mental", 0x33),
        ("침착성", "mental", 0x34),
        ("집중력", "mental", 0x35),
        ("순간 속도", "physical", 0x22),
        ("몸싸움", "physical", 0x24),
        ("지구력", "physical", 0x25),
        ("주력", "physical", 0x26),
        ("점프 거리", "physical", 0x27),
        ("균형 감각", "physical", 0x2a),
        ("민첩성", "physical", 0x2e),
        ("타고난 체력", "physical", 0x32),
        ("핸들링", "goalkeeping", 0x0b),
        ("공중 장악력", "goalkeeping", 0x0c),
        ("장악력", "goalkeeping", 0x0d),
        ("수비 조율", "goalkeeping", 0x0e),
        ("킥", "goalkeeping", 0x0f),
        ("던지기", "goalkeeping", 0x10),
        ("일대일 방어", "goalkeeping", 0x13),
        ("반사 신경", "goalkeeping", 0x15),
        ("뛰쳐나가기", "goalkeeping", 0x20),
    ];

    ABILITIES
        .iter()
        .filter_map(|(label, category, offset)| {
            read_fm_attribute(target, pointers.player + PATR + offset).map(|value| {
                ScoutingAbility {
                    label,
                    category,
                    value,
                }
            })
        })
        .collect()
}

/// 선수 얼굴. 포토 스튜디오에서 만든 생성 이미지가 있으면 그쪽이 우선이라,
/// 편집 화면과 스카우팅 카드도 자동으로 유니폼 입은 사진으로 바뀐다.
#[tauri::command]
fn read_player_face(uid: u32) -> Result<Option<String>, String> {
    if let Ok(image) = portrait::player_image(uid) {
        if image.src.is_some() {
            return Ok(image.src);
        }
    }
    let Some((path, mime)) = find_face_file(uid)? else {
        return Ok(None);
    };
    let bytes = fs::read(&path).map_err(|err| format!("얼굴 이미지를 읽지 못했습니다: {err}"))?;
    Ok(Some(format!("data:{mime};base64,{}", BASE64.encode(bytes))))
}

fn resolve_club_ptr(target: &Target, user_club_id: u32) -> Result<usize, String> {
    if let Some(club) = find_club_by_uid(target, user_club_id)? {
        return Ok(club);
    }
    if let Some(team) = find_team_by_uid(target, user_club_id)? {
        return target
            .read_usize(team + TEAM_CLUB)
            .map_err(|_| "팀에서 클럽 포인터를 읽지 못했습니다.".to_string());
    }
    Err("유저 클럽 객체를 찾지 못했습니다. 클럽 UID 또는 팀 UID를 확인하세요.".to_string())
}

fn find_primary_team(target: &Target, club_ptr: usize) -> Result<usize, String> {
    let teams = read_pointer_range(target, club_ptr + CLUB_TEAMS, 64)
        .map_err(|_| "구단의 팀 목록을 읽지 못했습니다.".to_string())?;
    if teams.is_empty() {
        return Err("구단의 팀 목록이 비어 있습니다.".to_string());
    }

    let mut fallback = None;
    for team in teams {
        if target.read_usize(team + TEAM_CLUB).ok() != Some(club_ptr) {
            continue;
        }
        let team_type = target.read_u8(team + TEAM_TYPE).unwrap_or(255);
        if fallback.is_none() {
            fallback = Some(team);
        }
        if team_type == 0 {
            return Ok(team);
        }
    }

    fallback.ok_or_else(|| "구단에 연결된 유효한 팀을 찾지 못했습니다.".to_string())
}

fn validate_human_manager_base(target: &Target, manager_ptr: usize) -> Option<usize> {
    if manager_ptr < 0x10_000 || manager_ptr > 0x7fff_ffff_ffff {
        return None;
    }

    let person = manager_ptr.checked_add(HUMAN_MANAGER_OFFSET as usize)?;
    if read_dynamic_offset(target, person)? != HUMAN_MANAGER_OFFSET {
        return None;
    }

    Some(person)
}

fn resolve_human_manager_ptr_from_team(
    target: &Target,
    team_ptr: usize,
) -> Result<(usize, usize, String), String> {
    let raw_manager = target
        .read_usize(team_ptr + TEAM_MANAGER)
        .map_err(|_| "팀의 감독 포인터를 읽지 못했습니다.".to_string())?;

    if let Some(person) = validate_human_manager_base(target, raw_manager) {
        return Ok((raw_manager, person, "team.Tmgr".to_string()));
    }

    if raw_manager > HUMAN_MANAGER_OFFSET as usize {
        let manager = raw_manager - HUMAN_MANAGER_OFFSET as usize;
        if let Some(person) = validate_human_manager_base(target, manager) {
            return Ok((manager, person, "team.Tmgr-person".to_string()));
        }
    }

    Err(format!(
        "팀 감독 포인터가 유저 감독 객체로 검증되지 않았습니다. team=0x{team_ptr:x}, raw=0x{raw_manager:x}"
    ))
}

struct ScoutingBudgetContext {
    club_ptr: usize,
    team_ptr: usize,
    manager_ptr: usize,
    manager_person_ptr: usize,
    scouting_centre_ptr: usize,
    source: String,
}

fn resolve_scouting_budget_context(
    target: &Target,
    user_club_id: u32,
) -> Result<ScoutingBudgetContext, String> {
    if user_club_id == 0 {
        return Err("유저 클럽 ID를 입력하세요.".to_string());
    }

    let club_ptr = resolve_club_ptr(target, user_club_id)?;
    let team_ptr = find_primary_team(target, club_ptr)?;
    let (manager_ptr, manager_person_ptr, source) =
        resolve_human_manager_ptr_from_team(target, team_ptr)?;
    let scouting_centre = target
        .read_usize(manager_ptr + MANAGER_SCOUTING_CENTRE)
        .map_err(|_| "감독의 스카우팅 센터 포인터를 읽지 못했습니다.".to_string())?;
    if scouting_centre < 0x10_000 || scouting_centre > 0x7fff_ffff_ffff {
        return Err(format!(
            "스카우팅 센터 포인터가 유효하지 않습니다. manager=0x{manager_ptr:x}, sc=0x{scouting_centre:x}"
        ));
    }

    Ok(ScoutingBudgetContext {
        club_ptr,
        team_ptr,
        manager_ptr,
        manager_person_ptr,
        scouting_centre_ptr: scouting_centre,
        source,
    })
}

fn read_scouting_budget_from_context(
    target: &Target,
    context: ScoutingBudgetContext,
) -> Result<ScoutingBudgetResult, String> {
    let season_budget = target
        .read_i32(context.scouting_centre_ptr + MANAGER_SCOUTING_BUDGET)
        .map_err(|_| "시즌 스카우트 예산을 읽지 못했습니다.".to_string())?;
    let remaining_budget = target
        .read_i32(context.scouting_centre_ptr + MANAGER_SCOUTING_BUDGET + 4)
        .map_err(|_| "남은 스카우트 예산을 읽지 못했습니다.".to_string())?;
    let recruitment_package = target
        .read_u8(context.scouting_centre_ptr + MANAGER_RECRUITMENT_PACKAGE)
        .ok()
        .filter(|value| (1..=7).contains(value));
    let unlimited_scouting = target
        .read_u8(context.manager_ptr + MANAGER_FLAGS_1)
        .map(|flags| flags & (1 << 2) != 0)
        .unwrap_or(false);
    let manager_uid = target.read_u32(context.manager_person_ptr + OBJ_DUNI).ok();

    Ok(ScoutingBudgetResult {
        club_ptr: context.club_ptr,
        team_ptr: context.team_ptr,
        manager_ptr: context.manager_ptr,
        manager_person_ptr: context.manager_person_ptr,
        manager_uid,
        recruitment_package,
        season_budget: season_budget as i64,
        remaining_budget: remaining_budget as i64,
        unlimited_scouting,
        source: context.source,
    })
}

#[tauri::command]
fn read_scouting_budget(
    user_club_id: u32,
    state: tauri::State<'_, AppState>,
) -> Result<ScoutingBudgetResult, String> {
    let target = state.target.lock().map_err(|_| "프로세스 상태 잠금 실패")?;
    let target = target.as_ref().ok_or("먼저 fm.exe에 연결해야 합니다.")?;
    let context = resolve_scouting_budget_context(target, user_club_id)?;
    read_scouting_budget_from_context(target, context)
}

#[tauri::command]
fn collect_user_club_scouts(
    user_club_id: u32,
    state: tauri::State<'_, AppState>,
) -> Result<UserClubScoutsResult, String> {
    let target = state.target.lock().map_err(|_| "프로세스 상태 잠금 실패")?;
    let target = target.as_ref().ok_or("먼저 fm.exe에 연결해야 합니다.")?;
    if user_club_id == 0 {
        return Err("유저 클럽 ID를 입력하세요.".to_string());
    }

    let club_ptr = resolve_club_ptr(target, user_club_id)?;
    let club_name =
        read_club_name(target, club_ptr).unwrap_or_else(|| format!("구단 ID {user_club_id}"));
    let raw_members = read_pointer_range(target, club_ptr + CLUB_RECRUITMENT_TEAM, 128)
        .map_err(|err| format!("구단의 스카우팅/영입 스태프 목록을 읽지 못했습니다: {err}"))?;

    let mut scouts = Vec::new();
    let mut seen = HashSet::new();
    for raw_member in &raw_members {
        let Some((person_ptr, scout)) = read_user_club_scout(target, *raw_member) else {
            continue;
        };
        if seen.insert(person_ptr) {
            scouts.push(scout);
        }
    }

    scouts.sort_by(|a, b| {
        let a_score = u16::from(a.jca) + u16::from(a.jpa) + u16::from(a.adaptability.unwrap_or(0));
        let b_score = u16::from(b.jca) + u16::from(b.jpa) + u16::from(b.adaptability.unwrap_or(0));
        b_score
            .cmp(&a_score)
            .then_with(|| b.jpa.cmp(&a.jpa))
            .then_with(|| b.jca.cmp(&a.jca))
            .then_with(|| a.name.cmp(&b.name))
    });

    Ok(UserClubScoutsResult {
        club_ptr,
        club_name,
        recruitment_team_count: raw_members.len(),
        imported_count: scouts.len(),
        scouts,
        source: "club.recruitmentTeam".to_string(),
    })
}

fn read_user_club_scout(target: &Target, raw_member: usize) -> Option<(usize, UserClubScout)> {
    let (staff_ptr, person_ptr) = resolve_staff_member_pointer(target, raw_member)?;
    let name = read_person_name(target, person_ptr)
        .ok()
        .flatten()
        .unwrap_or_else(|| "이름 미확인 스카우터".to_string());

    let jca = read_staff_attribute(target, staff_ptr, 0x1c)?;
    let jpa = read_staff_attribute(target, staff_ptr, 0x1d)?;

    Some((
        person_ptr,
        UserClubScout {
            name,
            jca,
            jpa,
            adaptability: read_plain_attribute(target, person_ptr + PADA),
        },
    ))
}

fn resolve_staff_member_pointer(target: &Target, raw_member: usize) -> Option<(usize, usize)> {
    let mut candidates = Vec::with_capacity(8);
    if is_plausible_pointer(raw_member) {
        candidates.push(raw_member);
    }
    for offset in [0usize, 0x08, 0x10, 0x18, 0x20, 0x28, 0x30] {
        if let Ok(candidate) = target.read_usize(raw_member + offset) {
            if is_plausible_pointer(candidate) && !candidates.contains(&candidate) {
                candidates.push(candidate);
            }
        }
    }

    for candidate in candidates {
        if let Some(resolved) = resolve_staff_from_base(target, candidate) {
            return Some(resolved);
        }
        if let Some(resolved) = resolve_staff_from_person(target, candidate) {
            return Some(resolved);
        }
    }

    None
}

fn resolve_staff_from_base(target: &Target, staff_ptr: usize) -> Option<(usize, usize)> {
    if !is_plausible_pointer(staff_ptr) {
        return None;
    }

    for dynamic_offset in [STAFF_OFFSET, PLAYER_STAFF_OFFSET, HUMAN_MANAGER_OFFSET] {
        let person = staff_ptr.checked_add(dynamic_offset as usize)?;
        if read_dynamic_offset(target, person)? == dynamic_offset
            && target
                .read_u32(person + OBJ_DUNI)
                .ok()
                .is_some_and(is_plausible_uid)
        {
            return Some((staff_ptr, person));
        }
    }

    None
}

fn resolve_staff_from_person(target: &Target, person: usize) -> Option<(usize, usize)> {
    if !is_plausible_pointer(person) {
        return None;
    }

    let dynamic_offset = read_dynamic_offset(target, person)?;
    if !matches!(
        dynamic_offset,
        STAFF_OFFSET | PLAYER_STAFF_OFFSET | HUMAN_MANAGER_OFFSET
    ) {
        return None;
    }
    if !target
        .read_u32(person + OBJ_DUNI)
        .ok()
        .is_some_and(is_plausible_uid)
    {
        return None;
    }

    let staff_ptr = person.checked_sub(dynamic_offset as usize)?;
    Some((staff_ptr, person))
}

fn read_staff_attribute(target: &Target, staff_ptr: usize, offset: usize) -> Option<u8> {
    read_fm_attribute(target, staff_ptr + STAFF_ATTRS + offset)
}

fn read_plain_attribute(target: &Target, addr: usize) -> Option<u8> {
    target
        .read_u8(addr)
        .ok()
        .filter(|value| (1..=20).contains(value))
}

fn is_plausible_pointer(addr: usize) -> bool {
    (0x10_000..=0x7fff_ffff_ffff).contains(&addr) && addr % 8 == 0
}

#[tauri::command]
fn deduct_scouting_budget(
    user_club_id: u32,
    cost: i64,
    state: tauri::State<'_, AppState>,
) -> Result<ScoutingBudgetResult, String> {
    let target = state.target.lock().map_err(|_| "프로세스 상태 잠금 실패")?;
    let target = target.as_ref().ok_or("먼저 fm.exe에 연결해야 합니다.")?;
    if cost < 0 {
        return Err("차감 금액은 0 이상이어야 합니다.".to_string());
    }
    if cost > i32::MAX as i64 {
        return Err(format!("차감 금액({cost})이 i32 범위를 초과합니다."));
    }

    let context = resolve_scouting_budget_context(target, user_club_id)?;
    let current = target
        .read_i32(context.scouting_centre_ptr + MANAGER_SCOUTING_BUDGET + 4)
        .map_err(|_| "남은 스카우트 예산을 읽지 못했습니다.".to_string())?;
    let preview_next = current
        .checked_sub(cost as i32)
        .ok_or_else(|| "남은 스카우트 예산 계산이 i32 범위를 벗어났습니다.".to_string())?;
    if preview_next < 0 {
        return Err(format!(
            "스카우트 예산이 부족합니다. 현재 {current}, 필요 {cost}"
        ));
    }

    // 스카우트 예산 주소가 확정되기 전까지는 실제 메모리 차감을 수행하지 않는다.
    read_scouting_budget_from_context(target, context)
}

// (finance_ptr, balance_offset_in_finance, current_balance) 를 반환한다.
// FM26 치트 테이블 확인 오프셋: Cfin=0x150 (finance ptr), Ccba=0x14 (balance, i32)
// 해당 오프셋 실패 시 주변 오프셋을 스캔한다.
fn find_club_balance(target: &Target, club_ptr: usize) -> Result<(usize, usize, i32), String> {
    // FM 구단 자금의 현실적 범위 (£500K ~ £2.1B, i32 최대값 고려)
    const MIN_BAL: i32 = 500_000;
    const MAX_BAL: i32 = 2_000_000_000;

    // 알려진 오프셋(치트 테이블 확인) 우선 시도
    const KNOWN_FP_OFFSET: usize = 0x150; // cluo.Cfin
    const KNOWN_BAL_OFFSET: usize = 0x14; // cluo.Ccba

    if let Ok(fp) = target.read_usize(club_ptr + KNOWN_FP_OFFSET) {
        if fp > 0x10_000 && fp < 0x7fff_ffff_ffff {
            if let Ok(val) = target.read_i32(fp + KNOWN_BAL_OFFSET) {
                if val >= MIN_BAL && val <= MAX_BAL {
                    return Ok((fp, KNOWN_BAL_OFFSET, val));
                }
            }
        }
    }

    // 알려진 오프셋이 실패하면 광범위 스캔으로 폴백
    let mut candidates: Vec<(usize, usize, i32)> = Vec::new();

    for fp_offset in (0x80usize..=0x2f8).step_by(8) {
        let Ok(fp) = target.read_usize(club_ptr + fp_offset) else {
            continue;
        };
        if fp < 0x10_000 || fp > 0x7fff_ffff_ffff {
            continue;
        }
        if target.read_usize(fp).is_err() {
            continue;
        }

        // 재정 객체 내부를 4-byte 단위로 순회 (FM 구단 자금은 i32)
        for bal_offset in (0x00usize..=0x7c).step_by(4) {
            let Ok(val) = target.read_i32(fp + bal_offset) else {
                continue;
            };
            if val >= MIN_BAL && val <= MAX_BAL {
                candidates.push((fp, bal_offset, val));
            }
        }
    }

    if candidates.is_empty() {
        return Err(format!(
            "구단 자금을 찾지 못했습니다. 알려진 오프셋(club+0x150, +0x14)과 \
             스캔 범위(0x80~0x2F8)에서 £500K~£2B 값이 없습니다. club_ptr=0x{club_ptr:x}"
        ));
    }

    // 우선순위: £1M~£1B 범위 우선, 낮은 fp_offset, 낮은 bal_offset
    candidates.sort_by(|a, b| {
        let a_typical = a.2 >= 1_000_000 && a.2 <= 1_000_000_000;
        let b_typical = b.2 >= 1_000_000 && b.2 <= 1_000_000_000;
        b_typical
            .cmp(&a_typical)
            .then_with(|| a.0.cmp(&b.0))
            .then_with(|| a.1.cmp(&b.1))
    });

    Ok(candidates.into_iter().next().unwrap())
}

#[tauri::command]
fn read_club_balance(user_club_id: u32, state: tauri::State<'_, AppState>) -> Result<i64, String> {
    let target = state.target.lock().map_err(|_| "프로세스 상태 잠금 실패")?;
    let target = target.as_ref().ok_or("먼저 fm.exe에 연결해야 합니다.")?;
    if user_club_id == 0 {
        return Err("유저 클럽 ID를 입력하세요.".to_string());
    }
    let club_ptr = resolve_club_ptr(target, user_club_id)?;
    let (_, _, balance) = find_club_balance(target, club_ptr)?;
    Ok(balance as i64)
}

#[tauri::command]
fn deduct_scouting_cost(
    user_club_id: u32,
    cost: i64,
    state: tauri::State<'_, AppState>,
) -> Result<i64, String> {
    let target = state.target.lock().map_err(|_| "프로세스 상태 잠금 실패")?;
    let target = target.as_ref().ok_or("먼저 fm.exe에 연결해야 합니다.")?;

    if user_club_id == 0 {
        return Err("유저 클럽 ID를 입력하세요.".to_string());
    }
    if cost > i32::MAX as i64 {
        return Err(format!("차감 금액({cost})이 i32 범위를 초과합니다."));
    }
    let _ = cost;

    let club_ptr = resolve_club_ptr(target, user_club_id)?;
    let (_, _, current_balance) = find_club_balance(target, club_ptr)?;

    Ok(current_balance as i64)
}

// === Nation editing (Youth Rating / Game Importance) ============================

// Nation 객체 후보 스캐닝.
// 국가 UID는 보통 작은 정수(예: 잉글랜드 769)라 메모리상에서 false positive가 매우 많다.
// vtable + Ntct 포인터 + 이름 포인터 다중 필터로 정리한다.
fn find_nation_candidates(
    target: &Target,
    uid: u32,
    max_hits: usize,
) -> Result<Vec<usize>, String> {
    let needle = uid.to_le_bytes();
    // Nation 객체는 적어도 Ntct(0x108) + 8바이트 이상 있어야 검증 가능.
    const MIN_OBJ_SIZE: usize = NATION_NTCT_PTR + 8;
    let mut hits = Vec::new();
    let mut seen = HashSet::new();

    for region in readable_regions(target) {
        let base = region.base;
        let size = region.size;
        if size < MIN_OBJ_SIZE || size > 256 * 1024 * 1024 {
            continue;
        }

        let Ok(bytes) = target.read(base, size) else {
            continue;
        };

        for i in OBJ_DUNI..=bytes.len().saturating_sub(needle.len()) {
            if bytes[i] != needle[0] || bytes[i..i + needle.len()] != needle {
                continue;
            }

            let obj_off = i - OBJ_DUNI;
            if obj_off + MIN_OBJ_SIZE > bytes.len() {
                continue;
            }

            // 1) vtable: 정렬된 유효 포인터
            let vtable = usize::from_le_bytes(bytes[obj_off..obj_off + 8].try_into().unwrap());
            if vtable < 0x10_0000 || vtable > 0x7fff_ffff_ffff || vtable % 8 != 0 {
                continue;
            }

            // 2) Nnam 이름 포인터(+0x18): 유효한 힙 주소
            let nnam_off = obj_off + NATION_REAL_NAME;
            let nnam_ptr = usize::from_le_bytes(bytes[nnam_off..nnam_off + 8].try_into().unwrap());
            if nnam_ptr < 0x10_000 || nnam_ptr > 0x7fff_ffff_ffff {
                continue;
            }

            // 3) Nsnm 짧은 이름 포인터(+0x20): 유효한 힙 주소
            let nsnm_off = obj_off + NATION_SHORT_NAME;
            let nsnm_ptr = usize::from_le_bytes(bytes[nsnm_off..nsnm_off + 8].try_into().unwrap());
            if nsnm_ptr < 0x10_000 || nsnm_ptr > 0x7fff_ffff_ffff {
                continue;
            }

            // 4) Ntct 포인터(+0x108): 유효한 힙 주소
            let ntct_off = obj_off + NATION_NTCT_PTR;
            let ntct_ptr = usize::from_le_bytes(bytes[ntct_off..ntct_off + 8].try_into().unwrap());
            if ntct_ptr < 0x10_000 || ntct_ptr > 0x7fff_ffff_ffff {
                continue;
            }

            let Some(object) = base.checked_add(obj_off) else {
                continue;
            };
            if !seen.insert(object) {
                continue;
            }
            // 실제 메모리에서 다시 한 번 검증 (캐시 일관성)
            if target.read_u32(object + OBJ_DUNI).ok() != Some(uid) {
                continue;
            }
            hits.push(object);
            if hits.len() >= max_hits {
                return Ok(hits);
            }
        }
    }

    Ok(hits)
}

// 국가 이름을 가능한 한 견고하게 읽는다.
// Nnam(+0x18, 진짜 국가 이름) → Nnty(+0x30) → Nsnm(+0x20) 순으로 시도.
fn read_nation_display_name(target: &Target, nation: usize) -> Option<String> {
    for &off in &[NATION_REAL_NAME, NATION_NAME, NATION_SHORT_NAME] {
        if let Ok(Some(name)) = read_fm_indirect_string(target, nation + off) {
            if is_plausible_label(&name) {
                return Some(name);
            }
        }
    }
    None
}

// 국가 이름으로 그럴듯한 라벨인지 가벼운 검사(하드코딩 목록과 달리 모든 국가 허용).
fn is_plausible_label(text: &str) -> bool {
    let trimmed = text.trim();
    let len = trimmed.chars().count();
    if !(2..=42).contains(&len) {
        return false;
    }
    // 대부분 글자/공백/하이픈/마침표/괄호. 제어문자나 깨진 바이트가 섞이면 제외.
    let printable = trimmed
        .chars()
        .filter(|c| c.is_alphabetic() || c.is_whitespace() || "-.'()&".contains(*c))
        .count();
    printable * 10 >= len * 8
}

// 구조 필터를 통과한 객체를 의미 수준(Ntct→YR/GI 범위)까지 검증하고,
// 통과하면 (포인터, 화면용 후보, vtable)을 돌려준다. 가짜는 None.
fn describe_nation(
    target: &Target,
    uid: u32,
    nation: usize,
) -> Option<(NationPointers, NationCandidate, usize)> {
    if target.read_u32(nation + OBJ_DUNI).ok() != Some(uid) {
        return None;
    }
    let vtable = target.read_usize(nation).ok()?;
    if vtable < 0x10_0000 || vtable > 0x7fff_ffff_ffff || vtable % 8 != 0 {
        return None;
    }
    let ntct = target.read_usize(nation + NATION_NTCT_PTR).ok()?;
    if ntct < 0x10_000 {
        return None;
    }
    let yr = target.read_u8(ntct + NTCT_YOUTH_RATING).ok()?;
    let gi = target.read_u8(ntct + NTCT_GAME_IMPORTANCE).ok()?;
    if !(1..=200).contains(&yr) || !(1..=4).contains(&gi) {
        return None;
    }
    let name = read_nation_display_name(target, nation);
    let candidate = NationCandidate {
        nation: format!("0x{nation:x}"),
        ntct: format!("0x{ntct:x}"),
        uid,
        name,
        youth_rating: yr,
        game_importance: gi,
        vtable_votes: 0,
    };
    Some((NationPointers { nation, ntct }, candidate, vtable))
}

// 정확도 우선: uid에 해당하는 "진짜 국가 객체"를 전수 수집한다.
// 구조 필터를 통과한 모든 후보를 의미 검증까지 돌린 뒤, vtable 다수결로 신뢰도를
// 매겨 정렬한다(드롭하지 않음 — 사용자가 최종 선택).
fn collect_nation_candidates(
    target: &Target,
    uid: u32,
) -> Result<Vec<(NationPointers, NationCandidate)>, String> {
    let structural = find_nation_candidates(target, uid, 4096)?;

    let mut described: Vec<(NationPointers, NationCandidate, usize)> = structural
        .iter()
        .filter_map(|&addr| describe_nation(target, uid, addr))
        .collect();

    // vtable 빈도 집계 — 진짜 Nation들은 동일 vtable을 공유한다.
    let mut votes: HashMap<usize, usize> = HashMap::new();
    for (_, _, vtable) in &described {
        *votes.entry(*vtable).or_insert(0) += 1;
    }
    for (_, candidate, vtable) in &mut described {
        candidate.vtable_votes = *votes.get(vtable).unwrap_or(&0);
    }

    // 신뢰도 정렬: vtable 득표 desc → 이름 있는 것 우선 → 주소 asc(안정적).
    described.sort_by(|a, b| {
        b.1.vtable_votes
            .cmp(&a.1.vtable_votes)
            .then_with(|| b.1.name.is_some().cmp(&a.1.name.is_some()))
            .then_with(|| a.0.nation.cmp(&b.0.nation))
    });

    Ok(described
        .into_iter()
        .map(|(pointers, candidate, _)| (pointers, candidate))
        .collect())
}

// 단일 확정 국가에 대한 결과(편집 화면용). candidates는 비우고 selected=true.
fn build_nation_scan_result(
    target: &Target,
    uid: u32,
    pointers: NationPointers,
    hit_count: usize,
) -> Result<NationScanResult, String> {
    if target.read_u32(pointers.nation + OBJ_DUNI).ok() != Some(uid) {
        return Err("선택된 레코드의 UID가 입력 UID와 일치하지 않습니다.".to_string());
    }
    let ntct = target.read_usize(pointers.nation + NATION_NTCT_PTR)?;
    if ntct != pointers.ntct {
        return Err("국가 유소년 데이터 포인터가 변경되었습니다. 다시 검색하세요.".to_string());
    }
    let youth_rating = target.read_u8(pointers.ntct + NTCT_YOUTH_RATING)?;
    let game_importance = target.read_u8(pointers.ntct + NTCT_GAME_IMPORTANCE)?;
    if !(1..=200).contains(&youth_rating) || !(1..=4).contains(&game_importance) {
        return Err("Youth Rating 또는 Game Importance 값이 예상 범위를 벗어났습니다.".to_string());
    }
    let name = read_nation_display_name(target, pointers.nation);

    Ok(NationScanResult {
        uid,
        youth_rating,
        game_importance,
        hit_count,
        name,
        candidates: Vec::new(),
        needs_selection: false,
        selected: true,
    })
}

#[tauri::command]
fn scan_nation(uid: u32, state: tauri::State<'_, AppState>) -> Result<NationScanResult, String> {
    let target = state.target.lock().map_err(|_| "프로세스 상태 잠금 실패")?;
    let target = target.as_ref().ok_or("먼저 fm.exe에 연결해야 합니다.")?;

    if uid == 0 {
        return Err("UID를 입력하세요.".to_string());
    }

    let candidates = collect_nation_candidates(target, uid)?;
    if candidates.is_empty() {
        return Err(
            "UID에 해당하는 국가 객체를 찾지 못했습니다. (Youth Rating/Game Importance 검증 통과 후보 없음)"
                .to_string(),
        );
    }
    let hit_count = candidates.len();

    // 후보가 하나뿐이면 자동 확정. 둘 이상이면 사용자 선택을 요구한다.
    if candidates.len() == 1 {
        let (pointers, candidate) = &candidates[0];
        let mut nation = state.nation.lock().map_err(|_| "국가 상태 잠금 실패")?;
        *nation = Some(*pointers);
        return Ok(NationScanResult {
            uid,
            youth_rating: candidate.youth_rating,
            game_importance: candidate.game_importance,
            hit_count,
            name: candidate.name.clone(),
            candidates: vec![candidate.clone()],
            needs_selection: false,
            selected: true,
        });
    }

    // 다중 후보: 확정하지 않고 전부 돌려준다. preview 값은 1순위 후보 기준.
    let preview = &candidates[0].1;
    Ok(NationScanResult {
        uid,
        youth_rating: preview.youth_rating,
        game_importance: preview.game_importance,
        hit_count,
        name: preview.name.clone(),
        candidates: candidates.into_iter().map(|(_, c)| c).collect(),
        needs_selection: true,
        selected: false,
    })
}

// 다중 후보 중 사용자가 고른 국가 주소("0x...")를 확정한다.
#[tauri::command]
fn select_nation(
    uid: u32,
    nation: String,
    state: tauri::State<'_, AppState>,
) -> Result<NationScanResult, String> {
    let target = state.target.lock().map_err(|_| "프로세스 상태 잠금 실패")?;
    let target = target.as_ref().ok_or("먼저 fm.exe에 연결해야 합니다.")?;

    let addr = usize::from_str_radix(nation.trim_start_matches("0x"), 16)
        .map_err(|_| "잘못된 국가 주소입니다.".to_string())?;

    let (pointers, _, _) = describe_nation(target, uid, addr)
        .ok_or("선택한 후보가 더 이상 유효하지 않습니다. 다시 검색하세요.")?;

    let mut nation_state = state.nation.lock().map_err(|_| "국가 상태 잠금 실패")?;
    *nation_state = Some(pointers);

    build_nation_scan_result(target, uid, pointers, 1)
}

#[tauri::command]
fn read_nation_fields(state: tauri::State<'_, AppState>) -> Result<NationScanResult, String> {
    let target = state.target.lock().map_err(|_| "프로세스 상태 잠금 실패")?;
    let target = target.as_ref().ok_or("먼저 fm.exe에 연결해야 합니다.")?;
    let nation = state.nation.lock().map_err(|_| "국가 상태 잠금 실패")?;
    let pointers = nation.as_ref().ok_or("먼저 국가를 검색해야 합니다.")?;

    let uid = target.read_u32(pointers.nation + OBJ_DUNI).unwrap_or(0);
    build_nation_scan_result(target, uid, *pointers, 1)
}

#[tauri::command]
fn apply_nation_changes(
    youth_rating: Option<u8>,
    game_importance: Option<u8>,
    state: tauri::State<'_, AppState>,
) -> Result<NationScanResult, String> {
    let target = state.target.lock().map_err(|_| "프로세스 상태 잠금 실패")?;
    let target = target.as_ref().ok_or("먼저 fm.exe에 연결해야 합니다.")?;
    let nation = state.nation.lock().map_err(|_| "국가 상태 잠금 실패")?;
    let pointers = nation.as_ref().ok_or("먼저 국가를 검색해야 합니다.")?;

    if let Some(yr) = youth_rating {
        if !(1..=200).contains(&yr) {
            return Err(format!(
                "Youth Rating은 1~200 사이여야 합니다 (입력: {yr})."
            ));
        }
        target.write(pointers.ntct + NTCT_YOUTH_RATING, &[yr])?;
    }
    if let Some(gi) = game_importance {
        if !(1..=4).contains(&gi) {
            return Err(format!(
                "Game Importance는 1~4 사이여야 합니다 (1:Very Important / 2:Important / 3:Unimportant / 4:Useless, 입력: {gi})."
            ));
        }
        target.write(pointers.ntct + NTCT_GAME_IMPORTANCE, &[gi])?;
    }

    let uid = target.read_u32(pointers.nation + OBJ_DUNI).unwrap_or(0);
    build_nation_scan_result(target, uid, *pointers, 1)
}

// ================================================================================

// ================================================================================
// 포토 스튜디오 — 얼굴 대신 "구단 유니폼 입은 실사 사진"을 붙이기 위한 프롬프트/파일 관리
// ================================================================================

#[tauri::command]
fn studio_state() -> Result<portrait::StudioState, String> {
    portrait::state()
}

#[tauri::command]
fn save_kit_reference(
    slot: String,
    file_name: String,
    data_base64: String,
) -> Result<portrait::KitReference, String> {
    portrait::save_kit(&slot, &file_name, &data_base64)
}

#[tauri::command]
fn clear_kit_reference(slot: String) -> Result<(), String> {
    portrait::clear_kit(&slot)
}

/// 생성본 우선, 없으면 페이스팩 얼굴.
#[tauri::command]
fn read_player_portrait(uid: u32) -> Result<portrait::PortraitImage, String> {
    portrait::player_image(uid)
}

#[tauri::command]
fn save_generated_portrait(uid: u32, data_base64: String) -> Result<String, String> {
    portrait::save_generated(uid, &data_base64)
}

#[tauri::command]
fn delete_generated_portrait(uid: u32) -> Result<(), String> {
    portrait::delete_generated(uid)
}

#[tauri::command]
fn build_portrait_prompts(
    request: portrait::PortraitPromptRequest,
) -> Vec<portrait::PortraitPrompt> {
    portrait_prompt::build_prompts(&request)
}

#[tauri::command]
fn export_portrait_prompts(
    request: portrait::PortraitPromptRequest,
    label: String,
) -> Result<portrait::ExportResult, String> {
    portrait_prompt::export(&request, &label)
}

/// 탐색기로 폴더 열기. 스튜디오 폴더 밖은 열지 않는다.
#[tauri::command]
fn open_studio_path(path: String) -> Result<(), String> {
    let root = portrait::studio_root()?;
    let target = std::path::PathBuf::from(&path);
    if !target.starts_with(&root) {
        return Err("스튜디오 폴더 밖의 경로는 열 수 없습니다.".to_string());
    }
    if !target.exists() {
        return Err("폴더가 없습니다.".to_string());
    }
    std::process::Command::new("explorer")
        .arg(&target)
        .spawn()
        .map_err(|err| format!("탐색기를 열지 못했습니다: {err}"))?;
    Ok(())
}

#[tauri::command]
fn analyze_save_file(path: String) -> Result<SaveFileHeader, String> {
    analyze_save_header(&path)
}

#[tauri::command]
fn decompress_and_analyze(path: String) -> Result<DecompressionResult, String> {
    analyze_decompressed(&path)
}

pub fn run() {
    tauri::Builder::default()
        .manage(AppState::default())
        .invoke_handler(tauri::generate_handler![
            app_status,
            set_window_on_top,
            list_fields,
            set_game_date,
            connect_fm,
            scan_player,
            read_field,
            read_all_fields,
            apply_changes,
            collect_club_player_uids,
            identify_club,
            analyze_squad,
            build_scouting_report,
            scout_player_detail,
            read_player_face,
            studio_state,
            save_kit_reference,
            clear_kit_reference,
            read_player_portrait,
            save_generated_portrait,
            delete_generated_portrait,
            build_portrait_prompts,
            export_portrait_prompts,
            open_studio_path,
            read_club_balance,
            read_scouting_budget,
            collect_user_club_scouts,
            deduct_scouting_budget,
            deduct_scouting_cost,
            analyze_save_file,
            decompress_and_analyze,
            scan_nation,
            select_nation,
            read_nation_fields,
            apply_nation_changes,
        ])
        .run(tauri::generate_context!())
        .expect("error while running tauri application");
}

#[derive(Clone, Copy)]
struct PlayerHit {
    pointers: PlayerPointers,
    ca: u16,
    pa: u16,
    dynamic_offset: i32,
}

fn find_player_by_uid(
    target: &Target,
    uid: u32,
    max_hits: usize,
) -> Result<Vec<PlayerHit>, String> {
    let needle = uid.to_le_bytes();
    let mut hits = Vec::new();
    let mut seen_people = HashSet::new();

    for region in readable_regions(target) {
        let base = region.base;
        let size = region.size;
        if size <= needle.len() || size > 256 * 1024 * 1024 {
            continue;
        }

        let Ok(bytes) = target.read(base, size) else {
            continue;
        };

        for i in 0..=bytes.len().saturating_sub(4) {
            if bytes[i] != needle[0] {
                continue;
            }
            let found_uid = u32::from_le_bytes(bytes[i..i + 4].try_into().unwrap());
            if found_uid != uid {
                continue;
            }

            let Some(person) = base
                .checked_add(i)
                .and_then(|addr| addr.checked_sub(OBJ_DUNI))
            else {
                continue;
            };
            if !seen_people.insert(person) {
                continue;
            }

            if let Some(hit) = try_resolve_from_person(target, person, uid) {
                hits.push(hit);
                if hits.len() >= max_hits {
                    return Ok(hits);
                }
            }
        }
    }

    Ok(hits)
}

fn find_players_by_uids(target: &Target, uids: &[u32]) -> Result<HashMap<u32, PlayerHit>, String> {
    let wanted = uids
        .iter()
        .copied()
        .filter(|uid| *uid > 0)
        .collect::<HashSet<_>>();
    if wanted.is_empty() {
        return Ok(HashMap::new());
    }

    let mut first_bytes = [false; 256];
    for uid in &wanted {
        first_bytes[uid.to_le_bytes()[0] as usize] = true;
    }

    let mut hits = HashMap::new();
    let mut seen_people = HashSet::new();

    for region in readable_regions(target) {
        let base = region.base;
        let size = region.size;
        if size <= 4 || size > 256 * 1024 * 1024 {
            continue;
        }

        let Ok(bytes) = target.read(base, size) else {
            continue;
        };

        for i in 0..=bytes.len().saturating_sub(4) {
            if !first_bytes[bytes[i] as usize] {
                continue;
            }

            let uid = u32::from_le_bytes(bytes[i..i + 4].try_into().unwrap());
            if !wanted.contains(&uid) || hits.contains_key(&uid) {
                continue;
            }

            let Some(person) = base
                .checked_add(i)
                .and_then(|addr| addr.checked_sub(OBJ_DUNI))
            else {
                continue;
            };
            if !seen_people.insert(person) {
                continue;
            }

            if let Some(hit) = try_resolve_from_person(target, person, uid) {
                hits.insert(uid, hit);
                if hits.len() >= wanted.len() {
                    return Ok(hits);
                }
            }
        }
    }

    Ok(hits)
}

fn try_resolve_from_person(target: &Target, person: usize, uid: u32) -> Option<PlayerHit> {
    if target.read_u32(person + OBJ_DUNI).ok()? != uid {
        return None;
    }

    let dynamic_offset = read_dynamic_offset(target, person)?;
    if dynamic_offset != PLAYER_OFFSET && dynamic_offset != PLAYER_STAFF_OFFSET {
        return None;
    }

    let player = person.checked_sub(dynamic_offset as usize)?;
    let ca = target.read_u16(player + 0x264).ok()?;
    let pa = target.read_u16(player + 0x266).ok()?;
    if !(1..=200).contains(&ca) || !(1..=200).contains(&pa) {
        return None;
    }

    Some(PlayerHit {
        pointers: PlayerPointers { person, player },
        ca,
        pa,
        dynamic_offset,
    })
}

fn find_club_by_uid(target: &Target, club_id: u32) -> Result<Option<usize>, String> {
    // vtable + CLUB_NAME 포인터 이중 필터로 false positive 제거 후 스캔
    let candidates = find_club_candidates(target, club_id, 4096)?;
    let mut best = None;
    let mut best_player_count = 0usize;
    let mut best_has_name = false;

    for club in candidates {
        let Ok((squads, _)) = collect_squads_from_club(target, club, "전체") else {
            continue;
        };
        let player_count = squads.iter().map(|squad| squad.player_count).sum::<usize>();
        let has_name = read_club_name(target, club).is_some();
        let is_better = player_count > best_player_count
            || (player_count == best_player_count && has_name && !best_has_name);

        if best.is_none() || is_better {
            best = Some(club);
            best_player_count = player_count;
            best_has_name = has_name;
            if player_count >= 15 && has_name {
                break;
            }
        }
    }

    Ok(best)
}

fn find_team_by_uid(target: &Target, team_id: u32) -> Result<Option<usize>, String> {
    // vtable + TEAM_TYPE 이중 필터로 false positive 제거 후 스캔
    let candidates = find_team_candidates(target, team_id, 4096)?;
    let mut best = None;
    let mut best_player_count = 0usize;

    for team in candidates {
        let Ok((player_uids, _)) = read_player_uids_from_team(target, team) else {
            continue;
        };
        if player_uids.len() > best_player_count {
            best = Some(team);
            best_player_count = player_uids.len();
        }
    }

    Ok(best)
}

// 클럽 전용 스캔: 이미 읽은 바이트 배열 안에서 vtable + CLUB_TEAMS 벡터 +
// CLUB_NAME/SHORT_NAME 포인터를 검사해 false positive를 제거한다.
// 작은 UID(예: 680)는 메모리에서 수만 번 등장하므로, 다중 필터 없이는
// 4096 cap 안에 진짜 클럽 객체가 들어오지 못한다.
fn find_club_candidates(target: &Target, uid: u32, max_hits: usize) -> Result<Vec<usize>, String> {
    let needle = uid.to_le_bytes();
    // 클럽 객체는 최소 CLUB_SHORT_NAME(0xc8) + 8 이상
    const MIN_OBJ_SIZE: usize = CLUB_SHORT_NAME + 8;
    let mut hits = Vec::new();
    let mut seen = HashSet::new();

    for region in readable_regions(target) {
        let base = region.base;
        let size = region.size;
        if size < MIN_OBJ_SIZE || size > 256 * 1024 * 1024 {
            continue;
        }

        let Ok(bytes) = target.read(base, size) else {
            continue;
        };

        for i in OBJ_DUNI..=bytes.len().saturating_sub(needle.len()) {
            if bytes[i] != needle[0] || bytes[i..i + needle.len()] != needle {
                continue;
            }

            let obj_off = i - OBJ_DUNI;

            // 객체 끝(CLUB_SHORT_NAME + 8)이 버퍼 안에 있어야 모든 필드를 검증 가능
            if obj_off + MIN_OBJ_SIZE > bytes.len() {
                continue;
            }

            // 1) vtable 체크 (object + 0x00)
            let vtable = usize::from_le_bytes(bytes[obj_off..obj_off + 8].try_into().unwrap());
            if vtable < 0x10_0000 || vtable > 0x7fff_ffff_ffff || vtable % 8 != 0 {
                continue;
            }

            // 2) CLUB_TEAMS 벡터 체크 (object + 0x18 = start, object + 0x20 = end)
            //    진짜 클럽 객체는 여기에 팀 포인터 배열의 시작/끝 주소 쌍이 있다.
            //    랜덤 힙 데이터는 두 연속 8바이트가 모두 정렬된 유효 포인터이면서
            //    end >= start 이고 간격이 8의 배수일 확률이 극히 낮다.
            let teams_start_off = obj_off + CLUB_TEAMS;
            let teams_end_off = obj_off + CLUB_TEAMS + 8;
            if teams_end_off + 8 <= bytes.len() {
                let ts = usize::from_le_bytes(
                    bytes[teams_start_off..teams_start_off + 8]
                        .try_into()
                        .unwrap(),
                );
                let te = usize::from_le_bytes(
                    bytes[teams_end_off..teams_end_off + 8].try_into().unwrap(),
                );
                // 유효한 힙 포인터 범위이고, end >= start, 8-byte 정렬, 팀 수 1~30
                let valid_vec = ts >= 0x10_000
                    && ts <= 0x7fff_ffff_ffff
                    && te >= ts
                    && te <= 0x7fff_ffff_ffff
                    && (te - ts) % 8 == 0;
                let team_count = if valid_vec { (te - ts) / 8 } else { 0 };
                if !valid_vec || team_count == 0 || team_count > 30 {
                    continue;
                }
            }

            // 3) CLUB_NAME 포인터 체크 (object + 0xc0) — 필수, 스킵 불가
            let name_off = obj_off + CLUB_NAME;
            let name_ptr = usize::from_le_bytes(bytes[name_off..name_off + 8].try_into().unwrap());
            if name_ptr < 0x10_000 || name_ptr > 0x7fff_ffff_ffff {
                continue;
            }

            // 4) CLUB_SHORT_NAME 포인터 체크 (object + 0xc8) — 추가 필터
            let sname_off = obj_off + CLUB_SHORT_NAME;
            let sname_ptr =
                usize::from_le_bytes(bytes[sname_off..sname_off + 8].try_into().unwrap());
            if sname_ptr < 0x10_000 || sname_ptr > 0x7fff_ffff_ffff {
                continue;
            }

            let Some(object) = base.checked_add(obj_off) else {
                continue;
            };
            if !seen.insert(object) {
                continue;
            }
            if target.read_u32(object + OBJ_DUNI).ok() == Some(uid) {
                hits.push(object);
                if hits.len() >= max_hits {
                    return Ok(hits);
                }
            }
        }
    }

    Ok(hits)
}

// 팀 전용 스캔: vtable + TEAM_TYPE + TEAM_CLUB + TEAM_PLAYERS 벡터를 검증해
// false positive를 제거한다.
fn find_team_candidates(target: &Target, uid: u32, max_hits: usize) -> Result<Vec<usize>, String> {
    let needle = uid.to_le_bytes();
    // 팀 객체는 최소 TEAM_PLAYERS(0x38) + 16바이트(start+end) 이상 필요
    const MIN_OBJ_SIZE: usize = TEAM_PLAYERS + 16;
    let mut hits = Vec::new();
    let mut seen = HashSet::new();

    for region in readable_regions(target) {
        let base = region.base;
        let size = region.size;
        if size < MIN_OBJ_SIZE || size > 256 * 1024 * 1024 {
            continue;
        }

        let Ok(bytes) = target.read(base, size) else {
            continue;
        };

        for i in OBJ_DUNI..=bytes.len().saturating_sub(needle.len()) {
            if bytes[i] != needle[0] || bytes[i..i + needle.len()] != needle {
                continue;
            }

            let obj_off = i - OBJ_DUNI;

            // 객체 끝이 버퍼 안에 있어야 모든 필드를 검증 가능
            if obj_off + MIN_OBJ_SIZE > bytes.len() {
                continue;
            }

            // 1) vtable 체크
            let vtable = usize::from_le_bytes(bytes[obj_off..obj_off + 8].try_into().unwrap());
            if vtable < 0x10_0000 || vtable > 0x7fff_ffff_ffff || vtable % 8 != 0 {
                continue;
            }

            // 2) TEAM_TYPE (offset 0x28) 체크 — 필수, 유효한 팀 타입 0~60
            let team_type = bytes[obj_off + TEAM_TYPE];
            if team_type > 60 {
                continue;
            }

            // 3) TEAM_CLUB 포인터 (offset 0x30) — 유효한 힙 주소여야 함
            let club_off = obj_off + TEAM_CLUB;
            if club_off + 8 <= bytes.len() {
                let club_ptr =
                    usize::from_le_bytes(bytes[club_off..club_off + 8].try_into().unwrap());
                if club_ptr < 0x10_000 || club_ptr > 0x7fff_ffff_ffff {
                    continue;
                }
            }

            // 4) TEAM_PLAYERS 벡터 체크 (offset 0x38 = start, 0x40 = end)
            let ps_off = obj_off + TEAM_PLAYERS;
            let pe_off = obj_off + TEAM_PLAYERS + 8;
            if pe_off + 8 <= bytes.len() {
                let ps = usize::from_le_bytes(bytes[ps_off..ps_off + 8].try_into().unwrap());
                let pe = usize::from_le_bytes(bytes[pe_off..pe_off + 8].try_into().unwrap());
                let valid_vec = ps >= 0x10_000
                    && ps <= 0x7fff_ffff_ffff
                    && pe >= ps
                    && pe <= 0x7fff_ffff_ffff
                    && (pe - ps) % 8 == 0;
                let player_count = if valid_vec { (pe - ps) / 8 } else { 0 };
                if !valid_vec || player_count > 512 {
                    continue;
                }
            }

            let Some(object) = base.checked_add(obj_off) else {
                continue;
            };
            if !seen.insert(object) {
                continue;
            }
            if target.read_u32(object + OBJ_DUNI).ok() == Some(uid) {
                hits.push(object);
                if hits.len() >= max_hits {
                    return Ok(hits);
                }
            }
        }
    }

    Ok(hits)
}

fn collect_squads_from_club(
    target: &Target,
    club: usize,
    squad_kind: &str,
) -> Result<(Vec<ClubSquadPlayers>, HashMap<u32, PlayerPointers>), String> {
    // FM 버전에 따라 팀 목록 오프셋이 다를 수 있어 여러 후보를 시도한다.
    const CLUB_TEAMS_OFFSETS: &[usize] = &[CLUB_TEAMS, 0x10, 0x20, 0x28, 0x30, 0x38, 0x40];

    let mut best_squads: Vec<ClubSquadPlayers> = Vec::new();
    let mut best_pointers: HashMap<u32, PlayerPointers> = HashMap::new();

    for &teams_offset in CLUB_TEAMS_OFFSETS {
        let Ok(teams) = read_pointer_range(target, club + teams_offset, 64) else {
            continue;
        };

        let mut squads = Vec::new();
        let mut pointer_cache = HashMap::new();

        for team in teams {
            if target.read_usize(team + TEAM_CLUB).ok() != Some(club) {
                continue;
            }

            let team_type = target.read_u8(team + TEAM_TYPE).unwrap_or(255);
            if !squad_kind_matches(team_type, squad_kind) {
                continue;
            }

            let Ok((player_uids, pointers)) = read_player_uids_from_team(target, team) else {
                continue;
            };
            if player_uids.is_empty() {
                continue;
            }
            pointer_cache.extend(pointers);
            squads.push(ClubSquadPlayers {
                team_type,
                team_type_label: team_type_label(team_type).to_string(),
                player_count: player_uids.len(),
                player_uids,
            });
        }

        let total: usize = squads.iter().map(|s| s.player_count).sum();
        let best_total: usize = best_squads.iter().map(|s| s.player_count).sum();
        if total > best_total {
            best_squads = squads;
            best_pointers = pointer_cache;
        }
    }

    if best_squads.is_empty() {
        return Err("선택한 스쿼드에서 선수 목록을 찾지 못했습니다.".to_string());
    }

    Ok((best_squads, best_pointers))
}

fn read_player_uids_from_team(
    target: &Target,
    team: usize,
) -> Result<(Vec<u32>, HashMap<u32, PlayerPointers>), String> {
    // FM 버전에 따라 선수 목록 오프셋이 달라질 수 있어 여러 후보를 순서대로 시도한다.
    const PLAYER_LIST_OFFSETS: &[usize] = &[
        TEAM_PLAYERS as usize, // 0x38 — 기준 오프셋
        0x28,
        0x30,
        0x40,
        0x48,
        0x50,
        0x58,
        0x60,
        0x68,
        0x70,
        0x78,
        0x80,
        0x88,
        0x90,
        0x98,
        0xa0,
        0xa8,
        0xb0,
    ];

    let mut best_uids: Vec<u32> = Vec::new();
    let mut best_pointers: HashMap<u32, PlayerPointers> = HashMap::new();

    for &offset in PLAYER_LIST_OFFSETS {
        let Ok(raw_players) = read_pointer_range(target, team + offset, 512) else {
            continue;
        };

        let mut seen = HashSet::new();
        let mut uids = Vec::new();
        let mut pointers = HashMap::new();

        for player in raw_players {
            let Some(hit) = try_resolve_from_squad_pointer(target, player) else {
                continue;
            };
            let Ok(uid) = target.read_u32(hit.pointers.person + OBJ_DUNI) else {
                continue;
            };
            if uid != 0 && seen.insert(uid) {
                uids.push(uid);
                pointers.insert(uid, hit.pointers);
            }
        }

        if uids.len() > best_uids.len() {
            best_uids = uids;
            best_pointers = pointers;
            if best_uids.len() >= 20 {
                break;
            }
        }
    }

    Ok((best_uids, best_pointers))
}

fn read_scouted_player(
    target: &Target,
    uid: u32,
    pointers: PlayerPointers,
    game_date: GameDate,
) -> Option<ScoutedPlayer> {
    if target.read_u32(pointers.person + OBJ_DUNI).ok()? != uid {
        return None;
    }

    let ca = target.read_u16(pointers.player + 0x264).ok()?;
    let pa = target.read_u16(pointers.player + 0x266).ok()?;
    if !(1..=200).contains(&ca) || !(1..=200).contains(&pa) {
        return None;
    }

    Some(ScoutedPlayer {
        uid,
        name: read_person_name(target, pointers.person).unwrap_or(None),
        ca,
        pa,
        position: read_best_position(target, pointers.player).unwrap_or_else(|| "N/A".to_string()),
        pointers,
        strength_profile: read_strength_profile(target, pointers),
        age: read_player_age(target, pointers.person, game_date),
        nation: read_person_nation_name(target, pointers.person),
    })
}

fn store_scouting_cache(
    state: &tauri::State<'_, AppState>,
    pointers: HashMap<u32, PlayerPointers>,
) -> Result<(), String> {
    let mut scouting_cache = state
        .scouting_cache
        .lock()
        .map_err(|_| "스카우팅 캐시 잠금 실패")?;
    for (uid, pointer) in pointers {
        scouting_cache.insert(uid, pointer);
    }
    Ok(())
}

fn read_personality_profile(
    target: &Target,
    pointers: PlayerPointers,
    player_uid: u32,
    date_seed: u64,
) -> Option<PersonalityProfile> {
    let adaptability = read_plain_attribute(target, pointers.person + PADA)?;
    let ambition = read_plain_attribute(target, pointers.person + PADA + 0x01)?;
    let loyalty = read_plain_attribute(target, pointers.person + PADA + 0x02)?;
    let pressure = read_plain_attribute(target, pointers.person + PADA + 0x03)?;
    let professionalism = read_plain_attribute(target, pointers.person + PADA + 0x04)?;
    let sportsmanship = read_plain_attribute(target, pointers.person + PADA + 0x05)?;
    let temperament = read_plain_attribute(target, pointers.person + PADA + 0x06)?;
    let controversy = read_plain_attribute(target, pointers.person + PADA + 0x07)?;
    let determination = read_fm_attribute(target, pointers.player + PATR + 0x33)?;
    let score = (u16::from(professionalism)
        + u16::from(ambition)
        + u16::from(determination)
        + u16::from(pressure))
        / 4;

    let summary = match score {
        17..=20 => "엘리트 멘탈리티",
        14..=16 => "좋은 성장 성향",
        10..=13 => "평균적 성향",
        _ => "성장 환경 관리 필요",
    }
    .to_string();

    let mut notes = Vec::new();
    push_personality_note(
        &mut notes,
        personality_axis_note(
            player_uid,
            date_seed,
            1,
            professionalism,
            "프로의식",
            &[
                "아침 회복 세션 출석부에는 이름이 있는데 GPS 조끼 기록은 비어 있던 날이 여러 번 있었습니다. 코치가 농담처럼 '서명은 월드클래스'라고 적어둔 메모가 남아 있습니다",
                "훈련 전날 룸 체크가 끝난 뒤 20분 만에 숙소 로비에서 다시 목격됐다는 보고가 있습니다. 재능보다 생활 리듬을 먼저 관리해야 하는 유형입니다",
                "개인 보강 과제를 받은 주에 정작 제일 성실히 반복한 것은 슈팅이 아니라 변명 레퍼토리였다는 스태프 코멘트가 붙었습니다",
                "훈련장에서는 번뜩이지만 훈련장 밖 루틴이 헐겁습니다. 현지 커뮤니티에서는 '하이라이트는 프리미어리그급, 알람은 아마추어급'이라는 말까지 돌았습니다",
                "원정 직후 회복식 대신 배달 음식 봉투가 먼저 발견됐다는 장비팀 제보가 있습니다. 몸이 먼저 커리어를 배신할 수 있다는 경고 신호입니다",
                "훈련 강도가 올라간 날마다 끈을 고쳐 묶고 물을 마시는 시간이 길어집니다. 힘든 반복을 피하는 요령을 재능만큼 빠르게 익힌 듯합니다",
            ],
            &[
                "훈련 태도는 날씨를 조금 탑니다. 경쟁자가 옆 레인에 붙으면 스프린트 기록이 살아나지만, 혼자 뛰는 날에는 코치의 목소리가 먼저 지칩니다",
                "코치가 옆에서 계속 기준을 잡아줘야 하는 타입입니다. 숙제 검사를 하는 날에는 준비가 되어 있고, 검사하지 않는 날에는 숙제가 사라집니다",
                "혼자 두면 평범하고, 경쟁자를 붙이면 갑자기 살아납니다. 스태프는 이 선수를 '자율형'보다 '대결형' 성장 자원으로 분류했습니다",
                "훈련 기록부에 좋은 날과 빈칸 같은 날이 번갈아 찍힙니다. 생활 관리 담당자가 붙으면 괜찮지만, 혼자 커리어를 설계할 정도는 아닙니다",
                "영상 분석 미팅에서는 고개를 끄덕이지만 다음 훈련에서 바로 재현되는 비율은 절반 정도입니다. 반복을 습관으로 바꾸는 과정이 아직 덜 익었습니다",
            ],
            &[
                "훈련장 열쇠 담당자가 이 선수의 귀가 시간을 기준으로 조명을 끈다는 말이 있습니다. 마지막 슈팅 소리가 들리면 그제야 하루가 끝난다고 합니다",
                "휴식일에도 몸 상태 기록을 직접 정리합니다. 스태프는 농담 반 진담 반으로 '이 선수는 자기 몸에 대한 회계 장부를 쓴다'고 표현했습니다",
                "팀 버스 안에서도 전날 경기 클립을 돌려봅니다. 휴대폰 배터리보다 자기 플레이 복기가 먼저 닳는 타입입니다",
                "어린 선수인데도 스트레칭, 수면, 식단을 작은 계약 조항처럼 지킵니다. 성장에 필요한 사소한 반복을 우습게 보지 않습니다",
                "부상 선수 재활 메뉴까지 같이 따라 하다가 피지컬 코치에게 '넌 다친 게 아니다'라는 말을 들었다는 이야기가 있습니다. 준비성은 거의 과잉에 가깝습니다",
                "훈련이 끝난 뒤 어린 골키퍼에게 남아 달라고 부탁해 약한 발 마무리만 40분 더 반복했습니다. 스카우터는 이 장면을 보고 평가표에 별표를 쳤습니다",
                "라커룸에서 가장 먼저 오는 선수로 알려져 있습니다. 장비팀은 이 선수가 이미 앉아 있으면 시계를 보지 않고도 훈련 시작이 가까웠다는 걸 안다고 합니다",
            ],
        ),
    );
    push_personality_note(
        &mut notes,
        personality_axis_note(
            player_uid,
            date_seed,
            2,
            ambition,
            "야망",
            &[
                "스카우터가 3년 뒤 목표를 묻자 '1군 벤치만 꾸준히 들어도 좋다'는 답이 돌아왔습니다. 안정감은 있지만 위로 치고 올라가려는 배고픔은 약합니다",
                "상위 무대 이야기를 꺼내면 먼저 출전 보장과 생활 안정성을 묻습니다. 커리어를 흔드는 도전보다 익숙한 주차장 위치를 더 소중히 여기는 듯합니다",
                "빅클럽 관심설이 뜬 날에도 제일 먼저 물어본 것이 훈련장까지의 통근 거리였다는 현지 기자 후문이 있습니다",
                "성공하고 싶다는 말은 하지만, 그 성공의 형태가 아직 흐릿합니다. 꿈보다 현재 라커룸의 편안한 자리가 더 크게 보입니다",
                "유소년 코치는 '좋은 선수는 되고 싶어 하지만 위대한 선수가 되겠다는 말은 아직 못 들었다'고 했습니다. 목표의 천장이 낮게 설정된 상태입니다",
            ],
            &[
                "성장 욕구는 있습니다. 다만 목표가 포스터처럼 벽에 붙어 있을 뿐, 매일 들고 다니는 체크리스트까지 내려오지는 않았습니다",
                "빅클럽에 대한 동경은 있지만 아직 생활 습관까지 바꾸지는 못했습니다. 꿈은 선명한데 알람은 가끔 흐립니다",
                "큰 무대를 말할 때 목소리는 커지지만, 그 무대로 가는 계단은 아직 직접 그리지 못합니다. 좋은 멘토가 붙으면 갑자기 속도가 붙을 수 있습니다",
                "야망의 불씨는 있습니다. 다만 누가 옆에서 계속 바람을 넣어줘야 제대로 타오릅니다",
                "현지 스태프는 '욕심이 없는 건 아닌데 아직 자기 욕심을 부끄러워한다'고 했습니다. 경쟁 환경이 필요합니다",
            ],
            &[
                "매일 밤 자신의 우상처럼 될 수 있다고 믿으며, 숙소 방에 걸어둔 유니폼 아래에 주간 훈련 목표를 적어 둔다는 이야기가 있습니다",
                "동료들에게 '여기서 끝낼 생각이 없다'고 자주 말합니다. 스태프는 허세보다 자기암시에 가깝다고 봅니다",
                "개인 목표를 숨기지 않습니다. 대표팀, 유럽대항전, 리그 최고 선수 같은 단어가 면담 노트에 반복되고, 말할 때 눈빛이 먼저 빨라집니다",
                "비 오는 유소년 경기 후 빈 관중석 앞에서 혼자 우승 세리머니를 연습했다는 목격담이 있습니다. 민망함보다 상상력이 먼저인 선수입니다",
                "훈련장 벽에 붙은 유소년 대회 사진보다, 그 위에 붙인 챔피언스리그 경기 일정표를 더 자주 봅니다",
                "스카우터가 '다음 목표가 뭐냐'고 묻자 대답이 너무 길어 면담 시간이 밀렸습니다. 욕심의 크기만큼 말도 길었습니다",
                "현지 팬 포럼에서는 벌써 이 선수가 인터뷰에서 말한 목표 목록을 캡처해 돌려봅니다. 부담을 피하기보다 일부러 공개해 자기에게 걸어두는 쪽입니다",
            ],
        ),
    );
    push_personality_note(
        &mut notes,
        personality_axis_note(
            player_uid,
            date_seed,
            3,
            pressure,
            "압박감 대처",
            &[
                "PK 연습 때 코치가 일부러 관중 소리를 크게 틀자 루틴이 무너졌습니다. 킥보다 호흡이 먼저 흔들리는 장면이 뚜렷했습니다",
                "스카우터가 지켜보는 경기에서 평소보다 안전한 선택만 반복했습니다. 시선이 몰리면 장점까지 접어서 주머니에 넣는 타입입니다",
                "경기장 스피커가 커질수록 패스가 짧아집니다. 함성보다 자기 심장 소리를 더 크게 듣는 듯합니다",
                "중요한 찬스 직전 양말을 다시 만지는 버릇이 보입니다. 긴장 신호가 몸 밖으로 먼저 새어 나옵니다",
                "유소년 결승 터널에서 신발끈을 세 번 다시 묶었다는 코치의 기억이 있습니다. 준비가 부족해서가 아니라, 무대가 커질수록 몸이 확인을 요구합니다",
            ],
            &[
                "압박을 완전히 즐기는 타입은 아니지만, 첫 터치 두세 번이 안정되면 표정이 돌아옵니다. 경기 초반을 부드럽게 넘겨주는 설계가 필요합니다",
                "중요 장면에서 잠깐 굳을 수 있으나, 주변 베테랑이 어깨 한 번 쳐주면 빠르게 정상 궤도로 돌아옵니다",
                "첫 실수 이후 표정은 굳지만 도망가지는 않습니다. 다음 장면을 한 번 성공시키면 다시 자기 리듬을 찾습니다",
                "소음에 약한 편은 아니지만, 경기 초반에는 안전핀을 꽂아두는 전술적 배려가 필요합니다",
                "스카우터석 위치를 의식한 날에는 전반 10분이 조심스러웠지만, 한 번 박수를 받자 평소 플레이가 돌아왔습니다. 시동이 느린 압박형입니다",
            ],
            &[
                "큰 경기 전날에도 루틴을 바꾸지 않습니다. 킥오프 직전까지 농담을 주고받을 만큼 심박이 안정된 타입입니다",
                "스카우터가 지켜보는 날 오히려 더 공을 달라고 요구했습니다. 관심을 부담보다 무대로 받아들이고, 관찰자를 관객처럼 씁니다",
                "관중석이 끓을수록 어깨가 펴집니다. 이 선수에게 소음은 방해가 아니라 배경음악에 가깝습니다",
                "페널티박스 안에서 모두가 숨을 멈출 때 혼자 시간 여유가 있어 보입니다. 압박을 느리게 처리하는 특이한 재능이 있습니다",
                "원정 팬들이 야유하자 다음 공격에서 바로 그쪽 관중석 앞까지 공을 몰고 갔습니다. 겁을 먹기보다 장면을 만드는 쪽입니다",
                "라커룸 관계자는 '큰 경기 날 제일 잠을 잘 자는 사람이 이 선수'라고 했습니다. 긴장을 에너지로 바꾸는 속도가 빠릅니다",
            ],
        ),
    );
    push_personality_note(
        &mut notes,
        personality_axis_note(
            player_uid,
            date_seed,
            4,
            temperament,
            "참을성",
            &[
                "상대 수비수가 귓속말 한 번 하면 다음 경합이 개인전으로 바뀝니다. 도발을 들으면 전술판보다 복수심을 먼저 읽는 순간이 있습니다",
                "훈련 중 거친 태클을 당한 뒤 미니게임이 갑자기 더비처럼 변했습니다. 코치가 조끼 색보다 감정 정리를 먼저 해야 했습니다",
                "판정에 불만이 생기면 손짓이 먼저 커집니다. 주심보다 자기 감정을 설득하려는 시간이 더 길어집니다",
                "원정 경기에서 볼보이의 늦은 공 전달에도 예민하게 반응했습니다. 작은 불씨를 크게 키우는 재능은 원하지 않아도 눈에 띕니다",
                "상대가 일부러 발을 밟고 지나간 뒤 5분 동안 플레이 선택이 거칠어졌습니다. 당한 장면을 경기 밖으로 보내는 데 시간이 걸립니다",
            ],
            &[
                "감정 기복은 있으나 경기 안에서 완전히 무너지지는 않습니다. 주장에게 한 번 붙잡히면 다시 공 쪽으로 시선이 돌아옵니다",
                "상대 도발에 반응하는 장면이 가끔 있습니다. 캡틴이나 코치가 이름을 짧게 불러주면 효과가 바로 나타납니다",
                "화를 참기는 하지만 얼굴에 자막처럼 드러납니다. 동료가 빨리 데려가면 문제는 줄어듭니다",
                "경기가 과열되면 말수가 늘어납니다. 침착한 센터백이나 주장과 같이 세우는 편이 안전합니다",
                "벤치 앞에서 물병을 세게 내려놓은 뒤 2분 만에 다시 정상 플레이로 돌아왔습니다. 폭발보다 김이 새는 쪽에 가깝습니다",
            ],
            &[
                "거친 압박을 받아도 표정 변화가 거의 없습니다. 상대가 일부러 건드려도 다음 플레이 위치부터 찾습니다",
                "라커룸에서 감정적으로 번지는 장면을 중재하는 쪽에 가깝습니다. 어린 나이에 비해 침착하고, 말보다 타이밍이 좋습니다",
                "발목을 차이고도 양말을 털고 바로 라인을 봅니다. 감정보다 위치가 먼저인 선수입니다",
                "상대가 아무리 말을 걸어도 대답은 짧고 플레이는 길게 가져갑니다. 도발을 산소처럼 흘려보냅니다",
                "더비에서 상대가 셔츠를 잡아끌자 웃고 넘어간 뒤 바로 역습의 첫 패스를 넣었습니다. 복수 대신 경기 장면으로 답하는 타입입니다",
                "주심이 오심을 인정하지 않았을 때도 손을 들다 말고 자기 자리로 돌아갔습니다. 감정의 브레이크가 잘 듣습니다",
            ],
        ),
    );
    push_personality_note(
        &mut notes,
        personality_axis_note(
            player_uid,
            date_seed,
            5,
            controversy,
            "논쟁성",
            &[
                "불필요한 말을 거의 하지 않습니다. 현지 기자가 '인터뷰 따기 힘든데 사고도 안 친다'고 할 만큼 라커룸 이야기를 밖으로 가져가지 않습니다",
                "스포트라이트를 받는 상황에서도 답변이 짧고 안정적입니다. 위험한 질문을 받으면 공을 사이드라인으로 보내듯 깔끔하게 넘깁니다",
                "라커룸에서 들은 이야기를 라커룸에 두고 나오는 타입입니다. 스태프가 안심하고 정보를 맡길 수 있습니다",
                "팬 포럼에서 이 선수 관련 논쟁이 열리면 대개 축구 얘기에서 끝납니다. 주변 소음이 적은 자원입니다",
                "경기 후 감정이 올라간 상황에서도 '팀으로 답하겠다'는 말 이상을 꺼내지 않았습니다. 미디어 앞에서 선을 잘 압니다",
            ],
            &[
                "가끔 직설적인 표현을 쓰지만 악의적이라고 보긴 어렵습니다. 기자들이 제목을 뽑기 좋은 단어를 하나씩 흘리는 정도입니다",
                "감정이 올라오면 말이 빨라집니다. 공개 발언보다 내부 면담에서 먼저 풀어주는 편이 안전합니다",
                "말실수 가능성은 있지만 불을 지르는 타입은 아닙니다. 미디어 교육 한 번이면 충분히 정리될 수 있습니다",
                "불만이 생기면 표정이 먼저 알려줍니다. 공개 발언으로 번지기 전에 코치가 읽어낼 수 있습니다",
                "현지 라디오에서 한 문장이 하루짜리 논쟁이 된 적은 있지만, 다음 경기에서 사라졌습니다. 장기 리스크보다는 관리 가능한 소음입니다",
            ],
            &[
                "인터뷰와 SNS 발언이 라커룸 분위기에 파장을 만들 수 있습니다. 기자들이 이 선수의 짧은 답변을 기사 세 개로 늘릴 수 있을 만큼 소재가 나옵니다",
                "자신의 불만을 오래 숨기지 않습니다. 출전 시간이 줄면 외부로 신호가 새어나가고, 현지 커뮤니티가 그 신호를 먼저 해석합니다",
                "마이크 앞에서 마음이 먼저 달립니다. 기자들에게는 좋은 소재지만, 감독에게는 약간의 두통입니다",
                "벤치에 오래 앉히면 표정보다 주변 소문이 먼저 움직일 수 있습니다. 출전 관리와 메시지 관리가 같이 필요합니다",
                "교체 아웃 후 손뼉을 치긴 했지만, 벤치로 가는 20미터 동안 표정 하나로 팬 포럼 한 페이지를 채웠습니다",
                "팀 내부 결정에 불만이 생기면 가까운 사람에게 먼저 말하고, 그 말이 멀리까지 걸어갑니다. 조용히 눌러두는 타입은 아닙니다",
            ],
        ),
    );
    push_personality_note(
        &mut notes,
        personality_axis_note(
            player_uid,
            date_seed,
            6,
            determination,
            "승부욕",
            &[
                "지고 있는 상황에서 고개가 먼저 떨어지는 장면이 보입니다. 현지 스카우터는 '경기 흐름보다 표정이 먼저 포기했다'고 적었습니다",
                "실점 직후 동료를 끌어올리기보다 자기 플레이를 줄이는 쪽으로 반응합니다. 불리한 장면에서 공을 더 원해야 하는데, 손이 작아집니다",
                "스코어가 벌어지면 공을 부르는 빈도가 줄어듭니다. 불리한 흐름을 자기 쪽으로 끌어오는 힘은 더 길러야 합니다",
                "훈련 게임에서 져도 금방 웃고 넘어갑니다. 성격은 편하지만, 승부처에서는 날이 덜 서 있습니다",
                "유소년 결승에서 실점 뒤 물병을 정리하러 먼저 간 선수라는 코치의 농담이 있습니다. 패배를 싫어하는 온도가 아직 높지 않습니다",
            ],
            &[
                "승부욕은 평균권입니다. 팀 분위기가 살아 있으면 같이 올라오지만, 혼자 라커룸 공기를 바꾸는 선수는 아닙니다",
                "지고 있을 때 반응은 나쁘지 않지만, 주도적으로 팀을 깨우는 장면은 아직 제한적입니다",
                "경쟁심은 있지만 불이 늦게 붙습니다. 경기 초반부터 목표를 분명히 심어줘야 합니다",
                "한 번 리듬을 타면 끝까지 뛰지만, 먼저 불을 붙이는 성냥은 대개 다른 선수가 쥡니다",
                "훈련에서 진 뒤 추가 슈팅을 하긴 했지만, 코치가 먼저 제안한 뒤였습니다. 스스로 분노를 연료로 쓰는 단계까지는 아닙니다",
            ],
            &[
                "훈련 미니게임에서도 지는 것을 싫어합니다. 패배한 조에 남아 추가 슈팅을 자청했고, 이긴 조가 샤워를 마칠 때까지 공을 찼다는 보고가 있습니다",
                "점수가 벌어진 뒤에도 마지막 압박까지 뛰었습니다. 스카우터는 이 장면을 보고 '포기 버튼 위치를 모르는 선수'라고 적었습니다",
                "훈련장 5대5 게임에서 졌다는 이유로 물병 정리 후 다시 한 판을 요구했다는 이야기가 있습니다. 코치가 시간을 끊자 혼자 벽 패스를 더 했습니다",
                "패배 직후 가장 먼저 라커룸을 나가지 않습니다. 말없이 신발 끈을 다시 묶고 다음 훈련 시간을 묻는 타입입니다",
                "유소년 시절 컵 결승에서 패한 뒤 다음 날 아침 가장 먼저 훈련장에 나왔다는 코치 증언이 있습니다. 패배를 오래 씹어 성장 재료로 쓰는 선수입니다",
                "현지 팬들은 이 선수를 '90분 이후에도 눈이 안 꺼지는 선수'라고 부릅니다. 스코어보다 다음 장면에 더 집착합니다",
            ],
        ),
    );

    if notes.is_empty() {
        notes.push((
            1,
            format!(
                "성향 수치가 극단으로 치우치지 않았습니다. {}",
                personality_balanced_note(
                    player_uid,
                    date_seed,
                    adaptability,
                    loyalty,
                    sportsmanship
                )
            ),
        ));
    }

    notes.sort_by(|a, b| b.0.cmp(&a.0).then_with(|| a.1.as_str().cmp(b.1.as_str())));
    let notes = notes
        .into_iter()
        .take(3)
        .map(|(_, note)| note)
        .collect::<Vec<_>>();

    Some(PersonalityProfile { summary, notes })
}

fn push_personality_note(notes: &mut Vec<(u8, String)>, note: Option<(u8, String)>) {
    if let Some(note) = note {
        notes.push(note);
    }
}

fn personality_axis_note(
    player_uid: u32,
    date_seed: u64,
    salt: u64,
    value: u8,
    axis: &str,
    low: &[&str],
    mid: &[&str],
    high: &[&str],
) -> Option<(u8, String)> {
    let (priority, pool) = match value {
        1..=5 => (5, low),
        6..=8 => (3, mid),
        16..=17 => (3, high),
        18..=20 => (5, high),
        _ => return None,
    };
    let note = pick_personality_note(player_uid, value, salt, date_seed, pool);
    Some((priority, format!("{axis}: {note}.")))
}

fn personality_balanced_note(
    player_uid: u32,
    date_seed: u64,
    adaptability: u8,
    loyalty: u8,
    sportsmanship: u8,
) -> String {
    let note = if adaptability >= 15 {
        "새 환경에 들어가도 근처 식당, 통근길, 라커룸 농담 코드를 빠르게 익히는 편이라 해외 이적 리스크는 낮게 봅니다"
    } else if loyalty >= 15 {
        "한 번 신뢰 관계가 생기면 유소년 코치 이름까지 오래 기억하는 타입입니다"
    } else if sportsmanship >= 15 {
        "경기장 안팎에서 선을 넘는 행동이 적어 코치진이 불필요한 해명 회의를 열 일이 적습니다"
    } else {
        "성장 환경, 출전 시간, 코치와의 관계에 따라 같은 선수의 이야기가 전혀 다르게 쓰일 수 있습니다"
    };
    let suffixes = [
        "추가 면담으로 이 선수가 무엇에 진짜 반응하는지 확인하는 것이 좋습니다",
        "한 경기보다 2~3개월 동안의 훈련장 목격담을 모아야 더 정확합니다",
        "영입 전 라커룸에서 누구 옆에 앉는지까지 확인할 필요가 있습니다",
    ];
    format!(
        "{}. {}.",
        note,
        pick_personality_note(player_uid, adaptability, 99, date_seed, &suffixes)
    )
}

fn pick_personality_note(
    player_uid: u32,
    value: u8,
    salt: u64,
    date_seed: u64,
    pool: &[&str],
) -> String {
    if pool.is_empty() {
        return String::new();
    }
    let mut state = u64::from(player_uid) ^ (u64::from(value) << 32) ^ salt ^ date_seed;
    state = state.wrapping_mul(0x9e37_79b9_7f4a_7c15);
    state ^= state >> 33;
    pool[(state as usize) % pool.len()].to_string()
}

fn read_hidden_intel_notes(
    target: &Target,
    pointers: PlayerPointers,
    player_uid: u32,
    date_seed: u64,
) -> Vec<String> {
    let mut notes = Vec::new();

    if let Some(value) = read_fm_attribute(target, pointers.player + PATR + 0x2c) {
        push_hidden_note(
            &mut notes,
            hidden_axis_note(
                player_uid,
                date_seed,
                11,
                value,
                "꾸준함",
                &[
                    "분석실 화이트보드에 이 선수의 시즌 평점 그래프가 붙어 있는데, 누군가 옆에 '예측 불가, 영입 시 도박'이라고 매직으로 적어놨습니다. 농담이지만 그 자리에 한참 그대로입니다",
                    "원정 3연전 첫날엔 펄펄 날더니 다음 날엔 전혀 다른 선수처럼 보였습니다. 셋째 날 현지 기자가 통역에게 '오늘 아침 이 선수 표정이 어땠습니까'라고 진지하게 물었다는 후문입니다",
                    "한참 조용하다가 갑자기 해트트릭이 터진 다음 주, 감독은 카메라 앞에서 한참을 침묵하다가 '저도 아직 분석 중입니다'라고만 답했습니다",
                    "현지 팬 커뮤니티에 '오늘의 버전 예측' 게시판이 따로 있습니다. 'A버전이면 따라가고, B버전이면 도망쳐라'는 댓글이 매주 베스트에 오릅니다",
                    "동료 한 명이 인터뷰에서 '워밍업 첫 슈팅이 골망을 깔끔하게 흔드는 날은 그날 무조건 큰일 난다'고 농담했는데, 그 말이 의외로 잘 맞습니다",
                    "현지 코치가 면담에서 '이 선수의 최고 경기 영상을 보고 영입하면 안 됩니다. 가장 평범한 날의 영상을 찾아 보세요'라고 직접 말했습니다",
                    "한 시즌 평점 그래프가 그래픽이 아니라 심전도처럼 보인다는 분석관 농담이 있습니다. 농담만은 아닙니다",
                ],
                &[
                    "홈에 비해 원정에서 한 단계 가라앉는 인상이 누적됩니다. 호텔 침대를 가린다는 농담이 있지만, 결국 환경 변화에 약하다는 신호입니다",
                    "연속 주전이 길어지면 어느 순간 첫 터치 실수가 늘어납니다. 코칭스태프 내부에 '몇 경기 가면 한 박자 쉬는 게 낫다'는 합의가 형성돼 있습니다",
                    "감독이 시즌 초 회의에서 '이 선수는 표정을 보고 결정해야 한다'고 했는데, 절반은 농담이 아니었습니다",
                    "주변에 안정적인 베테랑이 있으면 같이 안정됩니다. 옆자리 동료가 누구냐에 따라 출력이 한 단계씩 움직이는 보기 드문 케이스입니다",
                    "두 번 관찰로는 평범한 선수, 네 번 관찰로는 질문이 생기는 선수입니다. 표본을 충분히 모으지 않으면 함정에 빠집니다",
                ],
                &[
                    "여러 경기를 연이어 관찰했는데 스카우터 노트 분량이 매번 거의 같았습니다. 페이지 끝 여백 크기까지 비슷할 정도입니다",
                    "평점이 무너지는 경기가 거의 보이지 않습니다. 팀 분석관이 '예측 모델 정확도가 가장 높은 선수'라고 한 마디로 정리했습니다",
                    "감독이 인터뷰에서 '이 선수 이름은 라인업 카드 같은 칸에 같은 펜으로 적는다'고 농담했습니다. 라커룸의 보험 같은 존재입니다",
                    "팀이 크게 지고 있던 경기에서도 자기 구역 수비 가담 동선이 평소와 거의 같았습니다. 점수판이 이 선수의 움직임을 흔들지 못합니다",
                    "지난번 관찰 노트와 이번 노트를 나란히 놨더니 표현 몇 군데가 다를 뿐, 본문이 그대로 살아 있는 느낌이었습니다. 좋은 의미의 복사본입니다",
                    "상대 분석가가 '이 선수 패턴은 예측하기 쉽다'고 했는데, 그 말이 곧 장점입니다. 감독이 계산에 넣을 수 있는 변수가 적습니다",
                    "현지 팬들은 이 선수를 '7점짜리 담요'라고 부릅니다. 화려하게 빛나지는 않아도 추운 경기마다 덮을 수 있다는 뜻입니다",
                ],
                false,
            ),
        );
    }

    if let Some(value) = read_fm_attribute(target, pointers.player + PATR + 0x2f) {
        push_hidden_note(
            &mut notes,
            hidden_axis_note(
                player_uid,
                date_seed,
                12,
                value,
                "중요 경기",
                &[
                    "컵 준결승 휘슬 직전 카메라에 잡힌 표정이 평소보다 한 단계 굳어 있었습니다. 전반 초반엔 공을 받자마자 안전한 1차 패스로 떨궈 보냈고, 현지 팬 포럼 베스트 댓글 첫 줄이 '오늘 장갑 끼고 나왔냐'였습니다",
                    "더비 원정에서는 평소의 패스 정확도가 보이지 않았습니다. 현지 커뮤니티에 '큰 경기만 되면 발에 모래주머니 차는 선수'라는 별명이 굳어가고 있습니다",
                    "타이틀 레이스 막판 경기에서 평소엔 거침없이 꽂던 롱패스를 그날엔 거의 시도하지 않았습니다. 책임을 줄이는 방향으로 플레이가 수축하는 게 눈으로 보였습니다",
                    "중요 경기 항목만 따로 떼서 보면 평소의 그 선수가 아닙니다. 무대 크기와 출력이 반비례하는 곡선이 너무 분명합니다",
                    "컵 결승 터널 영상에서 신발끈을 묶고 풀고 다시 묶는 모습이 한참 잡혔습니다. 루틴이라기엔 손이 너무 떨렸고, 그 장면이 다음 날 현지 팬 채널에 그대로 박제됐습니다",
                    "더비 라인업 발표 직후 평소 동료에게 던지던 농담이 사라졌습니다. 키트맨이 '오늘은 조용한 날'이라고 했다는 후문이 라커룸 안에서 굳어 있습니다",
                    "현지 분석 채널에서 이 선수의 '중요 경기 vs 일반 경기' 슈퍼컷을 올렸는데, 댓글 1위가 '이거 같은 선수 맞아?'였습니다",
                ],
                &[
                    "더비에서 무너지지는 않지만 전반엔 전진 드리블이 사실상 사라집니다. 일단 살아남고 후반에 표현하는 타입이라는 현지 평이 정확합니다",
                    "토너먼트에서는 전반은 가라앉다가 후반에 살아나는 곡선이 분명합니다. 시작이 늦은 만큼 후반에 따라잡습니다",
                    "큰 경기에서 결정적 한 방은 드물지만 큰 실수도 없습니다. 현지 커뮤니티 평이 '나가서 우는 일은 없는데 영웅도 다른 사람'이었습니다",
                    "압박이 커지면 자동으로 역할이 작아집니다. 손이 비는 만큼 다칠 일도 줄이는, 안전한 90분을 선택하는 타입입니다",
                    "하프타임에 감독 한 마디로 후반이 달라지는 경우가 많습니다. 본인 동력은 약하지만 외부 자극에는 잘 반응합니다",
                ],
                &[
                    "결승전 후반 어느 순간, 팀 전체가 굳어 있을 때 이 선수만 평소처럼 공을 요구했습니다. 핵심 장면 몇 번으로 흐름이 바뀌었고, 경기 후 본인 인터뷰는 '평소와 다르지 않았다'였습니다",
                    "더비 전날 훈련장 분위기가 그날따라 가장 가벼웠습니다. 동료들이 긴장한 사이 본인이 먼저 농담을 던졌고, 다음 날 경기에서 가장 영향력 있는 선수가 됐습니다",
                    "토너먼트를 라운드별로 따라가 보면 무대가 커질수록 평점이 한 단계씩 올라갑니다. 결승에서 가장 좋은 경기를 했습니다",
                    "강등 직접 대결처럼 무게가 실리는 경기에서 결정적 장면을 직접 만들었습니다. 상대 감독이 경기 후 기자회견 첫 마디를 '저 선수를 어떻게 막느냐가 우리 시즌 숙제였다'로 시작했습니다",
                    "상대 분석가가 더비 전 회의에서 '이 선수는 자극하지 마라. 자극하면 90분 동안 갚는다'고 했다는 정보가 있습니다. 현지 팬들은 '경기 무게 감지기'라고 부릅니다",
                    "승부차기 첫 키커로 손을 든 장면이 카메라에 잡혔습니다. 성공 후 골키퍼에게 다음 키커 방향까지 알려주는 여유가 슈퍼컷으로 돌아다닙니다",
                    "현지 커뮤니티에 '이 선수는 90분이 아니라 120분 보고 골라야 한다'는 글이 베스트로 올라가 있습니다. 큰 경기를 거듭할수록 그 말이 농담이 아니라 결론이 됩니다",
                ],
                false,
            ),
        );
    }

    if let Some(value) = read_fm_attribute(target, pointers.player + PATR + 0x30) {
        push_hidden_note(
            &mut notes,
            hidden_axis_note(
                player_uid,
                date_seed,
                13,
                value,
                "부상 빈도",
                &[
                    "팀 의료팀이 농담조로 '이 선수 파일이 가장 얇다'고 합니다. 의무실 위치보다 장비창고 위치를 더 잘 압니다",
                    "강한 태클에 주저앉았다가 심판 휘슬도 기다리지 않고 일어나 전력 질주했습니다. 그 장면이 현지 팬 채널에 '메디컬팀 실업 짤'로 박제됐습니다",
                    "겨울 이적 시장에서 의무기록을 열람했는데 잔부상 항목이 거의 비어 있었습니다. 팀 닥터 메모에 '회복 속도가 비정상적'이라고 적혀 있었습니다",
                    "빡빡한 일정의 마지막 경기에서도 떨어지지 않습니다. 피로가 다른 회로로 흐르는 듯하다는 분석관 농담이 그저 농담만은 아닙니다",
                    "훈련을 거의 빠지지 않습니다. 결장 사유가 본인 부상보다 국가대표 차출이나 일정 조정 쪽에 가깝습니다",
                    "충돌 후 일어나는 속도가 남다릅니다. 상대 선수가 더 오래 누워 있었고, 본인은 이미 다음 동작을 시작했습니다. 같은 장면을 직접 여러 번 확인했습니다",
                    "현지 팬들이 이 선수에게 '뼈에 계약 옵션이 붙어 있다'고 농담합니다. 농담이 농담으로 끝나지 않는 게 문제(좋은 의미로)입니다",
                ],
                &[
                    "큰 부상은 없지만 시즌마다 한 번은 짧게 이탈하는 패턴이 보입니다. 휴식 사이클을 의식적으로 설계하면 충분히 관리 가능합니다",
                    "연속 출전이 길어지면 훈련 강도가 한 단계 떨어집니다. 몸이 먼저 신호를 보내는 타입이라 빠른 대응이 가능합니다",
                    "리그 평균 수준의 이탈 패턴입니다. 특이점은 없고 평범한 관리로도 충분한 가용성이 확보됩니다",
                    "메디컬 파일에서 같은 부위가 반복해 등장하지 않습니다. 한 군데를 거듭 다치지 않는다는 점은 명확한 장점입니다",
                    "의무실 직원이 이름은 알지만 자주 보지는 않는 정도입니다. 시즌 막판 마사지 베드 예약만 살짝 빨라집니다",
                ],
                &[
                    "올 시즌만 해도 잔이탈이 몇 차례 반복됐는데, 매번 '경미한 부상'으로 분류됐지만 합치면 결코 가벼운 규모가 아닙니다",
                    "현지 취재진 사이에 '훈련은 잘 하는데 경기가 다가오면 뭔가 하나씩 나온다'는 말이 굳어가고 있습니다. 메디컬 기록도 그 말의 패턴을 따라갑니다",
                    "상대 수비수와 가벼운 접촉 후 그라운드에 주저앉아 교체 사인을 보냈습니다. 검사 결과는 깨끗했지만, 다음 경기는 결장이었습니다",
                    "에이전트가 협상 자리에서 가장 먼저 꺼낸 단어가 '의료 지원 조항'이었습니다. 구단 입장에서는 그 자체가 데이터입니다",
                    "여러 시즌에 걸쳐 후반기마다 같은 부위 재발 신호가 보입니다. 패턴이 너무 익숙해서 코치들이 달력을 보고 미리 로테이션을 짠다는 농담이 라커룸에 굳어 있습니다",
                    "의무실 직원들이 이 선수의 커피 취향까지 외운다는 농담이 있습니다. 농담이지만, 농담이 나올 만큼의 방문 빈도입니다",
                    "현지 커뮤니티에 '유리몸 핀'이라는 별명이 굳어가고 있습니다. 노트에 '경기력은 A, 가용성은 물음표'라고 적힌 이유가 있습니다",
                ],
                true,
            ),
        );
    }

    if let Some(value) = read_fm_attribute(target, pointers.player + PATR + 0x31) {
        push_hidden_note(
            &mut notes,
            hidden_axis_note(
                player_uid,
                date_seed,
                14,
                value,
                "다재다능",
                &[
                    "한 경기에서 포지션을 바꿨더니 하프타임에 직접 코치를 찾아가 '정확히 어디 서면 됩니까'라고 물었다고 합니다. 전문가형의 전형입니다",
                    "감독이 전술적 이유로 포지션을 옮겼더니 다음 경기에서 자기 발로 원래 자리로 돌아왔습니다. 몸이 변화를 거부하는 게 눈으로 보입니다",
                    "포지션을 바꾼 직후 몇 경기 동안 익숙한 동작 한두 가지에 매달리는 패턴이 보입니다. 불안할 때 손에 익은 카드로 돌아가는 타입입니다",
                    "훈련 전술판에서 자기 자석이 다른 칸으로 옮겨가자 표정이 먼저 굳었습니다. 코치들이 다시 원래 자리로 돌려놓고 회의를 마쳤다는 후문이 있습니다",
                    "유소년 시절부터 한 자리에서만 훈련한 이력이 분명합니다. 다른 포지션 경험 자체가 부족해 전술 응용은 한계가 명확합니다",
                    "팀 내에 '저 선수에게 그 자리 맡기지 말라'는 암묵적 합의가 형성됐다는 후문이 있습니다. 역할 정의가 명확해야 작동합니다",
                    "현지 팬 커뮤니티에 '저 선수는 그 자리에서만 잘하는 선수'라는 글이 베스트로 굳어 있습니다. 단점이라기보다 잘하는 자리에서는 정말 잘한다는 뜻이기도 합니다",
                ],
                &[
                    "인접 포지션은 무리 없이 소화하지만 두 번째 자리에서는 위치 선정이 한 박자 늦습니다. 백업으로는 충분합니다",
                    "한두 자리 이동까지는 가능하지만 세 번째 자리는 코치가 손가락으로 한 번 찍어줘야 움직임이 매끄럽습니다",
                    "포지션을 바꿨을 때 수비 라인은 지켰지만 공격 가담 타이밍을 자주 놓쳤습니다. 주 포지션에 가까울수록 완성도가 올라갑니다",
                    "플랜 B 자원으로 충분히 활용 가능합니다. 플랜 A 자리에 대한 신뢰도가 명확하다는 점이 강점입니다",
                    "훈련에서 다른 조끼를 입혀도 따라가긴 합니다. 다만 몇 분의 적응 시간이 필요하다는 점은 감안해야 합니다",
                ],
                &[
                    "여러 포지션에서 비슷한 수준의 영향력을 보여줍니다. 어느 자리에서든 경기력이 크게 흔들리지 않습니다",
                    "경기 중 감독이 포지션을 두 번 바꿨는데 표정 변화가 0이었습니다. 전술 변경을 곧 자기 일로 받아들이는 타입입니다",
                    "인터뷰에서 '어느 자리가 편하냐'는 질문에 '그날 팀에 어디가 비느냐에 따라요'라고 답했습니다. 그 말이 실제 경기에서 그대로 확인됩니다",
                    "동시에 두 자리가 비었을 때 감독이 가장 먼저 부른 이름이 이 선수였습니다. 한 명으로 두 자리를 메우는 보기 드문 자원입니다",
                    "상대 분석가가 '이 선수가 오늘 어디에서 뛰는지 먼저 확인하라'고 했다는 정보가 있습니다. 위치를 못 잡으면 막을 수가 없습니다",
                    "유소년 코치 메모에 '어디에 둬도 역할을 이해함'이라는 한 줄이 적혀 있습니다. 그 한 줄이 성인 무대에서도 그대로 유효합니다",
                    "벤치에서 자석을 세 번 옮겨도 세 자리 모두 자기 자리처럼 움직였습니다. 본인이 보드를 미리 읽고 있다는 느낌입니다",
                    "현지 팬들이 이 선수를 '걸어다니는 만능열쇠'라고 부릅니다. 별명이 별명으로 끝나지 않습니다",
                ],
                false,
            ),
        );
    }

    if let Some(value) = read_fm_attribute(target, pointers.player + PATR + 0x29) {
        push_hidden_note(
            &mut notes,
            hidden_axis_note(
                player_uid,
                date_seed,
                15,
                value,
                "더티 플레이",
                &[
                    "거친 더비에서도 카드 없이 90분을 채웠습니다. 경기 후 상대 공격수가 인터뷰에서 '거칠게 들어왔는데 매번 공을 먼저 건드렸다'고 인정했습니다",
                    "최근 카드 기록이 거의 비어 있습니다. 심판이 등번호를 따로 외울 일이 없는 선수입니다",
                    "접촉 후 상대가 쓰러지면 공보다 손이 먼저 나갑니다. 한 경기에서 같은 행동을 여러 번 확인했고, 모두 자연스러웠습니다",
                    "강하게 경합하지만 뒤에서 체중을 싣는 방식은 쓰지 않습니다. 힘이 있음에도 페어한 방식이 몸에 배어 있습니다",
                    "공 근처에 늘 있지만 휘슬은 거의 받지 않습니다. 위치 선정으로 경합을 만들지 충돌로 만들지 않습니다",
                    "상대 윙어가 넘어졌을 때 손부터 내밀고 자기 수비 위치로 돌아갔습니다. 카메라가 없는 쪽에서도 같은 행동이 반복됩니다",
                    "현지 팬 커뮤니티에 '이 선수 카드 받는 영상을 본 사람이 있냐'는 글이 떠다닙니다. 댓글은 전부 부정형입니다",
                ],
                &[
                    "경기 흐름이 거칠어지면 늦은 태클이 한두 번 나옵니다. 평소엔 클린하지만 온도에 따라 흔들립니다",
                    "승부처에서 판단이 한 박자 늦어 카드가 따라옵니다. 시즌 후반 누적 관리가 중요해지는 타입입니다",
                    "본인이 먼저 거칠게 들어가지는 않지만, 받는 쪽에서 시작되면 갚으려는 경향이 있습니다. 주심이 엄격한 날 주의해야 합니다",
                    "기본 매너는 좋지만 감정이 올라간 후 잠깐이 위험합니다. 그 짧은 시간만 넘기면 다시 클린해집니다",
                    "더비에서 어깨 사용이 길어집니다. 현지 기자가 '나쁜 선수는 아닌데 경기 온도에 동조하는 타입'이라고 표현했습니다",
                ],
                &[
                    "리그에서 손꼽히는 카드 수집가입니다. 심판이 경기 시작 직후부터 등번호를 수첩에 적어둔다는 농담이 현지에 굳어 있습니다",
                    "공이 없는 곳에서도 작은 신경전이 끊이지 않습니다. 현장 관찰에서 공식 파울에 잡히지 않은 잔접촉이 여러 차례 더 있었습니다",
                    "교체 투입 직후 곧바로 경고를 받은 기록이 한 번이 아닙니다. 경기 온도가 낮아도 자체적으로 끌어올리는 타입입니다",
                    "팀 공식 징계 기록에 이 선수 이름이 가장 자주 등장합니다. 에이전트가 협상 자리에 사전 해명 자료를 들고 왔습니다",
                    "상대 팀 분석팀이 이 선수의 파울 패턴만 따로 분류한 자료를 준비했다는 정보가 있습니다. 무기지만 명백한 리스크입니다",
                    "상대가 등을 보이는 순간을 그냥 지나치는 법이 없습니다. 팔꿈치, 발끝, 어깨가 90분 내내 대화에 참여합니다",
                    "하프타임에 상대 스트라이커가 가장 먼저 물은 것이 전술이 아니라 이 선수의 등번호였다고 합니다. 전반 45분으로 충분히 기억에 남긴 셈입니다",
                    "현지 커뮤니티에 '이 선수가 들어오면 경기 온도가 한 단계 오른다'는 평이 굳어 있습니다. 무기와 리스크 사이를 90분 내내 오갑니다",
                ],
                true,
            ),
        );
    }

    if let Some(value) = read_plain_attribute(target, pointers.person + PADA) {
        push_hidden_note(
            &mut notes,
            hidden_axis_note(
                player_uid,
                date_seed,
                16,
                value,
                "적응력",
                &[
                    "이전 이적 직후 한참 동안 본모습이 나오지 않았습니다. 현지 언론이 '이적 실패'라고 일찍 단정 지었다가 한참 뒤에야 평가를 뒤집어야 했습니다",
                    "이적 직후 동료 인터뷰에 '아침마다 전 팀 도시락을 가져왔다'는 이야기가 나왔습니다. 사소한 환경 변화가 컨디션까지 끌고 내려갑니다",
                    "통역 없이 받은 첫 훈련 지시를 정반대로 이해했다는 기록이 있습니다. 환경 자체가 다른 곳으로 옮기면 적응 시간이 길어집니다",
                    "라커룸에서 한참 동안 말수가 거의 없었다는 보고가 있습니다. 생활이 안정돼야 경기력이 따라오는 구조입니다",
                    "이적 마감 직전 합류로 프리시즌을 통째로 놓치자 시즌 하나가 사실상 적응기로 날아간 사례가 있었습니다. 합류 타이밍이 곧 첫 시즌 평점입니다",
                    "첫 원정 식사 자리에서 메뉴를 보고 표정이 굳었고, 다음 날 훈련 강도까지 흔들렸다는 스태프 메모가 있습니다. 변화에 약한 사람입니다",
                    "현지 커뮤니티에 '천천히 데우는 오븐'이라는 별명이 굳어 있습니다. 따뜻해지면 좋지만 데우는 데 시간이 너무 걸린다는 의미입니다",
                ],
                &[
                    "프리시즌을 충분히 함께한 경우 적응이 무난했습니다. 시즌 중 이적이나 늦은 합류는 초반 리스크가 명확합니다",
                    "합류 후 어느 시점을 지나면서 경기력이 눈에 띄게 안정됩니다. 기다림이 필요한 타입이지만, 한 번 자리잡으면 흔들리지 않습니다",
                    "문화권이 비슷한 리그 내 이적은 문제가 없었습니다. 거리가 멀어질수록 적응 시간이 길어집니다",
                    "처음엔 통역 옆에 붙어 다니다가 어느 순간부터 동료들과 농담을 주고받기 시작했습니다. 시작은 느려도 닫힌 문은 아닙니다",
                    "새 환경에서 자기 루틴을 찾기까지 시간이 필요합니다. 급하게 결과를 요구하면 오히려 적응이 지연됩니다",
                ],
                &[
                    "이적하자마자 동료 이름부터 빠르게 외웠고, 첫 경기에서 곧바로 팀 패스 흐름의 중심에 섰습니다. 현지 스태프가 '이런 선수는 처음'이라고 했습니다",
                    "시즌 중 합류였는데도 적응 기간이 거의 없이 곧장 팀 최고 평점급 경기를 만들어냈습니다. 적응 기간이라는 단어가 없는 타입입니다",
                    "공항에서 내린 날 저녁에 이미 동료들과 같은 식당에 앉아 있었다는 후문이 있습니다. 라커룸 자리를 만드는 속도가 남다릅니다",
                    "짧은 기간에 여러 도시를 옮겨 다녔습니다. 인터뷰에서 '어디든 금방 적응한다'고 했고, 실제 기록이 그 말을 뒷받침합니다",
                    "감독이 '합류 첫날부터 전술 이해도가 기존 선수들 수준이었다'고 말했습니다. 환경 적응과 전술 습득이 동시에 진행되는 타입입니다",
                    "입단 첫 주에 훈련장 근처 빵집 단골이 됐고, 다음 주에는 동료들을 그리로 데려갔다는 이야기가 있습니다. 도시를 빠르게 자기 동선으로 끌어들입니다",
                    "현지 팬들이 '여권이 가장 잘 쓰이는 선수'라고 부릅니다. 어디 가도 거기서 가장 빨리 자리잡는다는 의미가 별명으로 굳었습니다",
                ],
                false,
            ),
        );
    }

    if let Some(value) = read_plain_attribute(target, pointers.person + PADA + 0x02) {
        push_hidden_note(
            &mut notes,
            hidden_axis_note(
                player_uid,
                date_seed,
                17,
                value,
                "충성심",
                &[
                    "계약 종료가 다가오자 에이전트가 시장에 공격적으로 노출시키기 시작했습니다. 구단이 협상 테이블을 열었을 땐 이미 다른 클럽과 사전 합의가 진행 중이었습니다",
                    "팀이 어려울 때 인터뷰에서 '개인적 발전을 위해 다른 선택이 필요할 수 있다'고 표현했습니다. 구단 관계자가 다음 날 그 발언을 별도 보고했습니다",
                    "빅클럽 관심이 있을 때마다 훈련 집중도가 눈에 띄게 흔들린다는 코칭스태프 관찰이 있습니다. 외부 소음을 잘 차단하지 못합니다",
                    "에이전트가 매년 여름 구단 회의실에 출근 도장을 찍는다는 농담이 현지에 굳어 있습니다. 재계약 창구보다 매각 창구에 가깝습니다",
                    "전 클럽 관계자가 비공개로 '내보내기 싫었지만 자기가 먼저 나가겠다고 했다'고 말했습니다. 클럽 프로젝트보다 개인 커리어가 항상 앞입니다",
                    "어린 나이부터 여러 번 이적했고, 매번 이유가 '성장을 위해'였습니다. 실제로는 매번 더 좋은 조건이 따라왔습니다",
                    "팬 사인회에서 '다음 시즌에도 여기 있나요'라는 질문에 미소만 지었다는 영상이 현지 채널에 돌고 있습니다. 작은 침묵도 이적설의 재료가 됩니다",
                ],
                &[
                    "관계가 좋을 때는 이적 의사가 보이지 않습니다. 다만 약속이 어긋나면 신호가 빨라지는 타입입니다",
                    "빅클럽 관심에 흔들릴 가능성은 있지만, 현재 팀에 정을 붙이고 있는 것은 분명합니다. 역할이 보장되면 안정적입니다",
                    "라커룸에서 불만은 표현하지 않지만 개인 면담에서 다음 스텝을 묻는 경우가 있다는 보고가 있습니다",
                    "정은 있지만 벤치 시간이 길어지면 에이전트가 먼저 움직입니다. 장기 프로젝트로 묶으려면 출전 보장이 선행돼야 합니다",
                    "팬들에게는 따뜻하지만 커리어 계산이 분명합니다. 마음은 클럽에, 눈은 테이블 위 제안서에 두는 타입입니다",
                ],
                &[
                    "지난 이적 시장에 더 좋은 조건의 오퍼들이 있었던 것으로 확인됩니다. 본인이 구단에 그 사실을 먼저 알리고 '잔류하겠다'고 했습니다",
                    "장기 부상으로 시즌이 통째로 비었던 해에 본인이 재계약을 먼저 요청했습니다. '이 팀이 처음 기회를 줬다'는 말을 했다는 보고가 있습니다",
                    "에이전트가 이적 협상을 시작했는데 본인이 직접 중단시켰다는 소문이 현지에 돌고 있습니다. 에이전트와의 관계가 그 일로 흔들렸다는 후속 보도까지 있습니다",
                    "유소년 팀 코치 이름을 아직도 외우고 매년 연락한다는 이야기가 있습니다. 신뢰 관계는 한 번 형성되면 오래 갑니다",
                    "팀 분위기가 나쁠 때 라커룸 결속력을 끌어올리는 역할을 했다는 보고가 있습니다. 클럽이 어려울 때 먼저 손을 내미는 사람입니다",
                    "재계약 협상에서 시장 시세보다 낮은 조건에도 서명했습니다. '여기서 계속 뛰고 싶다'는 한 줄이 협상 자리에서 직접 나왔다는 증언이 있습니다",
                    "강등 위기 시즌에도 지역 병원 행사에 빠지지 않았습니다. 현지 팬들은 이 선수를 '클럽이 일이 아니라 동네인 사람'이라고 부릅니다",
                ],
                false,
            ),
        );
    }

    if let Some(value) = read_plain_attribute(target, pointers.person + PADA + 0x05) {
        push_hidden_note(
            &mut notes,
            hidden_axis_note(
                player_uid,
                date_seed,
                18,
                value,
                "스포츠맨십",
                &[
                    "판정에 불만이 생기면 주심 주변에서 떠나지 않습니다. 시즌 동안 받은 경고들 중 항의성이 차지하는 비중이 눈에 띕니다",
                    "교체되어 나오면서 감독과 눈을 마주치지 않았습니다. 스태프 메모에 '불만을 숨기는 사람이 아니다'라고 적혀 있습니다",
                    "상대와의 신경전 끝에 보복성 파울을 한 장면이 별도 보고서에 기록됐습니다. 자극에 약한 패턴이 반복됩니다",
                    "더비 패배 후 인터뷰에서 상대 팬을 자극하는 발언이 나왔고, 구단이 공식 사과문을 냈습니다",
                    "심판이 파울을 인정하지 않으면 그라운드에 누워서 항의하는 장면이 반복됩니다. 상대 팀보다 심판에게 피로감을 더 줍니다",
                    "교체 투입 직후 짧은 시간에 경고를 연달아 받은 적이 있다는 현장 보고가 있습니다. 감정 조절이 경기 계획에 포함돼야 합니다",
                    "상대가 경련으로 쓰러진 상황에서 스로인을 빨리 달라고 손짓했습니다. 승부욕이 아니라 배려 부족으로 읽혔습니다",
                    "현지 팬 채널에 이 선수의 항의 영상만 모은 슈퍼컷이 정기적으로 돌아다닙니다. 분량이 매번 늘어나는 게 문제입니다",
                ],
                &[
                    "기본 선은 지키지만 경기가 뜨거워지면 불필요한 행동이 한두 번 나옵니다. 주장이 옆에 있을 때 안정됩니다",
                    "평소엔 괜찮지만 불리한 판정이 연속되면 반응이 커집니다. 더비나 직접 대결에서 관리가 필요합니다",
                    "클럽 이미지 대사로 내세우기엔 검증이 더 필요합니다. 외부 이벤트에서 돌발 발언 리스크가 약간 있습니다",
                    "경기 내에서는 관리 가능한 수준이지만 경기 외 상황에서 가끔 필요 이상의 말을 합니다",
                    "상대와 악수는 하지만 시선은 전광판에 있습니다. 나쁜 사람이라기보다 패배를 처리하는 법을 아직 배우는 중입니다",
                ],
                &[
                    "패배 직후 상대 팀 가장 어린 선수에게 다가가 격려를 건넸습니다. 상대 감독이 따로 감사 인사를 전했다는 후문이 있습니다",
                    "억울한 오프사이드로 골이 취소됐을 때, 항의 한마디 없이 수비 위치로 돌아갔습니다. 현장 노트에 '이 장면이 능력치보다 더 인상 깊었다'고 적었습니다",
                    "더비 대패 후에도 상대 선수 전원과 악수하며 경기장을 나갔습니다. 현지 기자가 그날 가장 기억에 남는 장면으로 이 장면을 꼽았습니다",
                    "훈련에서 어린 팀원이 실수를 반복하자 가장 먼저 다가가 시범을 보여줬습니다. 유소년 코치가 별도 보고서를 남길 정도였습니다",
                    "팀 패배 후 기자회견에서 상대 팀 선수와 감독을 구체적으로 칭찬했습니다. 현장 기자들이 분위기가 특이했다고 기록했습니다",
                    "억울한 판정에도 짧게 숨을 고르고 자리로 돌아가는 장면이 반복됩니다. 라커룸 안팎으로 평판 리스크가 낮은 사람입니다",
                    "상대 선수가 부상으로 쓰러지자 자기 팀 역습을 멈추라고 손짓했습니다. 벤치는 아쉬워했지만 양 팀 팬이 모두 그 장면을 공유했습니다",
                    "현지 팬들은 '이 선수의 인스타에는 시상식 사진보다 동료 칭찬 글이 더 많다'고 농담합니다. 농담이지만, 농담이 나올 만한 패턴입니다",
                ],
                false,
            ),
        );
    }

    notes.sort_by(|a, b| b.0.cmp(&a.0).then_with(|| a.1.as_str().cmp(b.1.as_str())));

    notes.into_iter().take(4).map(|(_, note)| note).collect()
}

fn push_hidden_note(notes: &mut Vec<(u8, String)>, note: Option<(u8, String)>) {
    if let Some(note) = note {
        notes.push(note);
    }
}

fn hidden_axis_note(
    player_uid: u32,
    date_seed: u64,
    salt: u64,
    value: u8,
    axis: &str,
    low: &[&str],
    mid: &[&str],
    high: &[&str],
    high_is_risky: bool,
) -> Option<(u8, String)> {
    let (priority, pool) = match value {
        1..=5 => (if high_is_risky { 4 } else { 5 }, low),
        6..=8 => (2, mid),
        16..=17 => (3, high),
        18..=20 => (if high_is_risky { 5 } else { 4 }, high),
        _ => return None,
    };
    let note = pick_personality_note(player_uid, value, salt, date_seed, pool);
    Some((priority, format!("{axis}: {note}.")))
}

fn read_risk_profile(
    target: &Target,
    pointers: PlayerPointers,
) -> Option<(String, ScoutingRiskDetails)> {
    let injury = read_fm_attribute(target, pointers.player + PATR + 0x30)? as i16;
    let consistency = read_fm_attribute(target, pointers.player + PATR + 0x2c)? as i16;
    let important_matches = read_fm_attribute(target, pointers.player + PATR + 0x2f)? as i16;
    let pressure = target.read_u8(pointers.person + PADA + 0x03).ok()? as i16;

    let risk_score = injury + (21 - consistency) + (21 - important_matches) + (21 - pressure);
    let risk_hint = match risk_score {
        0..=22 => "낮은 리스크".to_string(),
        23..=34 => "관리 가능한 리스크".to_string(),
        35..=48 => "주의 필요".to_string(),
        _ => "고위험 후보".to_string(),
    };

    let axes = [
        ("부상 내구성", injury_risk_label(injury), injury),
        (
            "경기력 안정성",
            positive_risk_label(consistency),
            21 - consistency,
        ),
        (
            "빅매치 적응",
            positive_risk_label(important_matches),
            21 - important_matches,
        ),
        ("압박 대처", positive_risk_label(pressure), 21 - pressure),
    ];
    let weakest = axes
        .iter()
        .max_by_key(|(_, _, score)| *score)
        .map(|(axis, label, _)| (*axis, *label))?;
    let strongest = axes
        .iter()
        .min_by_key(|(_, _, score)| *score)
        .map(|(axis, label, _)| (*axis, *label))?;

    Some((
        risk_hint,
        ScoutingRiskDetails {
            injury: axes[0].1.to_string(),
            consistency: axes[1].1.to_string(),
            big_matches: axes[2].1.to_string(),
            pressure: axes[3].1.to_string(),
            weakest_axis: weakest.0.to_string(),
            note: format!("가장 안정적인 축은 {}({})입니다.", strongest.0, strongest.1),
        },
    ))
}

fn injury_risk_label(value: i16) -> &'static str {
    match value {
        1..=6 => "내구성 우수",
        7..=11 => "관리 가능",
        12..=15 => "주의",
        _ => "고위험",
    }
}

fn positive_risk_label(value: i16) -> &'static str {
    match value {
        16..=20 => "안정",
        12..=15 => "양호",
        8..=11 => "검증 필요",
        _ => "위험",
    }
}

fn read_fm_attribute(target: &Target, addr: usize) -> Option<u8> {
    let raw = target.read_u8(addr).ok()? as f64;
    Some(((raw / 5.0 + 0.5).floor() as u8).clamp(1, 20))
}

fn read_player_age(target: &Target, person: usize, game_date: GameDate) -> Option<u16> {
    let raw = target.read_u32(person + PERSON_DOB).ok()?;
    let birth_day = (raw & 0x1ff) as u16;
    let birth_year = (raw >> 16) as i32;
    if !(1900..=2100).contains(&birth_year) {
        return None;
    }
    if birth_day == 0 || birth_day > 366 {
        return None;
    }

    let had_birthday = birth_day <= game_date.day_of_year;
    let age = game_date.year - birth_year - i32::from(!had_birthday);
    (0..=80).contains(&age).then_some(age as u16)
}

fn day_of_year(year: i32, month: u8, day: u8) -> Result<u16, String> {
    if !(1900..=2100).contains(&year) {
        return Err("게임 내 연도는 1900~2100 사이로 입력하세요.".to_string());
    }
    if !(1..=12).contains(&month) {
        return Err("게임 내 월은 1~12 사이로 입력하세요.".to_string());
    }

    let days = [
        31,
        if is_leap_year(year) { 29 } else { 28 },
        31,
        30,
        31,
        30,
        31,
        31,
        30,
        31,
        30,
        31,
    ];
    let month_index = (month - 1) as usize;
    let max_day = days[month_index];
    if day == 0 || day as i32 > max_day {
        return Err("게임 내 날짜가 올바르지 않습니다.".to_string());
    }

    let prior_days = days[..month_index].iter().sum::<i32>();
    Ok((prior_days + day as i32) as u16)
}

fn is_leap_year(year: i32) -> bool {
    (year % 4 == 0 && year % 100 != 0) || year % 400 == 0
}

fn read_strength_profile(target: &Target, pointers: PlayerPointers) -> StrengthProfile {
    let technical = avg_fm_attributes(
        target,
        pointers.player,
        &[0x01, 0x02, 0x07, 0x16, 0x17, 0x0b, 0x0f, 0x15],
    );
    let mental = avg_fm_attributes(
        target,
        pointers.player,
        &[0x11, 0x12, 0x1c, 0x33, 0x34, 0x35, 0x2f],
    );
    let physical = avg_fm_attributes(
        target,
        pointers.player,
        &[0x22, 0x24, 0x25, 0x26, 0x27, 0x2a, 0x2e],
    );

    if technical >= mental && technical >= physical {
        StrengthProfile::Technical
    } else if mental >= physical {
        StrengthProfile::Mental
    } else {
        StrengthProfile::Physical
    }
}

fn avg_fm_attributes(target: &Target, player: usize, offsets: &[usize]) -> f32 {
    let mut total = 0u16;
    let mut count = 0u16;
    for offset in offsets {
        if let Some(value) = read_fm_attribute(target, player + PATR + offset) {
            total += value as u16;
            count += 1;
        }
    }

    if count == 0 {
        0.0
    } else {
        total as f32 / count as f32
    }
}

fn try_resolve_from_player_pointer(target: &Target, player: usize) -> Option<PlayerHit> {
    try_resolve_from_player_base(target, player).or_else(|| {
        for delta in [-0x20isize, -0x18, -0x10, -0x08, 0x08, 0x10, 0x18, 0x20] {
            let candidate = offset_addr(player, delta)?;
            if let Some(hit) = try_resolve_from_player_base(target, candidate) {
                return Some(hit);
            }
        }
        None
    })
}

fn try_resolve_from_player_base(target: &Target, player: usize) -> Option<PlayerHit> {
    let ca = target.read_u16(player + 0x264).ok()?;
    let pa = target.read_u16(player + 0x266).ok()?;
    if !(1..=200).contains(&ca) || !(1..=200).contains(&pa) {
        return None;
    }

    for dynamic_offset in [
        PLAYER_OFFSET,
        PLAYER_OFFSET - 8,
        PLAYER_OFFSET + 8,
        PLAYER_STAFF_OFFSET,
        PLAYER_STAFF_OFFSET - 8,
        PLAYER_STAFF_OFFSET + 8,
    ] {
        if dynamic_offset <= 0 {
            continue;
        }

        let person = player.checked_add(dynamic_offset as usize)?;
        let Ok(uid) = target.read_u32(person + OBJ_DUNI) else {
            continue;
        };
        if !is_plausible_uid(uid) {
            continue;
        }

        let (resolved_player, resolved_offset) = match read_dynamic_offset(target, person) {
            Some(meta_offset)
                if meta_offset == PLAYER_OFFSET || meta_offset == PLAYER_STAFF_OFFSET =>
            {
                (person.checked_sub(meta_offset as usize)?, meta_offset)
            }
            _ => (player, dynamic_offset),
        };

        if target.read_u32(person + OBJ_DUNI).ok() == Some(uid) {
            let resolved_ca = target.read_u16(resolved_player + 0x264).ok().unwrap_or(ca);
            let resolved_pa = target.read_u16(resolved_player + 0x266).ok().unwrap_or(pa);
            if !(1..=200).contains(&resolved_ca) || !(1..=200).contains(&resolved_pa) {
                continue;
            }
            return Some(PlayerHit {
                pointers: PlayerPointers {
                    person,
                    player: resolved_player,
                },
                ca: resolved_ca,
                pa: resolved_pa,
                dynamic_offset: resolved_offset,
            });
        }
    }

    None
}

fn try_resolve_from_squad_pointer(target: &Target, pointer: usize) -> Option<PlayerHit> {
    let mut candidates = Vec::with_capacity(18);
    candidates.push(pointer);

    for offset in [
        0usize, 0x08, 0x10, 0x18, 0x20, 0x28, 0x30, 0x38, 0x40, 0x48, 0x50, 0x58, 0x60, 0x68, 0x70,
        0x78, 0x80,
    ] {
        if let Ok(candidate) = target.read_usize(pointer + offset) {
            if candidate != 0 && !candidates.contains(&candidate) {
                candidates.push(candidate);
            }
        }
    }

    for candidate in candidates {
        if let Some(hit) = try_resolve_from_player_pointer(target, candidate)
            .or_else(|| try_resolve_from_person_pointer(target, candidate))
        {
            return Some(hit);
        }
    }

    None
}

fn try_resolve_from_person_pointer(target: &Target, person: usize) -> Option<PlayerHit> {
    let uid = target.read_u32(person + OBJ_DUNI).ok()?;
    try_resolve_from_person(target, person, uid)
}

fn offset_addr(addr: usize, delta: isize) -> Option<usize> {
    if delta >= 0 {
        addr.checked_add(delta as usize)
    } else {
        addr.checked_sub(delta.unsigned_abs())
    }
}

fn is_plausible_uid(uid: u32) -> bool {
    uid >= 1_000
}

fn read_pointer_range(
    target: &Target,
    addr: usize,
    max_items: usize,
) -> Result<Vec<usize>, String> {
    let start = target.read_usize(addr)?;
    let end = target.read_usize(addr + 8)?;
    if start == 0 || end < start {
        return Err("잘못된 목록 포인터입니다.".to_string());
    }

    let span = end - start;
    if span % 8 != 0 {
        return Err("목록 포인터 정렬이 맞지 않습니다.".to_string());
    }

    let count = span / 8;
    if count > max_items {
        return Err("목록 크기가 예상보다 큽니다.".to_string());
    }

    let mut pointers = Vec::with_capacity(count);
    for index in 0..count {
        let pointer = target.read_usize(start + index * 8)?;
        if pointer != 0 {
            pointers.push(pointer);
        }
    }

    Ok(pointers)
}

fn build_uid_result(
    input_id: u32,
    source_kind: &str,
    team_name: String,
    nation: Option<String>,
    reputation: Option<u16>,
    squad_kind: String,
    squads: Vec<ClubSquadPlayers>,
) -> Result<ClubPlayerUidsResult, String> {
    let mut seen = HashSet::new();
    let mut player_uids = Vec::new();
    for squad in &squads {
        for uid in &squad.player_uids {
            if seen.insert(*uid) {
                player_uids.push(*uid);
            }
        }
    }

    if player_uids.is_empty() {
        return Err("선수 UID를 수집하지 못했습니다.".to_string());
    }

    Ok(ClubPlayerUidsResult {
        input_id,
        source_kind: source_kind.to_string(),
        team_name,
        nation,
        reputation,
        squad_kind,
        team_count: squads.len(),
        player_uids,
        squads,
    })
}

fn build_club_identity(
    target: &Target,
    input_id: u32,
    source_kind: &str,
    club: usize,
    squads: Vec<ClubSquadPlayers>,
) -> ClubIdentityResult {
    let player_count = squads.iter().map(|squad| squad.player_count).sum();
    let squad_label = if squads.len() == 1 {
        squads[0].team_type_label.clone()
    } else {
        format!("{}개 선수단", squads.len())
    };

    ClubIdentityResult {
        input_id,
        source_kind: source_kind.to_string(),
        name: read_club_name(target, club).unwrap_or_else(|| format!("구단 ID {input_id}")),
        nation: read_club_nation_name(target, club),
        reputation: read_club_reputation(target, club),
        team_count: squads.len(),
        player_count,
        squad_label,
    }
}

fn squad_kind_matches(team_type: u8, squad_kind: &str) -> bool {
    match squad_kind {
        "전체" => true,
        "1군" => team_type == 0,
        "2군 / B팀" => matches!(team_type, 1 | 3 | 9 | 13 | 15 | 16 | 17 | 30 | 44),
        "U21" => matches!(team_type, 9 | 10 | 18 | 33),
        "U19 / U18" => matches!(team_type, 11 | 12 | 36 | 37 | 39 | 40 | 41),
        _ => true,
    }
}

fn team_type_label(team_type: u8) -> &'static str {
    match team_type {
        0 => "1군",
        1 => "리저브",
        2 => "A팀",
        3 => "B팀",
        9 => "U23",
        10 => "U21",
        11 => "U19",
        12 => "U18",
        13 => "C팀",
        15 => "II",
        16 => "2팀",
        17 => "3팀",
        18 => "U20",
        30 => "리저브",
        33 => "U22",
        36 => "U19 B",
        37 => "U18 B",
        38 => "전체",
        39 => "전체 유소년",
        40 => "최상위 유소년",
        41 => "최하위 유소년",
        42 => "1군 제외 전체",
        44 => "세컨드 XI",
        _ => "기타",
    }
}

fn read_dynamic_offset(target: &Target, person: usize) -> Option<i32> {
    let vtable = target.read_usize(person).ok()?;
    if vtable == 0 {
        return None;
    }

    let meta = target.read_usize(vtable.checked_sub(8)?).ok()?;
    if meta == 0 {
        return None;
    }

    target.read_i32(meta + 4).ok()
}

fn read_person_name(target: &Target, person: usize) -> Result<Option<String>, String> {
    if let Some(common) = read_fm_nested_string(target, person + PERSON_COMMON_NAME)? {
        return Ok(Some(common));
    }

    let first = read_fm_nested_string(target, person + PERSON_FIRST_NAME)?;
    let second = read_fm_nested_string(target, person + PERSON_SECOND_NAME)?;
    let name = [first, second]
        .into_iter()
        .flatten()
        .filter(|part| !part.is_empty())
        .collect::<Vec<_>>()
        .join(" ");

    if name.is_empty() {
        Ok(None)
    } else {
        Ok(Some(name))
    }
}

fn read_person_nation_name(target: &Target, person: usize) -> Option<String> {
    let nation = target.read_usize(person + PERSON_NATION).ok()?;
    if nation == 0 {
        return None;
    }

    read_fm_indirect_string(target, nation + NATION_NAME)
        .ok()
        .flatten()
        .or_else(|| {
            read_fm_indirect_string(target, nation + NATION_SHORT_NAME)
                .ok()
                .flatten()
        })
}

fn read_club_nation_name(target: &Target, club: usize) -> Option<String> {
    if club == 0 {
        return None;
    }

    const CANDIDATE_OFFSETS: &[usize] = &[
        0x20, 0x28, 0x30, 0x38, 0x40, 0x48, 0x50, 0x58, 0x60, 0x68, 0x70, 0x78, 0x80, 0x88, 0x90,
        0x98, 0xa0, 0xa8, 0xb0, 0xb8, 0xd0, 0xd8, 0xe0, 0xe8,
    ];

    for &offset in CANDIDATE_OFFSETS {
        if matches!(offset, CLUB_TEAMS | CLUB_NAME | CLUB_SHORT_NAME) {
            continue;
        }
        let Ok(nation_ptr) = target.read_usize(club + offset) else {
            continue;
        };
        if nation_ptr == 0 {
            continue;
        }
        if let Some(name) = read_nation_name_from_ptr(target, nation_ptr) {
            return Some(name);
        }
    }

    None
}

fn read_club_reputation(target: &Target, club: usize) -> Option<u16> {
    if club == 0 {
        return None;
    }

    let mut candidates = Vec::new();
    for offset in (0xf0usize..=0x1c0).step_by(2) {
        if pointer_field_overlaps(offset) {
            continue;
        }
        let Ok(value) = target.read_u16(club + offset) else {
            continue;
        };
        if (500..=10_000).contains(&value) {
            candidates.push((offset, value));
        }
    }

    if candidates.is_empty() {
        return None;
    }

    candidates.sort_by(|a, b| {
        let a_known_zone = (0x100..=0x150).contains(&a.0);
        let b_known_zone = (0x100..=0x150).contains(&b.0);
        b_known_zone
            .cmp(&a_known_zone)
            .then_with(|| b.1.cmp(&a.1))
            .then_with(|| a.0.cmp(&b.0))
    });

    candidates.first().map(|(_, value)| *value)
}

fn pointer_field_overlaps(offset: usize) -> bool {
    const POINTER_FIELDS: &[usize] = &[
        CLUB_TEAMS,
        CLUB_TEAMS + 8,
        CLUB_NAME,
        CLUB_SHORT_NAME,
        0x150,
    ];
    POINTER_FIELDS
        .iter()
        .any(|field| offset >= *field && offset < *field + std::mem::size_of::<usize>())
}

fn read_nation_name_from_ptr(target: &Target, nation: usize) -> Option<String> {
    let name = read_fm_indirect_string(target, nation + NATION_NAME)
        .ok()
        .flatten()
        .or_else(|| {
            read_fm_indirect_string(target, nation + NATION_SHORT_NAME)
                .ok()
                .flatten()
        })?;

    if is_plausible_nation_name(&name) {
        Some(name)
    } else {
        None
    }
}

fn is_plausible_nation_name(text: &str) -> bool {
    let normalized = text.trim().to_ascii_lowercase();
    if normalized.len() < 2 || normalized.len() > 42 {
        return false;
    }

    const NATIONS: &[&str] = &[
        "argentina",
        "australia",
        "austria",
        "belgium",
        "brazil",
        "chile",
        "china",
        "colombia",
        "croatia",
        "czech republic",
        "denmark",
        "england",
        "france",
        "germany",
        "ghana",
        "italy",
        "japan",
        "mexico",
        "netherlands",
        "norway",
        "poland",
        "portugal",
        "republic of ireland",
        "scotland",
        "south korea",
        "spain",
        "sweden",
        "switzerland",
        "turkey",
        "united states",
        "uruguay",
        "wales",
        "대한민국",
        "한국",
        "일본",
        "중국",
        "잉글랜드",
        "스코틀랜드",
        "웨일스",
        "아일랜드",
        "프랑스",
        "독일",
        "스페인",
        "이탈리아",
        "포르투갈",
        "네덜란드",
        "브라질",
        "아르헨티나",
        "미국",
        "벨기에",
        "크로아티아",
        "우루과이",
        "멕시코",
    ];

    NATIONS.iter().any(|nation| normalized == *nation)
}

fn read_club_name(target: &Target, club: usize) -> Option<String> {
    for offset in [CLUB_NAME, CLUB_SHORT_NAME] {
        if let Ok(Some(text)) = read_fm_indirect_string(target, club + offset) {
            if is_plausible_name(&text) {
                return Some(text);
            }
        }
    }

    let mut candidates = Vec::new();
    for offset in (0x10..=0x180).step_by(8) {
        if offset == CLUB_TEAMS {
            continue;
        }
        if let Ok(Some(text)) = read_fm_indirect_string(target, club + offset) {
            if is_plausible_name(&text) {
                candidates.push(text);
            }
        }
    }

    candidates.sort_by_key(|name| {
        let word_bonus = name.chars().filter(|ch| ch.is_whitespace()).count();
        (word_bonus, name.chars().count())
    });
    candidates.pop()
}

fn read_team_display_name(target: &Target, club: usize, team_type: u8) -> Option<String> {
    let club_name = (club != 0)
        .then(|| read_club_name(target, club))
        .flatten()?;
    let team_label = team_type_label(team_type);
    if team_type == 0 || team_label == "기타" {
        Some(club_name)
    } else {
        Some(format!("{club_name} {team_label}"))
    }
}

fn is_plausible_name(text: &str) -> bool {
    let len = text.chars().count();
    len >= 2
        && len <= 48
        && text.chars().all(|ch| {
            ch.is_alphanumeric() || matches!(ch, ' ' | '-' | '\'' | '.' | '&' | '/' | '(' | ')')
        })
        && text.chars().any(|ch| ch.is_alphabetic())
}

fn read_best_position(target: &Target, player: usize) -> Option<String> {
    const POSITION_LABELS: [(&str, usize); 15] = [
        ("GK", 0x00),
        ("SW", 0x01),
        ("LB", 0x02),
        ("CB", 0x03),
        ("RB", 0x04),
        ("DM", 0x05),
        ("LM", 0x06),
        ("CM", 0x07),
        ("RM", 0x08),
        ("LW", 0x09),
        ("AM", 0x0a),
        ("RW", 0x0b),
        ("ST", 0x0c),
        ("LWB", 0x0d),
        ("RWB", 0x0e),
    ];

    POSITION_LABELS
        .iter()
        .filter_map(|(label, offset)| {
            target
                .read_u8(player + PPOS + offset)
                .ok()
                .map(|value| (*label, value))
        })
        .max_by_key(|(_, value)| *value)
        .and_then(|(label, value)| (value > 0).then(|| label.to_string()))
}

fn read_fm_nested_string(target: &Target, addr: usize) -> Result<Option<String>, String> {
    let outer = target.read_usize(addr)?;
    if outer == 0 {
        return Ok(None);
    }

    let inner = target.read_usize(outer)?;
    if inner == 0 {
        return Ok(None);
    }

    read_null_terminated_string(target, inner + 4, 128)
}

fn read_fm_indirect_string(target: &Target, addr: usize) -> Result<Option<String>, String> {
    let pointer = target.read_usize(addr)?;
    if pointer == 0 {
        return Ok(None);
    }

    read_null_terminated_string(target, pointer + 4, 128)
}

fn read_null_terminated_string(
    target: &Target,
    addr: usize,
    max_len: usize,
) -> Result<Option<String>, String> {
    let bytes = target.read(addr, max_len)?;
    let end = bytes
        .iter()
        .position(|byte| *byte == 0)
        .unwrap_or(bytes.len());
    if end == 0 {
        return Ok(None);
    }

    let text = String::from_utf8_lossy(&bytes[..end]).trim().to_string();
    if text.is_empty() {
        Ok(None)
    } else {
        Ok(Some(text))
    }
}
