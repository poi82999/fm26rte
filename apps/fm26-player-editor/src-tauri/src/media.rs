use std::collections::HashMap;
use std::ffi::OsStr;
use std::fs;
use std::path::{Path, PathBuf};
use std::sync::OnceLock;

#[derive(Default, Clone)]
struct FaceEntry {
    portrait: Option<PathBuf>,
    icon: Option<PathBuf>,
}

static INDEX: OnceLock<HashMap<String, FaceEntry>> = OnceLock::new();

pub(super) fn find_face_file(uid: u32) -> Result<Option<(PathBuf, &'static str)>, String> {
    let index = INDEX.get_or_init(build_index);

    let mut keys: Vec<String> = Vec::with_capacity(3);
    keys.push(uid.to_string());
    keys.push(format!("r-{uid}"));
    if uid >= 0x8000_0000 {
        let abs = (!uid).wrapping_add(1);
        keys.push(format!("r-{abs}"));
    }

    for key in &keys {
        if let Some(entry) = index.get(key) {
            if let Some(path) = entry.portrait.as_ref().filter(|p| p.is_file()) {
                return Ok(Some((path.clone(), "image/png")));
            }
            if let Some(path) = entry.icon.as_ref().filter(|p| p.is_file()) {
                return Ok(Some((path.clone(), "image/png")));
            }
        }
    }

    legacy_lookup(uid)
}

fn legacy_lookup(uid: u32) -> Result<Option<(PathBuf, &'static str)>, String> {
    let exe = std::env::current_exe()
        .map_err(|err| format!("실행 파일 위치를 찾지 못했습니다: {err}"))?;
    let app_dir = exe
        .parent()
        .ok_or("실행 파일 폴더를 찾지 못했습니다.".to_string())?;
    let candidates = [
        (app_dir.join("faces"), uid),
        (Path::new(".").join("faces"), uid),
    ];
    let exts = [
        ("png", "image/png"),
        ("jpg", "image/jpeg"),
        ("jpeg", "image/jpeg"),
        ("webp", "image/webp"),
    ];

    for (dir, id) in candidates {
        for (ext, mime) in exts {
            let path = dir.join(format!("{id}.{ext}"));
            if path.is_file() {
                return Ok(Some((path, mime)));
            }
        }
    }
    Ok(None)
}

fn build_index() -> HashMap<String, FaceEntry> {
    let mut index: HashMap<String, FaceEntry> = HashMap::new();
    if let Some(root) = graphics_root() {
        walk_and_parse(&root, &mut index);
    }
    index
}

fn graphics_root() -> Option<PathBuf> {
    let home = std::env::var_os("USERPROFILE")?;
    let path = PathBuf::from(home)
        .join("Documents")
        .join("Sports Interactive")
        .join("Football Manager 26")
        .join("graphics");
    if path.is_dir() {
        Some(path)
    } else {
        None
    }
}

fn walk_and_parse(dir: &Path, index: &mut HashMap<String, FaceEntry>) {
    let Ok(entries) = fs::read_dir(dir) else {
        return;
    };
    let mut subdirs: Vec<PathBuf> = Vec::new();
    let mut config_path: Option<PathBuf> = None;
    for entry in entries.flatten() {
        let Ok(ft) = entry.file_type() else {
            continue;
        };
        let path = entry.path();
        if ft.is_dir() {
            subdirs.push(path);
        } else if ft.is_file() && path.file_name() == Some(OsStr::new("config.xml")) {
            config_path = Some(path);
        }
    }
    if let Some(cfg) = config_path {
        parse_config(&cfg, dir, index);
    }
    for sub in subdirs {
        walk_and_parse(&sub, index);
    }
}

fn parse_config(config_path: &Path, base_dir: &Path, index: &mut HashMap<String, FaceEntry>) {
    let Ok(content) = fs::read_to_string(config_path) else {
        return;
    };
    for line in content.lines() {
        let trimmed = line.trim();
        if !trimmed.starts_with("<record ") {
            continue;
        }
        let Some(from) = extract_attr(trimmed, "from=\"") else {
            continue;
        };
        let Some(to) = extract_attr(trimmed, "to=\"") else {
            continue;
        };
        let Some(rest) = to.strip_prefix("graphics/pictures/person/") else {
            continue;
        };
        let Some((uid_key, kind)) = rest.rsplit_once('/') else {
            continue;
        };
        if kind != "portrait" && kind != "icon" {
            continue;
        }
        let png_path = base_dir.join(format!("{from}.png"));
        let entry = index.entry(uid_key.to_string()).or_default();
        match kind {
            "portrait" => {
                if entry.portrait.is_none() {
                    entry.portrait = Some(png_path);
                }
            }
            "icon" => {
                if entry.icon.is_none() {
                    entry.icon = Some(png_path);
                }
            }
            _ => {}
        }
    }
}

fn extract_attr<'a>(line: &'a str, prefix: &str) -> Option<&'a str> {
    let start = line.find(prefix)? + prefix.len();
    let rest = &line[start..];
    let end = rest.find('"')?;
    Some(&rest[..end])
}
