# FM26 Player RTE MVP Foundation

## Product Shape

- Build a live-memory editor for a running `fm.exe`, not an offline save-file parser.
- MVP lookup is by Player UID.
- After a UID hit, the editor should show only category tiles first.
- Category click shows editable field rows, but values stay hidden until the user opens a field.
- Field click performs lazy read and records `OriginalValue`.
- Apply writes one field at a time. Revert restores only fields whose original value has been loaded.

## Source Of Truth

- CT-derived fields live in `PlayerEditModel.cs`.
- Do not use the old `PlayerFields.cs` offsets for the MVP editor UI. That file is legacy probe code based on UID-relative offsets.
- Detailed extracted tables:
  - `_re/FM26_CE_EDITABLE_ITEMS.md`
  - `_re/FM26_CE_VALUE_RECORDS.csv`
  - `_re/PLAYER_STATS_OFFSETS.md`

## Memory Model

The Cheat Table separates selected player data into two base pointers:

- `ptrPerson`: identity, names, person flags, player traits/preferred moves.
- `ptrPlayer`: CA/PA, player attributes, position suitability, fitness/morale.

The MVP code mirrors that as:

- `PlayerEditPointers.Person`
- `PlayerEditPointers.Player`

Field addressing rule:

```text
final_address = base_pointer + field.Offset
```

Attribute codec:

```text
display = floor(raw_byte / 5 + 0.5)
raw     = display * 5
```

Trait codec:

```text
byte = readByte(person + 0xC0 + byteOffset)
on   = (byte & (1 << bit)) != 0
```

## Implementation Sequence

1. Keep `Target` as the process memory I/O layer.
2. Replace current all-at-once editor UI with category-first lazy UI.
3. Solve UID -> `PlayerEditPointers` reliably.
4. Wire lazy reads through `EditFieldCodec.TryRead`.
5. Wire single-field apply/revert through `EditFieldCodec.TryWrite`.
6. Add bulk reads only after the lazy MVP is stable.

## UX Rules

- Never read all fields after scan.
- Public in-game style fields may be loaded when their section opens.
- Private fields stay hidden until the user clicks `Read`.
- Private by default: CA, PA, exact reputation values, hidden attributes.
- Never show raw memory offsets in the normal editor.
- A hidden field displays a button such as `Read`.
- A loaded unchanged field displays original value and an input control.
- A dirty field displays Apply/Revert.
- Boolean trait fields use checkboxes.
- 1..20 fields use numeric input with min/max.
- The normal attributes page should show Technical / Mental / Physical together in three columns.
- Player traits should be grouped by playing behavior.
- Position suitability should be arranged in a pitch-like layout.
- Position fields show the FM meaning:
  - `20`: Natural
  - `18..19`: Natural2
  - `15..17`: Accomplished
  - `12..14`: Competent

## Open Technical Point

The reliable UID -> `ptrPerson`/`ptrPlayer` bridge is the main remaining blocker.
The Cheat Table can derive `ptrPlayer` from `ptrPerson` via vtable metadata and `playerOffset = 0x288` or `playerStaffOffset = 0x380`.
`PlayerPointerScanner` now implements that CT-derived bridge:

```text
uidAddr    = found UID bytes
ptrPerson  = uidAddr - objo.Duni
vtable     = readQword(ptrPerson)
meta       = readQword(vtable - 8)
dynOffset  = readInt32(meta + 4)
ptrPlayer  = ptrPerson - dynOffset
```

The current `PersonScanner` returns UID-address candidates from older probing and should be treated as a legacy scanner prototype.
