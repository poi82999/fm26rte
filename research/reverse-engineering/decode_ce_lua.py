from __future__ import annotations

import argparse
import re
import zlib
from pathlib import Path


CUSTOM_BASE85 = (
    "0123456789"
    "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    "abcdefghijklmnopqrstuvwxyz"
    "!#$%()*+,-./:;=?@[]^_{}"
)
DECODE_TABLE = {c: i for i, c in enumerate(CUSTOM_BASE85)}


def ce_base85_decode(text: str) -> bytes:
    out = bytearray()
    full_groups, rem = divmod(len(text), 5)

    for group_index in range(full_groups):
        chunk = text[group_index * 5 : group_index * 5 + 5]
        value = 0
        for ch in chunk:
            value = value * 85 + DECODE_TABLE[ch]
        out.extend(value.to_bytes(4, "big"))

    if rem > 1:
        chunk = text[full_groups * 5 :]
        value = 0
        for ch in chunk:
            value = value * 85 + DECODE_TABLE[ch]
        for _ in range(5 - rem):
            value = value * 85 + 84
        out.extend(value.to_bytes(4, "big")[: rem - 1])

    return bytes(out)


def extract_encoded_calls(source: str) -> list[str]:
    # Encoded strings are single-quoted and use CE's base85 alphabet, which does
    # not include quotes or backslashes.
    return re.findall(r"decodeFunction\('([^']+)'\)\(\)", source)


def decode_payload(encoded: str) -> bytes:
    compressed = ce_base85_decode(encoded)
    try:
        return zlib.decompress(compressed)
    except zlib.error:
        return zlib.decompress(compressed, -zlib.MAX_WBITS)


def safe_stem(path: Path, index: int, total: int) -> str:
    if total == 1:
        return path.stem
    return f"{path.stem}_{index:02d}"


def main() -> int:
    parser = argparse.ArgumentParser(
        description="Extract Cheat Engine encodeFunction/decodeFunction payloads to Lua bytecode."
    )
    parser.add_argument("inputs", nargs="+", type=Path)
    parser.add_argument("-o", "--out", type=Path, required=True)
    args = parser.parse_args()

    args.out.mkdir(parents=True, exist_ok=True)

    for input_path in args.inputs:
        source = input_path.read_text(encoding="utf-8", errors="replace")
        encoded_calls = extract_encoded_calls(source)
        print(f"{input_path}: {len(encoded_calls)} payload(s)")

        for i, encoded in enumerate(encoded_calls, start=1):
            decoded = decode_payload(encoded)
            stem = safe_stem(input_path, i, len(encoded_calls))
            out_path = args.out / f"{stem}.luac"
            out_path.write_bytes(decoded)
            header = decoded[:16].hex(" ")
            print(f"  -> {out_path} ({len(decoded)} bytes, {header})")

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
