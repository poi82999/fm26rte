import csv
import re
import xml.etree.ElementTree as ET
from collections import Counter, defaultdict
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
CT_PATH = ROOT / "Football Manager 26 Cheat Table by tdg6661" / "FMCET.CT"
OUT_MD = ROOT / "_re" / "FM26_CE_EDITABLE_ITEMS.md"
OUT_VALUES = ROOT / "_re" / "FM26_CE_VALUE_RECORDS.csv"
OUT_SCRIPTS = ROOT / "_re" / "FM26_CE_SCRIPT_RECORDS.csv"


def child_text(node, name, default=""):
    child = node.find(name)
    if child is None or child.text is None:
        return default
    return child.text.strip()


def clean_description(text):
    text = (text or "").strip()
    if len(text) >= 2 and text[0] == '"' and text[-1] == '"':
        text = text[1:-1]
    return text


def is_separator(text):
    stripped = re.sub(r"\s+", "", text or "")
    return len(stripped) >= 8 and len(set(stripped)) == 1 and stripped[0] in "-="


def offsets_text(node):
    offsets = []
    offsets_node = node.find("Offsets")
    if offsets_node is not None:
        for offset in offsets_node.findall("Offset"):
            offsets.append((offset.text or "").strip())
    return " -> ".join(offsets)


def path_without_noise(path):
    return [part for part in path if part and not is_separator(part)]


def display_path(path):
    path = path_without_noise(path)
    if path and path[0] == "Run Table":
        path = path[1:]
    return " > ".join(path)


def script_kind(script):
    lowered = script.lower()
    kinds = []
    if "{$lua}" in lowered:
        kinds.append("Lua")
    if "aobscan" in lowered:
        kinds.append("AOB hook")
    if "autoassemble" in lowered:
        kinds.append("nested AA")
    if "write" in lowered:
        kinds.append("write")
    if "setobjectfocus" in lowered or "ptrselectedobj" in lowered:
        kinds.append("focus/select")
    if "freeze" in lowered:
        kinds.append("freeze")
    if "registersymbol" in lowered:
        kinds.append("symbol")
    return ", ".join(kinds) if kinds else "AA"


def object_bucket(path):
    path = path_without_noise(path)
    if path and path[0] == "Run Table":
        path = path[1:]
    if not path:
        return "(root)"
    return path[0].replace(" >", "")


def group_bucket(path):
    path = path_without_noise(path)
    if path and path[0] == "Run Table":
        path = path[1:]
    if len(path) < 2:
        return ""
    return path[1].replace(" >", "")


def walk(parent, path, rows, scripts):
    entries = parent.find("CheatEntries")
    if entries is None:
        return

    for entry in entries.findall("CheatEntry"):
        desc = clean_description(child_text(entry, "Description"))
        cur_path = path + [desc]
        variable_type = child_text(entry, "VariableType")
        group_header = child_text(entry, "GroupHeader") == "1"

        if variable_type == "Auto Assembler Script":
            script = child_text(entry, "AssemblerScript")
            scripts.append(
                {
                    "id": child_text(entry, "ID"),
                    "path": display_path(cur_path),
                    "object": object_bucket(cur_path),
                    "group": group_bucket(cur_path),
                    "description": desc,
                    "kind": script_kind(script),
                }
            )
        elif variable_type and not group_header:
            rows.append(
                {
                    "id": child_text(entry, "ID"),
                    "path": display_path(cur_path),
                    "object": object_bucket(cur_path),
                    "group": group_bucket(cur_path),
                    "description": desc,
                    "variable_type": variable_type,
                    "custom_type": child_text(entry, "CustomType"),
                    "address": child_text(entry, "Address"),
                    "offsets": offsets_text(entry),
                    "bit_start": child_text(entry, "BitStart"),
                    "bit_length": child_text(entry, "BitLength"),
                    "string_length": child_text(entry, "Length"),
                    "unicode": child_text(entry, "Unicode"),
                    "dropdown": " | ".join(
                        line.strip()
                        for line in child_text(entry, "DropDownList").splitlines()
                        if line.strip()
                    ),
                }
            )

        walk(entry, cur_path, rows, scripts)


def md_escape(text):
    text = "" if text is None else str(text)
    return text.replace("\\", "\\\\").replace("|", "\\|").replace("\n", "<br>")


def md_table(headers, rows):
    lines = [
        "| " + " | ".join(headers) + " |",
        "| " + " | ".join("---" for _ in headers) + " |",
    ]
    for row in rows:
        lines.append("| " + " | ".join(md_escape(row.get(h, "")) for h in headers) + " |")
    return "\n".join(lines)


def write_csv(path, rows, headers):
    with path.open("w", encoding="utf-8-sig", newline="") as f:
        writer = csv.DictWriter(f, fieldnames=headers)
        writer.writeheader()
        writer.writerows(rows)


def main():
    root = ET.parse(CT_PATH).getroot()
    values = []
    scripts = []
    walk(root, [], values, scripts)

    value_headers = [
        "id",
        "object",
        "group",
        "description",
        "variable_type",
        "custom_type",
        "address",
        "offsets",
        "bit_start",
        "bit_length",
        "string_length",
        "unicode",
        "path",
        "dropdown",
    ]
    script_headers = ["id", "object", "group", "description", "kind", "path"]

    write_csv(OUT_VALUES, values, value_headers)
    write_csv(OUT_SCRIPTS, scripts, script_headers)

    by_object = defaultdict(lambda: Counter())
    for row in values:
        by_object[row["object"]]["value_records"] += 1
        by_object[row["object"]][row["variable_type"]] += 1
        if row["address"]:
            by_object[row["object"]][f"addr:{row['address']}"] += 1
    for row in scripts:
        by_object[row["object"]]["scripts"] += 1

    summary_rows = []
    for obj in sorted(by_object):
        counts = by_object[obj]
        addresses = sorted(
            (key[5:], value)
            for key, value in counts.items()
            if key.startswith("addr:")
        )
        summary_rows.append(
            {
                "object": obj,
                "value_records": counts["value_records"],
                "scripts": counts["scripts"],
                "common_addresses": ", ".join(f"{addr}({count})" for addr, count in addresses[:8]),
                "types": ", ".join(
                    f"{key}:{value}"
                    for key, value in counts.items()
                    if key
                    in {
                        "Byte",
                        "2 Bytes",
                        "4 Bytes",
                        "8 Bytes",
                        "Float",
                        "String",
                        "Custom",
                        "Binary",
                    }
                ),
            }
        )

    type_counts = Counter(row["variable_type"] for row in values)
    address_counts = Counter(row["address"] for row in values if row["address"])
    script_kind_counts = Counter(row["kind"] for row in scripts)

    with OUT_MD.open("w", encoding="utf-8", newline="\n") as f:
        f.write("# FM26 Cheat Engine Editable Items\n\n")
        f.write("Generated from `Football Manager 26 Cheat Table by tdg6661/FMCET.CT`.\n\n")
        f.write("## Counts\n\n")
        f.write(f"- Value records: {len(values)}\n")
        f.write(f"- Auto Assembler / Lua script records: {len(scripts)}\n\n")
        f.write("### Value Types\n\n")
        f.write(md_table(["type", "count"], [{"type": k, "count": v} for k, v in type_counts.most_common()]))
        f.write("\n\n### Main Address Symbols\n\n")
        f.write(
            md_table(
                ["address", "count"],
                [{"address": k, "count": v} for k, v in address_counts.most_common(40)],
            )
        )
        f.write("\n\n### Script Kinds\n\n")
        f.write(
            md_table(
                ["kind", "count"],
                [{"kind": k, "count": v} for k, v in script_kind_counts.most_common()],
            )
        )
        f.write("\n\n## Object Summary\n\n")
        f.write(md_table(["object", "value_records", "scripts", "common_addresses", "types"], summary_rows))
        f.write("\n\n## How Editing Works\n\n")
        f.write(
            "- The table attaches to `fm.exe`, registers global symbols such as `ptrPlayer`, `ptrPerson`, `ptrClub`, and uses AOB hooks/scripts to keep those symbols pointed at the selected game object.\n"
        )
        f.write(
            "- Normal value records write through Cheat Engine's process-memory write path: `Address` plus the listed `Offsets` resolves to a final address in the FM process, then CE writes the selected type size.\n"
        )
        f.write(
            "- `Custom` records with `FM Attribute` are scaled: the UI value is written as raw byte `value * 5`, and raw bytes are displayed as `floor(raw / 5 + 0.5)`.\n"
        )
        f.write(
            "- `Binary` records edit a bit range inside one byte/word. Player traits are an example: `ptrPerson + plao.Pprm + n`, with `BitStart` selecting the trait flag.\n"
        )
        f.write(
            "- `String` records follow pointer chains to game string buffers. Most editable names in the table are represented this way.\n"
        )
        f.write(
            "- `Auto Assembler Script` records either install hooks, update pointer symbols, call embedded Lua helper functions, or perform bulk writes/presets.\n\n"
        )
        f.write("## Direct Value Records\n\n")
        f.write(
            md_table(
                [
                    "id",
                    "object",
                    "group",
                    "description",
                    "variable_type",
                    "custom_type",
                    "address",
                    "offsets",
                    "bit_start",
                    "bit_length",
                    "string_length",
                    "unicode",
                ],
                values,
            )
        )
        f.write("\n\n## Script Records\n\n")
        f.write(md_table(script_headers, scripts))
        f.write("\n")

    print(f"Wrote {OUT_MD.relative_to(ROOT)}")
    print(f"Wrote {OUT_VALUES.relative_to(ROOT)}")
    print(f"Wrote {OUT_SCRIPTS.relative_to(ROOT)}")
    print(f"Value records: {len(values)}")
    print(f"Script records: {len(scripts)}")


if __name__ == "__main__":
    main()
