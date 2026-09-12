//! 선수 1명 → 생성 프롬프트 1개. 그리고 스쿼드 전체를 폴더로 내보내기.
//!
//! 프롬프트는 "첨부 이미지 + 지시문"을 전제로 쓴다. 얼굴 참조가 있으면 동일성 유지가
//! 최우선 지시이고, 나이·체격·포지션은 그 위에 얹는 보정이다. 얼굴 참조가 없을 때만
//! 국적/나이로 외모를 텍스트 서술한다.
//!
//! 선수 이름은 프롬프트 본문에 넣지 않는다. 실존 선수 이름이 들어가면 모델이 참조
//! 이미지 대신 자기가 아는 얼굴로 끌고 가거나, 유명인 초상 정책에 걸려 거절한다.
//! 이름은 폴더명과 목록 파일에만 남긴다.

use std::fs;
use std::path::{Path, PathBuf};

use crate::media::find_face_file;
use crate::portrait::{
    studio_root, ExportResult, PortraitPrompt, PortraitPromptRequest, PromptPlayer,
};

struct Band {
    ko: &'static str,
    en: &'static str,
}

impl Band {
    fn pick(&self, korean: bool) -> &'static str {
        if korean {
            self.ko
        } else {
            self.en
        }
    }
}

// ================================================================================
// 서술 테이블
// ================================================================================

/// 나이대별 얼굴/피부 묘사. 실사 인물 사진에서 나이를 가르는 건 주름·피부결·수염·머리색이다.
fn age_look(age: Option<u16>) -> Band {
    match age {
        None => Band {
            ko: "나이를 특정할 수 없다. 얼굴 참조 이미지에 보이는 나이대를 그대로 유지한다.",
            en: "Age unknown: keep exactly the age that the face reference already shows.",
        },
        Some(a) if a <= 16 => Band {
            ko: "10대 중반. 볼에 아직 살이 남은 앳된 소년의 얼굴, 부드러운 턱선, 매끈한 피부. 수염은 없다. 팔다리가 가늘고 근육이 덜 붙은 미성숙한 체격.",
            en: "Mid-teens. Boyish face with soft cheeks and jawline, smooth skin, no facial hair, thin and not yet filled-out physique.",
        },
        Some(a) if a <= 18 => Band {
            ko: "10대 후반. 소년티가 남은 얼굴에 솜털 수준의 옅은 수염. 피부는 매끈하고 주름이 없다. 마른 편이지만 어깨와 허벅지에 근육이 붙기 시작한 몸.",
            en: "Late teens. Still youthful face with only faint downy stubble, smooth wrinkle-free skin, lean frame with muscle just beginning to show.",
        },
        Some(a) if a <= 21 => Band {
            ko: "20대 초반. 이목구비가 또렷해졌지만 인상은 여전히 젊고 피부에 주름이 없다. 가볍고 탄탄한 운동선수 체형.",
            en: "Early twenties. Defined features but a young, unlined face; light and athletic build.",
        },
        Some(a) if a <= 25 => Band {
            ko: "20대 중반. 성인 남성의 또렷한 얼굴선, 짧게 정리된 수염이 있을 수 있다. 근육이 완성된 프로 운동선수의 몸.",
            en: "Mid twenties. Fully adult facial structure, possibly short trimmed stubble, peak athletic musculature.",
        },
        Some(a) if a <= 29 => Band {
            ko: "20대 후반. 다부지고 단단한 인상, 눈가에 아주 옅은 잔주름. 근육량이 가장 많은 시기이고 목과 어깨가 두껍다.",
            en: "Late twenties. Solid, hardened look with very faint eye creases; heaviest muscle mass, thick neck and shoulders.",
        },
        Some(a) if a <= 33 => Band {
            ko: "30대 초반. 이마와 눈가에 주름이 보이고 피부 결이 20대보다 거칠다. 볼에 살이 빠져 얼굴선이 날카롭고, 몸은 여전히 탄탄하다.",
            en: "Early thirties. Visible forehead and eye wrinkles, coarser skin texture, leaner cheeks and sharper facial lines, still solid physique.",
        },
        Some(a) if a <= 36 => Band {
            ko: "30대 중반. 팔자주름과 눈가 주름이 뚜렷하고 관자놀이에 흰머리가 섞였다. 노련한 베테랑의 인상, 근육은 유지되지만 얼굴은 야위었다.",
            en: "Mid thirties. Pronounced nasolabial and eye wrinkles, greying at the temples, veteran look with a leaner face.",
        },
        Some(_) => Band {
            ko: "30대 후반 이상의 노장. 흰머리와 깊은 주름이 뚜렷하고 피부가 거칠며 얼굴이 야위었다. 오래 뛴 선수의 단단하지만 지친 인상.",
            en: "Late thirties or older. Clear grey hair and deep wrinkles, weathered skin, gaunt face, the hardened look of a long career.",
        },
    }
}

/// BMI로 체격을 나눈다. 키/몸무게 둘 다 있을 때만 쓴다.
fn build_look(height_cm: Option<u16>, weight_kg: Option<u16>) -> Option<Band> {
    let (height, weight) = (height_cm?, weight_kg?);
    if height < 140 {
        return None;
    }
    let meters = f64::from(height) / 100.0;
    let bmi = f64::from(weight) / (meters * meters);

    Some(if bmi < 21.0 {
        Band {
            ko: "호리호리하고 가벼운 체형. 어깨가 좁고 팔다리가 길며 군살이 없다.",
            en: "Wiry, light build: narrow shoulders, long limbs, no bulk.",
        }
    } else if bmi < 23.5 {
        Band {
            ko: "군더더기 없는 표준 운동선수 체형. 어깨 폭은 보통이고 목과 승모근이 적당히 발달했다.",
            en: "Standard athletic build: average shoulder width, moderately developed neck and traps.",
        }
    } else if bmi < 26.0 {
        Band {
            ko: "어깨와 허벅지가 두꺼운 단단한 체형. 상체 볼륨이 눈에 띈다.",
            en: "Powerful build: thick shoulders and thighs, noticeable upper-body volume.",
        }
    } else {
        Band {
            ko: "상체가 크고 육중한 체형. 목이 굵고 어깨가 넓어 유니폼이 팽팽하게 당겨진다.",
            en: "Heavy, imposing build: thick neck, broad shoulders, shirt pulled tight.",
        }
    })
}

/// 포지션별 실루엣 힌트. 전신 컷에서 특히 차이가 난다.
fn position_look(position: &str) -> Band {
    match position {
        "GK" => Band {
            ko: "골키퍼. 팀에서 가장 장신에 속하고 팔이 길다.",
            en: "Goalkeeper: among the tallest in the squad, long arms.",
        },
        "CB" | "SW" => Band {
            ko: "센터백. 키가 크고 상체가 두껍다.",
            en: "Centre-back: tall with a thick upper body.",
        },
        "LB" | "RB" | "LWB" | "RWB" => Band {
            ko: "풀백. 마르고 다리 근육이 발달한 지구력형 체형.",
            en: "Full-back: lean, endurance build with developed leg muscles.",
        },
        "DM" | "CM" => Band {
            ko: "중앙 미드필더. 균형 잡힌 표준 체형.",
            en: "Central midfielder: balanced, standard build.",
        },
        "LM" | "RM" | "LW" | "RW" => Band {
            ko: "측면 자원. 작고 날렵하며 하체가 단단한 체형.",
            en: "Wide player: smaller, quick, with a compact lower body.",
        },
        "AM" => Band {
            ko: "공격형 미드필더. 체구는 크지 않고 날렵하다.",
            en: "Attacking midfielder: not large, agile frame.",
        },
        "ST" => Band {
            ko: "스트라이커. 상체가 발달하고 몸싸움이 되는 체형.",
            en: "Striker: developed upper body built for physical duels.",
        },
        _ => Band {
            ko: "일반적인 프로 축구 선수 체형.",
            en: "Typical professional footballer build.",
        },
    }
}

fn framing_block(framing: &str, korean: bool) -> &'static str {
    match (framing, korean) {
        ("full", true) => "- 구도: 전신. 발끝까지 프레임 안에 들어오게. 정면을 보고 선 자연스러운 기립 자세, 팔은 몸 옆에 자연스럽게.\n- 비율: 세로 3:4.",
        ("full", false) => "- Framing: full body, feet inside the frame, natural standing pose facing camera, arms relaxed at the sides.\n- Aspect ratio: 3:4 portrait.",
        ("cutout", true) => "- 구도: 상반신(가슴 위) 정면 컷아웃. 배경은 완전한 단색 또는 투명으로 비우고 인물만 남긴다.\n- 비율: 정사각형 1:1, 인물 중앙.",
        ("cutout", false) => "- Framing: upper-body cutout facing camera. Background fully flat or transparent, subject only.\n- Aspect ratio: 1:1 square, subject centred.",
        (_, true) => "- 구도: 상반신(가슴 위) 정면, 카메라를 응시. 어깨가 살짝 열린 자연스러운 자세.\n- 비율: 정사각형 1:1, 인물 중앙.",
        (_, false) => "- Framing: upper body (chest up), facing and looking into the camera, shoulders slightly open.\n- Aspect ratio: 1:1 square, subject centred.",
    }
}

fn background_block(framing: &str, korean: bool) -> &'static str {
    match (framing, korean) {
        ("cutout", true) => "- 배경: 없음. 단색 또는 투명 배경.",
        ("cutout", false) => "- Background: none. Flat or transparent backdrop.",
        ("full", true) => "- 배경: 초점이 날아간 경기장 피치와 관중석. 채도가 낮은 중성 톤.",
        ("full", false) => "- Background: defocused pitch and stands, low-saturation neutral tones.",
        (_, true) => "- 배경: 초점이 날아간 경기장 관중석. 회색-녹색 계열의 중성 톤.",
        (_, false) => "- Background: defocused stadium stands in neutral grey-green tones.",
    }
}

// ================================================================================
// 프롬프트 조립
// ================================================================================

fn is_keeper(player: &PromptPlayer) -> bool {
    player.position.eq_ignore_ascii_case("GK")
}

fn kit_block(
    player: &PromptPlayer,
    request: &PortraitPromptRequest,
    kit_ref_no: Option<u8>,
    korean: bool,
) -> String {
    let keeper = is_keeper(player);
    let mut lines: Vec<String> = Vec::new();

    match (keeper, kit_ref_no) {
        // 참조 이미지가 그 포지션용으로 정확히 붙은 경우.
        (true, Some(no)) if request.has_keeper_kit => lines.push(if korean {
            format!("- {no}번 참조 이미지의 골키퍼 유니폼을 그대로 입힌다. 색 배열, 무늬, 카라 형태, 소매 길이를 참조와 동일하게 재현한다.")
        } else {
            format!("- Dress the subject in the goalkeeper kit from reference image {no}: identical colour blocking, pattern, collar shape and sleeve length.")
        }),
        (false, Some(no)) => lines.push(if korean {
            format!("- {no}번 참조 이미지의 필드 플레이어 유니폼 상의를 그대로 입힌다. 색 배열, 무늬, 카라 형태, 소매 길이를 참조와 동일하게 재현한다.")
        } else {
            format!("- Dress the subject in the outfield shirt from reference image {no}: identical colour blocking, pattern, collar shape and sleeve length.")
        }),
        // GK인데 GK 킷 참조가 없다 → 필드 킷의 구단 색만 빌려 골키퍼용으로 재해석.
        (true, Some(no)) => lines.push(if korean {
            format!("- 이 선수는 골키퍼다. {no}번 참조는 필드 플레이어 킷이므로 그대로 입히지 말고, 그 구단 색 계열을 유지한 별도의 골키퍼 유니폼으로 바꿔 입힌다: 긴팔 상의, 필드 킷과 대비되는 톤, 골키퍼 장갑 착용.")
        } else {
            format!("- This player is a goalkeeper. Reference {no} is the outfield kit, so do not copy it directly: build a separate goalkeeper kit in the same club colours - long sleeves, a tone that contrasts with the outfield shirt, goalkeeper gloves.")
        }),
        (keeper, None) => lines.push(if korean {
            format!(
                "- {}의 유니폼을 입힌다.{}",
                request.club_name,
                if keeper {
                    " 골키퍼 유니폼(긴팔, 장갑 착용)."
                } else {
                    ""
                }
            )
        } else {
            format!(
                "- Dress the subject in the {} kit.{}",
                request.club_name,
                if keeper {
                    " Goalkeeper kit: long sleeves, gloves."
                } else {
                    ""
                }
            )
        }),
    }

    let note = request.kit_note.trim();
    if !note.is_empty() {
        lines.push(if korean {
            format!("- 킷 추가 지시: {note}")
        } else {
            format!("- Extra kit instruction: {note}")
        });
    }

    lines.push(if korean {
        "- 가슴의 스폰서 문구와 브랜드 로고는 넣지 말고 무지로 비운다.".to_string()
    } else {
        "- Leave the chest blank: no sponsor text, no brand logos.".to_string()
    });

    lines.join("\n")
}

fn identity_block(player: &PromptPlayer, has_face: bool, korean: bool) -> String {
    if has_face {
        return if korean {
            "- 1번 참조 이미지의 인물과 같은 사람으로 보여야 한다. 이목구비 배치, 얼굴형, 피부톤, 머리색과 헤어스타일, 눈썹, 수염 유무를 그대로 가져간다.\n- 얼굴을 미화하거나 더 잘생기게 고치지 말고, 인종적 특징을 바꾸지 않는다."
                .to_string()
        } else {
            "- The result must read as the same person as reference image 1: same feature placement, face shape, skin tone, hair colour and style, eyebrows, facial hair.\n- Do not beautify or restyle the face, and do not change ethnicity."
                .to_string()
        };
    }

    // 얼굴 참조가 없으면(페이스팩에 없는 선수) 국적·나이로 최소한의 외모를 지정한다.
    let nation = player.nation.as_deref().unwrap_or("");
    if korean {
        let origin = if nation.is_empty() {
            "얼굴 참조 이미지가 없다. 아래 조건에 맞는 가상의 인물을 새로 만든다.".to_string()
        } else {
            format!("얼굴 참조 이미지가 없다. {nation} 출신으로 보이는 외모의 가상 인물을 새로 만든다.")
        };
        format!("- {origin}\n- 실존 인물과 닮게 만들지 않는다.")
    } else {
        let origin = if nation.is_empty() {
            "No face reference is attached: invent a new fictional person matching the details below.".to_string()
        } else {
            format!("No face reference is attached: invent a new fictional person who plausibly looks {nation}.")
        };
        format!("- {origin}\n- Do not resemble any real person.")
    }
}

fn facts_block(player: &PromptPlayer, request: &PortraitPromptRequest, korean: bool) -> String {
    let mut lines = Vec::new();
    if korean {
        lines.push(format!(
            "- 소속: {} ({})",
            request.club_name, player.squad_label
        ));
        lines.push(match player.age {
            Some(age) => format!("- 나이: {age}세"),
            None => "- 나이: 미상".to_string(),
        });
        if let Some(nation) = player.nation.as_deref().filter(|n| !n.is_empty()) {
            lines.push(format!("- 국적: {nation}"));
        }
        lines.push(format!("- 포지션: {}", player.position));
        match (player.height_cm, player.weight_kg) {
            (Some(h), Some(w)) => lines.push(format!("- 신체: {h}cm / {w}kg")),
            (Some(h), None) => lines.push(format!("- 신체: {h}cm")),
            (None, Some(w)) => lines.push(format!("- 신체: {w}kg")),
            (None, None) => {}
        }
        if !player.foot.is_empty() {
            lines.push(format!("- 주발: {}", player.foot));
        }
    } else {
        lines.push(format!(
            "- Club: {} ({})",
            request.club_name, player.squad_label
        ));
        lines.push(match player.age {
            Some(age) => format!("- Age: {age}"),
            None => "- Age: unknown".to_string(),
        });
        if let Some(nation) = player.nation.as_deref().filter(|n| !n.is_empty()) {
            lines.push(format!("- Nationality: {nation}"));
        }
        lines.push(format!("- Position: {}", player.position));
        match (player.height_cm, player.weight_kg) {
            (Some(h), Some(w)) => lines.push(format!("- Physique: {h}cm / {w}kg")),
            (Some(h), None) => lines.push(format!("- Height: {h}cm")),
            (None, Some(w)) => lines.push(format!("- Weight: {w}kg")),
            (None, None) => {}
        }
    }
    lines.join("\n")
}

fn attachment_block(has_face: bool, kit_ref_no: Option<u8>, korean: bool) -> String {
    let mut lines = Vec::new();
    if has_face {
        lines.push(if korean {
            "1번: 얼굴 참조 (이 사람의 얼굴을 유지)".to_string()
        } else {
            "1: face reference (keep this person's face)".to_string()
        });
    }
    if let Some(no) = kit_ref_no {
        lines.push(if korean {
            format!("{no}번: 유니폼 참조 (이 킷을 재현)")
        } else {
            format!("{no}: kit reference (reproduce this kit)")
        });
    }
    if lines.is_empty() {
        return if korean {
            "첨부 이미지 없음. 아래 서술만으로 생성한다.".to_string()
        } else {
            "No attachments. Generate from the description below only.".to_string()
        };
    }
    lines.join("\n")
}

pub(crate) fn build_prompt(
    player: &PromptPlayer,
    request: &PortraitPromptRequest,
    has_face: bool,
) -> String {
    let korean = request.language != "en";
    let keeper = is_keeper(player);

    // 첨부 순서: 얼굴이 있으면 얼굴이 1번, 킷이 2번. 얼굴이 없으면 킷이 1번.
    let kit_available = if keeper {
        request.has_keeper_kit || request.has_field_kit
    } else {
        request.has_field_kit
    };
    let kit_ref_no = if kit_available {
        Some(if has_face { 2 } else { 1 })
    } else {
        None
    };

    let mut out = String::new();
    let age = age_look(player.age);
    let position = position_look(&player.position);
    let build = build_look(player.height_cm, player.weight_kg);

    if korean {
        out.push_str("[축구 선수 프로필 사진 생성]\n\n");
        out.push_str("■ 첨부 이미지\n");
        out.push_str(&attachment_block(has_face, kit_ref_no, true));
        out.push_str("\n\n■ 인물 정보\n");
        out.push_str(&facts_block(player, request, true));
        out.push_str("\n\n■ 얼굴\n");
        out.push_str(&identity_block(player, has_face, true));
        out.push_str("\n\n■ 나이대 (반드시 반영)\n- ");
        out.push_str(age.pick(true));
        out.push_str("\n\n■ 체격\n- ");
        out.push_str(position.pick(true));
        if let Some(build) = &build {
            out.push_str("\n- ");
            out.push_str(build.pick(true));
        }
        out.push_str("\n\n■ 복장\n");
        out.push_str(&kit_block(player, request, kit_ref_no, true));
        out.push_str("\n\n■ 촬영\n");
        out.push_str("- 구단 공식 프로필 촬영 스타일의 실사 사진. 일러스트나 3D 렌더가 아니라 실제 카메라로 찍은 사진처럼.\n");
        out.push_str("- 85mm 인물 렌즈, f/2.8, 얕은 심도.\n");
        out.push_str("- 조명: 부드러운 키라이트에 은은한 림라이트. 그림자는 자연스럽게.\n");
        out.push_str("- 표정: 담담하고 진지하게. 과장된 미소 금지.\n");
        out.push_str(framing_block(&request.framing, true));
        out.push('\n');
        out.push_str(background_block(&request.framing, true));
        out.push_str("\n\n■ 금지\n");
        out.push_str("- 얼굴 미화, 이목구비 변형, 피부톤·인종 변경, 실제 나이와 다른 나이로 만들기.\n");
        out.push_str("- 이미지 안에 글자, 등번호, 워터마크, 로고 삽입.\n");
        out.push_str("- 실존 브랜드 로고나 실제 스폰서 재현.\n");
        out.push_str("\n결과물 1장.");
    } else {
        out.push_str("[Football player profile photo]\n\n");
        out.push_str("# Attachments\n");
        out.push_str(&attachment_block(has_face, kit_ref_no, false));
        out.push_str("\n\n# Subject\n");
        out.push_str(&facts_block(player, request, false));
        out.push_str("\n\n# Face\n");
        out.push_str(&identity_block(player, has_face, false));
        out.push_str("\n\n# Age rendering (must be respected)\n- ");
        out.push_str(age.pick(false));
        out.push_str("\n\n# Build\n- ");
        out.push_str(position.pick(false));
        if let Some(build) = &build {
            out.push_str("\n- ");
            out.push_str(build.pick(false));
        }
        out.push_str("\n\n# Kit\n");
        out.push_str(&kit_block(player, request, kit_ref_no, false));
        out.push_str("\n\n# Photography\n");
        out.push_str("- Photorealistic club media-day portrait. A real camera photograph, not an illustration or 3D render.\n");
        out.push_str("- 85mm portrait lens, f/2.8, shallow depth of field.\n");
        out.push_str("- Lighting: soft key light with a subtle rim light, natural shadows.\n");
        out.push_str("- Expression: calm and serious, no exaggerated smile.\n");
        out.push_str(framing_block(&request.framing, false));
        out.push('\n');
        out.push_str(background_block(&request.framing, false));
        out.push_str("\n\n# Do not\n");
        out.push_str("- Beautify or restyle the face, change skin tone or ethnicity, or shift the apparent age.\n");
        out.push_str("- Render any text, shirt number, watermark or logo.\n");
        out.push_str("- Reproduce real brand marks or real sponsors.\n");
        out.push_str("\nReturn one image.");
    }

    out
}

pub(crate) fn build_prompts(request: &PortraitPromptRequest) -> Vec<PortraitPrompt> {
    request
        .players
        .iter()
        .map(|player| {
            let has_face = find_face_file(player.uid)
                .ok()
                .flatten()
                .is_some();
            PortraitPrompt {
                uid: player.uid,
                name: player.name.clone(),
                prompt: build_prompt(player, request, has_face),
                has_face,
                is_keeper: is_keeper(player),
            }
        })
        .collect()
}

// ================================================================================
// 내보내기
// ================================================================================

/// Windows 파일명에 못 쓰는 문자를 걷어낸다. 빈 문자열이 되면 fallback.
fn safe_name(raw: &str, fallback: &str) -> String {
    let cleaned: String = raw
        .chars()
        .map(|ch| match ch {
            '\\' | '/' | ':' | '*' | '?' | '"' | '<' | '>' | '|' => '_',
            ch if ch.is_control() => '_',
            ch => ch,
        })
        .collect();
    let trimmed = cleaned.trim().trim_matches('.').trim();
    if trimmed.is_empty() {
        fallback.to_string()
    } else if trimmed.chars().count() > 48 {
        trimmed.chars().take(48).collect()
    } else {
        trimmed.to_string()
    }
}

fn copy_kit(root: &Path, folder: &Path, stem: &str, out_name: &str) -> Option<String> {
    for ext in ["png", "jpg", "jpeg", "webp"] {
        let source = root.join("kit").join(format!("{stem}.{ext}"));
        if source.is_file() {
            let target = folder.join(format!("{out_name}.{ext}"));
            if fs::copy(&source, &target).is_ok() {
                return Some(format!("{out_name}.{ext}"));
            }
        }
    }
    None
}

pub(crate) fn export(
    request: &PortraitPromptRequest,
    label: &str,
) -> Result<ExportResult, String> {
    if request.players.is_empty() {
        return Err("내보낼 선수가 없습니다.".to_string());
    }

    let root = studio_root()?;
    let folder_name = format!(
        "{}-{}",
        safe_name(&request.club_name, "club"),
        safe_name(label, "export")
    );
    let folder: PathBuf = root.join("export").join(&folder_name);
    let players_dir = folder.join("players");
    fs::create_dir_all(&players_dir)
        .map_err(|err| format!("내보내기 폴더를 만들지 못했습니다: {err}"))?;

    let field_kit = copy_kit(&root, &folder, "field", "kit-field");
    let keeper_kit = copy_kit(&root, &folder, "keeper", "kit-keeper");

    let prompts = build_prompts(request);
    let korean = request.language != "en";

    let mut index = String::new();
    index.push_str(&format!("# {} 포토 스튜디오 프롬프트\n\n", request.club_name));
    index.push_str(&format!("선수 {}명\n\n", prompts.len()));
    index.push_str("## 쓰는 법\n\n");
    index.push_str("1. 구독형 모델(ChatGPT / Gemini 등) 새 대화를 연다.\n");
    match (&field_kit, &keeper_kit) {
        (Some(field), Some(keeper)) => index.push_str(&format!(
            "2. 선수 폴더의 `face.png`를 첫 번째로, 유니폼 참조(`{field}`, 골키퍼는 `{keeper}`)를 두 번째로 첨부한다.\n"
        )),
        (Some(field), None) => index.push_str(&format!(
            "2. 선수 폴더의 `face.png`를 첫 번째로, 유니폼 참조 `{field}`를 두 번째로 첨부한다.\n"
        )),
        _ => index.push_str("2. 선수 폴더의 `face.png`를 첨부한다. (유니폼 참조 이미지는 등록되지 않았다)\n"),
    }
    index.push_str("3. 같은 폴더의 `prompt.txt` 내용을 그대로 붙여넣는다.\n");
    index.push_str("4. 받은 이미지를 저장한 뒤, 앱의 포토 스튜디오에서 해당 선수 카드에 넣으면 얼굴 대신 표시된다.\n\n");
    index.push_str("얼굴 참조가 없는 선수(`face.png` 없음)는 프롬프트가 국적·나이 서술로 대체돼 있다.\n\n");
    index.push_str("## 선수 목록\n\n");
    index.push_str("| # | 선수 | UID | 폴더 | 얼굴 |\n|---|---|---|---|---|\n");

    let mut face_count = 0usize;
    let mut missing_face_uids = Vec::new();

    for (position, prompt) in prompts.iter().enumerate() {
        let display_name = prompt
            .name
            .clone()
            .unwrap_or_else(|| format!("UID {}", prompt.uid));
        let dir_name = format!(
            "{:02}_{}_{}",
            position + 1,
            safe_name(&display_name, "player"),
            prompt.uid
        );
        let player_dir = players_dir.join(&dir_name);
        fs::create_dir_all(&player_dir)
            .map_err(|err| format!("선수 폴더를 만들지 못했습니다: {err}"))?;

        fs::write(player_dir.join("prompt.txt"), &prompt.prompt)
            .map_err(|err| format!("프롬프트를 저장하지 못했습니다: {err}"))?;

        let mut face_mark = "-";
        if let Some((face_path, _)) = find_face_file(prompt.uid)? {
            let ext = face_path
                .extension()
                .and_then(|ext| ext.to_str())
                .unwrap_or("png")
                .to_string();
            if fs::copy(&face_path, player_dir.join(format!("face.{ext}"))).is_ok() {
                face_count += 1;
                face_mark = "O";
            }
        }
        if face_mark == "-" {
            missing_face_uids.push(prompt.uid);
        }

        index.push_str(&format!(
            "| {} | {} | {} | `{}` | {} |\n",
            position + 1,
            display_name,
            prompt.uid,
            dir_name,
            face_mark
        ));
    }

    // 프롬프트를 한 파일로도 남긴다. 폴더를 안 열고 훑고 싶을 때 쓴다.
    let mut all = String::new();
    all.push_str(&format!(
        "# {} — 프롬프트 모음 ({})\n\n",
        request.club_name,
        if korean { "한국어" } else { "English" }
    ));
    for (position, prompt) in prompts.iter().enumerate() {
        let display_name = prompt
            .name
            .clone()
            .unwrap_or_else(|| format!("UID {}", prompt.uid));
        all.push_str(&format!(
            "\n---\n\n## {:02}. {} (UID {})\n\n```\n{}\n```\n",
            position + 1,
            display_name,
            prompt.uid,
            prompt.prompt
        ));
    }

    fs::write(folder.join("README.md"), index)
        .map_err(|err| format!("안내 파일을 저장하지 못했습니다: {err}"))?;
    fs::write(folder.join("prompts.md"), all)
        .map_err(|err| format!("프롬프트 모음을 저장하지 못했습니다: {err}"))?;

    Ok(ExportResult {
        folder: folder.to_string_lossy().to_string(),
        player_count: prompts.len(),
        face_count,
        missing_face_uids,
    })
}

#[cfg(test)]
mod tests {
    use super::*;

    fn player(age: u16, position: &str) -> PromptPlayer {
        PromptPlayer {
            uid: 1234,
            name: Some("테스트".to_string()),
            position: position.to_string(),
            squad_label: "1군".to_string(),
            age: Some(age),
            nation: Some("대한민국".to_string()),
            height_cm: Some(183),
            weight_kg: Some(78),
            foot: "오른발".to_string(),
        }
    }

    fn request(players: Vec<PromptPlayer>) -> PortraitPromptRequest {
        PortraitPromptRequest {
            club_name: "테스트 FC".to_string(),
            kit_note: String::new(),
            framing: "upper".to_string(),
            language: "ko".to_string(),
            has_field_kit: true,
            has_keeper_kit: false,
            players,
        }
    }

    #[test]
    fn age_changes_the_face_description() {
        let req = request(vec![]);
        let young = build_prompt(&player(17, "ST"), &req, true);
        let old = build_prompt(&player(35, "ST"), &req, true);
        assert!(young.contains("10대 후반"));
        assert!(old.contains("30대 중반"));
        assert_ne!(young, old);
    }

    #[test]
    fn keeper_without_keeper_kit_gets_a_separate_kit_instruction() {
        let req = request(vec![]);
        let keeper = build_prompt(&player(28, "GK"), &req, true);
        assert!(keeper.contains("골키퍼"));
        assert!(keeper.contains("장갑"));
    }

    #[test]
    fn kit_becomes_attachment_one_when_there_is_no_face() {
        let req = request(vec![]);
        let faceless = build_prompt(&player(24, "CM"), &req, false);
        assert!(faceless.contains("1번: 유니폼 참조"));
        assert!(faceless.contains("얼굴 참조 이미지가 없다"));
    }

    #[test]
    fn name_never_reaches_the_prompt() {
        let req = request(vec![]);
        let mut named = player(24, "CM");
        // 구단명과 겹치지 않는 이름이어야 검사가 의미 있다.
        named.name = Some("고유선수이름".to_string());
        let prompt = build_prompt(&named, &req, true);
        assert!(!prompt.contains("고유선수이름"), "선수 이름이 프롬프트에 들어갔다");
    }

}
