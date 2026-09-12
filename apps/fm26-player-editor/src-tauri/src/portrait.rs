//! 포토 스튜디오 — 스쿼드 선수를 "구단 유니폼 입은 실사 인물 사진"으로 바꾸기 위한
//! 생성 프롬프트를 만들고, 얼굴/킷 참조 이미지와 함께 내보낸다.
//!
//! 이미지 생성 자체는 앱이 하지 않는다. 사용자가 구독형 모델(ChatGPT/Gemini 등)에
//! 프롬프트와 첨부 이미지를 붙여넣고, 받은 결과물을 다시 앱에 넣으면 얼굴 대신 표시된다.

use base64::engine::general_purpose::STANDARD as BASE64;
use base64::Engine;
use serde::{Deserialize, Serialize};
use std::fs;
use std::path::{Path, PathBuf};

use crate::media::find_face_file;

/// 참조 이미지 1장의 최대 크기. 구독형 모델 업로드 한도를 넘길 이유가 없다.
const MAX_IMAGE_BYTES: usize = 16 * 1024 * 1024;

#[derive(Serialize, Clone)]
#[serde(rename_all = "camelCase")]
pub(super) struct KitReference {
    pub slot: String,
    pub path: String,
    pub file_name: String,
    pub data_uri: String,
}

#[derive(Serialize)]
#[serde(rename_all = "camelCase")]
pub(super) struct StudioState {
    pub root: String,
    pub kit_field: Option<KitReference>,
    pub kit_keeper: Option<KitReference>,
    pub generated_uids: Vec<u32>,
}

#[derive(Serialize)]
#[serde(rename_all = "camelCase")]
pub(super) struct PortraitImage {
    /// data URI. 없으면 None.
    pub src: Option<String>,
    /// "generated" | "face" | "none"
    pub kind: &'static str,
}

#[derive(Deserialize, Clone)]
#[serde(rename_all = "camelCase")]
pub(super) struct PromptPlayer {
    pub uid: u32,
    pub name: Option<String>,
    pub position: String,
    pub squad_label: String,
    pub age: Option<u16>,
    pub nation: Option<String>,
    pub height_cm: Option<u16>,
    pub weight_kg: Option<u16>,
    pub foot: String,
}

#[derive(Deserialize)]
#[serde(rename_all = "camelCase")]
pub(super) struct PortraitPromptRequest {
    pub club_name: String,
    /// 킷 추가 설명(선택). 참조 이미지로 안 잡히는 것을 적는 칸.
    #[serde(default)]
    pub kit_note: String,
    /// "upper" | "full" | "cutout"
    pub framing: String,
    /// "ko" | "en"
    pub language: String,
    /// 필드 킷 참조 이미지 등록 여부.
    pub has_field_kit: bool,
    /// GK 킷 참조 이미지 등록 여부.
    pub has_keeper_kit: bool,
    pub players: Vec<PromptPlayer>,
}

#[derive(Serialize)]
#[serde(rename_all = "camelCase")]
pub(super) struct PortraitPrompt {
    pub uid: u32,
    pub name: Option<String>,
    pub prompt: String,
    /// 페이스팩 얼굴이 있는지. 없으면 프롬프트가 텍스트 묘사로 대체된다.
    pub has_face: bool,
    pub is_keeper: bool,
}

#[derive(Serialize)]
#[serde(rename_all = "camelCase")]
pub(super) struct ExportResult {
    pub folder: String,
    pub player_count: usize,
    pub face_count: usize,
    pub missing_face_uids: Vec<u32>,
}

// ================================================================================
// 경로
// ================================================================================

pub(super) fn studio_root() -> Result<PathBuf, String> {
    let home = std::env::var_os("USERPROFILE")
        .ok_or_else(|| "USERPROFILE 환경변수를 읽지 못했습니다.".to_string())?;
    let root = PathBuf::from(home)
        .join("Documents")
        .join("FM26 Player Editor")
        .join("studio");
    for sub in ["kit", "generated", "export"] {
        fs::create_dir_all(root.join(sub))
            .map_err(|err| format!("스튜디오 폴더를 만들지 못했습니다: {err}"))?;
    }
    Ok(root)
}

fn slot_stem(slot: &str) -> Result<&'static str, String> {
    match slot {
        "field" => Ok("field"),
        "keeper" => Ok("keeper"),
        _ => Err("킷 슬롯은 field 또는 keeper 여야 합니다.".to_string()),
    }
}

fn mime_for(ext: &str) -> Option<&'static str> {
    match ext {
        "png" => Some("image/png"),
        "jpg" | "jpeg" => Some("image/jpeg"),
        "webp" => Some("image/webp"),
        _ => None,
    }
}

fn find_slot_file(root: &Path, stem: &str) -> Option<(PathBuf, &'static str)> {
    for ext in ["png", "jpg", "jpeg", "webp"] {
        let path = root.join("kit").join(format!("{stem}.{ext}"));
        if path.is_file() {
            return mime_for(ext).map(|mime| (path, mime));
        }
    }
    None
}

fn to_data_uri(path: &Path, mime: &str) -> Result<String, String> {
    let bytes = fs::read(path).map_err(|err| format!("이미지를 읽지 못했습니다: {err}"))?;
    Ok(format!("data:{mime};base64,{}", BASE64.encode(bytes)))
}

fn read_kit(root: &Path, slot: &str) -> Option<KitReference> {
    let stem = slot_stem(slot).ok()?;
    let (path, mime) = find_slot_file(root, stem)?;
    let data_uri = to_data_uri(&path, mime).ok()?;
    Some(KitReference {
        slot: slot.to_string(),
        file_name: path
            .file_name()
            .map(|name| name.to_string_lossy().to_string())
            .unwrap_or_default(),
        path: path.to_string_lossy().to_string(),
        data_uri,
    })
}

// ================================================================================
// 상태 / 파일 입출력
// ================================================================================

pub(super) fn state() -> Result<StudioState, String> {
    let root = studio_root()?;
    let mut generated_uids = Vec::new();
    if let Ok(entries) = fs::read_dir(root.join("generated")) {
        for entry in entries.flatten() {
            let path = entry.path();
            if path.extension().and_then(|ext| ext.to_str()) != Some("png") {
                continue;
            }
            if let Some(uid) = path
                .file_stem()
                .and_then(|stem| stem.to_str())
                .and_then(|stem| stem.parse::<u32>().ok())
            {
                generated_uids.push(uid);
            }
        }
    }
    generated_uids.sort_unstable();

    Ok(StudioState {
        kit_field: read_kit(&root, "field"),
        kit_keeper: read_kit(&root, "keeper"),
        generated_uids,
        root: root.to_string_lossy().to_string(),
    })
}

fn decode_payload(data_base64: &str) -> Result<Vec<u8>, String> {
    // "data:image/png;base64,..." 형태로 와도 받아준다.
    let payload = data_base64
        .rsplit_once("base64,")
        .map(|(_, rest)| rest)
        .unwrap_or(data_base64);
    let bytes = BASE64
        .decode(payload.trim())
        .map_err(|err| format!("이미지 데이터를 해석하지 못했습니다: {err}"))?;
    if bytes.is_empty() {
        return Err("빈 이미지입니다.".to_string());
    }
    if bytes.len() > MAX_IMAGE_BYTES {
        return Err(format!(
            "이미지가 너무 큽니다 ({:.1}MB). 16MB 이하로 줄여주세요.",
            bytes.len() as f64 / (1024.0 * 1024.0)
        ));
    }
    Ok(bytes)
}

fn extension_of(file_name: &str) -> Result<&'static str, String> {
    let ext = Path::new(file_name)
        .extension()
        .and_then(|ext| ext.to_str())
        .unwrap_or("png")
        .to_ascii_lowercase();
    match ext.as_str() {
        "png" => Ok("png"),
        "jpg" | "jpeg" => Ok("jpg"),
        "webp" => Ok("webp"),
        other => Err(format!(
            "지원하지 않는 이미지 형식입니다: .{other} (png/jpg/webp만 됩니다)"
        )),
    }
}

/// 저장된 바이트의 매직 넘버로 MIME을 판정한다. 확장자를 믿지 않는다.
fn sniff_mime(bytes: &[u8]) -> &'static str {
    if bytes.starts_with(&[0x89, b'P', b'N', b'G']) {
        "image/png"
    } else if bytes.starts_with(&[0xff, 0xd8, 0xff]) {
        "image/jpeg"
    } else if bytes.len() > 12 && &bytes[0..4] == b"RIFF" && &bytes[8..12] == b"WEBP" {
        "image/webp"
    } else {
        "image/png"
    }
}

pub(super) fn save_kit(
    slot: &str,
    file_name: &str,
    data_base64: &str,
) -> Result<KitReference, String> {
    let stem = slot_stem(slot)?;
    let ext = extension_of(file_name)?;
    let bytes = decode_payload(data_base64)?;
    let root = studio_root()?;

    // 같은 슬롯의 옛 확장자 파일이 남아 조회에서 먼저 잡히는 일이 없게 먼저 지운다.
    clear_kit(slot)?;

    let path = root.join("kit").join(format!("{stem}.{ext}"));
    fs::write(&path, &bytes).map_err(|err| format!("킷 이미지를 저장하지 못했습니다: {err}"))?;

    read_kit(&root, slot).ok_or_else(|| "저장한 킷 이미지를 다시 읽지 못했습니다.".to_string())
}

pub(super) fn clear_kit(slot: &str) -> Result<(), String> {
    let stem = slot_stem(slot)?;
    let root = studio_root()?;
    for ext in ["png", "jpg", "jpeg", "webp"] {
        let path = root.join("kit").join(format!("{stem}.{ext}"));
        if path.is_file() {
            fs::remove_file(&path).map_err(|err| format!("킷 이미지를 지우지 못했습니다: {err}"))?;
        }
    }
    Ok(())
}

fn generated_path(root: &Path, uid: u32) -> PathBuf {
    root.join("generated").join(format!("{uid}.png"))
}

pub(super) fn save_generated(uid: u32, data_base64: &str) -> Result<String, String> {
    if uid == 0 {
        return Err("선수 UID가 없습니다.".to_string());
    }
    let bytes = decode_payload(data_base64)?;
    let root = studio_root()?;
    let path = generated_path(&root, uid);
    // 확장자와 무관하게 <uid>.png 이름으로 저장한다. 원본 바이트는 건드리지 않고
    // data URI만 실제 형식에 맞춰 돌려준다.
    fs::write(&path, &bytes).map_err(|err| format!("생성 이미지를 저장하지 못했습니다: {err}"))?;
    Ok(format!(
        "data:{};base64,{}",
        sniff_mime(&bytes),
        BASE64.encode(&bytes)
    ))
}

pub(super) fn delete_generated(uid: u32) -> Result<(), String> {
    let root = studio_root()?;
    let path = generated_path(&root, uid);
    if path.is_file() {
        fs::remove_file(&path).map_err(|err| format!("생성 이미지를 지우지 못했습니다: {err}"))?;
    }
    Ok(())
}

/// 생성본이 있으면 그것을, 없으면 페이스팩 얼굴을 돌려준다.
pub(super) fn player_image(uid: u32) -> Result<PortraitImage, String> {
    let root = studio_root()?;
    let path = generated_path(&root, uid);
    if path.is_file() {
        let bytes = fs::read(&path).map_err(|err| format!("생성 이미지를 읽지 못했습니다: {err}"))?;
        return Ok(PortraitImage {
            src: Some(format!(
                "data:{};base64,{}",
                sniff_mime(&bytes),
                BASE64.encode(&bytes)
            )),
            kind: "generated",
        });
    }

    match find_face_file(uid)? {
        Some((face_path, mime)) => Ok(PortraitImage {
            src: Some(to_data_uri(&face_path, mime)?),
            kind: "face",
        }),
        None => Ok(PortraitImage {
            src: None,
            kind: "none",
        }),
    }
}
