use std::collections::HashMap;

use super::{ScoutedPlayer, ScoutingBand};

pub(super) fn development_band(ca: u16, pa: u16, age: Option<u16>) -> String {
    let gap = pa.saturating_sub(ca);
    match age {
        Some(a) if a <= 19 => match pa {
            185.. => "역대급 원석 - 조기 확보 필수".to_string(),
            170.. => "최우선 발굴 대상".to_string(),
            155.. => "중장기 핵심 육성주".to_string(),
            _ => "장기 개발 프로젝트".to_string(),
        },
        Some(a) if a <= 23 => match gap {
            35.. => "황금기 전 핵심 유망주".to_string(),
            20..=34 => "성장 궤도 진입 중".to_string(),
            10..=19 => "점진적 성장 기대".to_string(),
            _ => "현재 전력 위주 활용".to_string(),
        },
        Some(a) if a <= 27 => match gap {
            25.. => "황금기 도달 가능".to_string(),
            10..=24 => "즉전 + 추가 성장 여지".to_string(),
            _ => "피크 자원으로 관리".to_string(),
        },
        Some(_) => match ca {
            155.. => "전성기 즉시 전력".to_string(),
            135.. => "경험 기반 안정 자원".to_string(),
            _ => "주전 확보 어려운 연령대".to_string(),
        },
        None => match gap {
            0..=10 => "거의 완성형".to_string(),
            11..=25 => "즉시 전력 성장 여지".to_string(),
            26..=45 => "핵심 육성 후보".to_string(),
            _ => "장기 프로젝트급 잠재력".to_string(),
        },
    }
}

pub(super) fn recommendation_hint(player: &ScoutedPlayer) -> String {
    let gap = player.pa.saturating_sub(player.ca);
    if player.pa >= 170 && gap >= 30 {
        "최우선 추적 대상".to_string()
    } else if player.pa >= 155 && gap >= 20 {
        "상위 후보군 유지".to_string()
    } else if player.ca >= 140 {
        "즉시 전력 관점 재검토".to_string()
    } else {
        "후속 관찰 필요".to_string()
    }
}

pub(super) fn count_rating_bands(
    values: impl Iterator<Item = u16>,
    knowledge_level: u8,
) -> Vec<ScoutingBand> {
    let values = values.collect::<Vec<_>>();
    let bands = rating_band_ranges(knowledge_level);
    bands
        .iter()
        .map(|(label, min, max)| ScoutingBand {
            label: label.clone(),
            count: values
                .iter()
                .filter(|value| **value >= *min && **value <= *max)
                .count(),
        })
        .collect()
}

pub(super) fn rating_band(value: u16, knowledge_level: u8) -> String {
    rating_band_ranges(knowledge_level)
        .into_iter()
        .find(|(_, min, max)| value >= *min && value <= *max)
        .map(|(label, _, _)| label)
        .unwrap_or_else(|| "미확인".to_string())
}

fn rating_band_ranges(knowledge_level: u8) -> Vec<(String, u16, u16)> {
    match knowledge_level {
        1 => vec![
            ("1-119".to_string(), 1, 119),
            ("120-149".to_string(), 120, 149),
            ("150-169".to_string(), 150, 169),
            ("170-200".to_string(), 170, 200),
        ],
        2 => vec![
            ("1-99".to_string(), 1, 99),
            ("100-119".to_string(), 100, 119),
            ("120-139".to_string(), 120, 139),
            ("140-159".to_string(), 140, 159),
            ("160-179".to_string(), 160, 179),
            ("180-200".to_string(), 180, 200),
        ],
        _ => {
            let mut bands = vec![("1-99".to_string(), 1, 99)];
            let mut start = 100;
            while start <= 180 {
                let end = start + 9;
                bands.push((format!("{start}-{end}"), start, end));
                start += 10;
            }
            bands.push(("190-194".to_string(), 190, 194));
            bands.push(("195-200".to_string(), 195, 200));
            bands
        }
    }
}

pub(super) fn count_positions(players: &[ScoutedPlayer]) -> Vec<ScoutingBand> {
    let mut counts = HashMap::<String, usize>::new();
    for player in players {
        *counts.entry(player.position.clone()).or_default() += 1;
    }

    let mut counts = counts
        .into_iter()
        .map(|(label, count)| ScoutingBand { label, count })
        .collect::<Vec<_>>();
    counts.sort_by(|a, b| b.count.cmp(&a.count).then_with(|| a.label.cmp(&b.label)));
    counts
}

pub(super) fn generate_summary_narrative(
    team_name: &str,
    squad_kind: &str,
    knowledge_level: u8,
    candidates: &[super::ScoutingCandidate],
    players: &[ScoutedPlayer],
) -> String {
    if players.is_empty() {
        return format!(
            "{}의 {}에 대한 스카우팅 데이터가 충분하지 않습니다.",
            team_name, squad_kind
        );
    }

    let total = players.len();
    let avg_pa = players.iter().map(|p| p.pa as u32).sum::<u32>() / total as u32;
    let elite_count = players.iter().filter(|p| p.pa >= 175).count();
    let young_count = players
        .iter()
        .filter(|p| matches!(p.age, Some(a) if a <= 23))
        .count();

    let level_desc = squad_level_desc(avg_pa);
    let elite_mentality_count = candidates
        .iter()
        .filter(|c| c.personality_hint.as_deref() == Some("엘리트 멘탈리티"))
        .count();

    let vibe = if avg_pa >= 160 {
        "예상보다 눈에 띄는 재능들이 있다는 인상을 받았습니다"
    } else if avg_pa >= 140 {
        "전반적으로 평균적인 수준의 선수군으로 파악됩니다"
    } else {
        "아직 특별히 두각을 나타내는 자원은 보이지 않습니다"
    };

    let mut report = NarrativeBuilder::new();
    if knowledge_level == 1 {
        report.push(format!(
            "[1단계 기초 탐문] {}의 {} 기초 탐문이 완료되었습니다. {}. 보다 정확한 평가를 위해 추가 스카우팅을 권장합니다.",
            team_name, squad_kind, vibe
        ));
    }

    if knowledge_level == 2 {
        let elite_note = if elite_count > 0 {
            format!(
                " 특히 상위 {}명은 주목할 만한 잠재력을 보유하고 있습니다.",
                elite_count
            )
        } else {
            String::new()
        };
        report.push(format!(
            "[2단계 후보 신원 확인] 총 {}명을 확인한 결과, 전반적으로 {} 수준으로 파악됩니다.{}",
            total, level_desc, elite_note
        ));
    }

    if knowledge_level == 3 {
        let elite_note = match elite_count {
            0 => "역대급 재능은 아직 발굴되지 않았으나".to_string(),
            1 => "특출난 엘리트급 원석이 1명 확인되었으며".to_string(),
            n => format!("엘리트급 원석 {}명이 확인되었으며", n),
        };
        let mut section = format!(
            "[3단계 성장 궤도 산정] {} 전력 수준으로 평가됩니다. {}, {}",
            level_desc,
            elite_note,
            age_structure_note(young_count, total)
        );

        // 컴패리즌 부여 범위(PA >= 150) 안에 들어온 유망주를 PA 순으로 전원 호명한다.
        // 더 깊이 보고 싶다면 카드에서 개별 드릴다운(L4/L5)으로 진입.
        for (i, cand) in candidates.iter().enumerate() {
            let rank_label = match i {
                0 => "최우선 추적 대상".to_string(),
                1 => "차순위 주목 선수".to_string(),
                n => format!("주목 후보 {}순위", n + 1),
            };
            section.push_str("\n\n");
            section.push_str(&render_prospect_candidate_paragraph(
                cand,
                &rank_label,
                CandidateReportDepth::Observation,
            ));
        }
        report.push(section);
    }

    if knowledge_level == 4 {
        let opening = if elite_count >= 3 {
            "복수의 엘리트급 원석이 발굴되어 즉각적인 대응이 필요합니다.".to_string()
        } else if elite_count >= 1 && elite_mentality_count >= 1 {
            "재능과 정신력을 동시에 갖춘 희귀 자원이 확인되었습니다.".to_string()
        } else if elite_count >= 1 {
            "눈여겨볼 만한 발굴이 있었으며, 즉시 추가 접촉을 권장합니다.".to_string()
        } else {
            format!("총 {}명의 선수 프로필을 정밀 검토하였습니다.", total)
        };
        let mentality_note = match elite_mentality_count {
            0 => "후보군 전체를 살펴봐도 특출난 멘탈리티는 확인되지 않았습니다.".to_string(),
            1 => "후보군 중 1명이 최상위 멘탈리티를 갖추고 있어 장기 투자 가치가 높습니다."
                .to_string(),
            n => format!(
                "{}명이 엘리트급 멘탈리티를 보유하고 있습니다. 이 수치는 이례적으로 높습니다.",
                n
            ),
        };
        let mut section = format!(
            "[4단계 현장 성향 검증] {} {} 이번 단계에서는 숫자보다 현장 장면을 우선했습니다. 훈련장, 원정 이동, 경기 후 통로에서 나온 관찰 메모를 선수별로 묶어 아래에 정리합니다.",
            opening, mentality_note
        );
        for (i, cand) in candidates.iter().enumerate() {
            let rank_label = match i {
                0 => "최우선 추적 대상".to_string(),
                1 => "차순위 주목 선수".to_string(),
                n => format!("주목 후보 {}순위", n + 1),
            };
            section.push_str("\n\n");
            section.push_str(&render_prospect_candidate_paragraph(
                cand,
                &rank_label,
                CandidateReportDepth::Observation,
            ));
        }
        report.push(section);
    }

    if knowledge_level >= 5 {
        let verdict = if elite_count >= 2 && elite_mentality_count >= 1 {
            "즉시 계약 테이블에 올려야 할 최우선 자원이 복수 발굴되었습니다."
        } else if elite_count >= 1 && elite_mentality_count >= 1 {
            "재능과 멘탈리티를 모두 갖춘 자원이 확인되었습니다. 경쟁 클럽에 선점당하기 전에 움직여야 합니다."
        } else if elite_count >= 1 {
            "잠재력은 충분하지만 성향과 리스크 측면의 추가 검증이 필요합니다."
        } else if avg_pa >= 155 {
            "결정적인 원석은 없으나, 전체적으로 준수한 자원군이 구성되어 있습니다."
        } else {
            "현 시점에서 우선 영입 대상으로 삼기 어려운 자원군으로 최종 평가됩니다."
        };
        let mut section = format!(
            "[5단계 전문가 기밀 리포트] {}의 {} - 유망주 {}명 최종 판정.\n{}\n{}",
            team_name,
            squad_kind,
            total,
            verdict,
            summarize_risk_axes(candidates)
        );
        for (i, cand) in candidates.iter().enumerate() {
            let rank_label = match i {
                0 => "최우선 영입 후보".to_string(),
                1 => "차순위 영입 후보".to_string(),
                n => format!("보류 전 검토 후보 {}순위", n + 1),
            };
            section.push_str("\n\n");
            section.push_str(&render_prospect_candidate_paragraph(
                cand,
                &rank_label,
                CandidateReportDepth::Final,
            ));
        }
        report.push(section);
    }

    report.finish()
}

pub(super) fn generate_senior_summary_narrative(
    team_name: &str,
    squad_kind: &str,
    knowledge_level: u8,
    candidates: &[super::ScoutingCandidate],
    players: &[ScoutedPlayer],
) -> String {
    if players.is_empty() {
        return format!(
            "{}의 {}에서 전성기 이상으로 분류된 선수는 확인되지 않았습니다.",
            team_name, squad_kind
        );
    }

    let total = players.len();
    let avg_ca = players.iter().map(|p| p.ca as u32).sum::<u32>() / total as u32;
    let avg_pa = players.iter().map(|p| p.pa as u32).sum::<u32>() / total as u32;
    let immediate_count = players.iter().filter(|p| p.ca >= 140).count();
    let ceiling_count = players.iter().filter(|p| p.pa >= 160).count();
    let stable_count = players
        .iter()
        .filter(|p| p.pa.saturating_sub(p.ca) <= 10)
        .count();

    let mut report = NarrativeBuilder::new();
    if knowledge_level == 1 {
        report.push(format!(
            "[전성기 이상 리포트] {}의 {}에서 25세 이상 선수 {}명을 별도 분류했습니다. 이 그룹은 플레이 유사 선수 비교 없이 현재 능력과 잠재 능력 구간만으로 판단합니다.",
            team_name, squad_kind, total
        ));
    }

    if knowledge_level == 2 {
        report.push(format!(
            "[현재 전력 분포] 평균 CA는 {} 수준, 평균 PA는 {} 수준입니다. 즉시 전력권으로 볼 수 있는 선수는 {}명이며, 추가 잠재력 상한이 남아 있는 선수는 {}명입니다.",
            senior_level_desc(avg_ca),
            senior_level_desc(avg_pa),
            immediate_count,
            ceiling_count
        ));
    }

    if knowledge_level >= 3 {
        let stability_note = if stable_count * 2 >= total {
            "대부분은 이미 현재 능력과 잠재 능력의 간격이 좁아 완성형에 가깝습니다."
        } else {
            "일부 선수는 나이 대비 PA 여지가 남아 있어 단기 활용과 잔여 성장 가능성을 함께 볼 수 있습니다."
        };
        let mut section = format!(
            "[CA/PA 판정] {} 상위권 선수는 현재 능력 순으로 우선 검토하는 편이 적합합니다.",
            stability_note
        );
        // 1군 top 10 호명. 더 깊은 정보는 카드 드릴다운 진입.
        for (index, cand) in candidates.iter().enumerate() {
            section.push_str("\n\n");
            section.push_str(&render_senior_candidate_paragraph(cand, index + 1));
        }
        report.push(section);
    }

    report.finish()
}

struct NarrativeBuilder {
    sections: Vec<String>,
}

impl NarrativeBuilder {
    fn new() -> Self {
        Self {
            sections: Vec::with_capacity(6),
        }
    }

    fn push(&mut self, section: String) {
        if !section.trim().is_empty() {
            self.sections.push(section);
        }
    }

    fn finish(self) -> String {
        self.sections.join("\n\n")
    }
}

#[derive(Clone, Copy)]
enum CandidateReportDepth {
    Observation,
    Final,
}

#[derive(Clone, serde::Serialize)]
#[serde(rename_all = "camelCase")]
pub(super) struct NarrativeParagraph {
    pub(super) uid: Option<u32>,
    pub(super) body: String,
}

fn prospect_rank_label(knowledge_level: u8, index: usize) -> String {
    match (knowledge_level, index) {
        (5, 0) => "최우선 영입 후보".to_string(),
        (5, 1) => "차순위 영입 후보".to_string(),
        (5, n) => format!("보류 전 검토 후보 {}순위", n + 1),
        (_, 0) => "최우선 추적 대상".to_string(),
        (_, 1) => "차순위 주목 선수".to_string(),
        (_, n) => format!("주목 후보 {}순위", n + 1),
    }
}

fn prospect_depth_for(knowledge_level: u8) -> CandidateReportDepth {
    if knowledge_level >= 5 {
        CandidateReportDepth::Final
    } else {
        CandidateReportDepth::Observation
    }
}

// 보고서 본문의 per-candidate 단락을 구조화된 형태로 추출.
// 팀 보고서 narrative와 동일한 문장 집합을 단락별로 분리해 반환한다.
pub(super) fn build_prospect_paragraphs(
    candidates: &[super::ScoutingCandidate],
    knowledge_level: u8,
) -> Vec<NarrativeParagraph> {
    if knowledge_level < 3 {
        return Vec::new();
    }
    let depth = prospect_depth_for(knowledge_level);
    candidates
        .iter()
        .enumerate()
        .map(|(i, c)| NarrativeParagraph {
            uid: c.uid,
            body: render_prospect_candidate_paragraph(
                c,
                &prospect_rank_label(knowledge_level, i),
                depth,
            ),
        })
        .collect()
}

pub(super) fn build_senior_paragraphs(
    candidates: &[super::ScoutingCandidate],
    knowledge_level: u8,
) -> Vec<NarrativeParagraph> {
    if knowledge_level < 3 {
        return Vec::new();
    }
    candidates
        .iter()
        .enumerate()
        .map(|(i, c)| NarrativeParagraph {
            uid: c.uid,
            body: render_senior_candidate_paragraph(c, i + 1),
        })
        .collect()
}

fn render_prospect_candidate_paragraph(
    candidate: &super::ScoutingCandidate,
    rank_label: &str,
    depth: CandidateReportDepth,
) -> String {
    let mut sentences = Vec::with_capacity(9);
    sentences.push(candidate_identity_sentence(candidate, rank_label));

    if let Some(development_band) = candidate.development_band.as_deref() {
        sentences.push(format!(
            "육성 분류는 {}{} 잡힙니다.",
            emphasize(development_band),
            josa_ro(development_band)
        ));
    }

    if let Some(style_sentence) = candidate_style_sentence(candidate) {
        sentences.push(style_sentence);
    }

    if let Some(intel_sentence) = candidate_intel_sentence(candidate, depth) {
        sentences.push(intel_sentence);
    }

    if matches!(depth, CandidateReportDepth::Final) {
        if let Some(risk_sentence) = candidate_risk_sentence(candidate) {
            sentences.push(risk_sentence);
        }
        if let Some(recommendation) = candidate.recommendation.as_deref() {
            sentences.push(format!("권고 액션은 {}입니다.", emphasize(recommendation)));
        }
        sentences.push(candidate_verification_sentence(candidate));
    }

    sentences.join(" ")
}

// 개별 선수 드릴다운(L4/L5)을 위한 단락 렌더링.
// 팀 보고서의 [4단계]/[5단계] 헤더와 그룹 verdict를 빼고, 해당 선수의 본문만 만든다.
pub(super) fn render_player_drilldown_narrative(
    candidate: &super::ScoutingCandidate,
    knowledge_level: u8,
    rank_index: usize,
) -> String {
    let rank_label = match (knowledge_level, rank_index) {
        (5, 0) => "최우선 영입 후보".to_string(),
        (5, 1) => "차순위 영입 후보".to_string(),
        (5, n) => format!("보류 전 검토 후보 {}순위", n + 1),
        (_, 0) => "최우선 추적 대상".to_string(),
        (_, 1) => "차순위 주목 선수".to_string(),
        (_, n) => format!("주목 후보 {}순위", n + 1),
    };
    let depth = if knowledge_level >= 5 {
        CandidateReportDepth::Final
    } else {
        CandidateReportDepth::Observation
    };
    render_prospect_candidate_paragraph(candidate, &rank_label, depth)
}

fn render_senior_candidate_paragraph(candidate: &super::ScoutingCandidate, rank: usize) -> String {
    let mut sentence = format!(
        "{}순위 후보인 {}은 {} 포지션의 전성기 이상 자원입니다. 현재 능력 구간은 {}, 잠재 능력 구간은 {}로 읽히므로 즉시 전력성 중심으로 판단해야 합니다.",
        emphasize(rank.to_string()),
        emphasize(&candidate.label),
        emphasize(&candidate.position),
        emphasize(&candidate.ca_band),
        emphasize(&candidate.pa_band)
    );
    if let Some(age) = candidate.age {
        sentence.push_str(&format!(
            " 나이는 {}라서 성장 폭보다 현재 출력, 계약 기간, 급여 구조가 더 중요합니다.",
            emphasize(format!("{age}세"))
        ));
    }
    sentence
}

fn candidate_identity_sentence(candidate: &super::ScoutingCandidate, rank_label: &str) -> String {
    let age_clause = candidate
        .age
        .map(|age| format!(" 나이는 {}이며,", emphasize(format!("{age}세"))))
        .unwrap_or_default();
    format!(
        "{}인 {}는{} {} 포지션에서 확인된 자원입니다. 현재 보고서 기준 CA 구간은 {}, PA 구간은 {}입니다.",
        emphasize(rank_label),
        emphasize(&candidate.label),
        age_clause,
        emphasize(&candidate.position),
        emphasize(&candidate.ca_band),
        emphasize(&candidate.pa_band)
    )
}

fn candidate_style_sentence(candidate: &super::ScoutingCandidate) -> Option<String> {
    let phrase = candidate.comparison_phrase.as_deref();
    let comparison = comparison_note(&candidate.comparisons);
    match (phrase, comparison) {
        // phrase 자체가 비교 대상 선수를 포함하므로 별도 비교군 라인은 생략한다.
        (Some(phrase), _) => {
            let trimmed = phrase.trim_end_matches('.').trim_end_matches('。').trim();
            Some(format!(
                "플레이 스타일 관찰: {}. 특히 {}에서 이 패턴이 반복됐습니다.",
                emphasize(trimmed),
                emphasize(pick_scouting_case(candidate, 23, STYLE_SCENES))
            ))
        }
        (None, Some(comparison)) => Some(format!(
            "유사 선수 비교에서는 {} 쪽 패턴이 먼저 잡힙니다. 해당 평가는 {}에서 나온 장면을 기준으로 했습니다.",
            emphasize(&comparison),
            emphasize(pick_scouting_case(candidate, 24, STYLE_SCENES))
        )),
        (None, None) => None,
    }
}

fn candidate_intel_sentence(
    candidate: &super::ScoutingCandidate,
    depth: CandidateReportDepth,
) -> Option<String> {
    let note_limit = match depth {
        CandidateReportDepth::Observation => 1,
        CandidateReportDepth::Final => 2,
    };
    let personality_notes = emphasized_notes(&candidate.personality_notes, note_limit);
    let hidden_notes = emphasized_notes(&candidate.hidden_notes, note_limit);
    if candidate.personality_hint.is_none()
        && personality_notes.is_empty()
        && hidden_notes.is_empty()
    {
        return None;
    }

    let mut sentences = Vec::with_capacity(3);
    if let Some(personality) = candidate.personality_hint.as_deref() {
        sentences.push(format!(
            "성향 프로필은 {}{} 분류됩니다.",
            emphasize(personality),
            josa_ro(personality)
        ));
    }
    if !personality_notes.is_empty() {
        sentences.push(format!(
            "성격 일화는 {}에서 수집됐습니다. {}",
            emphasize(pick_scouting_case(candidate, 31, PERSONALITY_SOURCES)),
            personality_notes.join(" ")
        ));
    }
    if !hidden_notes.is_empty() {
        sentences.push(format!(
            "히든 성향은 {}에서 더 구체적으로 드러났습니다. {}",
            emphasize(pick_scouting_case(candidate, 32, HIDDEN_SOURCES)),
            hidden_notes.join(" ")
        ));
    }

    Some(sentences.join(" "))
}

fn candidate_risk_sentence(candidate: &super::ScoutingCandidate) -> Option<String> {
    let risk = candidate.risk_hint.as_deref()?;
    let Some(detail) = candidate.risk_details.as_ref() else {
        return Some(format!("리스크 등급은 {}입니다.", emphasize(risk)));
    };

    Some(format!(
        "리스크 등급은 {}입니다. 세부 항목은 부상 {}, 안정성 {}, 빅매치 {}, 압박 {}{} 갈리며, {}",
        emphasize(risk),
        emphasize(&detail.injury),
        emphasize(&detail.consistency),
        emphasize(&detail.big_matches),
        emphasize(&detail.pressure),
        josa_ro(&detail.pressure),
        detail.note
    ))
}

fn candidate_verification_sentence(candidate: &super::ScoutingCandidate) -> String {
    let action = candidate
        .risk_details
        .as_ref()
        .map(|detail| match detail.weakest_axis.as_str() {
            "부상 내구성" => "8일 동안 3경기를 치르는 구간에서 후반 20분 스프린트와 다음 날 회복 세션 출석 기록을 같이 확인해야 합니다",
            "경기력 안정성" => "홈 경기 직후 원정 경기까지 이어지는 2연전에서 같은 역할을 맡겼을 때 터치 수와 압박 가담 횟수가 유지되는지 봐야 합니다",
            "빅매치 적응" => "더비나 컵 대회 후반 라운드처럼 관중 소음이 커지는 경기에서 첫 15분의 볼 요구 횟수를 따로 체크해야 합니다",
            "압박 대처" => "스카우터가 공개적으로 배석한 경기와 현지 언론 관심이 붙은 경기에서 첫 실수 이후 선택지가 줄어드는지 확인해야 합니다",
            _ => "동일 포지션 경쟁자가 붙은 경기에서 반응과 경기 후 태도를 추가 확인해야 합니다",
        })
        .unwrap_or_else(|| pick_scouting_case(candidate, 42, FINAL_CHECKS));
    format!("최종 검증 액션은 {}.", emphasize(action))
}

fn summarize_risk_axes(candidates: &[super::ScoutingCandidate]) -> String {
    let details = candidates
        .iter()
        .filter_map(|candidate| candidate.risk_details.as_ref())
        .collect::<Vec<_>>();
    if details.is_empty() {
        return "세부 리스크 항목은 일부 후보에서만 확인되었습니다. 최종 판단 전 같은 조건의 추가 관찰 샘플이 필요합니다.".to_string();
    }

    let mut counts = HashMap::<&str, usize>::new();
    for detail in &details {
        *counts.entry(detail.weakest_axis.as_str()).or_default() += 1;
    }

    let (axis, count) = counts
        .into_iter()
        .max_by(|a, b| a.1.cmp(&b.1).then_with(|| a.0.cmp(b.0)))
        .unwrap_or(("리스크", 0));
    let axis_note = match axis {
        "부상 내구성" => {
            "의무 기록만 보지 말고 빡빡한 일정 뒤의 회복 속도를 같이 확인해야 합니다."
        }
        "경기력 안정성" => {
            "좋은 날의 하이라이트보다 조용한 날의 최소 출력이 영입 판단의 핵심입니다."
        }
        "빅매치 적응" => {
            "상위권 맞대결, 원정 더비, 컵 대회 후반 라운드를 따로 분리해 관찰해야 합니다."
        }
        "압박 대처" => {
            "이적설과 언론 관심이 붙은 경기에서 첫 실수 이후 반응을 다시 봐야 합니다."
        }
        _ => "계약 전 추가 확인이 필요합니다.",
    };

    if count >= 2 {
        format!(
            "반복 리스크는 {}입니다. {}명이 이 축에서 가장 크게 흔들렸고, {}",
            emphasize(axis),
            count,
            axis_note
        )
    } else {
        format!(
            "후보별 리스크는 분산되어 있습니다. 가장 눈에 띄는 단일 취약 축은 {}이며, {}",
            emphasize(axis),
            axis_note
        )
    }
}

fn pick_scouting_case<'a>(
    candidate: &super::ScoutingCandidate,
    salt: u64,
    pool: &'a [&'a str],
) -> &'a str {
    let seed = candidate_seed(candidate, salt);
    pool[(seed as usize) % pool.len()]
}

fn candidate_seed(candidate: &super::ScoutingCandidate, salt: u64) -> u64 {
    let mut state = u64::from(candidate.uid.unwrap_or(0x9e37_79b9)) ^ salt;
    for byte in candidate.label.as_bytes() {
        state ^= u64::from(*byte);
        state = state.wrapping_mul(0x100_0000_01b3);
    }
    state ^= u64::from(candidate.ca) << 17;
    state ^= u64::from(candidate.pa) << 33;
    state
}

const STYLE_SCENES: &[&str] = &[
    "상대 풀백이 첫 압박을 늦춘 순간 곧바로 안쪽 공간을 찌른 장면",
    "전환 직후 세 번째 터치에서 패스 각도를 바꾼 장면",
    "수비형 미드필더 뒤쪽 빈 공간으로 몸을 먼저 넣은 장면",
    "공을 받기 전 고개를 두 번 돌리고 첫 터치 방향을 미리 정한 장면",
    "상대 센터백이 한 걸음 물러선 순간 슈팅 대신 컷백을 고른 장면",
];

const PERSONALITY_SOURCES: &[&str] = &[
    "훈련 종료 뒤 장비를 정리하던 스태프와의 짧은 대화",
    "원정 경기 다음 날 회복 세션 출석부와 피지컬 코치의 메모",
    "경기 후 혼합취재구역에서 현지 기자가 남긴 비공개 코멘트",
    "U21 코치가 공유한 유소년 시절 훈련 일지",
    "라커룸 통로에서 주장과 주고받은 30초짜리 대화",
    "팬 사인회 뒤 구단 직원이 남긴 내부 공유 메모",
];

const HIDDEN_SOURCES: &[&str] = &[
    "의무팀, 장비팀, 분석관이 각자 적은 짧은 메모를 맞춰 본 결과",
    "현지 팬 포럼에 반복해서 올라온 경기 후 목격담과 스카우터 현장 노트",
    "비공개 연습경기 종료 후 코치진이 남긴 역할 변경 기록",
    "컵 경기 전날 훈련장 분위기와 경기 당일 터널 관찰을 비교한 기록",
    "3경기 연속 관찰표에서 같은 항목에 반복 표시된 체크마크",
    "상대 팀 분석 스태프에게 비공식으로 확인한 경기 준비 메모",
];

const FINAL_CHECKS: &[&str] = &[
    "계약 전 마지막 관찰은 원정 경기와 다음 날 회복 세션을 붙여서 진행해야 합니다",
    "최소 한 번은 더비급 소음이 있는 경기에서 첫 실수 이후 반응을 확인해야 합니다",
    "동일 포지션 경쟁자와 함께 뛴 30분 샘플을 추가로 확보해야 합니다",
    "훈련장 태도와 경기 후 인터뷰 톤을 같은 날 묶어서 다시 확인해야 합니다",
];

fn emphasized_notes(notes: &[String], limit: usize) -> Vec<String> {
    notes.iter().take(limit).map(emphasize).collect::<Vec<_>>()
}

fn emphasize(text: impl AsRef<str>) -> String {
    let text = text.as_ref().replace("**", "");
    format!("**{text}**")
}

// 마지막 글자의 받침에 따라 "로" 또는 "으로"를 돌려준다.
// 받침이 없거나 ㄹ 받침이면 "로", 그 외 받침이면 "으로".
fn josa_ro(text: &str) -> &'static str {
    let last = text.chars().rev().find(|c| !c.is_whitespace());
    match last {
        Some(c) => {
            let code = c as u32;
            if (0xAC00..=0xD7A3).contains(&code) {
                let batchim = (code - 0xAC00) % 28;
                if batchim == 0 || batchim == 8 {
                    "로"
                } else {
                    "으로"
                }
            } else {
                "로"
            }
        }
        None => "로",
    }
}

// comparisons 배열에서 유사 선수 이름을 한 문장으로 조합한다.
// 1명: "X" / 2명: "X, Y" / 3명+: "X, Y 외 N명"
fn comparison_note(comparisons: &[String]) -> Option<String> {
    match comparisons.len() {
        0 => None,
        1 => Some(comparisons[0].clone()),
        2 => Some(format!("{}, {}", comparisons[0], comparisons[1])),
        n => Some(format!(
            "{}, {} 외 {}명",
            comparisons[0],
            comparisons[1],
            n - 2
        )),
    }
}

fn age_structure_note(young_count: usize, total: usize) -> &'static str {
    if young_count * 2 >= total {
        "젊은 자원 중심의 구성으로 장기적 성장 가능성이 높습니다."
    } else if young_count * 4 < total {
        "경험 있는 베테랑 중심 구성으로 즉시 전력 활용이 가능합니다."
    } else {
        "경험과 젊음이 균형 잡힌 구성입니다."
    }
}

fn squad_level_desc(avg_pa: u32) -> &'static str {
    match avg_pa {
        170.. => "세계 최정상급",
        155.. => "상위권 리그 경쟁",
        140.. => "중상위권",
        125.. => "중위권",
        _ => "하위권",
    }
}

fn senior_level_desc(value: u32) -> &'static str {
    match value {
        170.. => "세계 최정상급",
        155.. => "상위권 리그 핵심",
        140.. => "상위권 로테이션",
        125.. => "중위권 주전",
        _ => "보강 우선순위 낮음",
    }
}
