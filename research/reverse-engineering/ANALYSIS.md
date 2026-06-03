# Football Manager 26 Cheat Table Lua Analysis

## Outputs

- Decoded Lua bytecode: `_re/ce_luac/*.luac`
- Normalized custom Lua 5.3 chunks: `_re/ce_luac_normalized/*.luac`
- Decompiled Lua source: `_re/ce_lua_decompiled/*.lua`
- Decoder: `_re/decode_ce_lua.py`
- Custom chunk normalizer: `_re/normalize_ce_luac.py`

## Deobfuscation Notes

The `decodeFunction('...')()` payloads use Cheat Engine's zlib-compressed custom Base85 wrapper. The embedded CT payloads decode directly to standard Lua 5.3 chunks.

The six `lib/*.lua` payloads decode to a tdg6661 custom Lua 5.3 chunk format:

- Header uses Lua 5.3 version with format byte `1`.
- Bytes `6..13` are an 8-byte seed.
- The standard Lua 5.3 header tail begins at byte `14`.
- Primitive dump fields are XORed with a per-block mask:
  - `mask(i) = 0xCE` when `i % 8 == 0`
  - otherwise `mask(i) = (seed >> (i % 14)) & 0xff`
- Instruction arrays have one extra transform after XOR: subtract `instruction_index % 4` from the first byte of each 4-byte instruction.

## Modules

- `CETableDetails.lua`: table metadata, target version checks, messages, donation/forum links.
- `CETableHelpers.lua`: generic Cheat Engine helpers, process/version validation, timers, memory record helpers, CSV/theme/readme UI helpers.
- `FMCETableEnums.lua`: large enum/offset/data-definition module. Contains offsets such as `playerOffset = 648`, `staffOffset = 256`, `playerStaffOffset = 896`, `humanManagerOffset = 1104`.
- `FMCETableHelpers.lua`: Football Manager object traversal and record-building helpers for clubs, nations, people, players, staff, competitions, relationships, eligibility, objectives, transfers, search, and custom value types.
- `FMCETableForms.lua`: UI/forms for role analyzer, player panels, status/search panels, mass edit, relation/eligibility/sponsorship/career-plan dialogs.
- `FMCETablePresets.lua`: user-facing edit actions and global presets.
- `FMCET_01.lua` through `FMCET_07.lua`: small embedded CT scripts, mostly instructions and the `CETrequire` bootstrap.

## Target

`CETableDetails.lua` declares:

- Game: `Football Manager 26`
- Process: `fm.exe`
- EXE version: `26.3.0.0`
- Module: `game_plugin.dll`
- Module version: `26.3.0`
- Required Cheat Engine: `7.6`
- Table version: `5`
- Premium flag: `false`

## Main Capabilities Seen

Preset/edit functions include:

- Club/team edits: finances, debts/loans, training happiness, tactical familiarity, team cohesion, professionalism, board requests, stadium/training ground, scouting knowledge, freezer.
- Person/player/staff edits: name, DOB, birthplace, nationality, contract, wage, CA/PA matching, traits, injuries, bans, unhappiness, training happiness, agent affection, partnerships, attributes freeze.
- Game-rule/global presets: accelerate player development, board accepts requests, golden generation, ignore retirement, contract/transfer acceptance, on-match ability modifier, extra staff limit, no work permits, no transfer windows, no loan restrictions, nationality restrictions lifted.
- Database/search tooling: object search, search result memory records, mass edit, swap club, relations, eligibility, sponsorships, career plans.

## Memory Behavior

The code is primarily a Cheat Engine table automation layer:

- Reads and writes game memory via `readByte`, `readSmallInteger`, `readInteger`, `readQword`, `readPointer`, `readString`, and matching `write*` APIs.
- Uses `aobscanmodule`, `alloc`, `registersymbol`, `unregistersymbol`, and `autoAssemble` to patch `game_plugin.dll`.
- Contains assembly hooks for presets such as golden generation, player development, on-match ability modifiers, transfer/contract rule bypasses, and staff limits.
- Uses version and module checks before activation.

## External/Host Behavior

No obvious downloader or network client code was found in the decompiled Lua. Notable host interactions:

- `shellExecute` opens declared links such as Patreon, PayPal, KaryaKarsa, Fearless Revolution, and Sortitoutsi.
- `loadstring` is used by the `CETrequire` bootstrap to load Lua files embedded in the Cheat Engine table when they are not present on disk.
- File dialogs are used for CSV import/export and table assets are read through `findTableFile`.
- `os.clock`/`os.time` are used for elapsed-time messages and generated labels; no `os.execute` usage was identified.

## Caution

This table intentionally modifies the running game process. The decompiled code did not show an obvious general-purpose malware pattern, but the CE scripts do patch executable memory and write many game object fields, so crashes/corruption are still possible if offsets or versions mismatch.
