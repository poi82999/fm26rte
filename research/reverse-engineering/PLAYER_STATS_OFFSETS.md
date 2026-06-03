# Player Stat Address Notes

The active Cheat Engine records use `ptrPlayer` as a symbol that stores the currently focused player base pointer.

Formula:

- Player base: `player = readQword("ptrPlayer")`
- CA: `player + plao.Pcab` = `player + 0x264`
- PA: `player + plao.Ppab` = `player + 0x266`
- Attributes: `player + plao.Patr + stat_offset`
- `plao.Patr = 0x15F`

Attribute values use the table's `FM Attribute` custom type:

- Read display value: `math.floor(readByte(addr) / 5 + 0.5)`
- Write display value: `writeByte(addr, value * 5)`

## Core Offsets

| Name | Address expression | Type |
|---|---:|---|
| CA | `player + 0x264` | 2 bytes |
| PA | `player + 0x266` | 2 bytes |
| Current reputation | `player + 0x260` | 2 bytes |
| Home reputation | `player + 0x25E` | 2 bytes |
| World reputation | `player + 0x262` | 2 bytes |
| Condition | `player + 0x258` | 2 bytes |
| Match sharpness | `player + 0x25C` | 2 bytes |
| Fatigue | `player + 0x25A` | 2 bytes |
| Morale | `player + 0x26C` | byte |

## Player Attributes

| Attribute | Address expression | Raw offset |
|---|---:|---:|
| Crossing | `player + 0x15F + 0x00` | `0x15F` |
| Dribbling | `player + 0x15F + 0x01` | `0x160` |
| Finishing | `player + 0x15F + 0x02` | `0x161` |
| Heading | `player + 0x15F + 0x03` | `0x162` |
| Long Shots | `player + 0x15F + 0x04` | `0x163` |
| Marking | `player + 0x15F + 0x05` | `0x164` |
| Off The Ball | `player + 0x15F + 0x06` | `0x165` |
| Passing | `player + 0x15F + 0x07` | `0x166` |
| Penalty Taking | `player + 0x15F + 0x08` | `0x167` |
| Tackling | `player + 0x15F + 0x09` | `0x168` |
| Vision | `player + 0x15F + 0x0A` | `0x169` |
| Handling | `player + 0x15F + 0x0B` | `0x16A` |
| Aerial Reach | `player + 0x15F + 0x0C` | `0x16B` |
| Command Of Area | `player + 0x15F + 0x0D` | `0x16C` |
| Communication | `player + 0x15F + 0x0E` | `0x16D` |
| Kicking | `player + 0x15F + 0x0F` | `0x16E` |
| Throwing | `player + 0x15F + 0x10` | `0x16F` |
| Anticipation | `player + 0x15F + 0x11` | `0x170` |
| Decisions | `player + 0x15F + 0x12` | `0x171` |
| One On Ones | `player + 0x15F + 0x13` | `0x172` |
| Positioning | `player + 0x15F + 0x14` | `0x173` |
| Reflexes | `player + 0x15F + 0x15` | `0x174` |
| First Touch | `player + 0x15F + 0x16` | `0x175` |
| Technique | `player + 0x15F + 0x17` | `0x176` |
| Left Foot | `player + 0x15F + 0x18` | `0x177` |
| Right Foot | `player + 0x15F + 0x19` | `0x178` |
| Flair | `player + 0x15F + 0x1A` | `0x179` |
| Corners | `player + 0x15F + 0x1B` | `0x17A` |
| Teamwork | `player + 0x15F + 0x1C` | `0x17B` |
| Work Rate | `player + 0x15F + 0x1D` | `0x17C` |
| Long Throws | `player + 0x15F + 0x1E` | `0x17D` |
| Eccentricity | `player + 0x15F + 0x1F` | `0x17E` |
| Rushing Out | `player + 0x15F + 0x20` | `0x17F` |
| Punching | `player + 0x15F + 0x21` | `0x180` |
| Acceleration | `player + 0x15F + 0x22` | `0x181` |
| Free Kick Taking | `player + 0x15F + 0x23` | `0x182` |
| Strength | `player + 0x15F + 0x24` | `0x183` |
| Stamina | `player + 0x15F + 0x25` | `0x184` |
| Pace | `player + 0x15F + 0x26` | `0x185` |
| Jumping Reach | `player + 0x15F + 0x27` | `0x186` |
| Leadership | `player + 0x15F + 0x28` | `0x187` |
| Dirtiness | `player + 0x15F + 0x29` | `0x188` |
| Balance | `player + 0x15F + 0x2A` | `0x189` |
| Bravery | `player + 0x15F + 0x2B` | `0x18A` |
| Consistency | `player + 0x15F + 0x2C` | `0x18B` |
| Aggression | `player + 0x15F + 0x2D` | `0x18C` |
| Agility | `player + 0x15F + 0x2E` | `0x18D` |
| Imp. Matches | `player + 0x15F + 0x2F` | `0x18E` |
| Injury Proneness | `player + 0x15F + 0x30` | `0x18F` |
| Versatility | `player + 0x15F + 0x31` | `0x190` |
| Natural Fitness | `player + 0x15F + 0x32` | `0x191` |
| Determination | `player + 0x15F + 0x33` | `0x192` |
| Composure | `player + 0x15F + 0x34` | `0x193` |
| Concentration | `player + 0x15F + 0x35` | `0x194` |

## Position Suitability

The position suitability records are plain bytes under `ptrPlayer`.

Formula:

- Player base: `player = readQword("ptrPlayer")`
- Position byte: `readByte(player + plao.Ppos + position_offset)`
- `plao.Ppos = 0x150`

The helper's grouping logic treats the raw values as:

- `20`: Natural
- `18..19`: Natural2
- `15..17`: Accomplished
- `12..14`: Competent

| Position | Address expression | Raw offset |
|---|---:|---:|
| GK | `player + 0x150 + 0x00` | `0x150` |
| SW | `player + 0x150 + 0x01` | `0x151` |
| DL | `player + 0x150 + 0x02` | `0x152` |
| DC | `player + 0x150 + 0x03` | `0x153` |
| DR | `player + 0x150 + 0x04` | `0x154` |
| DM | `player + 0x150 + 0x05` | `0x155` |
| ML | `player + 0x150 + 0x06` | `0x156` |
| MC | `player + 0x150 + 0x07` | `0x157` |
| MR | `player + 0x150 + 0x08` | `0x158` |
| AML | `player + 0x150 + 0x09` | `0x159` |
| AMC | `player + 0x150 + 0x0A` | `0x15A` |
| AMR | `player + 0x150 + 0x0B` | `0x15B` |
| ST | `player + 0x150 + 0x0C` | `0x15C` |
| WBL | `player + 0x150 + 0x0D` | `0x15D` |
| WBR | `player + 0x150 + 0x0E` | `0x15E` |

Related position fields:

| Field | Address expression | Type |
|---|---:|---|
| Preferred central position | `player + plao.Plcp` = `player + 0x276` | byte |
| Role used to fill empty attributes | `player + plao.Plcp + 1` = `player + 0x277` | byte |

Preferred central position enum:

| Value | Meaning |
|---:|---|
| 0 | Not Set |
| 1 | Right |
| 2 | Left |
| 3 | Right Or Central When Three |
| 4 | Left Or Central When Three |
| 5 | Central When Three |
| 6 | Right Of Two Or Right / Central When Three |
| 7 | Left Of Two Or Left / Central When Three |

## Player Traits / Preferred Moves

The "Player Traits" records are binary bits under `ptrPerson`, not `ptrPlayer`.

Formula:

- Person base: `person = readQword("ptrPerson")`
- Trait byte: `readByte(person + plao.Pprm + byte_offset)`
- `plao.Pprm = 0xC0`
- Active check: `(trait_byte & (1 << bit)) ~= 0`
- The table's `removeAllTraits` clears the full bitfield with `writeQword(person + plao.Pprm, 0)`.

| Byte offset | Bit | Address | Trait |
|---:|---:|---:|---|
| `0x00` | 0 | `person + 0xC0` | Runs With Ball Down Left |
| `0x00` | 1 | `person + 0xC0` | Runs With Ball Down Right |
| `0x00` | 2 | `person + 0xC0` | Runs With Ball Down Center |
| `0x00` | 3 | `person + 0xC0` | Gets Into Opposition Area |
| `0x00` | 4 | `person + 0xC0` | Moves Into Channels |
| `0x00` | 5 | `person + 0xC0` | Gets Forward Whenever Possible |
| `0x00` | 6 | `person + 0xC0` | Plays Short Simple Passes |
| `0x00` | 7 | `person + 0xC0` | Tries Killer Balls Often |
| `0x01` | 0 | `person + 0xC1` | Shoots From Distance |
| `0x01` | 1 | `person + 0xC1` | Shoots With Power |
| `0x01` | 2 | `person + 0xC1` | Places Shots |
| `0x01` | 3 | `person + 0xC1` | Curls Ball |
| `0x01` | 4 | `person + 0xC1` | Likes to Round Keeper |
| `0x01` | 5 | `person + 0xC1` | Likes to Try To Break Offside Trap |
| `0x01` | 6 | `person + 0xC1` | Uses Outside Of Foot |
| `0x01` | 7 | `person + 0xC1` | Marks Opponent Tightly |
| `0x02` | 0 | `person + 0xC2` | Winds Up Opponents |
| `0x02` | 1 | `person + 0xC2` | Argues With Officials |
| `0x02` | 2 | `person + 0xC2` | Plays with Back To Goal |
| `0x02` | 3 | `person + 0xC2` | Comes Deep To Get Ball |
| `0x02` | 4 | `person + 0xC2` | Plays One-Twos |
| `0x02` | 5 | `person + 0xC2` | Likes To Lob Keeper |
| `0x02` | 6 | `person + 0xC2` | Dictates Tempo |
| `0x02` | 7 | `person + 0xC2` | Attempts Overhead Kicks |
| `0x03` | 0 | `person + 0xC3` | Looks For Pass Rather Than Attempting To Score |
| `0x03` | 1 | `person + 0xC3` | Plays No Through Balls |
| `0x03` | 2 | `person + 0xC3` | Stops Play |
| `0x03` | 3 | `person + 0xC3` | Knocks Ball Past Opponent |
| `0x03` | 4 | `person + 0xC3` | Moves Ball To Right Foot Before Dribble Attempt |
| `0x03` | 5 | `person + 0xC3` | Moves Ball To Left Foot Before Dribble Attempt |
| `0x03` | 6 | `person + 0xC3` | Dwells On Ball |
| `0x03` | 7 | `person + 0xC3` | Arrives Late In Opponents' Area |
| `0x04` | 0 | `person + 0xC4` | Tries To Play Way Out Of Trouble |
| `0x04` | 1 | `person + 0xC4` | Stays Back At All Times |
| `0x04` | 2 | `person + 0xC4` | Avoids Using Weaker Foot |
| `0x04` | 3 | `person + 0xC4` | Tries Tricks |
| `0x04` | 4 | `person + 0xC4` | Tries Long Range Free Kicks |
| `0x04` | 5 | `person + 0xC4` | Dives Into Tackles |
| `0x04` | 6 | `person + 0xC4` | Does Not Dive Into Tackles |
| `0x04` | 7 | `person + 0xC4` | Cuts Inside From Both Wings |
| `0x05` | 0 | `person + 0xC5` | Hugs Line |
| `0x05` | 1 | `person + 0xC5` | Gets Crowd Going |
| `0x05` | 2 | `person + 0xC5` | Tries First Time Shots |
| `0x05` | 3 | `person + 0xC5` | Tries Long Range Passes |
| `0x05` | 4 | `person + 0xC5` | Likes Ball Played Into Feet |
| `0x05` | 5 | `person + 0xC5` | Hits Free Kick With Power |
| `0x05` | 6 | `person + 0xC5` | Likes To Beat Man Repeatedly |
| `0x05` | 7 | `person + 0xC5` | Likes To Switch Ball To Other Flank |
| `0x06` | 2 | `person + 0xC6` | Possesses Long Flat Throw |
| `0x06` | 3 | `person + 0xC6` | Runs With Ball Often |
| `0x06` | 4 | `person + 0xC6` | Runs With Ball Rarely |
| `0x06` | 6 | `person + 0xC6` | Does not Move Into Channels |
| `0x06` | 7 | `person + 0xC6` | Uses Long Throw To Start Counter Attacks |
| `0x07` | 0 | `person + 0xC7` | Refrains From Taking Long Shots |
| `0x07` | 1 | `person + 0xC7` | Cuts Inside From Left Wing |
| `0x07` | 2 | `person + 0xC7` | Cuts Inside From Right Wing |
| `0x07` | 3 | `person + 0xC7` | Crosses Early |
| `0x07` | 4 | `person + 0xC7` | Brings Ball Out of Defense |
| `0x07` | 7 | `person + 0xC7` | Plays Ball With Feet |

## Source Trail

- `plao` offsets are initialized in `_re/ce_lua_decompiled/FMCETableEnums.lua`.
- `readFMAttribute` and `writeFMAttribute` are in `_re/ce_lua_decompiled/FMCETableHelpers.lua`.
- The active CT records point to `ptrPlayer` plus `plao.Patr + ...`.
- Position records point to `ptrPlayer` plus `plao.Ppos + ...`.
- Player trait records point to `ptrPerson` plus `plao.Pprm + ...` and use CE binary bit records.
- `getPlayerDataWIP` contains a conflicting direct-offset table and appears to be a WIP/stale path, not the active record mapping.
