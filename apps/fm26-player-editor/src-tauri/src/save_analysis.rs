use lzma_rs::lzma_decompress;
use serde::{Deserialize, Serialize};
use std::fs;
use std::io::{Read, Seek, SeekFrom};
use std::path::Path;

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct SaveFileHeader {
    /// First 16 bytes of the .fm file
    pub magic: Vec<u8>,
    /// Hex representation of magic
    pub magic_hex: String,
    /// File size in bytes
    pub file_size: u64,
    /// Detected compression format (LZMA, LZ4, None, etc)
    pub compression: String,
    /// First few chunks identified
    pub chunks_preview: Vec<ChunkInfo>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct ChunkInfo {
    pub offset: u64,
    pub length: u32,
    pub type_tag: Option<u32>,
    pub preview: String,
}

/// Analyze FM26 save file header and container structure
pub fn analyze_save_header(path: &str) -> Result<SaveFileHeader, String> {
    let file_path = Path::new(path);

    if !file_path.exists() {
        return Err(format!("File not found: {}", path));
    }

    let metadata =
        fs::metadata(file_path).map_err(|e| format!("Failed to read file metadata: {}", e))?;

    let file_size = metadata.len();

    let mut file = fs::File::open(file_path).map_err(|e| format!("Failed to open file: {}", e))?;

    // Read first 32 bytes for header analysis
    let mut header_buf = vec![0u8; 32.min(file_size as usize)];
    let buf_len = header_buf.len();
    file.read_exact(&mut header_buf[..buf_len])
        .map_err(|e| format!("Failed to read header: {}", e))?;

    let magic_hex = hex_encode(&header_buf[..16.min(buf_len)]);

    // Detect compression format
    let compression = detect_compression(&header_buf);

    // Scan for chunks
    let chunks_preview = scan_chunks(&mut file, file_size)?;

    Ok(SaveFileHeader {
        magic: header_buf[..16.min(buf_len)].to_vec(),
        magic_hex,
        file_size,
        compression,
        chunks_preview,
    })
}

fn hex_encode(data: &[u8]) -> String {
    data.iter()
        .map(|b| format!("{:02x}", b))
        .collect::<Vec<_>>()
        .join(" ")
}

fn detect_compression(header: &[u8]) -> String {
    if header.len() < 4 {
        return "unknown".to_string();
    }

    // LZMA signature: 5D 00 00 00 xx
    if header.len() >= 5 && header[0] == 0x5D && header[1..4] == [0, 0, 0] {
        return "LZMA".to_string();
    }

    // LZ4 signature: 04 22 4D 18
    if header.len() >= 4 && header[0..4] == [0x04, 0x22, 0x4D, 0x18] {
        return "LZ4".to_string();
    }

    // zlib signature: 78 9C / 78 01
    if header.len() >= 2 && header[0] == 0x78 && (header[1] == 0x9C || header[1] == 0x01) {
        return "zlib".to_string();
    }

    // SI custom wrapper check: look for length fields
    // Often starts with version+padding or type tag
    if header.len() >= 8 {
        let u32_le = u32::from_le_bytes([header[0], header[1], header[2], header[3]]);
        let u32_be = u32::from_be_bytes([header[0], header[1], header[2], header[3]]);

        // If first 4 bytes look like a version or small ID
        if u32_le < 1000 || u32_be < 1000 {
            return "SI_custom_wrapper (likely)".to_string();
        }
    }

    "unknown".to_string()
}

fn scan_chunks<R: Read + Seek>(file: &mut R, file_size: u64) -> Result<Vec<ChunkInfo>, String> {
    let mut chunks = Vec::new();
    let mut offset = 0u64;

    file.seek(SeekFrom::Start(0))
        .map_err(|e| format!("Seek failed: {}", e))?;

    // Scan up to 20 chunks or 1MB, whichever comes first
    while offset < file_size && offset < 1024 * 1024 && chunks.len() < 20 {
        let mut buf = [0u8; 16];
        if file.read_exact(&mut buf).is_err() {
            break;
        }

        // Try to interpret first 4 bytes as little-endian length
        let potential_length = u32::from_le_bytes([buf[0], buf[1], buf[2], buf[3]]);

        // If length is reasonable (between 16 and 10MB), assume it's a valid chunk
        if potential_length > 16 && potential_length < 10 * 1024 * 1024 {
            let type_tag = u32::from_le_bytes([buf[4], buf[5], buf[6], buf[7]]);

            // Try to read preview
            let mut preview_buf = [0u8; 32];
            let _ = file.read(&mut preview_buf);

            let preview = format!(
                "offset={} len={} tag=0x{:08x} data={}",
                offset,
                potential_length,
                type_tag,
                hex_encode(&preview_buf[..8.min(preview_buf.len())])
            );

            chunks.push(ChunkInfo {
                offset,
                length: potential_length,
                type_tag: Some(type_tag),
                preview,
            });

            offset += 8; // Move to next potential chunk
            file.seek(SeekFrom::Start(offset))
                .map_err(|e| format!("Seek failed: {}", e))?;
        } else {
            offset += 1;
            file.seek(SeekFrom::Start(offset))
                .map_err(|e| format!("Seek failed: {}", e))?;
        }
    }

    Ok(chunks)
}

/// Decompress FM26 save file (LZMA format)
pub fn decompress_save(path: &str) -> Result<Vec<u8>, String> {
    let file_path = Path::new(path);

    if !file_path.exists() {
        return Err(format!("File not found: {}", path));
    }

    let file = fs::File::open(file_path).map_err(|e| format!("Failed to open file: {}", e))?;

    let mut compressed = Vec::new();
    let mut reader = std::io::BufReader::new(file);
    reader
        .read_to_end(&mut compressed)
        .map_err(|e| format!("Failed to read file: {}", e))?;

    // Try LZMA decompression
    if compressed.len() < 5 {
        return Err("File too small to be valid LZMA".to_string());
    }

    // Check LZMA signature
    if compressed[0] == 0x5D && compressed[1..4] == [0, 0, 0] {
        let mut decompressed = Vec::new();
        lzma_decompress(&mut &compressed[..], &mut decompressed)
            .map_err(|e| format!("LZMA decompression failed: {:?}", e))?;

        return Ok(decompressed);
    }

    Err("File does not appear to be LZMA compressed (invalid signature)".to_string())
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct DecompressionResult {
    pub decompressed_size: usize,
    pub first_100_bytes_hex: String,
    pub detected_chunks: Vec<ChunkInfo>,
}

/// Decompress save and analyze internal structure
pub fn analyze_decompressed(path: &str) -> Result<DecompressionResult, String> {
    let decompressed = decompress_save(path)?;
    let decompressed_size = decompressed.len();

    // Hex preview of first 100 bytes
    let preview_len = 100.min(decompressed_size);
    let first_100_bytes_hex = hex_encode(&decompressed[..preview_len]);

    // Scan chunks in decompressed data
    let mut file_like = std::io::Cursor::new(&decompressed);
    let chunks = scan_chunks(&mut file_like, decompressed_size as u64)?;

    Ok(DecompressionResult {
        decompressed_size,
        first_100_bytes_hex,
        detected_chunks: chunks,
    })
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_hex_encode() {
        assert_eq!(hex_encode(&[0xFF, 0x00, 0x12]), "ff 00 12");
    }

    #[test]
    fn test_detect_lzma() {
        let lzma_header = vec![0x5D, 0x00, 0x00, 0x00, 0x10];
        assert_eq!(detect_compression(&lzma_header), "LZMA");
    }

    #[test]
    fn test_detect_lz4() {
        let lz4_header = vec![0x04, 0x22, 0x4D, 0x18];
        assert_eq!(detect_compression(&lz4_header), "LZ4");
    }
}
