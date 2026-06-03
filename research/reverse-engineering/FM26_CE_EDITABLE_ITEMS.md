# FM26 Cheat Engine Editable Items

Generated from `Football Manager 26 Cheat Table by tdg6661/FMCET.CT`.

## Counts

- Value records: 1126
- Auto Assembler / Lua script records: 659

### Value Types

| type | count |
| --- | --- |
| Byte | 372 |
| Custom | 366 |
| Binary | 157 |
| 4 Bytes | 76 |
| String | 64 |
| 2 Bytes | 44 |
| 8 Bytes | 38 |
| Float | 9 |

### Main Address Symbols

| address | count |
| --- | --- |
| ptrClub | 299 |
| ptrPerson | 173 |
| ptrStadium | 132 |
| ptrNation | 107 |
| ptrPlayer | 89 |
| ptrComp | 66 |
| ptrStaff | 64 |
| ptrAward | 45 |
| ptrHumanStaff | 34 |
| ptrContinent | 26 |
| ptrDerby | 20 |
| ptrCity | 10 |
| ptrLeagueStage | 7 |
| ptrTeam | 3 |
| 00000000 | 1 |
| ptrRCA+4 | 1 |
| ptrRCA | 1 |
| hdeffxoa+0x2 | 1 |
| hdeffxoa+0x3 | 1 |
| hdeffxoa+0x4 | 1 |
| hdeffxoa | 1 |
| hdeffxoa+0x1 | 1 |
| hdeffxoa+0x5 | 1 |
| ignoreRet | 1 |
| ignoreRet+1 | 1 |
| ignoreRet+2 | 1 |
| ptrFullContract | 1 |
| ptrLoanContract | 1 |
| ptrNationContract | 1 |
| ptrRevClubContract | 1 |
| ptrSelectedObj | 1 |
| updSelect | 1 |
| updAward | 1 |
| updCity | 1 |
| updClub | 1 |
| updComp | 1 |
| updContinent | 1 |
| updNation | 1 |
| updPerson | 1 |
| updStadium | 1 |

### Script Kinds

| kind | count |
| --- | --- |
| Lua | 620 |
| AA | 17 |
| Lua, write | 12 |
| Lua, freeze | 5 |
| Lua, focus/select, symbol | 1 |
| Lua, symbol | 1 |
| Lua, write, symbol | 1 |
| AOB hook, symbol | 1 |
| AOB hook, focus/select, symbol | 1 |

## Object Summary

| object | value_records | scripts | common_addresses | types |
| --- | --- | --- | --- | --- |
| (root) | 0 | 1 |  |  |
| Award | 44 | 4 | ptrAward(44) | 4 Bytes:6, String:5, Byte:30, Custom:1, Binary:1, 2 Bytes:1 |
| City | 9 | 1 | ptrCity(9) | 4 Bytes:3, String:1, Float:3, Byte:2 |
| Club | 300 | 67 | ptrClub(298), ptrTeam(2) | 4 Bytes:10, String:10, 2 Bytes:5, Byte:53, Binary:3, Custom:217, Float:2 |
| Competition | 71 | 4 | ptrComp(65), ptrLeagueStage(6) | 4 Bytes:7, String:5, Byte:49, 2 Bytes:8, Binary:2 |
| Continent | 25 | 2 | ptrContinent(25) | 4 Bytes:6, String:6, Float:1, Byte:12 |
| Database List | 0 | 6 |  |  |
| Derby | 20 | 7 | ptrDerby(20) | 4 Bytes:3, String:8, Custom:1, 2 Bytes:1, Byte:7 |
| Freezer | 0 | 1 |  |  |
| Nation | 106 | 19 | ptrNation(106) | 4 Bytes:11, String:11, Byte:37, Binary:1, 2 Bytes:5, Float:1, Custom:40 |
| Person | 353 | 491 | 00000000(1), ptrHumanStaff(32), ptrPerson(169), ptrPlayer(87), ptrRCA(1), ptrRCA+4(1), ptrStaff(62) | 4 Bytes:6, String:12, Custom:101, Binary:85, Byte:134, 2 Bytes:15 |
| Presets (Global) | 9 | 32 | hdeffxoa(1), hdeffxoa+0x1(1), hdeffxoa+0x2(1), hdeffxoa+0x3(1), hdeffxoa+0x4(1), hdeffxoa+0x5(1), ignoreRet(1), ignoreRet+1(1) | Byte:7, 8 Bytes:1, 4 Bytes:1 |
| Print List | 0 | 3 |  |  |
| Read Me! | 0 | 1 |  |  |
| Stadium | 131 | 5 | ptrStadium(131) | 4 Bytes:17, String:4, Byte:31, Binary:64, 2 Bytes:8, Custom:5, Float:2 |
| Table Settings | 58 | 11 | datTimeRoot(1), datTimeRoot+1(1), datTimeRoot+2(1), fm.exe+4A05111(1), fm.exe+4A0F28E(1), ptrAward(1), ptrCity(1), ptrClub(1) | 8 Bytes:37, Byte:10, Binary:1, Custom:1, 2 Bytes:1, 4 Bytes:6, String:2 |
| Useful Tools | 0 | 4 |  |  |

## How Editing Works

- The table attaches to `fm.exe`, registers global symbols such as `ptrPlayer`, `ptrPerson`, `ptrClub`, and uses AOB hooks/scripts to keep those symbols pointed at the selected game object.
- Normal value records write through Cheat Engine's process-memory write path: `Address` plus the listed `Offsets` resolves to a final address in the FM process, then CE writes the selected type size.
- `Custom` records with `FM Attribute` are scaled: the UI value is written as raw byte `value * 5`, and raw bytes are displayed as `floor(raw / 5 + 0.5)`.
- `Binary` records edit a bit range inside one byte/word. Player traits are an example: `ptrPerson + plao.Pprm + n`, with `BitStart` selecting the trait flag.
- `String` records follow pointer chains to game string buffers. Most editable names in the table are represented this way.
- `Auto Assembler Script` records either install hooks, update pointer symbols, call embedded Lua helper functions, or perform bulk writes/presets.

## Direct Value Records

| id | object | group | description | variable_type | custom_type | address | offsets | bit_start | bit_length | string_length | unicode |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 12878 | Award | Details | Row ID | 4 Bytes |  | ptrAward | objo.Rwid |  |  |  |  |
| 12877 | Award | Details | Unique ID | 4 Bytes |  | ptrAward | objo.Duni |  |  |  |  |
| 17669 | Award | Details | Random ID | 4 Bytes |  | ptrAward | objo.Rdui |  |  |  |  |
| 12876 | Award | Details | Full Name | String |  | ptrAward | 4 -> awro.AWna |  |  | 32 | 0 |
| 19677 | Award | Details | Short Name | String |  | ptrAward | 4 -> awro.AWsn |  |  | 32 | 0 |
| 19702 | Award | Details | Continent | String |  | ptrAward | 4 -> cono.Cnam -> awro.AWci |  |  | 32 | 0 |
| 19701 | Award | Details | Nation | String |  | ptrAward | 4 -> nato.Nnam -> awro.AWni |  |  | 32 | 0 |
| 19703 | Award | Details | Competition | String |  | ptrAward | 4 -> cmpo.Cnam -> awro.AWmi |  |  | 32 | 0 |
| 19675 | Award | Details | Reputation | Byte |  | ptrAward | awro.AWre |  |  |  |  |
| 12881 | Award | Details | Winner Home Reputation | Byte |  | ptrAward | awro.AWwh |  |  |  |  |
| 19704 | Award | Details | Winner World Reputation | Byte |  | ptrAward | awro.AWwr |  |  |  |  |
| 19681 | Award | Details | Hex | 4 Bytes |  | ptrAward | awro.AWfc |  |  |  |  |
| 19683 | Award | Details | Red | Byte |  | ptrAward | awro.AWfc+2 |  |  |  |  |
| 19684 | Award | Details | Green | Byte |  | ptrAward | awro.AWfc+1 |  |  |  |  |
| 19685 | Award | Details | Blue | Byte |  | ptrAward | awro.AWfc |  |  |  |  |
| 19686 | Award | Details | Opacity | Byte |  | ptrAward | awro.AWfc+3 |  |  |  |  |
| 19688 | Award | Details | Hex | 4 Bytes |  | ptrAward | awro.AWbc |  |  |  |  |
| 19690 | Award | Details | Red | Byte |  | ptrAward | awro.AWbc+2 |  |  |  |  |
| 19691 | Award | Details | Green | Byte |  | ptrAward | awro.AWbc+1 |  |  |  |  |
| 19692 | Award | Details | Blue | Byte |  | ptrAward | awro.AWbc |  |  |  |  |
| 19693 | Award | Details | Opacity | Byte |  | ptrAward | awro.AWbc+3 |  |  |  |  |
| 19695 | Award | Details | Hex | 4 Bytes |  | ptrAward | awro.AWtc |  |  |  |  |
| 19697 | Award | Details | Red | Byte |  | ptrAward | awro.AWtc+2 |  |  |  |  |
| 19698 | Award | Details | Green | Byte |  | ptrAward | awro.AWtc+1 |  |  |  |  |
| 19699 | Award | Details | Blue | Byte |  | ptrAward | awro.AWtc |  |  |  |  |
| 19700 | Award | Details | Opacity | Byte |  | ptrAward | awro.AWtc+3 |  |  |  |  |
| 19705 | Award | Rules | Award Recipient Type | Byte |  | ptrAward | awro.AWrt |  |  |  |  |
| 19710 | Award | Rules | Award Type | Byte |  | ptrAward | awro.AWty |  |  |  |  |
| 19709 | Award | Rules | Award Period | Byte |  | ptrAward | awro.AWdr |  |  |  |  |
| 12880 | Award | Rules | Announcement Date | Custom | FM Date | ptrAward | awro.AWad |  |  |  |  |
| 19708 | Award | Rules | Number Of Placings | Byte |  | ptrAward | awro.AWnp |  |  |  |  |
| 19707 | Award | Rules | Voting | Byte |  | ptrAward | awro.AWsc |  |  |  |  |
| 19706 | Award | Rules | Voting Format | Byte |  | ptrAward | awro.AWvf |  |  |  |  |
| 19711 | Award | Rules | Can Vote For Own Player | Binary |  | ptrAward | awro.AWop | 1 | 1 |  |  |
| 19715 | Award | Rules | Run By | Byte |  | ptrAward | awro.AWrb |  |  |  |  |
| 19714 | Award | Rules | Based | Byte |  | ptrAward | awro.AWbr |  |  |  |  |
| 19713 | Award | Rules | Use Stats From | Byte |  | ptrAward | awro.AWss |  |  |  |  |
| 19718 | Award | Rules | Allow Previous Winner | Byte |  | ptrAward | awro.AWap |  |  |  |  |
| 19712 | Award | Rules | Minimum Percentage Of Games Played | Byte |  | ptrAward | awro.AWmg |  |  |  |  |
| 19717 | Award | Rules | Minimum Age | Byte |  | ptrAward | awro.AWma |  |  |  |  |
| 19716 | Award | Rules | Maximum Age | Byte |  | ptrAward | awro.AWxa |  |  |  |  |
| 19720 | Award | Rules | Position | 2 Bytes |  | ptrAward | awro.AWpo |  |  |  |  |
| 19719 | Award | Rules | Side | Byte |  | ptrAward | awro.AWsr |  |  |  |  |
| 19809 | Award | Rules | Formation | Byte |  | ptrAward | awro.AWfo |  |  |  |  |
| 19668 | City | Details | Row ID | 4 Bytes |  | ptrCity | objo.Rwid |  |  |  |  |
| 19669 | City | Details | Unique ID | 4 Bytes |  | ptrCity | objo.Duni |  |  |  |  |
| 19670 | City | Details | Random ID | 4 Bytes |  | ptrCity | objo.Rdui |  |  |  |  |
| 19671 | City | Details | Full Name | String |  | ptrCity | 4 -> ctyo.Cnam |  |  | 32 | 0 |
| 19672 | City | Details | Altitude | Float |  | ptrCity | ctyo.Calt |  |  |  |  |
| 19673 | City | Details | Latitude | Float |  | ptrCity | ctyo.Clat |  |  |  |  |
| 19674 | City | Details | Longitude | Float |  | ptrCity | ctyo.Clon |  |  |  |  |
| 12882 | City | Details | Inhabitants Range | Byte |  | ptrCity | ctyo.Cinh |  |  |  |  |
| 19676 | City | Details | Attraction | Byte |  | ptrCity | ctyo.Catt |  |  |  |  |
| 1150 | Club | Details | Row ID | 4 Bytes |  | ptrClub | objo.Rwid |  |  |  |  |
| 1151 | Club | Details | Unique ID | 4 Bytes |  | ptrClub | objo.Duni |  |  |  |  |
| 17203 | Club | Details | Random ID | 4 Bytes |  | ptrClub | objo.Rdui |  |  |  |  |
| 1156 | Club | Details | Full Name | String |  | ptrClub | 4 -> cluo.Cnam |  |  | 32 | 0 |
| 1157 | Club | Details | Short Name | String |  | ptrClub | 4 -> cluo.Csnm |  |  | 16 | 0 |
| 1187 | Club | Details | Nickname | String |  | ptrClub | 4 -> cluo.Tcnn -> cluo.Cino |  |  | 32 | 0 |
| 12863 | Club | Details | Six Letter Name | String |  | ptrClub | 4 -> cluo.Csxn -> cluo.Cint |  |  | 32 | 0 |
| 1094 | Club | Details | Nation | String |  | ptrClub | 4 -> nato.Nnam -> cluo.Cnti |  |  | 32 | 0 |
| 12868 | Club | Details | Based Nation | String |  | ptrClub | 4 -> nato.Nnam -> cluo.Cbni |  |  | 32 | 0 |
| 12867 | Club | Details | Continental Cup Nation | String |  | ptrClub | 4 -> nato.Nnam -> cluo.Cccn |  |  | 32 | 0 |
| 17651 | Club | Details | City | String |  | ptrClub | 4 -> ctyo.Cnam -> cluo.Ccty |  |  | 32 | 0 |
| 295 | Club | Details | Year Founded | 2 Bytes |  | ptrClub | cluo.Cyfn -> cluo.Cint |  |  |  |  |
| 1323 | Club | Details | Status | Byte |  | ptrClub | cluo.Cprs |  |  |  |  |
| 632 | Club | Details | Team Type | Byte |  | ptrTeam | teao.Ttyp |  |  |  |  |
| 297 | Club | Details | Morale | Byte |  | ptrClub | cluo.Cmle -> cluo.Cint |  |  |  |  |
| 300 | Club | Details | Reputation | 2 Bytes |  | ptrTeam | teao.Trep |  |  |  |  |
| 12610 | Club | Details | Scouting Package | Byte |  | ptrClub | cluo.Cscp -> cluo.Cint |  |  |  |  |
| 23745 | Club | Details | Allow Licensed Kit | Binary |  | ptrClub | teao.Tmlk -> 0 -> cluo.Ctea | 3 | 1 |  |  |
| 1273 | Club | Details | Hex | 4 Bytes |  | ptrClub | cluo.Ttcl -> cluo.Cino |  |  |  |  |
| 1334 | Club | Details | Red | Byte |  | ptrClub | cluo.Ttcl+2 -> cluo.Cino |  |  |  |  |
| 1339 | Club | Details | Green | Byte |  | ptrClub | cluo.Ttcl+1 -> cluo.Cino |  |  |  |  |
| 1340 | Club | Details | Blue | Byte |  | ptrClub | cluo.Ttcl -> cluo.Cino |  |  |  |  |
| 1341 | Club | Details | Opacity | Byte |  | ptrClub | cluo.Ttcl+3 -> cluo.Cino |  |  |  |  |
| 1318 | Club | Details | Hex | 4 Bytes |  | ptrClub | cluo.Tbcl -> cluo.Cino |  |  |  |  |
| 1338 | Club | Details | Red | Byte |  | ptrClub | cluo.Tbcl+2 -> cluo.Cino |  |  |  |  |
| 1335 | Club | Details | Green | Byte |  | ptrClub | cluo.Tbcl+1 -> cluo.Cino |  |  |  |  |
| 1336 | Club | Details | Blue | Byte |  | ptrClub | cluo.Tbcl -> cluo.Cino |  |  |  |  |
| 1337 | Club | Details | Opacity | Byte |  | ptrClub | cluo.Tbcl+3 -> cluo.Cino |  |  |  |  |
| 12437 | Club | Ownership | Chairman Title | Byte |  | ptrClub | cluo.Chti -> cluo.Cint |  |  |  |  |
| 12438 | Club | Ownership | Ownership Type | Byte |  | ptrClub | cluo.Cown -> cluo.Cint |  |  |  |  |
| 12439 | Club | Ownership | Chairman Status | 2 Bytes |  | ptrClub | cluo.Chst -> cluo.Cint |  |  |  |  |
| 1475 | Club | Facilities | Stadium | String |  | ptrClub | 4 -> stao.Snam -> teao.Tsti -> 0 -> cluo.Ctea |  |  | 32 | 0 |
| 17634 | Club | Facilities | Training Ground | String |  | ptrClub | 4 -> stao.Snam -> cluo.Ctrg |  |  | 32 | 0 |
| 653 | Club | Facilities | Average Attendance | 4 Bytes |  | ptrClub | cluo.Catd -> cluo.Cino |  |  |  |  |
| 657 | Club | Facilities | Minimum Attendance | 4 Bytes |  | ptrClub | cluo.Cmna -> cluo.Cino |  |  |  |  |
| 656 | Club | Facilities | Maximum Attendance | 4 Bytes |  | ptrClub | cluo.Cmxa -> cluo.Cino |  |  |  |  |
| 11371 | Club | Facilities | Training Facilities | Byte |  | ptrClub | cluo.Ctlv -> cluo.Cint |  |  |  |  |
| 290 | Club | Facilities | Youth Coaching | Byte |  | ptrClub | cluo.Cytv -> cluo.Cint |  |  |  |  |
| 291 | Club | Facilities | Youth Facilities | Byte |  | ptrClub | cluo.Cyfb -> cluo.Cint |  |  |  |  |
| 289 | Club | Facilities | Youth Recruitment | Byte |  | ptrClub | cluo.Crcb -> cluo.Cint |  |  |  |  |
| 294 | Club | Facilities | Youth Importance | Byte |  | ptrClub | cluo.Cyim -> cluo.Cint |  |  |  |  |
| 687 | Club | Facilities | Corporate Facilities | Byte |  | ptrClub | cluo.Ccfe -> cluo.Cfin |  |  |  |  |
| 686 | Club | Finances | Balance | Custom | United Kingdom Pound | ptrClub | cluo.Ccba -> cluo.Cfin |  |  |  |  |
| 706 | Club | Finances | Transfer Budget (Season) | Custom | United Kingdom Pound | ptrClub | cluo.Ctbu -> cluo.Cfin |  |  |  |  |
| 705 | Club | Finances | Transfer Budget (Rem.) | Custom | United Kingdom Pound | ptrClub | cluo.Ctbc -> cluo.Cfin |  |  |  |  |
| 704 | Club | Finances | Trn. Income Made Available (%) | Byte |  | ptrClub | cluo.Ctpc -> cluo.Cfin |  |  |  |  |
| 703 | Club | Finances | Weekly Wage Budget | Custom | United Kingdom Pound | ptrClub | cluo.Crmb -> cluo.Cfin |  |  |  |  |
| 702 | Club | Finances | Weekly Wage Total | Custom | United Kingdom Pound | ptrClub | cluo.Ctwg -> cluo.Cfin |  |  |  |  |
| 12488 | Club | Finances | Weekly Wage Total (Incl. Bonuses) | Custom | United Kingdom Pound | ptrClub | cluo.Ctwb -> cluo.Cfin |  |  |  |  |
| 12115 | Club | Finances | Highest Wage Allowed | Custom | United Kingdom Pound | ptrClub | cluo.Cmwe -> cluo.Cfin |  |  |  |  |
| 700 | Club | Finances | Highest Wage Paid | Custom | United Kingdom Pound | ptrClub | cluo.Chwp -> cluo.Cfin |  |  |  |  |
| 699 | Club | Finances | Highest Staff Wage Paid | Custom | United Kingdom Pound | ptrClub | cluo.Chws -> cluo.Cfin |  |  |  |  |
| 697 | Club | Finances | Sugar Daddy | Byte |  | ptrClub | cluo.Chsd -> cluo.Cfin |  |  |  |  |
| 689 | Club | Finances | Sugar Daddy Increases Starting Finances | Binary |  | ptrClub | cluo.Chaf -> cluo.Cfin | 0 | 1 |  |  |
| 12592 | Club | Finances | In Administration | Binary |  | ptrClub | cluo.Cadm -> cluo.Cfin | 1 | 1 |  |  |
| 17822 | Club | Finances | Embargo Start Date | Custom | FM Date | ptrClub | cluo.Cesd -> cluo.Cfin |  |  |  |  |
| 17823 | Club | Finances | Embargo End Date | Custom | FM Date | ptrClub | cluo.Ceed -> cluo.Cfin |  |  |  |  |
| 17824 | Club | Finances | Embargo Appeal Date | Custom | FM Date | ptrClub | cluo.Cead -> cluo.Cfin |  |  |  |  |
| 690 | Club | Finances | Stadium Rental Per Year | Custom | United Kingdom Pound | ptrClub | cluo.Csry -> cluo.Cfin |  |  |  |  |
| 696 | Club | Finances | Average Match Ticket Price | Float |  | ptrClub | cluo.Cmtp -> cluo.Cfin |  |  |  |  |
| 695 | Club | Finances | Average Season Ticket Price | Float |  | ptrClub | cluo.Casp -> cluo.Cfin |  |  |  |  |
| 1278 | Club | Finances | Number Of Season Ticket Holders | 4 Bytes |  | ptrClub | cluo.Csth -> cluo.Cint |  |  |  |  |
| 19989 | Club | Finances | Corporate Facilities Income | Custom | United Kingdom Pound | ptrClub | cluo.Citm+0x3C -> cluo.Cfin |  |  |  |  |
| 20006 | Club | Finances | Fund Raising | Custom | United Kingdom Pound | ptrClub | cluo.Citm+0x24 -> cluo.Cfin |  |  |  |  |
| 19983 | Club | Finances | Gate Receipts | Custom | United Kingdom Pound | ptrClub | cluo.Citm -> cluo.Cfin |  |  |  |  |
| 19987 | Club | Finances | Grants | Custom | United Kingdom Pound | ptrClub | cluo.Citm+0x2C -> cluo.Cfin |  |  |  |  |
| 19980 | Club | Finances | Interest | Custom | United Kingdom Pound | ptrClub | cluo.Citm+0xC -> cluo.Cfin |  |  |  |  |
| 20004 | Club | Finances | Investments | Custom | United Kingdom Pound | ptrClub | cluo.Citm+0x10 -> cluo.Cfin |  |  |  |  |
| 24084 | Club | Finances | Loan Income | Custom | United Kingdom Pound | ptrClub | cluo.Citm+0x44 -> cluo.Cfin |  |  |  |  |
| 19986 | Club | Finances | Match Day Income | Custom | United Kingdom Pound | ptrClub | cluo.Citm+0x20 -> cluo.Cfin |  |  |  |  |
| 19984 | Club | Finances | Merchandising | Custom | United Kingdom Pound | ptrClub | cluo.Citm+0x14 -> cluo.Cfin |  |  |  |  |
| 20002 | Club | Finances | Other | Custom | United Kingdom Pound | ptrClub | cluo.Citm+0x4 -> cluo.Cfin |  |  |  |  |
| 19985 | Club | Finances | Players Sold | Custom | United Kingdom Pound | ptrClub | cluo.Citm+0x18 -> cluo.Cfin |  |  |  |  |
| 20007 | Club | Finances | Prize Money | Custom | United Kingdom Pound | ptrClub | cluo.Citm+0x34 -> cluo.Cfin |  |  |  |  |
| 19982 | Club | Finances | Season Tickets | Custom | United Kingdom Pound | ptrClub | cluo.Citm+0x8 -> cluo.Cfin |  |  |  |  |
| 20010 | Club | Finances | Soladarity Payments | Custom | United Kingdom Pound | ptrClub | cluo.Citm+0x40 -> cluo.Cfin |  |  |  |  |
| 20003 | Club | Finances | Sponsorship | Custom | United Kingdom Pound | ptrClub | cluo.Citm+0x1C -> cluo.Cfin |  |  |  |  |
| 19988 | Club | Finances | TV Revenue | Custom | United Kingdom Pound | ptrClub | cluo.Citm+0x38 -> cluo.Cfin |  |  |  |  |
| 24234 | Club | Finances | Corporate Facilities Income | Custom | United Kingdom Pound | ptrClub | cluo.Cilm+0x3C -> cluo.Cfin |  |  |  |  |
| 24235 | Club | Finances | Fund Raising | Custom | United Kingdom Pound | ptrClub | cluo.Cilm+0x24 -> cluo.Cfin |  |  |  |  |
| 24236 | Club | Finances | Gate Receipts | Custom | United Kingdom Pound | ptrClub | cluo.Cilm -> cluo.Cfin |  |  |  |  |
| 24237 | Club | Finances | Grants | Custom | United Kingdom Pound | ptrClub | cluo.Cilm+0x2C -> cluo.Cfin |  |  |  |  |
| 24238 | Club | Finances | Interest | Custom | United Kingdom Pound | ptrClub | cluo.Cilm+0xC -> cluo.Cfin |  |  |  |  |
| 24239 | Club | Finances | Investments | Custom | United Kingdom Pound | ptrClub | cluo.Cilm+0x10 -> cluo.Cfin |  |  |  |  |
| 24240 | Club | Finances | Loan Income | Custom | United Kingdom Pound | ptrClub | cluo.Cilm+0x44 -> cluo.Cfin |  |  |  |  |
| 24241 | Club | Finances | Match Day Income | Custom | United Kingdom Pound | ptrClub | cluo.Cilm+0x20 -> cluo.Cfin |  |  |  |  |
| 24242 | Club | Finances | Merchandising | Custom | United Kingdom Pound | ptrClub | cluo.Cilm+0x14 -> cluo.Cfin |  |  |  |  |
| 24243 | Club | Finances | Other | Custom | United Kingdom Pound | ptrClub | cluo.Cilm+0x4 -> cluo.Cfin |  |  |  |  |
| 24244 | Club | Finances | Players Sold | Custom | United Kingdom Pound | ptrClub | cluo.Cilm+0x18 -> cluo.Cfin |  |  |  |  |
| 24245 | Club | Finances | Prize Money | Custom | United Kingdom Pound | ptrClub | cluo.Cilm+0x34 -> cluo.Cfin |  |  |  |  |
| 24246 | Club | Finances | Season Tickets | Custom | United Kingdom Pound | ptrClub | cluo.Cilm+0x8 -> cluo.Cfin |  |  |  |  |
| 24247 | Club | Finances | Soladarity Payments | Custom | United Kingdom Pound | ptrClub | cluo.Cilm+0x40 -> cluo.Cfin |  |  |  |  |
| 24248 | Club | Finances | Sponsorship | Custom | United Kingdom Pound | ptrClub | cluo.Cilm+0x1C -> cluo.Cfin |  |  |  |  |
| 24249 | Club | Finances | TV Revenue | Custom | United Kingdom Pound | ptrClub | cluo.Cilm+0x38 -> cluo.Cfin |  |  |  |  |
| 19999 | Club | Finances | Corporate Facilities Income | Custom | United Kingdom Pound | ptrClub | cluo.Cits+0x3C -> cluo.Cfin |  |  |  |  |
| 20009 | Club | Finances | Fund Raising | Custom | United Kingdom Pound | ptrClub | cluo.Cits+0x24 -> cluo.Cfin |  |  |  |  |
| 19991 | Club | Finances | Gate Receipts | Custom | United Kingdom Pound | ptrClub | cluo.Cits -> cluo.Cfin |  |  |  |  |
| 19997 | Club | Finances | Grants | Custom | United Kingdom Pound | ptrClub | cluo.Cits+0x2C -> cluo.Cfin |  |  |  |  |
| 19993 | Club | Finances | Interest | Custom | United Kingdom Pound | ptrClub | cluo.Cits+0xC -> cluo.Cfin |  |  |  |  |
| 20005 | Club | Finances | Investments | Custom | United Kingdom Pound | ptrClub | cluo.Cits+0x10 -> cluo.Cfin |  |  |  |  |
| 24085 | Club | Finances | Loan Income | Custom | United Kingdom Pound | ptrClub | cluo.Cits+0x44 -> cluo.Cfin |  |  |  |  |
| 19996 | Club | Finances | Match Day Income | Custom | United Kingdom Pound | ptrClub | cluo.Cits+0x20 -> cluo.Cfin |  |  |  |  |
| 19994 | Club | Finances | Merchandising | Custom | United Kingdom Pound | ptrClub | cluo.Cits+0x14 -> cluo.Cfin |  |  |  |  |
| 20000 | Club | Finances | Other | Custom | United Kingdom Pound | ptrClub | cluo.Cits+0x4 -> cluo.Cfin |  |  |  |  |
| 19995 | Club | Finances | Players Sold | Custom | United Kingdom Pound | ptrClub | cluo.Cits+0x18 -> cluo.Cfin |  |  |  |  |
| 20008 | Club | Finances | Prize Money | Custom | United Kingdom Pound | ptrClub | cluo.Cits+0x34 -> cluo.Cfin |  |  |  |  |
| 19992 | Club | Finances | Season Tickets | Custom | United Kingdom Pound | ptrClub | cluo.Cits+0x8 -> cluo.Cfin |  |  |  |  |
| 20011 | Club | Finances | Soladarity Payments | Custom | United Kingdom Pound | ptrClub | cluo.Cits+0x40 -> cluo.Cfin |  |  |  |  |
| 20001 | Club | Finances | Sponsorship | Custom | United Kingdom Pound | ptrClub | cluo.Cits+0x1C -> cluo.Cfin |  |  |  |  |
| 19998 | Club | Finances | TV Revenue | Custom | United Kingdom Pound | ptrClub | cluo.Cits+0x38 -> cluo.Cfin |  |  |  |  |
| 24251 | Club | Finances | Corporate Facilities Income | Custom | United Kingdom Pound | ptrClub | cluo.Cils+0x3C -> cluo.Cfin |  |  |  |  |
| 24252 | Club | Finances | Fund Raising | Custom | United Kingdom Pound | ptrClub | cluo.Cils+0x24 -> cluo.Cfin |  |  |  |  |
| 24253 | Club | Finances | Gate Receipts | Custom | United Kingdom Pound | ptrClub | cluo.Cils -> cluo.Cfin |  |  |  |  |
| 24254 | Club | Finances | Grants | Custom | United Kingdom Pound | ptrClub | cluo.Cils+0x2C -> cluo.Cfin |  |  |  |  |
| 24255 | Club | Finances | Interest | Custom | United Kingdom Pound | ptrClub | cluo.Cils+0xC -> cluo.Cfin |  |  |  |  |
| 24256 | Club | Finances | Investments | Custom | United Kingdom Pound | ptrClub | cluo.Cils+0x10 -> cluo.Cfin |  |  |  |  |
| 24257 | Club | Finances | Loan Income | Custom | United Kingdom Pound | ptrClub | cluo.Cils+0x44 -> cluo.Cfin |  |  |  |  |
| 24258 | Club | Finances | Match Day Income | Custom | United Kingdom Pound | ptrClub | cluo.Cils+0x20 -> cluo.Cfin |  |  |  |  |
| 24259 | Club | Finances | Merchandising | Custom | United Kingdom Pound | ptrClub | cluo.Cils+0x14 -> cluo.Cfin |  |  |  |  |
| 24260 | Club | Finances | Other | Custom | United Kingdom Pound | ptrClub | cluo.Cils+0x4 -> cluo.Cfin |  |  |  |  |
| 24261 | Club | Finances | Players Sold | Custom | United Kingdom Pound | ptrClub | cluo.Cils+0x18 -> cluo.Cfin |  |  |  |  |
| 24262 | Club | Finances | Prize Money | Custom | United Kingdom Pound | ptrClub | cluo.Cils+0x34 -> cluo.Cfin |  |  |  |  |
| 24263 | Club | Finances | Season Tickets | Custom | United Kingdom Pound | ptrClub | cluo.Cils+0x8 -> cluo.Cfin |  |  |  |  |
| 24264 | Club | Finances | Soladarity Payments | Custom | United Kingdom Pound | ptrClub | cluo.Cils+0x40 -> cluo.Cfin |  |  |  |  |
| 24265 | Club | Finances | Sponsorship | Custom | United Kingdom Pound | ptrClub | cluo.Cils+0x1C -> cluo.Cfin |  |  |  |  |
| 24266 | Club | Finances | TV Revenue | Custom | United Kingdom Pound | ptrClub | cluo.Cils+0x38 -> cluo.Cfin |  |  |  |  |
| 11607 | Club | Finances | Agent Fees | Custom | United Kingdom Pound | ptrClub | cluo.Cetm+0x80 -> cluo.Cfin |  |  |  |  |
| 11609 | Club | Finances | Bonuses | Custom | United Kingdom Pound | ptrClub | cluo.Cetm+0x1C -> cluo.Cfin |  |  |  |  |
| 12603 | Club | Finances | Director Emoluments | Custom | United Kingdom Pound | ptrClub | cluo.Cetm+0x78 -> cluo.Cfin |  |  |  |  |
| 12860 | Club | Finances | Dividends | Custom | United Kingdom Pound | ptrClub | cluo.Cetm+0x18 -> cluo.Cfin |  |  |  |  |
| 11622 | Club | Finances | Ground Maintenance | Custom | United Kingdom Pound | ptrClub | cluo.Cetm+0xC -> cluo.Cfin |  |  |  |  |
| 24086 | Club | Finances | Insurance | Custom | United Kingdom Pound | ptrClub | cluo.Cetm+0x94 -> cluo.Cfin |  |  |  |  |
| 24184 | Club | Finances | League Fines | Custom | United Kingdom Pound | ptrClub | cluo.Cetm+0x8 -> cluo.Cfin |  |  |  |  |
| 24087 | Club | Finances | Loan Fees | Custom | United Kingdom Pound | ptrClub | cluo.Cetm+0x98 -> cluo.Cfin |  |  |  |  |
| 24185 | Club | Finances | Loan Repayments and Interest | Custom | United Kingdom Pound | ptrClub | cluo.Cetm+0x4 -> cluo.Cfin |  |  |  |  |
| 11617 | Club | Finances | Loyalty Bonuses | Custom | United Kingdom Pound | ptrClub | cluo.Cetm+0x20 -> cluo.Cfin |  |  |  |  |
| 11619 | Club | Finances | Match Day Expenses | Custom | United Kingdom Pound | ptrClub | cluo.Cetm+0x74 -> cluo.Cfin |  |  |  |  |
| 11605 | Club | Finances | Non-Football Costs | Custom | United Kingdom Pound | ptrClub | cluo.Cetm+0x7C -> cluo.Cfin |  |  |  |  |
| 11603 | Club | Finances | Other | Custom | United Kingdom Pound | ptrClub | cluo.Cetm -> cluo.Cfin |  |  |  |  |
| 12434 | Club | Finances | Player Wages | Custom | United Kingdom Pound | ptrClub | cluo.Cetm+0x10 -> cluo.Cfin |  |  |  |  |
| 12605 | Club | Finances | Scouting Costs | Custom | United Kingdom Pound | ptrClub | cluo.Cetm+0x88 -> cluo.Cfin |  |  |  |  |
| 11598 | Club | Finances | Staff Wages | Custom | United Kingdom Pound | ptrClub | cluo.Cetm+0x14 -> cluo.Cfin |  |  |  |  |
| 24186 | Club | Finances | Tax - Income Tax | Custom | United Kingdom Pound | ptrClub | cluo.Cetm+0x2C -> cluo.Cfin |  |  |  |  |
| 24187 | Club | Finances | Tax - Employer Tax | Custom | United Kingdom Pound | ptrClub | cluo.Cetm+0x30 -> cluo.Cfin |  |  |  |  |
| 12433 | Club | Finances | Tax - Corporation Tax | Custom | United Kingdom Pound | ptrClub | cluo.Cetm+0x34 -> cluo.Cfin |  |  |  |  |
| 12597 | Club | Finances | Tax - VAT | Custom | United Kingdom Pound | ptrClub | cluo.Cetm+0x38 -> cluo.Cfin |  |  |  |  |
| 24188 | Club | Finances | Tax - Nl Employee | Custom | United Kingdom Pound | ptrClub | cluo.Cetm+0x3C -> cluo.Cfin |  |  |  |  |
| 12599 | Club | Finances | Tax - Nl Employer | Custom | United Kingdom Pound | ptrClub | cluo.Cetm+0x40 -> cluo.Cfin |  |  |  |  |
| 24192 | Club | Finances | Tax - Pension Employee | Custom | United Kingdom Pound | ptrClub | cluo.Cetm+0x44 -> cluo.Cfin |  |  |  |  |
| 24191 | Club | Finances | Tax - Pension Employer | Custom | United Kingdom Pound | ptrClub | cluo.Cetm+0x48 -> cluo.Cfin |  |  |  |  |
| 24190 | Club | Finances | Tax - Transfer Tax | Custom | United Kingdom Pound | ptrClub | cluo.Cetm+0x4C -> cluo.Cfin |  |  |  |  |
| 24189 | Club | Finances | Tax - Internal Transfer Tax | Custom | United Kingdom Pound | ptrClub | cluo.Cetm+0x50 -> cluo.Cfin |  |  |  |  |
| 24083 | Club | Finances | Tax - External Transfer Tax | Custom | United Kingdom Pound | ptrClub | cluo.Cetm+0x54 -> cluo.Cfin |  |  |  |  |
| 24193 | Club | Finances | Tax - Ticket Entertainment Tax | Custom | United Kingdom Pound | ptrClub | cluo.Cetm+0x60 -> cluo.Cfin |  |  |  |  |
| 11850 | Club | Finances | Tax - Other | Custom | United Kingdom Pound | ptrClub | cluo.Cetm+0x64 -> cluo.Cfin |  |  |  |  |
| 24194 | Club | Finances | Tax - Brazilian Ticket Tax | Custom | United Kingdom Pound | ptrClub | cluo.Cetm+0x68 -> cluo.Cfin |  |  |  |  |
| 24195 | Club | Finances | Tax - Foreign Player Transfer Tax | Custom | United Kingdom Pound | ptrClub | cluo.Cetm+0x6C -> cluo.Cfin |  |  |  |  |
| 24196 | Club | Finances | Tax - Domestic Player Transfer Tax | Custom | United Kingdom Pound | ptrClub | cluo.Cetm+0x70 -> cluo.Cfin |  |  |  |  |
| 12600 | Club | Finances | Transfer Expenditure | Custom | United Kingdom Pound | ptrClub | cluo.Cetm+0x24 -> cluo.Cfin |  |  |  |  |
| 11615 | Club | Finances | Travel Costs | Custom | United Kingdom Pound | ptrClub | cluo.Cetm+0x8C -> cluo.Cfin |  |  |  |  |
| 12609 | Club | Finances | Youth Setup | Custom | United Kingdom Pound | ptrClub | cluo.Cetm+0x84 -> cluo.Cfin |  |  |  |  |
| 24198 | Club | Finances | Agent Fees | Custom | United Kingdom Pound | ptrClub | cluo.Celm+0x80 -> cluo.Cfin |  |  |  |  |
| 24199 | Club | Finances | Bonuses | Custom | United Kingdom Pound | ptrClub | cluo.Celm+0x1C -> cluo.Cfin |  |  |  |  |
| 24200 | Club | Finances | Director Emoluments | Custom | United Kingdom Pound | ptrClub | cluo.Celm+0x78 -> cluo.Cfin |  |  |  |  |
| 24201 | Club | Finances | Dividends | Custom | United Kingdom Pound | ptrClub | cluo.Celm+0x18 -> cluo.Cfin |  |  |  |  |
| 24202 | Club | Finances | Ground Maintenance | Custom | United Kingdom Pound | ptrClub | cluo.Celm+0xC -> cluo.Cfin |  |  |  |  |
| 24203 | Club | Finances | Insurance | Custom | United Kingdom Pound | ptrClub | cluo.Celm+0x94 -> cluo.Cfin |  |  |  |  |
| 24204 | Club | Finances | League Fines | Custom | United Kingdom Pound | ptrClub | cluo.Celm+0x8 -> cluo.Cfin |  |  |  |  |
| 24205 | Club | Finances | Loan Fees | Custom | United Kingdom Pound | ptrClub | cluo.Celm+0x98 -> cluo.Cfin |  |  |  |  |
| 24206 | Club | Finances | Loan Repayments and Interest | Custom | United Kingdom Pound | ptrClub | cluo.Celm+0x4 -> cluo.Cfin |  |  |  |  |
| 24207 | Club | Finances | Loyalty Bonuses | Custom | United Kingdom Pound | ptrClub | cluo.Celm+0x20 -> cluo.Cfin |  |  |  |  |
| 24208 | Club | Finances | Match Day Expenses | Custom | United Kingdom Pound | ptrClub | cluo.Celm+0x74 -> cluo.Cfin |  |  |  |  |
| 24209 | Club | Finances | Non-Football Costs | Custom | United Kingdom Pound | ptrClub | cluo.Celm+0x7C -> cluo.Cfin |  |  |  |  |
| 24210 | Club | Finances | Other | Custom | United Kingdom Pound | ptrClub | cluo.Celm -> cluo.Cfin |  |  |  |  |
| 24211 | Club | Finances | Player Wages | Custom | United Kingdom Pound | ptrClub | cluo.Celm+0x10 -> cluo.Cfin |  |  |  |  |
| 24212 | Club | Finances | Scouting Costs | Custom | United Kingdom Pound | ptrClub | cluo.Celm+0x88 -> cluo.Cfin |  |  |  |  |
| 24213 | Club | Finances | Staff Wages | Custom | United Kingdom Pound | ptrClub | cluo.Celm+0x14 -> cluo.Cfin |  |  |  |  |
| 24214 | Club | Finances | Tax - Income Tax | Custom | United Kingdom Pound | ptrClub | cluo.Celm+0x2C -> cluo.Cfin |  |  |  |  |
| 24215 | Club | Finances | Tax - Employer Tax | Custom | United Kingdom Pound | ptrClub | cluo.Celm+0x30 -> cluo.Cfin |  |  |  |  |
| 24216 | Club | Finances | Tax - Corporation Tax | Custom | United Kingdom Pound | ptrClub | cluo.Celm+0x34 -> cluo.Cfin |  |  |  |  |
| 24217 | Club | Finances | Tax - VAT | Custom | United Kingdom Pound | ptrClub | cluo.Celm+0x38 -> cluo.Cfin |  |  |  |  |
| 24218 | Club | Finances | Tax - Nl Employee | Custom | United Kingdom Pound | ptrClub | cluo.Celm+0x3C -> cluo.Cfin |  |  |  |  |
| 24219 | Club | Finances | Tax - Nl Employer | Custom | United Kingdom Pound | ptrClub | cluo.Celm+0x40 -> cluo.Cfin |  |  |  |  |
| 24220 | Club | Finances | Tax - Pension Employee | Custom | United Kingdom Pound | ptrClub | cluo.Celm+0x44 -> cluo.Cfin |  |  |  |  |
| 24221 | Club | Finances | Tax - Pension Employer | Custom | United Kingdom Pound | ptrClub | cluo.Celm+0x48 -> cluo.Cfin |  |  |  |  |
| 24222 | Club | Finances | Tax - Transfer Tax | Custom | United Kingdom Pound | ptrClub | cluo.Celm+0x4C -> cluo.Cfin |  |  |  |  |
| 24223 | Club | Finances | Tax - Internal Transfer Tax | Custom | United Kingdom Pound | ptrClub | cluo.Celm+0x50 -> cluo.Cfin |  |  |  |  |
| 24224 | Club | Finances | Tax - External Transfer Tax | Custom | United Kingdom Pound | ptrClub | cluo.Celm+0x54 -> cluo.Cfin |  |  |  |  |
| 24225 | Club | Finances | Tax - Ticket Entertainment Tax | Custom | United Kingdom Pound | ptrClub | cluo.Celm+0x60 -> cluo.Cfin |  |  |  |  |
| 24226 | Club | Finances | Tax - Other | Custom | United Kingdom Pound | ptrClub | cluo.Celm+0x64 -> cluo.Cfin |  |  |  |  |
| 24227 | Club | Finances | Tax - Brazilian Ticket Tax | Custom | United Kingdom Pound | ptrClub | cluo.Celm+0x68 -> cluo.Cfin |  |  |  |  |
| 24228 | Club | Finances | Tax - Foreign Player Transfer Tax | Custom | United Kingdom Pound | ptrClub | cluo.Celm+0x6C -> cluo.Cfin |  |  |  |  |
| 24229 | Club | Finances | Tax - Domestic Player Transfer Tax | Custom | United Kingdom Pound | ptrClub | cluo.Celm+0x70 -> cluo.Cfin |  |  |  |  |
| 24230 | Club | Finances | Transfer Expenditure | Custom | United Kingdom Pound | ptrClub | cluo.Celm+0x24 -> cluo.Cfin |  |  |  |  |
| 24231 | Club | Finances | Travel Costs | Custom | United Kingdom Pound | ptrClub | cluo.Celm+0x8C -> cluo.Cfin |  |  |  |  |
| 24232 | Club | Finances | Youth Setup | Custom | United Kingdom Pound | ptrClub | cluo.Celm+0x84 -> cluo.Cfin |  |  |  |  |
| 11608 | Club | Finances | Agent Fees | Custom | United Kingdom Pound | ptrClub | cluo.Cets+0x80 -> cluo.Cfin |  |  |  |  |
| 11610 | Club | Finances | Bonuses | Custom | United Kingdom Pound | ptrClub | cluo.Cets+0x1C -> cluo.Cfin |  |  |  |  |
| 12602 | Club | Finances | Director Emoluments | Custom | United Kingdom Pound | ptrClub | cluo.Cets+0x78 -> cluo.Cfin |  |  |  |  |
| 12861 | Club | Finances | Dividends | Custom | United Kingdom Pound | ptrClub | cluo.Cets+0x18 -> cluo.Cfin |  |  |  |  |
| 11621 | Club | Finances | Ground Maintenance | Custom | United Kingdom Pound | ptrClub | cluo.Cets+0xC -> cluo.Cfin |  |  |  |  |
| 24088 | Club | Finances | Insurance | Custom | United Kingdom Pound | ptrClub | cluo.Cets+0x94 -> cluo.Cfin |  |  |  |  |
| 24146 | Club | Finances | League Fines | Custom | United Kingdom Pound | ptrClub | cluo.Cets+0x8 -> cluo.Cfin |  |  |  |  |
| 24089 | Club | Finances | Loan Fees | Custom | United Kingdom Pound | ptrClub | cluo.Cets+0x98 -> cluo.Cfin |  |  |  |  |
| 24147 | Club | Finances | Loan Repayments and Interest | Custom | United Kingdom Pound | ptrClub | cluo.Cets+0x4 -> cluo.Cfin |  |  |  |  |
| 11618 | Club | Finances | Loyalty Bonuses | Custom | United Kingdom Pound | ptrClub | cluo.Cets+0x20 -> cluo.Cfin |  |  |  |  |
| 11620 | Club | Finances | Match Day Expenses | Custom | United Kingdom Pound | ptrClub | cluo.Cets+0x74 -> cluo.Cfin |  |  |  |  |
| 11606 | Club | Finances | Non-Football Costs | Custom | United Kingdom Pound | ptrClub | cluo.Cets+0x7C -> cluo.Cfin |  |  |  |  |
| 11604 | Club | Finances | Other | Custom | United Kingdom Pound | ptrClub | cluo.Cets -> cluo.Cfin |  |  |  |  |
| 11614 | Club | Finances | Player Wages | Custom | United Kingdom Pound | ptrClub | cluo.Cets+0x10 -> cluo.Cfin |  |  |  |  |
| 12604 | Club | Finances | Scouting Costs | Custom | United Kingdom Pound | ptrClub | cluo.Cets+0x88 -> cluo.Cfin |  |  |  |  |
| 11599 | Club | Finances | Staff Wages | Custom | United Kingdom Pound | ptrClub | cluo.Cets+0x14 -> cluo.Cfin |  |  |  |  |
| 24144 | Club | Finances | Tax - Income Tax | Custom | United Kingdom Pound | ptrClub | cluo.Cets+0x2C -> cluo.Cfin |  |  |  |  |
| 24145 | Club | Finances | Tax - Employer Tax | Custom | United Kingdom Pound | ptrClub | cluo.Cets+0x30 -> cluo.Cfin |  |  |  |  |
| 12435 | Club | Finances | Tax - Corporation Tax | Custom | United Kingdom Pound | ptrClub | cluo.Cets+0x34 -> cluo.Cfin |  |  |  |  |
| 12596 | Club | Finances | Tax - VAT | Custom | United Kingdom Pound | ptrClub | cluo.Cets+0x38 -> cluo.Cfin |  |  |  |  |
| 24139 | Club | Finances | Tax - Nl Employee | Custom | United Kingdom Pound | ptrClub | cluo.Cets+0x3C -> cluo.Cfin |  |  |  |  |
| 12598 | Club | Finances | Tax - Nl Employer | Custom | United Kingdom Pound | ptrClub | cluo.Cets+0x40 -> cluo.Cfin |  |  |  |  |
| 24143 | Club | Finances | Tax - Pension Employee | Custom | United Kingdom Pound | ptrClub | cluo.Cets+0x44 -> cluo.Cfin |  |  |  |  |
| 24140 | Club | Finances | Tax - Pension Employer | Custom | United Kingdom Pound | ptrClub | cluo.Cets+0x48 -> cluo.Cfin |  |  |  |  |
| 24142 | Club | Finances | Tax - Transfer Tax | Custom | United Kingdom Pound | ptrClub | cluo.Cets+0x4C -> cluo.Cfin |  |  |  |  |
| 24141 | Club | Finances | Tax - Internal Transfer Tax | Custom | United Kingdom Pound | ptrClub | cluo.Cets+0x50 -> cluo.Cfin |  |  |  |  |
| 24082 | Club | Finances | Tax - External Transfer Tax | Custom | United Kingdom Pound | ptrClub | cluo.Cets+0x54 -> cluo.Cfin |  |  |  |  |
| 24138 | Club | Finances | Tax - Ticket Entertainment Tax | Custom | United Kingdom Pound | ptrClub | cluo.Cets+0x60 -> cluo.Cfin |  |  |  |  |
| 11848 | Club | Finances | Tax - Other | Custom | United Kingdom Pound | ptrClub | cluo.Cets+0x64 -> cluo.Cfin |  |  |  |  |
| 24137 | Club | Finances | Tax - Brazilian Ticket Tax | Custom | United Kingdom Pound | ptrClub | cluo.Cets+0x68 -> cluo.Cfin |  |  |  |  |
| 24135 | Club | Finances | Tax - Foreign Player Transfer Tax | Custom | United Kingdom Pound | ptrClub | cluo.Cets+0x6C -> cluo.Cfin |  |  |  |  |
| 24136 | Club | Finances | Tax - Domestic Player Transfer Tax | Custom | United Kingdom Pound | ptrClub | cluo.Cets+0x70 -> cluo.Cfin |  |  |  |  |
| 12601 | Club | Finances | Transfer Expenditure | Custom | United Kingdom Pound | ptrClub | cluo.Cets+0x24 -> cluo.Cfin |  |  |  |  |
| 11616 | Club | Finances | Travel Costs | Custom | United Kingdom Pound | ptrClub | cluo.Cets+0x8C -> cluo.Cfin |  |  |  |  |
| 12608 | Club | Finances | Youth Setup | Custom | United Kingdom Pound | ptrClub | cluo.Cets+0x84 -> cluo.Cfin |  |  |  |  |
| 24149 | Club | Finances | Agent Fees | Custom | United Kingdom Pound | ptrClub | cluo.Cels+0x80 -> cluo.Cfin |  |  |  |  |
| 24150 | Club | Finances | Bonuses | Custom | United Kingdom Pound | ptrClub | cluo.Cels+0x1C -> cluo.Cfin |  |  |  |  |
| 24151 | Club | Finances | Director Emoluments | Custom | United Kingdom Pound | ptrClub | cluo.Cels+0x78 -> cluo.Cfin |  |  |  |  |
| 24152 | Club | Finances | Dividends | Custom | United Kingdom Pound | ptrClub | cluo.Cels+0x18 -> cluo.Cfin |  |  |  |  |
| 24153 | Club | Finances | Ground Maintenance | Custom | United Kingdom Pound | ptrClub | cluo.Cels+0xC -> cluo.Cfin |  |  |  |  |
| 24154 | Club | Finances | Insurance | Custom | United Kingdom Pound | ptrClub | cluo.Cels+0x94 -> cluo.Cfin |  |  |  |  |
| 24155 | Club | Finances | League Fines | Custom | United Kingdom Pound | ptrClub | cluo.Cels+0x8 -> cluo.Cfin |  |  |  |  |
| 24156 | Club | Finances | Loan Fees | Custom | United Kingdom Pound | ptrClub | cluo.Cels+0x98 -> cluo.Cfin |  |  |  |  |
| 24157 | Club | Finances | Loan Repayments and Interest | Custom | United Kingdom Pound | ptrClub | cluo.Cels+0x4 -> cluo.Cfin |  |  |  |  |
| 24158 | Club | Finances | Loyalty Bonuses | Custom | United Kingdom Pound | ptrClub | cluo.Cels+0x20 -> cluo.Cfin |  |  |  |  |
| 24159 | Club | Finances | Match Day Expenses | Custom | United Kingdom Pound | ptrClub | cluo.Cels+0x74 -> cluo.Cfin |  |  |  |  |
| 24160 | Club | Finances | Non-Football Costs | Custom | United Kingdom Pound | ptrClub | cluo.Cels+0x7C -> cluo.Cfin |  |  |  |  |
| 24161 | Club | Finances | Other | Custom | United Kingdom Pound | ptrClub | cluo.Cels -> cluo.Cfin |  |  |  |  |
| 24162 | Club | Finances | Player Wages | Custom | United Kingdom Pound | ptrClub | cluo.Cels+0x10 -> cluo.Cfin |  |  |  |  |
| 24163 | Club | Finances | Scouting Costs | Custom | United Kingdom Pound | ptrClub | cluo.Cels+0x88 -> cluo.Cfin |  |  |  |  |
| 24164 | Club | Finances | Staff Wages | Custom | United Kingdom Pound | ptrClub | cluo.Cels+0x14 -> cluo.Cfin |  |  |  |  |
| 24165 | Club | Finances | Tax - Income Tax | Custom | United Kingdom Pound | ptrClub | cluo.Cels+0x2C -> cluo.Cfin |  |  |  |  |
| 24166 | Club | Finances | Tax - Employer Tax | Custom | United Kingdom Pound | ptrClub | cluo.Cels+0x30 -> cluo.Cfin |  |  |  |  |
| 24167 | Club | Finances | Tax - Corporation Tax | Custom | United Kingdom Pound | ptrClub | cluo.Cels+0x34 -> cluo.Cfin |  |  |  |  |
| 24168 | Club | Finances | Tax - VAT | Custom | United Kingdom Pound | ptrClub | cluo.Cels+0x38 -> cluo.Cfin |  |  |  |  |
| 24169 | Club | Finances | Tax - Nl Employee | Custom | United Kingdom Pound | ptrClub | cluo.Cels+0x3C -> cluo.Cfin |  |  |  |  |
| 24170 | Club | Finances | Tax - Nl Employer | Custom | United Kingdom Pound | ptrClub | cluo.Cels+0x40 -> cluo.Cfin |  |  |  |  |
| 24171 | Club | Finances | Tax - Pension Employee | Custom | United Kingdom Pound | ptrClub | cluo.Cels+0x44 -> cluo.Cfin |  |  |  |  |
| 24172 | Club | Finances | Tax - Pension Employer | Custom | United Kingdom Pound | ptrClub | cluo.Cels+0x48 -> cluo.Cfin |  |  |  |  |
| 24173 | Club | Finances | Tax - Transfer Tax | Custom | United Kingdom Pound | ptrClub | cluo.Cels+0x4C -> cluo.Cfin |  |  |  |  |
| 24174 | Club | Finances | Tax - Internal Transfer Tax | Custom | United Kingdom Pound | ptrClub | cluo.Cels+0x50 -> cluo.Cfin |  |  |  |  |
| 24175 | Club | Finances | Tax - External Transfer Tax | Custom | United Kingdom Pound | ptrClub | cluo.Cels+0x54 -> cluo.Cfin |  |  |  |  |
| 24176 | Club | Finances | Tax - Ticket Entertainment Tax | Custom | United Kingdom Pound | ptrClub | cluo.Cels+0x60 -> cluo.Cfin |  |  |  |  |
| 24177 | Club | Finances | Tax - Other | Custom | United Kingdom Pound | ptrClub | cluo.Cels+0x64 -> cluo.Cfin |  |  |  |  |
| 24178 | Club | Finances | Tax - Brazilian Ticket Tax | Custom | United Kingdom Pound | ptrClub | cluo.Cels+0x68 -> cluo.Cfin |  |  |  |  |
| 24179 | Club | Finances | Tax - Foreign Player Transfer Tax | Custom | United Kingdom Pound | ptrClub | cluo.Cels+0x6C -> cluo.Cfin |  |  |  |  |
| 24180 | Club | Finances | Tax - Domestic Player Transfer Tax | Custom | United Kingdom Pound | ptrClub | cluo.Cels+0x70 -> cluo.Cfin |  |  |  |  |
| 24181 | Club | Finances | Transfer Expenditure | Custom | United Kingdom Pound | ptrClub | cluo.Cels+0x24 -> cluo.Cfin |  |  |  |  |
| 24182 | Club | Finances | Travel Costs | Custom | United Kingdom Pound | ptrClub | cluo.Cels+0x8C -> cluo.Cfin |  |  |  |  |
| 24183 | Club | Finances | Youth Setup | Custom | United Kingdom Pound | ptrClub | cluo.Cels+0x84 -> cluo.Cfin |  |  |  |  |
| 674 | Club | Tactical Attributes | Preferred Formation | Byte |  | ptrClub | cluo.Cpfr -> cluo.Cino |  |  |  |  |
| 673 | Club | Tactical Attributes | Second Preferred Formation | Byte |  | ptrClub | cluo.C2pf -> cluo.Cino |  |  |  |  |
| 672 | Club | Tactical Attributes | Defensive Formation | Byte |  | ptrClub | cluo.Cdfo -> cluo.Cino |  |  |  |  |
| 675 | Club | Tactical Attributes | Attacking Formation | Byte |  | ptrClub | cluo.Cafo -> cluo.Cino |  |  |  |  |
| 23742 | Club | Supporters -> | Social Media Followers | 4 Bytes |  | ptrClub | cluo.Cssf -> cluo.Cint |  |  |  |  |
| 23741 | Club | Supporters -> | Social Stature | 2 Bytes |  | ptrClub | cluo.Csss -> cluo.Cint |  |  |  |  |
| 23740 | Club | Supporters -> | Social Trendiness | 2 Bytes |  | ptrClub | cluo.Csst -> cluo.Cint |  |  |  |  |
| 1326 | Club | Supporters -> | Loyalty | Byte |  | ptrClub | cluo.Csly -> cluo.Cint |  |  |  |  |
| 1331 | Club | Supporters -> | Passion | Byte |  | ptrClub | cluo.Csps -> cluo.Cint |  |  |  |  |
| 1330 | Club | Supporters -> | Patience | Byte |  | ptrClub | cluo.Cspt -> cluo.Cint |  |  |  |  |
| 1329 | Club | Supporters -> | Affluence | Byte |  | ptrClub | cluo.Csaf -> cluo.Cint |  |  |  |  |
| 1328 | Club | Supporters -> | Temperament | Byte |  | ptrClub | cluo.Cste -> cluo.Cint |  |  |  |  |
| 1327 | Club | Supporters -> | Expectations | Byte |  | ptrClub | cluo.Cspe -> cluo.Cint |  |  |  |  |
| 10156 | Club | Contract Types | Star Player | Byte |  | ptrClub | cluo.Ccsp -> cluo.Cint |  |  |  |  |
| 12631 | Club | Contract Types | Important Player | Byte |  | ptrClub | cluo.Ccsk -> cluo.Cint |  |  |  |  |
| 10157 | Club | Contract Types | Regular Starter | Byte |  | ptrClub | cluo.Ccsf -> cluo.Cint |  |  |  |  |
| 10158 | Club | Contract Types | Squad Player | Byte |  | ptrClub | cluo.Ccsr -> cluo.Cint |  |  |  |  |
| 10159 | Club | Contract Types | Fringe Player | Byte |  | ptrClub | cluo.Ccsb -> cluo.Cint |  |  |  |  |
| 10160 | Club | Contract Types | Hot Prospect | Byte |  | ptrClub | cluo.Ccsh -> cluo.Cint |  |  |  |  |
| 10161 | Club | Contract Types | Youngster | Byte |  | ptrClub | cluo.Ccsy -> cluo.Cint |  |  |  |  |
| 10163 | Club | Contract Types | Manager | Byte |  | ptrClub | cluo.Ccjm -> cluo.Cint |  |  |  |  |
| 10164 | Club | Contract Types | Ast. Manager | Byte |  | ptrClub | cluo.Ccja -> cluo.Cint |  |  |  |  |
| 10165 | Club | Contract Types | Coach | Byte |  | ptrClub | cluo.Ccjc -> cluo.Cint |  |  |  |  |
| 10166 | Club | Contract Types | Fitness Coach | Byte |  | ptrClub | cluo.Ccji -> cluo.Cint |  |  |  |  |
| 10167 | Club | Contract Types | Goalkeeping Coach | Byte |  | ptrClub | cluo.Ccjg -> cluo.Cint |  |  |  |  |
| 10168 | Club | Contract Types | Youth Team Coach | Byte |  | ptrClub | cluo.Ccjy -> cluo.Cint |  |  |  |  |
| 10169 | Club | Contract Types | Scout | Byte |  | ptrClub | cluo.Ccjs -> cluo.Cint |  |  |  |  |
| 10170 | Club | Contract Types | Physio | Byte |  | ptrClub | cluo.Ccjp -> cluo.Cint |  |  |  |  |
| 10173 | Club | Contract Types | Director of Football | Byte |  | ptrClub | cluo.Ccjd -> cluo.Cint |  |  |  |  |
| 12632 | Club | Contract Types | Technical Director | Byte |  | ptrClub | cluo.Ccjt -> cluo.Cint |  |  |  |  |
| 12633 | Club | Contract Types | Loan Manager | Byte |  | ptrClub | cluo.Ccjh -> cluo.Cint |  |  |  |  |
| 10172 | Club | Contract Types | Data Analyst | Byte |  | ptrClub | cluo.Ccda -> cluo.Cint |  |  |  |  |
| 10171 | Club | Contract Types | Sports Scientist | Byte |  | ptrClub | cluo.Ccss -> cluo.Cint |  |  |  |  |
| 12634 | Club | Contract Types | Doctor | Byte |  | ptrClub | cluo.Ccdr -> cluo.Cint |  |  |  |  |
| 959 | Competition | Details | Row ID | 4 Bytes |  | ptrComp | objo.Rwid |  |  |  |  |
| 961 | Competition | Details | Unique ID | 4 Bytes |  | ptrComp | objo.Duni |  |  |  |  |
| 17202 | Competition | Details | Random ID | 4 Bytes |  | ptrComp | objo.Rdui |  |  |  |  |
| 968 | Competition | Details | Full Name | String |  | ptrComp | 4 -> cmpo.Cnam |  |  | 32 | 0 |
| 962 | Competition | Details | Short Name | String |  | ptrComp | 4 -> cmpo.Csnm |  |  | 32 | 0 |
| 970 | Competition | Details | Three Letter Name | String |  | ptrComp | 4 -> cmpo.C3ln |  |  | 3 | 0 |
| 972 | Competition | Details | Nation | String |  | ptrComp | 4 -> nato.Nnam -> cmpo.Cnti |  |  | 32 | 0 |
| 997 | Competition | Details | Continent | String |  | ptrComp | 4 -> cono.Cnam -> cmpo.Ccti |  |  | 32 | 0 |
| 1314 | Competition | Details | Lowest Official Category Allowed | Byte |  | ptrComp | cmpo.Lauc |  |  |  |  |
| 967 | Competition | Details | Reputation | 2 Bytes |  | ptrComp | cmpo.Crep |  |  |  |  |
| 983 | Competition | Details | Original Reputation | 2 Bytes |  | ptrComp | cmpo.Crep+2 |  |  |  |  |
| 12593 | Competition | Details | Trophy | Byte |  | ptrComp | cmpo.Ctty |  |  |  |  |
| 984 | Competition | Details | Continental Position | 2 Bytes |  | ptrComp | cmpo.Cpos |  |  |  |  |
| 985 | Competition | Details | Last Continental Position | 2 Bytes |  | ptrComp | cmpo.Cpos-2 |  |  |  |  |
| 994 | Competition | Details | Uses Extra Officials | Byte |  | ptrComp | cmpo.Cuae |  |  |  |  |
| 995 | Competition | Details | Uses Seated Stadiums Only | Byte |  | ptrComp | cmpo.Csso |  |  |  |  |
| 17987 | Competition | Details | Is Extinct | Binary |  | ptrComp | cmpo.Cfla | 2 | 1 |  |  |
| 992 | Competition | Details | Type | Byte |  | ptrComp | cmpo.Dbty |  |  |  |  |
| 1313 | Competition | Details | Competition Level | Byte |  | ptrComp | cmpo.Levl |  |  |  |  |
| 1312 | Competition | Details | Uses Squad Numbers (Inactive Comps Only) | Binary |  | ptrComp | cmpo.Cfla | 0 | 1 |  |  |
| 979 | Competition | Details | Minimum Pitch Length | 2 Bytes |  | ptrComp | cmpo.Cmnl |  |  |  |  |
| 982 | Competition | Details | Minimum Pitch Width | 2 Bytes |  | ptrComp | cmpo.Cmnw |  |  |  |  |
| 981 | Competition | Details | Maximum Pitch Length | 2 Bytes |  | ptrComp | cmpo.Cmxl |  |  |  |  |
| 980 | Competition | Details | Maximum Pitch Width | 2 Bytes |  | ptrComp | cmpo.Cmxw |  |  |  |  |
| 964 | Competition | Details | Hex | 4 Bytes |  | ptrComp | cmpo.Cfcl |  |  |  |  |
| 1141 | Competition | Details | Red | Byte |  | ptrComp | cmpo.Cfcl+2 |  |  |  |  |
| 1140 | Competition | Details | Green | Byte |  | ptrComp | cmpo.Cfcl+1 |  |  |  |  |
| 1139 | Competition | Details | Blue | Byte |  | ptrComp | cmpo.Cfcl |  |  |  |  |
| 1142 | Competition | Details | Opacity | Byte |  | ptrComp | cmpo.Cfcl+3 |  |  |  |  |
| 965 | Competition | Details | Hex | 4 Bytes |  | ptrComp | cmpo.Cbcl |  |  |  |  |
| 1137 | Competition | Details | Red | Byte |  | ptrComp | cmpo.Cbcl+2 |  |  |  |  |
| 1136 | Competition | Details | Green | Byte |  | ptrComp | cmpo.Cbcl+1 |  |  |  |  |
| 1135 | Competition | Details | Blue | Byte |  | ptrComp | cmpo.Cbcl |  |  |  |  |
| 1138 | Competition | Details | Opacity | Byte |  | ptrComp | cmpo.Cbcl+3 |  |  |  |  |
| 966 | Competition | Details | Hex | 4 Bytes |  | ptrComp | cmpo.Ctcl |  |  |  |  |
| 1145 | Competition | Details | Red | Byte |  | ptrComp | cmpo.Ctcl+2 |  |  |  |  |
| 1144 | Competition | Details | Green | Byte |  | ptrComp | cmpo.Ctcl+1 |  |  |  |  |
| 1134 | Competition | Details | Blue | Byte |  | ptrComp | cmpo.Ctcl |  |  |  |  |
| 1146 | Competition | Details | Opacity | Byte |  | ptrComp | cmpo.Ctcl+3 |  |  |  |  |
| 963 | Competition | Details | Hex | 4 Bytes |  | ptrComp | cmpo.Wbcl |  |  |  |  |
| 1143 | Competition | Details | Red | Byte |  | ptrComp | cmpo.Wbcl+2 |  |  |  |  |
| 1133 | Competition | Details | Green | Byte |  | ptrComp | cmpo.Wbcl+2 |  |  |  |  |
| 1132 | Competition | Details | Blue | Byte |  | ptrComp | cmpo.Wbcl |  |  |  |  |
| 1131 | Competition | Details | Opacity | Byte |  | ptrComp | cmpo.Wbcl+3 |  |  |  |  |
| 11 | Competition | Contract Types | Star Player | Byte |  | ptrComp | cmpo.Ccss |  |  |  |  |
| 19 | Competition | Contract Types | Regular Starter | Byte |  | ptrComp | cmpo.Ccss+1 |  |  |  |  |
| 18 | Competition | Contract Types | Squad Player | Byte |  | ptrComp | cmpo.Ccss+2 |  |  |  |  |
| 17 | Competition | Contract Types | Fringe Player | Byte |  | ptrComp | cmpo.Ccss+3 |  |  |  |  |
| 16 | Competition | Contract Types | Hot Prospect | Byte |  | ptrComp | cmpo.Ccss+4 |  |  |  |  |
| 15 | Competition | Contract Types | Youngster | Byte |  | ptrComp | cmpo.Ccss+5 |  |  |  |  |
| 20 | Competition | Contract Types | Manager | Byte |  | ptrComp | cmpo.Ccjt |  |  |  |  |
| 27 | Competition | Contract Types | Ast. Manager | Byte |  | ptrComp | cmpo.Ccjt+1 |  |  |  |  |
| 26 | Competition | Contract Types | Coach | Byte |  | ptrComp | cmpo.Ccjt+2 |  |  |  |  |
| 25 | Competition | Contract Types | Fitness Coach | Byte |  | ptrComp | cmpo.Ccjt+4 |  |  |  |  |
| 24 | Competition | Contract Types | Goalkeeping Coach | Byte |  | ptrComp | cmpo.Ccjt+5 |  |  |  |  |
| 23 | Competition | Contract Types | Youth Team Coach | Byte |  | ptrComp | cmpo.Ccjt+3 |  |  |  |  |
| 22 | Competition | Contract Types | Scout | Byte |  | ptrComp | cmpo.Ccjt+7 |  |  |  |  |
| 21 | Competition | Contract Types | Physio | Byte |  | ptrComp | cmpo.Ccjt+6 |  |  |  |  |
| 12474 | Competition | Contract Types | Director of Football | Byte |  | ptrComp | cmpo.Ccjt+8 |  |  |  |  |
| 12475 | Competition | Contract Types | Technical Director | Byte |  | ptrComp | cmpo.Ccjt+C |  |  |  |  |
| 12478 | Competition | Contract Types | Loan Manager | Byte |  | ptrComp | cmpo.Ccjt+D |  |  |  |  |
| 12479 | Competition | Contract Types | Data Analyst | Byte |  | ptrComp | cmpo.Ccjt+9 |  |  |  |  |
| 12477 | Competition | Contract Types | Sports Scientist | Byte |  | ptrComp | cmpo.Ccjt+B |  |  |  |  |
| 12476 | Competition | Contract Types | Doctor | Byte |  | ptrComp | cmpo.Ccjt+A |  |  |  |  |
| 18057 | Competition | League Settings | Number of Rounds | Byte |  | ptrLeagueStage | 7A -> cmpo.Clst |  |  |  |  |
| 18058 | Competition | League Settings | Number of Teams | Byte |  | ptrLeagueStage | 7B -> cmpo.Clst |  |  |  |  |
| 18059 | Competition | League Settings | Number of Promotion | Byte |  | ptrLeagueStage | 6F+0x18 -> cmpo.Clst |  |  |  |  |
| 18060 | Competition | League Settings | Number of Relegation | Byte |  | ptrLeagueStage | 6E+0x18 -> cmpo.Clst |  |  |  |  |
| 18062 | Competition | League Settings | Fixture Priority | Byte |  | ptrLeagueStage | 6E+0x18+0xB2 -> cmpo.Clst |  |  |  |  |
| 18061 | Competition | League Settings | Substitution Rules | Byte |  | ptrLeagueStage | 6E+0x18+0xB4 -> cmpo.Clst |  |  |  |  |
| 23628 | Competition | League Settings | No description | Byte |  | ptrComp | F8 |  |  |  |  |
| 19862 | Continent | Details | Row ID | 4 Bytes |  | ptrContinent | objo.Rwid |  |  |  |  |
| 19863 | Continent | Details | Unique ID | 4 Bytes |  | ptrContinent | objo.Duni |  |  |  |  |
| 19864 | Continent | Details | Random ID | 4 Bytes |  | ptrContinent | objo.Rdui |  |  |  |  |
| 19865 | Continent | Details | Full Name | String |  | ptrContinent | 4 -> cono.Cnam |  |  | 32 | 0 |
| 19867 | Continent | Details | Three Letter Name | String |  | ptrContinent | 4 -> cono.C3ln |  |  | 3 | 0 |
| 19868 | Continent | Details | Continentality Name | String |  | ptrContinent | 4 -> cono.Ccty |  |  | 32 | 0 |
| 19871 | Continent | Details | Federation Name | String |  | ptrContinent | 4 -> cono.Cfdn |  |  | 32 | 0 |
| 19870 | Continent | Details | Short Federation Name | String |  | ptrContinent | 4 -> cono.C6lf |  |  | 32 | 0 |
| 19869 | Continent | Details | Three Letter Federation Name | String |  | ptrContinent | 4 -> cono.Csfn |  |  | 32 | 0 |
| 20575 | Continent | Details | Regional Strength | Float |  | ptrContinent | cono.Crgs |  |  |  |  |
| 19874 | Continent | Details | Hex | 4 Bytes |  | ptrContinent | cono.CTfc |  |  |  |  |
| 19876 | Continent | Details | Red | Byte |  | ptrContinent | cono.CTfc+0x2 |  |  |  |  |
| 19877 | Continent | Details | Green | Byte |  | ptrContinent | cono.CTfc+0x1 |  |  |  |  |
| 19878 | Continent | Details | Blue | Byte |  | ptrContinent | cono.CTfc |  |  |  |  |
| 19879 | Continent | Details | Opacity | Byte |  | ptrContinent | cono.CTfc+0x3 |  |  |  |  |
| 19881 | Continent | Details | Hex | 4 Bytes |  | ptrContinent | cono.CTbc |  |  |  |  |
| 19883 | Continent | Details | Red | Byte |  | ptrContinent | cono.CTbc+0x2 |  |  |  |  |
| 19884 | Continent | Details | Green | Byte |  | ptrContinent | cono.CTbc+0x1 |  |  |  |  |
| 19885 | Continent | Details | Blue | Byte |  | ptrContinent | cono.CTbc |  |  |  |  |
| 19886 | Continent | Details | Opacity | Byte |  | ptrContinent | cono.CTbc+0x3 |  |  |  |  |
| 19888 | Continent | Details | Hex | 4 Bytes |  | ptrContinent | cono.CTtc |  |  |  |  |
| 19890 | Continent | Details | Red | Byte |  | ptrContinent | cono.CTtc+0x2 |  |  |  |  |
| 19891 | Continent | Details | Green | Byte |  | ptrContinent | cono.CTtc+0x1 |  |  |  |  |
| 19892 | Continent | Details | Blue | Byte |  | ptrContinent | cono.CTtc |  |  |  |  |
| 19893 | Continent | Details | Opacity | Byte |  | ptrContinent | cono.CTtc+0x3 |  |  |  |  |
| 20665 | Derby | Details | Row ID | 4 Bytes |  | ptrDerby | objo.Rwid |  |  |  |  |
| 20666 | Derby | Details | Unique ID | 4 Bytes |  | ptrDerby | objo.Duni |  |  |  |  |
| 20667 | Derby | Details | Random ID | 4 Bytes |  | ptrDerby | objo.Rdui |  |  |  |  |
| 20627 | Derby | Details | Name | String |  | ptrDerby | 4 -> drbr.Dnam |  |  | 32 | 0 |
| 20628 | Derby | Details | Short Name | String |  | ptrDerby | 4 -> drbr.Dsnm |  |  | 32 | 0 |
| 20629 | Derby | Details | Alternative Name | String |  | ptrDerby | 4 -> drbr.Danm |  |  | 32 | 0 |
| 20654 | Derby | Details | Alternative Short Name | String |  | ptrDerby | 4 -> drbr.Dasn |  |  | 32 | 0 |
| 20635 | Derby | Details | Team 1 | String |  | ptrDerby | 4 -> cluo.Csnm -> teao.Tclu -> drbr.Dtm1 |  |  | 32 | 0 |
| 20634 | Derby | Details | Team 2 | String |  | ptrDerby | 4 -> cluo.Csnm -> teao.Tclu -> drbr.Dtm2 |  |  | 32 | 0 |
| 20633 | Derby | Details | First Match Date | Custom | FM Date | ptrDerby | drbr.Dfmd |  |  |  |  |
| 20632 | Derby | Details | First Match Competition | String |  | ptrDerby | 4 -> cmpo.Csnm -> drbr.Dfmc |  |  | 32 | 0 |
| 20631 | Derby | Details | First Match Stadium | String |  | ptrDerby | 4 -> stao.Snam -> drbr.Dfms |  |  | 32 | 0 |
| 20630 | Derby | Details | First Match Attendance | 2 Bytes |  | ptrDerby | drbr.Dfma |  |  |  |  |
| 20637 | Derby | Details | First Match Team 1 Goals | Byte |  | ptrDerby | drbr.Dfg1 |  |  |  |  |
| 20636 | Derby | Details | First Match Team 2 Goals | Byte |  | ptrDerby | drbr.Dfg2 |  |  |  |  |
| 20639 | Derby | Details | Team 1 Total Games Won | Byte |  | ptrDerby | drbr.D1tw |  |  |  |  |
| 20638 | Derby | Details | Team 1 Total Games Drawn | Byte |  | ptrDerby | drbr.D1td |  |  |  |  |
| 20640 | Derby | Details | Team 1 Total Games Lost  | Byte |  | ptrDerby | drbr.D1tl |  |  |  |  |
| 20644 | Derby | Details | World Reputation | Byte |  | ptrDerby | drbr.Dwdr |  |  |  |  |
| 20643 | Derby | Details | National Reputation | Byte |  | ptrDerby | drbr.Dntr |  |  |  |  |
| 1527 | Nation | Details | Row ID | 4 Bytes |  | ptrNation | objo.Rwid |  |  |  |  |
| 1528 | Nation | Details | Unique ID | 4 Bytes |  | ptrNation | objo.Duni |  |  |  |  |
| 17201 | Nation | Details | Random ID | 4 Bytes |  | ptrNation | objo.Rdui |  |  |  |  |
| 1529 | Nation | Details | Name | String |  | ptrNation | 4 -> nato.Nnam |  |  | 32 | 0 |
| 1531 | Nation | Details | Short Name | String |  | ptrNation | 4 -> nato.Nsnm |  |  | 32 | 0 |
| 1532 | Nation | Details | Three Letter Name | String |  | ptrNation | 4 -> nato.N3ln |  |  | 3 | 0 |
| 24032 | Nation | Details | Nickname | String |  | ptrNation | 4 -> nato.TCnn -> cluo.Cino -> nato.Ntct |  |  | 32 | 0 |
| 1533 | Nation | Details | Nationality Name | String |  | ptrNation | 4 -> nato.Nnty |  |  | 32 | 0 |
| 1534 | Nation | Details | Capital | String |  | ptrNation | 4 -> ctyo.Cnam -> nato.Ncpi |  |  | 32 | 0 |
| 1535 | Nation | Details | Continent | String |  | ptrNation | 4 -> cono.Cnam -> nato.Ncti |  |  | 32 | 0 |
| 20574 | Nation | Details | National Stadium | String |  | ptrNation | 4 -> stao.Snam -> nato.Nnsi |  |  | 32 | 0 |
| 1550 | Nation | Details | Average Attendance | 4 Bytes |  | ptrNation | nato.Catd -> cluo.Cino -> nato.Ntct |  |  |  |  |
| 1552 | Nation | Details | Minimum Attendance | 4 Bytes |  | ptrNation | nato.Cmna -> cluo.Cino -> nato.Ntct |  |  |  |  |
| 1551 | Nation | Details | Maximum Attendance | 4 Bytes |  | ptrNation | nato.Cmxa -> cluo.Cino -> nato.Ntct |  |  |  |  |
| 19913 | Nation | Details | Hex | 4 Bytes |  | ptrNation | nato.ttcl -> cluo.Cino -> nato.Ntct |  |  |  |  |
| 19915 | Nation | Details | Red | Byte |  | ptrNation | nato.ttcl+0x2 -> cluo.Cino -> nato.Ntct |  |  |  |  |
| 19916 | Nation | Details | Green | Byte |  | ptrNation | nato.ttcl+0x1 -> cluo.Cino -> nato.Ntct |  |  |  |  |
| 19917 | Nation | Details | Blue | Byte |  | ptrNation | nato.ttcl -> cluo.Cino -> nato.Ntct |  |  |  |  |
| 19918 | Nation | Details | Opacity | Byte |  | ptrNation | nato.ttcl+0x3 -> cluo.Cino -> nato.Ntct |  |  |  |  |
| 19920 | Nation | Details | Hex | 4 Bytes |  | ptrNation | nato.tbcl -> cluo.Cino -> nato.Ntct |  |  |  |  |
| 19922 | Nation | Details | Red | Byte |  | ptrNation | nato.tbcl+0x2 -> cluo.Cino -> nato.Ntct |  |  |  |  |
| 19923 | Nation | Details | Green | Byte |  | ptrNation | nato.tbcl+0x1 -> cluo.Cino -> nato.Ntct |  |  |  |  |
| 19924 | Nation | Details | Blue | Byte |  | ptrNation | nato.tbcl -> cluo.Cino -> nato.Ntct |  |  |  |  |
| 19925 | Nation | Details | Opacity | Byte |  | ptrNation | nato.tbcl+0x3 -> cluo.Cino -> nato.Ntct |  |  |  |  |
| 1554 | Nation | Information | Economic Factor | Byte |  | ptrNation | nato.Necf |  |  |  |  |
| 1546 | Nation | Information | FA Financial Power | Byte |  | ptrNation | nato.Nfap -> nato.Ntct |  |  |  |  |
| 1547 | Nation | Information | Years To Gain Nationality | Byte |  | ptrNation | nato.Nygn |  |  |  |  |
| 1537 | Nation | Information | Gain Nationality Type | Byte |  | ptrNation | nato.Ngct |  |  |  |  |
| 11732 | Nation | Information | Does Not Allow Dual Nationality | Binary |  | ptrNation | nato.Nndn | 1 | 1 |  |  |
| 1947 | Nation | Information | Max Youth Age | Byte |  | ptrNation | nato.Nmya -> nato.Ntct |  |  |  |  |
| 1545 | Nation | Information | State Of Development | Byte |  | ptrNation | nato.Nsod |  |  |  |  |
| 1555 | Nation | Information | Game Importance | Byte |  | ptrNation | nato.Ngim -> nato.Ntct |  |  |  |  |
| 1557 | Nation | Information | Allow Multiple Assistant Manager | Byte |  | ptrNation | nato.Numa -> nato.Ntct |  |  |  |  |
| 12578 | Nation | Information | Worldwide Governing Body Full Member | Byte |  | ptrNation | nato.Nffm -> nato.Ntct |  |  |  |  |
| 1654 | Nation | Information | Year Affiliated | 2 Bytes |  | ptrNation | nato.Nfay -> nato.Ntct |  |  |  |  |
| 1587 | Nation | Information | Year Affiliated to Federation | 2 Bytes |  | ptrNation | nato.Nfdy -> nato.Ntct |  |  |  |  |
| 1586 | Nation | Information | Year Association Formed | 2 Bytes |  | ptrNation | nato.Nafy -> nato.Ntct |  |  |  |  |
| 1541 | Nation | Information | FIFA Position | 2 Bytes |  | ptrNation | nato.Nfps -> nato.Ntct |  |  |  |  |
| 1540 | Nation | Information | FIFA Ranking Points | 2 Bytes |  | ptrNation | nato.Nfrp -> nato.Ntct |  |  |  |  |
| 1548 | Nation | Information | Foreign Manager Likelihood | Byte |  | ptrNation | nato.Nfml -> nato.Ntct |  |  |  |  |
| 1558 | Nation | Information | FA Patience | Byte |  | ptrNation | nato.Nfpa -> nato.Ntct |  |  |  |  |
| 1556 | Nation | Information | Youth Rating | Byte |  | ptrNation | nato.NYRt -> nato.Ntct |  |  |  |  |
| 1567 | Nation | Tactical Attributes | Attacking | Byte |  | ptrNation | nato.Ntat -> nato.Ntct |  |  |  |  |
| 1568 | Nation | Tactical Attributes | Defensive Line | Byte |  | ptrNation | nato.Ntat+0x1 -> nato.Ntct |  |  |  |  |
| 1569 | Nation | Tactical Attributes | Directness | Byte |  | ptrNation | nato.Ntat+0x2 -> nato.Ntct |  |  |  |  |
| 1570 | Nation | Tactical Attributes | Flamboyancy | Byte |  | ptrNation | nato.Ntat+0x3 -> nato.Ntct |  |  |  |  |
| 1571 | Nation | Tactical Attributes | Fluidity | Byte |  | ptrNation | nato.Ntat+0x4 -> nato.Ntct |  |  |  |  |
| 1572 | Nation | Tactical Attributes | Free Roles | Byte |  | ptrNation | nato.Ntat+0x5 -> nato.Ntct |  |  |  |  |
| 1573 | Nation | Tactical Attributes | Marking | Byte |  | ptrNation | nato.Ntat+0x6 -> nato.Ntct |  |  |  |  |
| 1574 | Nation | Tactical Attributes | Offside | Byte |  | ptrNation | nato.Ntat+0x7 -> nato.Ntct |  |  |  |  |
| 1575 | Nation | Tactical Attributes | Pressing | Byte |  | ptrNation | nato.Ntat+0x8 -> nato.Ntct |  |  |  |  |
| 1576 | Nation | Tactical Attributes | Sitting Back | Byte |  | ptrNation | nato.Ntat+0x9 -> nato.Ntct |  |  |  |  |
| 1577 | Nation | Tactical Attributes | Tempo | Byte |  | ptrNation | nato.Ntat+0xA -> nato.Ntct |  |  |  |  |
| 1578 | Nation | Tactical Attributes | Use Of Playmaker | Byte |  | ptrNation | nato.Ntat+0xB -> nato.Ntct |  |  |  |  |
| 1579 | Nation | Tactical Attributes | Width | Byte |  | ptrNation | nato.Ntat+0xC -> nato.Ntct |  |  |  |  |
| 1580 | Nation | Tactical Attributes | Preferred Formation | Byte |  | ptrNation | nato.Nprf -> cluo.Cino -> nato.Ntct |  |  |  |  |
| 1581 | Nation | Tactical Attributes | Second Preferred Formation | Byte |  | ptrNation | nato.Nspf -> cluo.Cino -> nato.Ntct |  |  |  |  |
| 1582 | Nation | Tactical Attributes | Defensive Formation | Byte |  | ptrNation | nato.Ndfm -> cluo.Cino -> nato.Ntct |  |  |  |  |
| 1583 | Nation | Tactical Attributes | Attacking Formation | Byte |  | ptrNation | nato.Nafm -> cluo.Cino -> nato.Ntct |  |  |  |  |
| 12872 | Nation | Currency | Row ID | 4 Bytes |  | ptrNation | 8 -> nato.Ncur |  |  |  |  |
| 12873 | Nation | Currency | Unique ID | 4 Bytes |  | ptrNation | C -> nato.Ncur |  |  |  |  |
| 19895 | Nation | Currency | Random ID | 4 Bytes |  | ptrNation | 10 -> nato.Ncur |  |  |  |  |
| 1536 | Nation | Currency | Full Name | String |  | ptrNation | 4 -> 18 -> nato.Ncur |  |  | 32 | 0 |
| 12870 | Nation | Currency | Short Name | String |  | ptrNation | 4 -> 20 -> nato.Ncur |  |  | 32 | 0 |
| 12871 | Nation | Currency | Symbol | String |  | ptrNation | 4 -> 30 -> nato.Ncur |  |  | 32 | 0 |
| 12874 | Nation | Currency | Exchange Rate | Float |  | ptrNation | 38 -> nato.Ncur |  |  |  |  |
| 1613 | Nation | Transfers and Contracts | Reputation 50 - 549 | Custom | United Kingdom Pound | ptrNation | 0 -> nato.Ntfv -> nato.Ntct |  |  |  |  |
| 1632 | Nation | Transfers and Contracts | Reputation 550 - 1,049 | Custom | United Kingdom Pound | ptrNation | 4 -> nato.Ntfv -> nato.Ntct |  |  |  |  |
| 1631 | Nation | Transfers and Contracts | Reputation 1,050 - 1,549 | Custom | United Kingdom Pound | ptrNation | 8 -> nato.Ntfv -> nato.Ntct |  |  |  |  |
| 1630 | Nation | Transfers and Contracts | Reputation 1,550 - 2,049 | Custom | United Kingdom Pound | ptrNation | C -> nato.Ntfv -> nato.Ntct |  |  |  |  |
| 1629 | Nation | Transfers and Contracts | Reputation 2,050 - 2,549 | Custom | United Kingdom Pound | ptrNation | 10 -> nato.Ntfv -> nato.Ntct |  |  |  |  |
| 1628 | Nation | Transfers and Contracts | Reputation 2,550 - 3,049 | Custom | United Kingdom Pound | ptrNation | 14 -> nato.Ntfv -> nato.Ntct |  |  |  |  |
| 1627 | Nation | Transfers and Contracts | Reputation 3,050 - 3,549 | Custom | United Kingdom Pound | ptrNation | 18 -> nato.Ntfv -> nato.Ntct |  |  |  |  |
| 1626 | Nation | Transfers and Contracts | Reputation 3,550 - 4,049 | Custom | United Kingdom Pound | ptrNation | 1C -> nato.Ntfv -> nato.Ntct |  |  |  |  |
| 1625 | Nation | Transfers and Contracts | Reputation 4,050 - 4,549 | Custom | United Kingdom Pound | ptrNation | 20 -> nato.Ntfv -> nato.Ntct |  |  |  |  |
| 1624 | Nation | Transfers and Contracts | Reputation 4,550 - 5,049 | Custom | United Kingdom Pound | ptrNation | 24 -> nato.Ntfv -> nato.Ntct |  |  |  |  |
| 1623 | Nation | Transfers and Contracts | Reputation 5,050 - 5,549 | Custom | United Kingdom Pound | ptrNation | 28 -> nato.Ntfv -> nato.Ntct |  |  |  |  |
| 1622 | Nation | Transfers and Contracts | Reputation 5,550 - 6,049 | Custom | United Kingdom Pound | ptrNation | 2C -> nato.Ntfv -> nato.Ntct |  |  |  |  |
| 1621 | Nation | Transfers and Contracts | Reputation 6,050 - 6,549 | Custom | United Kingdom Pound | ptrNation | 30 -> nato.Ntfv -> nato.Ntct |  |  |  |  |
| 1620 | Nation | Transfers and Contracts | Reputation 6,550 - 7,049 | Custom | United Kingdom Pound | ptrNation | 34 -> nato.Ntfv -> nato.Ntct |  |  |  |  |
| 1619 | Nation | Transfers and Contracts | Reputation 7,050 - 7,549 | Custom | United Kingdom Pound | ptrNation | 38 -> nato.Ntfv -> nato.Ntct |  |  |  |  |
| 1618 | Nation | Transfers and Contracts | Reputation 7,550 - 8,049 | Custom | United Kingdom Pound | ptrNation | 3C -> nato.Ntfv -> nato.Ntct |  |  |  |  |
| 1617 | Nation | Transfers and Contracts | Reputation 8,050 - 8,549 | Custom | United Kingdom Pound | ptrNation | 40 -> nato.Ntfv -> nato.Ntct |  |  |  |  |
| 1616 | Nation | Transfers and Contracts | Reputation 8,550 - 9,049 | Custom | United Kingdom Pound | ptrNation | 44 -> nato.Ntfv -> nato.Ntct |  |  |  |  |
| 1615 | Nation | Transfers and Contracts | Reputation 9,050 - 9,549 | Custom | United Kingdom Pound | ptrNation | 48 -> nato.Ntfv -> nato.Ntct |  |  |  |  |
| 1614 | Nation | Transfers and Contracts | Reputation 9,550 - 10,000 | Custom | United Kingdom Pound | ptrNation | 4C -> nato.Ntfv -> nato.Ntct |  |  |  |  |
| 1634 | Nation | Transfers and Contracts | Reputation 50 - 549 | Custom | United Kingdom Pound | ptrNation | 0 -> nato.Nwgv -> nato.Ntct |  |  |  |  |
| 1635 | Nation | Transfers and Contracts | Reputation 550 - 1,049 | Custom | United Kingdom Pound | ptrNation | 4 -> nato.Nwgv -> nato.Ntct |  |  |  |  |
| 1636 | Nation | Transfers and Contracts | Reputation 1,050 - 1,549 | Custom | United Kingdom Pound | ptrNation | 8 -> nato.Nwgv -> nato.Ntct |  |  |  |  |
| 1637 | Nation | Transfers and Contracts | Reputation 1,550 - 2,049 | Custom | United Kingdom Pound | ptrNation | C -> nato.Nwgv -> nato.Ntct |  |  |  |  |
| 1638 | Nation | Transfers and Contracts | Reputation 2,050 - 2,549 | Custom | United Kingdom Pound | ptrNation | 10 -> nato.Nwgv -> nato.Ntct |  |  |  |  |
| 1639 | Nation | Transfers and Contracts | Reputation 2,550 - 3,049 | Custom | United Kingdom Pound | ptrNation | 14 -> nato.Nwgv -> nato.Ntct |  |  |  |  |
| 1640 | Nation | Transfers and Contracts | Reputation 3,050 - 3,549 | Custom | United Kingdom Pound | ptrNation | 18 -> nato.Nwgv -> nato.Ntct |  |  |  |  |
| 1641 | Nation | Transfers and Contracts | Reputation 3,550 - 4,049 | Custom | United Kingdom Pound | ptrNation | 1C -> nato.Nwgv -> nato.Ntct |  |  |  |  |
| 1642 | Nation | Transfers and Contracts | Reputation 4,050 - 4,549 | Custom | United Kingdom Pound | ptrNation | 20 -> nato.Nwgv -> nato.Ntct |  |  |  |  |
| 1643 | Nation | Transfers and Contracts | Reputation 4,550 - 5,049 | Custom | United Kingdom Pound | ptrNation | 24 -> nato.Nwgv -> nato.Ntct |  |  |  |  |
| 1644 | Nation | Transfers and Contracts | Reputation 5,050 - 5,549 | Custom | United Kingdom Pound | ptrNation | 28 -> nato.Nwgv -> nato.Ntct |  |  |  |  |
| 1645 | Nation | Transfers and Contracts | Reputation 5,550 - 6,049 | Custom | United Kingdom Pound | ptrNation | 2C -> nato.Nwgv -> nato.Ntct |  |  |  |  |
| 1646 | Nation | Transfers and Contracts | Reputation 6,050 - 6,549 | Custom | United Kingdom Pound | ptrNation | 30 -> nato.Nwgv -> nato.Ntct |  |  |  |  |
| 1647 | Nation | Transfers and Contracts | Reputation 6,550 - 7,049 | Custom | United Kingdom Pound | ptrNation | 34 -> nato.Nwgv -> nato.Ntct |  |  |  |  |
| 1648 | Nation | Transfers and Contracts | Reputation 7,050 - 7,549 | Custom | United Kingdom Pound | ptrNation | 38 -> nato.Nwgv -> nato.Ntct |  |  |  |  |
| 1649 | Nation | Transfers and Contracts | Reputation 7,550 - 8,049 | Custom | United Kingdom Pound | ptrNation | 3C -> nato.Nwgv -> nato.Ntct |  |  |  |  |
| 1650 | Nation | Transfers and Contracts | Reputation 8,050 - 8,549 | Custom | United Kingdom Pound | ptrNation | 40 -> nato.Nwgv -> nato.Ntct |  |  |  |  |
| 1651 | Nation | Transfers and Contracts | Reputation 8,550 - 9,049 | Custom | United Kingdom Pound | ptrNation | 44 -> nato.Nwgv -> nato.Ntct |  |  |  |  |
| 1652 | Nation | Transfers and Contracts | Reputation 9,050 - 9,549 | Custom | United Kingdom Pound | ptrNation | 48 -> nato.Nwgv -> nato.Ntct |  |  |  |  |
| 1653 | Nation | Transfers and Contracts | Reputation 9,550 - 10,000 | Custom | United Kingdom Pound | ptrNation | 4C -> nato.Nwgv -> nato.Ntct |  |  |  |  |
| 1716 | Person | Details | Row ID | 4 Bytes |  | ptrPerson | objo.Rwid |  |  |  |  |
| 1717 | Person | Details | Unique ID | 4 Bytes |  | ptrPerson | objo.Duni |  |  |  |  |
| 17200 | Person | Details | Random ID | 4 Bytes |  | ptrPerson | objo.Rdui |  |  |  |  |
| 1718 | Person | Details | First Name | String |  | ptrPerson | 4 -> 0 -> pero.Pfna |  |  | 255 | 0 |
| 1779 | Person | Details | Last Name | String |  | ptrPerson | 4 -> 0 -> pero.Psna |  |  | 255 | 0 |
| 1778 | Person | Details | Common Name | String |  | ptrPerson | 4 -> 0 -> pero.Pcna |  |  | 255 | 0 |
| 1777 | Person | Details | Full Name | String |  | ptrPerson | 4 -> pero.Pfln |  |  | 255 | 0 |
| 17198 | Person | Details | Nationality | String |  | ptrPerson | 4 -> nato.Nnty -> pero.Pnti |  |  | 255 | 0 |
| 17199 | Person | Details | Birth Place | String |  | ptrPerson | 4 -> ctyo.Cnam -> pero.Pcbi |  |  | 255 | 0 |
| 17812 | Person | Details | Birth Date | Custom | FM Date | ptrPerson | pero.Pdob |  |  |  |  |
| 12999 | Person | Details | Female | Binary |  | ptrPerson | pero.Pfl1 | 4 | 1 |  |  |
| 1720 | Person | Details | Ethnicity | Byte |  | ptrPerson | pero.Peth |  |  |  |  |
| 1725 | Person | Details | Hair Colour | Byte |  | ptrPerson | pero.Phcl |  |  |  |  |
| 1724 | Person | Details | Hair Length | Byte |  | ptrPerson | pero.Phln |  |  |  |  |
| 1723 | Person | Details | Skin Tone | Byte |  | ptrPerson | pero.Pskt |  |  |  |  |
| 410 | Person | Details | Nationality Info | Byte |  | ptrPlayer | pero.Pdfn |  |  |  |  |
| 12664 | Person | Details | Retiring After Spell At Current Club | Binary |  | ptrPerson | pero.Pfl1 | 7 | 1 |  |  |
| 407 | Person | Details | International Apps | Byte |  | ptrPerson | pero.Piap |  |  |  |  |
| 406 | Person | Details | International Goals | Byte |  | ptrPerson | pero.Piap+0x2 |  |  |  |  |
| 1515 | Person | Details | Youth Apps | Byte |  | ptrPerson | pero.Puia |  |  |  |  |
| 1516 | Person | Details | Youth Goals | Byte |  | ptrPerson | pero.Puia+0x2 |  |  |  |  |
| 17816 | Person | Details | Joined To Current Team Date | Custom | FM Date | ptrPerson | pero.Pjoi |  |  |  |  |
| 18016 | Person | Details | Moved To Based Nation Date | Custom | FM Date | ptrPerson | pero.Pcnj |  |  |  |  |
| 17826 | Person | Details | Retire Date | Custom | FM Date | 00000000 |  |  |  |  |  |
| 24025 | Person | Details | Freeze Attributes | Binary |  | ptrPerson | pero.Pfl2 | 5 | 1 |  |  |
| 180 | Person | Contract | Club | String |  | ptrPerson | 4 -> cluo.Csnm -> teao.Tclu -> pero.Pcti -> pero.Pflc |  |  | 32 | 0 |
| 172 | Person | Contract | Job | Byte |  | ptrPerson | pero.Pcjo -> pero.Pflc |  |  |  |  |
| 117 | Person | Contract | Guide Value | Custom | United Kingdom Pound | ptrPlayer | pero.Pcgv |  |  |  |  |
| 163 | Person | Contract | Transfer Value | Custom | United Kingdom Pound | ptrPlayer | pero.Pcgv+0x4 |  |  |  |  |
| 179 | Person | Contract | Contract Type | Byte |  | ptrPerson | pero.Pces -> pero.Pflc |  |  |  |  |
| 170 | Person | Contract | Weekly Wage | Custom | United Kingdom Pound | ptrPerson | pero.Pcwg -> pero.Pflc |  |  |  |  |
| 178 | Person | Contract | Loyalty Bonus | Custom | United Kingdom Pound | ptrPerson | pero.Pclb -> pero.Pflc |  |  |  |  |
| 22727 | Person | Contract | Agent Fees | Custom | United Kingdom Pound | ptrPerson | pero.Pcaf -> pero.Pflc |  |  |  |  |
| 17813 | Person | Contract | Start Date | Custom | FM Date | ptrPerson | pero.Pcsd -> pero.Pflc |  |  |  |  |
| 17814 | Person | Contract | End Date | Custom | FM Date | ptrPerson | pero.Pcex -> pero.Pflc |  |  |  |  |
| 17815 | Person | Contract | Sign Date | Custom | FM Date | ptrPerson | pero.Pfta -> pero.Pflc |  |  |  |  |
| 12570 | Person | Contract | Listed | Binary |  | ptrPerson | pero.Pffl -> pero.Pflc | 0 | 1 |  |  |
| 12618 | Person | Contract | Listed by Request | Binary |  | ptrPerson | pero.Pffl -> pero.Pflc | 3 | 1 |  |  |
| 12682 | Person | Contract | Not for Sale | Binary |  | ptrPerson | pero.Pffl -> pero.Pflc | 4 | 1 |  |  |
| 12660 | Person | Contract | Set for Release | Binary |  | ptrPerson | pero.Pffl -> pero.Pflc | 5 | 1 |  |  |
| 12619 | Person | Contract | Available for Loan | Binary |  | ptrPerson | pero.Pffl -> pero.Pflc | 1 | 1 |  |  |
| 12617 | Person | Contract | Unavailable for Loan | Binary |  | ptrPerson | pero.Pffl -> pero.Pflc | 6 | 1 |  |  |
| 12680 | Person | Contract | Transfer Offer Options | Byte |  | ptrPerson | pero.Pmsq+0xA -> pero.Pflc |  |  |  |  |
| 646 | Person | Contract | Agreed Playing Time | Byte |  | ptrPerson | pero.Pmsq -> pero.Pflc |  |  |  |  |
| 647 | Person | Contract | Previous Playing Time | Byte |  | ptrPerson | pero.Pmsq+0x1 -> pero.Pflc |  |  |  |  |
| 22724 | Person | Contract | Future Playing Time | Byte |  | ptrPerson | pero.Pcfp -> pero.Pflc |  |  |  |  |
| 22725 | Person | Contract | Future Playing Time Year | 2 Bytes |  | ptrPerson | pero.Pcfp+0x4 -> pero.Pflc |  |  |  |  |
| 24372 | Person | Contract | Playing Time Happiness | Byte |  | ptrPerson | pero.Pmsq+0x8 -> pero.Pflc |  |  |  |  |
| 24371 | Person | Contract | Happiness | Byte |  | ptrPerson | pero.Pmsq+0x6 -> pero.Pflc |  |  |  |  |
| 12571 | Person | Contract | Squad Number | Byte |  | ptrPerson | pero.Psnu -> pero.Pflc |  |  |  |  |
| 13002 | Person | Contract | Preferred Squad Number | Byte |  | ptrPerson | pero.Ppsq -> pero.Ppdt |  |  |  |  |
| 12123 | Person | Contract | Club | String |  | ptrPerson | 4 -> cluo.Csnm -> teao.Tclu -> pero.Pcti -> pero.Plnc -> pero.Potc |  |  | 32 | 0 |
| 12124 | Person | Contract | Job | Byte |  | ptrPerson | pero.Pcjo -> pero.Plnc -> pero.Potc |  |  |  |  |
| 12128 | Person | Contract | Weekly Wage | Custom | United Kingdom Pound | ptrPerson | pero.Pcwg -> pero.Plnc -> pero.Potc |  |  |  |  |
| 24050 | Person | Contract | Unused Weekly Wage | Custom | United Kingdom Pound | ptrPerson | pero.PLmf+0x8 -> pero.Plnc -> pero.Potc |  |  |  |  |
| 17818 | Person | Contract | Start Date | Custom | FM Date | ptrPerson | pero.Pcsd -> pero.Plnc -> pero.Potc |  |  |  |  |
| 17819 | Person | Contract | End Date | Custom | FM Date | ptrPerson | pero.Pcex -> pero.Plnc -> pero.Potc |  |  |  |  |
| 17820 | Person | Contract | Sign Date | Custom | FM Date | ptrPerson | pero.Pfta -> pero.Plnc -> pero.Potc |  |  |  |  |
| 12147 | Person | Contract | Agreed Playing Time | Byte |  | ptrPerson | pero.Pmsq -> pero.Plnc -> pero.Potc |  |  |  |  |
| 12148 | Person | Contract | Previous Playing Time | Byte |  | ptrPerson | pero.Pmsq+0x1 -> pero.Plnc -> pero.Potc |  |  |  |  |
| 12149 | Person | Contract | Squad Number | Byte |  | ptrPerson | pero.Psnu -> pero.Plnc -> pero.Potc |  |  |  |  |
| 24386 | Person | Contract | Agreed Squad Number | Byte |  | ptrPerson | pero.PLsn -> pero.Plnc -> pero.Potc |  |  |  |  |
| 20187 | Person | Contract | Playing Monthly Fee | Custom | United Kingdom Pound | ptrPerson | pero.PLmf -> pero.Plnc -> pero.Potc |  |  |  |  |
| 20188 | Person | Contract | Unused Monthly Fee | Custom | United Kingdom Pound | ptrPerson | pero.PLmf+0x4 -> pero.Plnc -> pero.Potc |  |  |  |  |
| 20176 | Person | Contract | Fee To Buy | Custom | United Kingdom Pound | ptrPerson | pero.PLfb -> pero.Plnc -> pero.Potc |  |  |  |  |
| 24051 | Person | Contract | Purchase After Matches Played | Byte |  | ptrPerson | pero.PLNG -> pero.Plnc -> pero.Potc |  |  |  |  |
| 24052 | Person | Contract | Future Buy Back Fee | Custom | United Kingdom Pound | ptrPerson | pero.PLmf-0x4 -> pero.Plnc -> pero.Potc |  |  |  |  |
| 20182 | Person | Contract | Can Be Recalled | Binary |  | ptrPerson | pero.PLfl -> pero.Plnc -> pero.Potc | 2 | 1 |  |  |
| 20183 | Person | Contract | Can Play In Cup | Binary |  | ptrPerson | pero.PLfl -> pero.Plnc -> pero.Potc | 1 | 1 |  |  |
| 20178 | Person | Contract | Can Play Against Parent Club | Binary |  | ptrPerson | pero.PLfl -> pero.Plnc -> pero.Potc | 0 | 1 |  |  |
| 20186 | Person | Contract | Can Play Against Parent Club B Team | Binary |  | ptrPerson | pero.PLfl+0x1 -> pero.Plnc -> pero.Potc | 7 | 1 |  |  |
| 20181 | Person | Contract | Can Play For Parent Club | Binary |  | ptrPerson | pero.PLfl+0x2 -> pero.Plnc -> pero.Potc | 0 | 1 |  |  |
| 20185 | Person | Contract | Can Play For Parent Club Reserve Team | Binary |  | ptrPerson | pero.PLfl+0x1 -> pero.Plnc -> pero.Potc | 5 | 1 |  |  |
| 20180 | Person | Contract | Can Play For Parent Club In Cup Matches | Binary |  | ptrPerson | pero.PLfl+0x2 -> pero.Plnc -> pero.Potc | 4 | 1 |  |  |
| 20184 | Person | Contract | Loan Cannot Be Terminated | Binary |  | ptrPerson | pero.PLfl+0x1 -> pero.Plnc -> pero.Potc | 6 | 1 |  |  |
| 20179 | Person | Contract | Loan cannot be terminated | Binary |  | ptrPerson | pero.PLfl+0x1 -> pero.Plnc -> pero.Potc | 4 | 1 |  |  |
| 12640 | Person | Contract | Club | String |  | ptrPerson | 4 -> cluo.Csnm -> teao.Tclu -> pero.Pcti -> pero.Pbcc -> pero.Potc |  |  | 32 | 0 |
| 12641 | Person | Contract | Job | Byte |  | ptrPerson | pero.Pcjo -> pero.Pbcc -> pero.Potc |  |  |  |  |
| 12642 | Person | Contract | Weekly Wage | Custom | United Kingdom Pound | ptrPerson | pero.Pcwg -> pero.Pbcc -> pero.Potc |  |  |  |  |
| 12907 | Person | Contract | Nation | String |  | ptrPerson | 4 -> nato.Nnam -> nato.Nnat -> teao.Tclu -> pero.Pcti -> pero.Pnac -> pero.Potc |  |  | 32 | 0 |
| 12908 | Person | Contract | Job | Byte |  | ptrPerson | pero.Pcjo -> pero.Pnac -> pero.Potc |  |  |  |  |
| 12909 | Person | Contract | Weekly Wage | Custom | United Kingdom Pound | ptrPerson | pero.Pcwg -> pero.Pnac -> pero.Potc |  |  |  |  |
| 24377 | Person | Contract | Based Nation | String |  | ptrPerson | 4 -> nato.Nnam -> agto.Abnt -> pero.Pagt |  |  | 255 | 0 |
| 24378 | Person | Contract | Scope | Byte |  | ptrPerson | agto.Ascp -> pero.Pagt |  |  |  |  |
| 24380 | Person | Contract | Patience | Byte |  | ptrPerson | agto.Apat -> pero.Pagt |  |  |  |  |
| 24381 | Person | Contract | Business | Byte |  | ptrPerson | agto.Apat+0x1 -> pero.Pagt |  |  |  |  |
| 24383 | Person | Contract | Size Of Agency | Byte |  | ptrPerson | agto.Apat+0x2 -> pero.Pagt |  |  |  |  |
| 24382 | Person | Contract | Touting Clients | Byte |  | ptrPerson | agto.Apat+0x3 -> pero.Pagt |  |  |  |  |
| 23644 | Person | Person Data | Personality (Player-only) | Byte |  | ptrRCA+4 |  |  |  |  |  |
| 102 | Person | Person Data | Adaptability | Byte |  | ptrPerson | pero.Pada |  |  |  |  |
| 109 | Person | Person Data | Ambition | Byte |  | ptrPerson | pero.Pada+0x1 |  |  |  |  |
| 108 | Person | Person Data | Loyalty | Byte |  | ptrPerson | pero.Pada+0x2 |  |  |  |  |
| 107 | Person | Person Data | Pressure | Byte |  | ptrPerson | pero.Pada+0x3 |  |  |  |  |
| 106 | Person | Person Data | Professionalism | Byte |  | ptrPerson | pero.Pada+0x4 |  |  |  |  |
| 105 | Person | Person Data | Sportsmanship | Byte |  | ptrPerson | pero.Pada+0x5 |  |  |  |  |
| 104 | Person | Person Data | Temperament | Byte |  | ptrPerson | pero.Pada+0x6 |  |  |  |  |
| 103 | Person | Person Data | Controversy | Byte |  | ptrPerson | pero.Pada+0x7 |  |  |  |  |
| 1703 | Person | Person Data | Director of Football | Byte |  | ptrPerson | 9 -> pero.Pjpr |  |  |  |  |
| 1705 | Person | Person Data | Technical Director | Byte |  | ptrPerson | E -> pero.Pjpr |  |  |  |  |
| 1683 | Person | Person Data | Manager | Byte |  | ptrPerson | 0 -> pero.Pjpr |  |  |  |  |
| 1711 | Person | Person Data | Ast. Manager | Byte |  | ptrPerson | 1 -> pero.Pjpr |  |  |  |  |
| 1710 | Person | Person Data | Coach | Byte |  | ptrPerson | 2 -> pero.Pjpr |  |  |  |  |
| 1709 | Person | Person Data | Fitness Coach | Byte |  | ptrPerson | 6 -> pero.Pjpr |  |  |  |  |
| 1708 | Person | Person Data | Goalkeeping Coach | Byte |  | ptrPerson | 5 -> pero.Pjpr |  |  |  |  |
| 24031 | Person | Person Data | Set Piece Coach | Byte |  | ptrPerson | 7 -> pero.Pjpr |  |  |  |  |
| 1702 | Person | Person Data | Head of Youth Development | Byte |  | ptrPerson | A -> pero.Pjpr |  |  |  |  |
| 1706 | Person | Person Data | Scout | Byte |  | ptrPerson | 4 -> pero.Pjpr |  |  |  |  |
| 12486 | Person | Person Data | Data Analyst | Byte |  | ptrPerson | C -> pero.Pjpr |  |  |  |  |
| 1707 | Person | Person Data | Loan Manager | Byte |  | ptrPerson | B -> pero.Pjpr |  |  |  |  |
| 12485 | Person | Person Data | Physio | Byte |  | ptrPerson | 3 -> pero.Pjpr |  |  |  |  |
| 1704 | Person | Person Data | Sports Scientist | Byte |  | ptrPerson | D -> pero.Pjpr |  |  |  |  |
| 1701 | Person | Person Data | Chairman | Byte |  | ptrPerson | 8 -> pero.Pjpr |  |  |  |  |
| 18097 | Person | Player Data | Shirt Name | String |  | ptrPlayer | 4 -> plao.Pshn |  |  | 16 | 0 |
| 7 | Person | Player Data | CA | 2 Bytes |  | ptrPlayer | plao.Pcab |  |  |  |  |
| 22728 | Person | Player Data | RCA | 4 Bytes |  | ptrRCA |  |  |  |  |  |
| 8 | Person | Player Data | PA | 2 Bytes |  | ptrPlayer | plao.Ppab |  |  |  |  |
| 5 | Person | Player Data | Current Rep. | 2 Bytes |  | ptrPlayer | plao.Pcrp |  |  |  |  |
| 4 | Person | Player Data | Home Rep. | 2 Bytes |  | ptrPlayer | plao.Phrp |  |  |  |  |
| 6 | Person | Player Data | World Rep. | 2 Bytes |  | ptrPlayer | plao.Pwrp |  |  |  |  |
| 408 | Person | Player Data | Height | 2 Bytes |  | ptrPlayer | plao.Phes |  |  |  |  |
| 409 | Person | Player Data | Body Type | Byte |  | ptrPlayer | pero.Pbdt |  |  |  |  |
| 68 | Person | Player Data | Left Foot | Custom | FM Attribute | ptrPlayer | plao.Patr+0x18 |  |  |  |  |
| 67 | Person | Player Data | Right Foot | Custom | FM Attribute | ptrPlayer | plao.Patr+0x19 |  |  |  |  |
| 1938 | Person | Player Data | Has Work Permit | Binary |  | ptrPerson | plao.Phnp | 2 | 1 |  |  |
| 1939 | Person | Player Data | Treated As Non-EU In Italy | Binary |  | ptrPlayer | plao.NEUI | 3 | 1 |  |  |
| 468 | Person | Player Data | Morale | Byte |  | ptrPlayer | plao.Pmor |  |  |  |  |
| 3 | Person | Player Data | Overall Physical Condition | 2 Bytes |  | ptrPlayer | plao.Popc |  |  |  |  |
| 12676 | Person | Player Data | Match Sharpness | 2 Bytes |  | ptrPlayer | plao.Pmsh |  |  |  |  |
| 12677 | Person | Player Data | Fatigue | 2 Bytes |  | ptrPlayer | plao.Pftg |  |  |  |  |
| 1307 | Person | Player Data | Role Used To Fill Empty Attributes | Byte |  | ptrPlayer | plao.Plcp+0x1 |  |  |  |  |
| 84 | Person | Player Data | GK | Byte |  | ptrPlayer | plao.Ppos+0 |  |  |  |  |
| 99 | Person | Player Data | SW | Byte |  | ptrPlayer | plao.Ppos+0x1 |  |  |  |  |
| 98 | Person | Player Data | DL | Byte |  | ptrPlayer | plao.Ppos+0x2 |  |  |  |  |
| 97 | Person | Player Data | DC | Byte |  | ptrPlayer | plao.Ppos+0x3 |  |  |  |  |
| 96 | Person | Player Data | DR | Byte |  | ptrPlayer | plao.Ppos+0x4 |  |  |  |  |
| 87 | Person | Player Data | WBL | Byte |  | ptrPlayer | plao.Ppos+0xD |  |  |  |  |
| 86 | Person | Player Data | WBR | Byte |  | ptrPlayer | plao.Ppos+0xE |  |  |  |  |
| 95 | Person | Player Data | DM | Byte |  | ptrPlayer | plao.Ppos+0x5 |  |  |  |  |
| 94 | Person | Player Data | ML | Byte |  | ptrPlayer | plao.Ppos+0x6 |  |  |  |  |
| 93 | Person | Player Data | MC | Byte |  | ptrPlayer | plao.Ppos+0x7 |  |  |  |  |
| 92 | Person | Player Data | MR | Byte |  | ptrPlayer | plao.Ppos+0x8 |  |  |  |  |
| 91 | Person | Player Data | AML | Byte |  | ptrPlayer | plao.Ppos+0x9 |  |  |  |  |
| 90 | Person | Player Data | AMC | Byte |  | ptrPlayer | plao.Ppos+0xA |  |  |  |  |
| 89 | Person | Player Data | AMR | Byte |  | ptrPlayer | plao.Ppos+0xB |  |  |  |  |
| 88 | Person | Player Data | ST | Byte |  | ptrPlayer | plao.Ppos+0xC |  |  |  |  |
| 1305 | Person | Player Data | Preferred Central Position | Byte |  | ptrPlayer | plao.Plcp |  |  |  |  |
| 442 | Person | Player Data | Acceleration | Custom | FM Attribute | ptrPlayer | plao.Patr+0x22 |  |  |  |  |
| 453 | Person | Player Data | Agility | Custom | FM Attribute | ptrPlayer | plao.Patr+0x2E |  |  |  |  |
| 452 | Person | Player Data | Balance | Custom | FM Attribute | ptrPlayer | plao.Patr+0x2A |  |  |  |  |
| 451 | Person | Player Data | Jumping Reach | Custom | FM Attribute | ptrPlayer | plao.Patr+0x27 |  |  |  |  |
| 450 | Person | Player Data | Natural Fitness | Custom | FM Attribute | ptrPlayer | plao.Patr+0x32 |  |  |  |  |
| 449 | Person | Player Data | Pace | Custom | FM Attribute | ptrPlayer | plao.Patr+0x26 |  |  |  |  |
| 448 | Person | Player Data | Stamina | Custom | FM Attribute | ptrPlayer | plao.Patr+0x25 |  |  |  |  |
| 447 | Person | Player Data | Strength | Custom | FM Attribute | ptrPlayer | plao.Patr+0x24 |  |  |  |  |
| 47 | Person | Player Data | Aggression | Custom | FM Attribute | ptrPlayer | plao.Patr+0x2D |  |  |  |  |
| 39 | Person | Player Data | Anticipation | Custom | FM Attribute | ptrPlayer | plao.Patr+0x11 |  |  |  |  |
| 49 | Person | Player Data | Bravery | Custom | FM Attribute | ptrPlayer | plao.Patr+0x2B |  |  |  |  |
| 73 | Person | Player Data | Composure | Custom | FM Attribute | ptrPlayer | plao.Patr+0x34 |  |  |  |  |
| 72 | Person | Player Data | Concentration | Custom | FM Attribute | ptrPlayer | plao.Patr+0x35 |  |  |  |  |
| 38 | Person | Player Data | Decision | Custom | FM Attribute | ptrPlayer | plao.Patr+0x12 |  |  |  |  |
| 74 | Person | Player Data | Determination | Custom | FM Attribute | ptrPlayer | plao.Patr+0x33 |  |  |  |  |
| 66 | Person | Player Data | Flair | Custom | FM Attribute | ptrPlayer | plao.Patr+0x1A |  |  |  |  |
| 52 | Person | Player Data | Leadership | Custom | FM Attribute | ptrPlayer | plao.Patr+0x28 |  |  |  |  |
| 32 | Person | Player Data | Off The Ball | Custom | FM Attribute | ptrPlayer | plao.Patr+0x6 |  |  |  |  |
| 36 | Person | Player Data | Positioning | Custom | FM Attribute | ptrPlayer | plao.Patr+0x14 |  |  |  |  |
| 64 | Person | Player Data | Teamwork | Custom | FM Attribute | ptrPlayer | plao.Patr+0x1C |  |  |  |  |
| 46 | Person | Player Data | Vision | Custom | FM Attribute | ptrPlayer | plao.Patr+0xA |  |  |  |  |
| 63 | Person | Player Data | Work Rate | Custom | FM Attribute | ptrPlayer | plao.Patr+0x1D |  |  |  |  |
| 428 | Person | Player Data | Crossing | Custom | FM Attribute | ptrPlayer | plao.Patr+0x0 |  |  |  |  |
| 427 | Person | Player Data | Dribbling | Custom | FM Attribute | ptrPlayer | plao.Patr+0x1 |  |  |  |  |
| 426 | Person | Player Data | Finishing | Custom | FM Attribute | ptrPlayer | plao.Patr+0x2 |  |  |  |  |
| 425 | Person | Player Data | First Touch | Custom | FM Attribute | ptrPlayer | plao.Patr+0x16 |  |  |  |  |
| 423 | Person | Player Data | Heading | Custom | FM Attribute | ptrPlayer | plao.Patr+0x3 |  |  |  |  |
| 422 | Person | Player Data | Long Shots | Custom | FM Attribute | ptrPlayer | plao.Patr+0x4 |  |  |  |  |
| 420 | Person | Player Data | Marking | Custom | FM Attribute | ptrPlayer | plao.Patr+0x5 |  |  |  |  |
| 419 | Person | Player Data | Passing | Custom | FM Attribute | ptrPlayer | plao.Patr+0x7 |  |  |  |  |
| 417 | Person | Player Data | Tackling | Custom | FM Attribute | ptrPlayer | plao.Patr+0x9 |  |  |  |  |
| 416 | Person | Player Data | Technique | Custom | FM Attribute | ptrPlayer | plao.Patr+0x17 |  |  |  |  |
| 415 | Person | Player Data | Corners | Custom | FM Attribute | ptrPlayer | plao.Patr+0x1B |  |  |  |  |
| 424 | Person | Player Data | Free Kick Taking | Custom | FM Attribute | ptrPlayer | plao.Patr+0x23 |  |  |  |  |
| 421 | Person | Player Data | Long Throws | Custom | FM Attribute | ptrPlayer | plao.Patr+0x1E |  |  |  |  |
| 418 | Person | Player Data | Penalty Taking | Custom | FM Attribute | ptrPlayer | plao.Patr+0x8 |  |  |  |  |
| 429 | Person | Player Data | Aerial Reach | Custom | FM Attribute | ptrPlayer | plao.Patr+0xC |  |  |  |  |
| 439 | Person | Player Data | Command Of Area | Custom | FM Attribute | ptrPlayer | plao.Patr+0xD |  |  |  |  |
| 438 | Person | Player Data | Communication | Custom | FM Attribute | ptrPlayer | plao.Patr+0xE |  |  |  |  |
| 437 | Person | Player Data | Eccentricity | Custom | FM Attribute | ptrPlayer | plao.Patr+0x1F |  |  |  |  |
| 436 | Person | Player Data | Handling | Custom | FM Attribute | ptrPlayer | plao.Patr+0xB |  |  |  |  |
| 435 | Person | Player Data | Kicking | Custom | FM Attribute | ptrPlayer | plao.Patr+0xF |  |  |  |  |
| 434 | Person | Player Data | One On Ones | Custom | FM Attribute | ptrPlayer | plao.Patr+0x13 |  |  |  |  |
| 431 | Person | Player Data | Punching (Tendency) | Custom | FM Attribute | ptrPlayer | plao.Patr+0x21 |  |  |  |  |
| 433 | Person | Player Data | Reflexes | Custom | FM Attribute | ptrPlayer | plao.Patr+0x15 |  |  |  |  |
| 432 | Person | Player Data | Rushing Out (Tendency) | Custom | FM Attribute | ptrPlayer | plao.Patr+0x20 |  |  |  |  |
| 430 | Person | Player Data | Throwing | Custom | FM Attribute | ptrPlayer | plao.Patr+0x10 |  |  |  |  |
| 446 | Person | Player Data | Consistency | Custom | FM Attribute | ptrPlayer | plao.Patr+0x2C |  |  |  |  |
| 441 | Person | Player Data | Dirtiness | Custom | FM Attribute | ptrPlayer | plao.Patr+0x29 |  |  |  |  |
| 445 | Person | Player Data | Imp. Matches | Custom | FM Attribute | ptrPlayer | plao.Patr+0x2F |  |  |  |  |
| 444 | Person | Player Data | Injury Proneness | Custom | FM Attribute | ptrPlayer | plao.Patr+0x30 |  |  |  |  |
| 443 | Person | Player Data | Versatility | Custom | FM Attribute | ptrPlayer | plao.Patr+0x31 |  |  |  |  |
| 11466 | Person | Player Data | Runs With Ball Down Left | Binary |  | ptrPerson | plao.Pprm+0 | 0 | 1 |  |  |
| 11473 | Person | Player Data | Runs With Ball Down Right | Binary |  | ptrPerson | plao.Pprm+0 | 1 | 1 |  |  |
| 11472 | Person | Player Data | Runs With Ball Down Center | Binary |  | ptrPerson | plao.Pprm+0 | 2 | 1 |  |  |
| 11471 | Person | Player Data | Gets Into Opposition Area | Binary |  | ptrPerson | plao.Pprm+0 | 3 | 1 |  |  |
| 11470 | Person | Player Data | Moves Into Channels | Binary |  | ptrPerson | plao.Pprm+0 | 4 | 1 |  |  |
| 11469 | Person | Player Data | Gets Forward Whenever Possible | Binary |  | ptrPerson | plao.Pprm+0 | 5 | 1 |  |  |
| 11468 | Person | Player Data | Plays Short Simple Passes | Binary |  | ptrPerson | plao.Pprm+0 | 6 | 1 |  |  |
| 11467 | Person | Player Data | Tries Killer Balls Often | Binary |  | ptrPerson | plao.Pprm+0 | 7 | 1 |  |  |
| 11474 | Person | Player Data | Shoots From Distance | Binary |  | ptrPerson | plao.Pprm+1 | 0 | 1 |  |  |
| 11475 | Person | Player Data | Shoots With Power | Binary |  | ptrPerson | plao.Pprm+1 | 1 | 1 |  |  |
| 11476 | Person | Player Data | Places Shots | Binary |  | ptrPerson | plao.Pprm+1 | 2 | 1 |  |  |
| 11477 | Person | Player Data | Curls Ball | Binary |  | ptrPerson | plao.Pprm+1 | 3 | 1 |  |  |
| 11478 | Person | Player Data | Likes to Round Keeper | Binary |  | ptrPerson | plao.Pprm+1 | 4 | 1 |  |  |
| 11479 | Person | Player Data | Likes to Try To Break Offside Trap | Binary |  | ptrPerson | plao.Pprm+1 | 5 | 1 |  |  |
| 11527 | Person | Player Data | Uses Outside Of Foot | Binary |  | ptrPerson | plao.Pprm+1 | 6 | 1 |  |  |
| 11528 | Person | Player Data | Marks Opponent Tightly | Binary |  | ptrPerson | plao.Pprm+1 | 7 | 1 |  |  |
| 11483 | Person | Player Data | Winds Up Opponents | Binary |  | ptrPerson | plao.Pprm+2 | 0 | 1 |  |  |
| 11481 | Person | Player Data | Argues With Officials | Binary |  | ptrPerson | plao.Pprm+2 | 1 | 1 |  |  |
| 11484 | Person | Player Data | Plays with Back To Goal | Binary |  | ptrPerson | plao.Pprm+2 | 2 | 1 |  |  |
| 11485 | Person | Player Data | Comes Deep To Get Ball | Binary |  | ptrPerson | plao.Pprm+2 | 3 | 1 |  |  |
| 11486 | Person | Player Data | Plays One-Twos | Binary |  | ptrPerson | plao.Pprm+2 | 4 | 1 |  |  |
| 11487 | Person | Player Data | Likes To Lob Keeper | Binary |  | ptrPerson | plao.Pprm+2 | 5 | 1 |  |  |
| 11488 | Person | Player Data | Dictates Tempo | Binary |  | ptrPerson | plao.Pprm+2 | 6 | 1 |  |  |
| 11489 | Person | Player Data | Attempts Overhead Kicks | Binary |  | ptrPerson | plao.Pprm+2 | 7 | 1 |  |  |
| 11490 | Person | Player Data | Looks For Pass Rather Than Attempting To Score | Binary |  | ptrPerson | plao.Pprm+3 | 0 | 1 |  |  |
| 11491 | Person | Player Data | Plays No Through Balls | Binary |  | ptrPerson | plao.Pprm+3 | 1 | 1 |  |  |
| 11492 | Person | Player Data | Stops Play | Binary |  | ptrPerson | plao.Pprm+3 | 2 | 1 |  |  |
| 11493 | Person | Player Data | Knocks Ball Past Opponent | Binary |  | ptrPerson | plao.Pprm+3 | 3 | 1 |  |  |
| 11529 | Person | Player Data | Moves Ball To Right Foot Before Dribble Attempt | Binary |  | ptrPerson | plao.Pprm+3 | 4 | 1 |  |  |
| 11530 | Person | Player Data | Moves Ball To Left Foot Before Dribble Attempt | Binary |  | ptrPerson | plao.Pprm+3 | 5 | 1 |  |  |
| 11496 | Person | Player Data | Dwells On Ball | Binary |  | ptrPerson | plao.Pprm+3 | 6 | 1 |  |  |
| 11497 | Person | Player Data | Arrives Late In Opponents' Area | Binary |  | ptrPerson | plao.Pprm+3 | 7 | 1 |  |  |
| 11498 | Person | Player Data | Tries To Play Way Out Of Trouble | Binary |  | ptrPerson | plao.Pprm+4 | 0 | 1 |  |  |
| 11499 | Person | Player Data | Stays Back At All Times | Binary |  | ptrPerson | plao.Pprm+4 | 1 | 1 |  |  |
| 11500 | Person | Player Data | Avoids Using Weaker Foot | Binary |  | ptrPerson | plao.Pprm+4 | 2 | 1 |  |  |
| 11534 | Person | Player Data | Tries Tricks | Binary |  | ptrPerson | plao.Pprm+4 | 3 | 1 |  |  |
| 11502 | Person | Player Data | Tries Long Range Free Kicks | Binary |  | ptrPerson | plao.Pprm+4 | 4 | 1 |  |  |
| 11503 | Person | Player Data | Dives Into Tackles | Binary |  | ptrPerson | plao.Pprm+4 | 5 | 1 |  |  |
| 11504 | Person | Player Data | Does Not Dive Into Tackles | Binary |  | ptrPerson | plao.Pprm+4 | 6 | 1 |  |  |
| 11505 | Person | Player Data | Cuts Inside From Both Wings | Binary |  | ptrPerson | plao.Pprm+4 | 7 | 1 |  |  |
| 11506 | Person | Player Data | Hugs Line | Binary |  | ptrPerson | plao.Pprm+5 | 0 | 1 |  |  |
| 11531 | Person | Player Data | Gets Crowd Going | Binary |  | ptrPerson | plao.Pprm+5 | 1 | 1 |  |  |
| 11508 | Person | Player Data | Tries First Time Shots | Binary |  | ptrPerson | plao.Pprm+5 | 2 | 1 |  |  |
| 11509 | Person | Player Data | Tries Long Range Passes | Binary |  | ptrPerson | plao.Pprm+5 | 3 | 1 |  |  |
| 11532 | Person | Player Data | Likes Ball Played Into Feet | Binary |  | ptrPerson | plao.Pprm+5 | 4 | 1 |  |  |
| 11511 | Person | Player Data | Hits Free Kick With Power | Binary |  | ptrPerson | plao.Pprm+5 | 5 | 1 |  |  |
| 11533 | Person | Player Data | Likes To Beat Man Repeatedly | Binary |  | ptrPerson | plao.Pprm+5 | 6 | 1 |  |  |
| 11513 | Person | Player Data | Likes To Switch Ball To Other Flank | Binary |  | ptrPerson | plao.Pprm+5 | 7 | 1 |  |  |
| 11516 | Person | Player Data | Possesses Long Flat Throw | Binary |  | ptrPerson | plao.Pprm+6 | 2 | 1 |  |  |
| 11517 | Person | Player Data | Runs With Ball Often | Binary |  | ptrPerson | plao.Pprm+6 | 3 | 1 |  |  |
| 11518 | Person | Player Data | Runs With Ball Rarely | Binary |  | ptrPerson | plao.Pprm+6 | 4 | 1 |  |  |
| 11520 | Person | Player Data | Does not Move Into Channels | Binary |  | ptrPerson | plao.Pprm+6 | 6 | 1 |  |  |
| 11521 | Person | Player Data | Uses Long Throw To Start Counter Attacks | Binary |  | ptrPerson | plao.Pprm+6 | 7 | 1 |  |  |
| 11522 | Person | Player Data | Refrains From Taking Long Shots | Binary |  | ptrPerson | plao.Pprm+7 | 0 | 1 |  |  |
| 11523 | Person | Player Data | Cuts Inside From Left Wing | Binary |  | ptrPerson | plao.Pprm+7 | 1 | 1 |  |  |
| 11524 | Person | Player Data | Cuts Inside From Right Wing | Binary |  | ptrPerson | plao.Pprm+7 | 2 | 1 |  |  |
| 11525 | Person | Player Data | Crosses Early | Binary |  | ptrPerson | plao.Pprm+7 | 3 | 1 |  |  |
| 11526 | Person | Player Data | Brings Ball Out of Defense | Binary |  | ptrPerson | plao.Pprm+7 | 4 | 1 |  |  |
| 12809 | Person | Player Data | Plays Ball With Feet | Binary |  | ptrPerson | plao.Pprm+7 | 7 | 1 |  |  |
| 11167 | Person | Staff Data | CA | 2 Bytes |  | ptrStaff | nplo.Ncra |  |  |  |  |
| 11168 | Person | Staff Data | PA | 2 Bytes |  | ptrStaff | nplo.Npta |  |  |  |  |
| 11169 | Person | Staff Data | Current Rep. | 2 Bytes |  | ptrStaff | nplo.Ncrr |  |  |  |  |
| 11170 | Person | Staff Data | Home Rep. | 2 Bytes |  | ptrStaff | nplo.Nhmr |  |  |  |  |
| 11171 | Person | Staff Data | World Rep. | 2 Bytes |  | ptrStaff | nplo.Nwrr |  |  |  |  |
| 11172 | Person | Staff Data | In Possession | Byte |  | ptrStaff | nplo.Nppf |  |  |  |  |
| 24374 | Person | Staff Data | Out of Possession | Byte |  | ptrStaff | nplo.Nppf+0x4 |  |  |  |  |
| 11173 | Person | Staff Data | In Possession | Byte |  | ptrStaff | nplo.Npsf |  |  |  |  |
| 24399 | Person | Staff Data | Out of Possession | Byte |  | ptrStaff | nplo.Npsf+0x4 |  |  |  |  |
| 11174 | Person | Staff Data | Defensive Formation | Byte |  | ptrStaff | nplo.Npdf |  |  |  |  |
| 11175 | Person | Staff Data | Attacking Formation | Byte |  | ptrStaff | nplo.Npaf |  |  |  |  |
| 11176 | Person | Staff Data | Coaching Style | Byte |  | ptrStaff | nplo.Npcs |  |  |  |  |
| 11177 | Person | Staff Data | Coaching License | Byte |  | ptrPerson | nplo.Npcl |  |  |  |  |
| 11200 | Person | Staff Data | Attacking | Custom | FM Attribute | ptrStaff | nplo.Npat+0x22 |  |  |  |  |
| 11201 | Person | Staff Data | Defending | Custom | FM Attribute | ptrStaff | nplo.Npat+0x23 |  |  |  |  |
| 11202 | Person | Staff Data | Fitness | Custom | FM Attribute | ptrStaff | nplo.Npat+0x24 |  |  |  |  |
| 24030 | Person | Staff Data | Set Pieces | Custom | FM Attribute | ptrStaff | nplo.Npat+0x33 |  |  |  |  |
| 11206 | Person | Staff Data | Possession | Custom | FM Attribute | ptrStaff | nplo.Npat+0x25 |  |  |  |  |
| 11208 | Person | Staff Data | Tactical | Custom | FM Attribute | ptrStaff | nplo.Npat+0x27 |  |  |  |  |
| 11209 | Person | Staff Data | Technical | Custom | FM Attribute | ptrStaff | nplo.Npat+0x26 |  |  |  |  |
| 11199 | Person | Staff Data | Working with Youngsters | Byte |  | ptrStaff | nplo.Npat+0xC |  |  |  |  |
| 12465 | Person | Staff Data | GK Distribution | Custom | FM Attribute | ptrStaff | nplo.Npat+0x2A |  |  |  |  |
| 12466 | Person | Staff Data | GK Handling | Custom | FM Attribute | ptrStaff | nplo.Npat+0x29 |  |  |  |  |
| 12467 | Person | Staff Data | GK Shot Stopping | Custom | FM Attribute | ptrStaff | nplo.Npat+0x1B |  |  |  |  |
| 11214 | Person | Staff Data | Adaptability | Byte |  | ptrPerson | pero.Pada |  |  |  |  |
| 11216 | Person | Staff Data | Determination | Custom | FM Attribute | ptrStaff | nplo.Npat+0xD |  |  |  |  |
| 11215 | Person | Staff Data | Authority | Byte |  | ptrStaff | nplo.Npat+0x4 |  |  |  |  |
| 11210 | Person | Staff Data | People Management | Custom | FM Attribute | ptrStaff | nplo.Npat+0x1E |  |  |  |  |
| 11219 | Person | Staff Data | Motivating | Custom | FM Attribute | ptrStaff | nplo.Npat+0x1F |  |  |  |  |
| 12444 | Person | Staff Data | Judging Player Ability | Custom | FM Attribute | ptrStaff | nplo.Npat+0x1C |  |  |  |  |
| 12445 | Person | Staff Data | Judging Player Potential | Custom | FM Attribute | ptrStaff | nplo.Npat+0x1D |  |  |  |  |
| 12446 | Person | Staff Data | Judging Staff Ability | Custom | FM Attribute | ptrStaff | nplo.Npat+0x32 |  |  |  |  |
| 12451 | Person | Staff Data | Negotiating | Custom | FM Attribute | ptrStaff | nplo.Npat+0x31 |  |  |  |  |
| 12448 | Person | Staff Data | Tactical Knowledge | Custom | FM Attribute | ptrStaff | nplo.Npat+0x21 |  |  |  |  |
| 12459 | Person | Staff Data | Physiotherapy | Custom | FM Attribute | ptrStaff | nplo.Npat+0x20 |  |  |  |  |
| 12460 | Person | Staff Data | Sports Science | Custom | FM Attribute | ptrStaff | nplo.Npat+0x2F |  |  |  |  |
| 11229 | Person | Staff Data | Analysing Data | Custom | FM Attribute | ptrStaff | nplo.Npat+0x2C |  |  |  |  |
| 11224 | Person | Staff Data | Business | Byte |  | ptrStaff | nplo.Npat+0x1 |  |  |  |  |
| 11225 | Person | Staff Data | Interference | Byte |  | ptrStaff | nplo.Npat+0x6 |  |  |  |  |
| 11227 | Person | Staff Data | Resources | Byte |  | ptrStaff | nplo.Npat+0xB |  |  |  |  |
| 11226 | Person | Staff Data | Patience | Byte |  | ptrStaff | nplo.Npat+0x9 |  |  |  |  |
| 11179 | Person | Staff Data | Attacking | Byte |  | ptrStaff | nplo.Npat |  |  |  |  |
| 12997 | Person | Staff Data | Depth | Byte |  | ptrStaff | nplo.Npat+0x2 |  |  |  |  |
| 11180 | Person | Staff Data | Defensive Line | Byte |  | ptrStaff | nplo.Npat+0x13 |  |  |  |  |
| 11181 | Person | Staff Data | Directness | Byte |  | ptrStaff | nplo.Npat+0x3 |  |  |  |  |
| 11211 | Person | Staff Data | Dirtiness Allowance | Custom | FM Attribute | ptrStaff | nplo.Npat+0x28 |  |  |  |  |
| 13014 | Person | Staff Data | Eccentricity | Custom | FM Attribute | ptrStaff | nplo.Npat+0x30 |  |  |  |  |
| 11182 | Person | Staff Data | Fluidity | Byte |  | ptrStaff | nplo.Npat+0x14 |  |  |  |  |
| 11183 | Person | Staff Data | Flexibility | Byte |  | ptrStaff | nplo.Npat+0x15 |  |  |  |  |
| 11184 | Person | Staff Data | Free Roles | Byte |  | ptrStaff | nplo.Npat+0x5 |  |  |  |  |
| 11185 | Person | Staff Data | Marking | Byte |  | ptrStaff | nplo.Npat+0x7 |  |  |  |  |
| 11186 | Person | Staff Data | Offside | Byte |  | ptrStaff | nplo.Npat+0x8 |  |  |  |  |
| 11187 | Person | Staff Data | Pressing Intensity | Byte |  | ptrStaff | nplo.Npat+0xA |  |  |  |  |
| 11188 | Person | Staff Data | Sitting Back | Byte |  | ptrStaff | nplo.Npat+0x10 |  |  |  |  |
| 13013 | Person | Staff Data | Technique | Byte |  | ptrStaff | nplo.Npat+0x2 |  |  |  |  |
| 11189 | Person | Staff Data | Tempo | Byte |  | ptrStaff | nplo.Npat+0x18 |  |  |  |  |
| 11190 | Person | Staff Data | Use Of Playmaker | Byte |  | ptrStaff | nplo.Npat+0x11 |  |  |  |  |
| 11191 | Person | Staff Data | Use Of Subtitutions | Byte |  | ptrStaff | nplo.Npat+0x12 |  |  |  |  |
| 11192 | Person | Staff Data | Width | Byte |  | ptrStaff | nplo.Npat+0x19 |  |  |  |  |
| 11194 | Person | Staff Data | Buying Players | Byte |  | ptrStaff | nplo.Npat+0xE |  |  |  |  |
| 11195 | Person | Staff Data | Hardness Of Training | Byte |  | ptrStaff | nplo.Npat+0x16 |  |  |  |  |
| 11196 | Person | Staff Data | Mind Games | Byte |  | ptrStaff | nplo.Npat+0xF |  |  |  |  |
| 11197 | Person | Staff Data | Squad Rotation | Byte |  | ptrStaff | nplo.Npat+0x17 |  |  |  |  |
| 11212 | Person | Staff Data | Versatility | Custom | FM Attribute | ptrStaff | nplo.Npat+0x2B |  |  |  |  |
| 12673 | Person | Manager Data | Media Handling | Byte |  | ptrHumanStaff | mano.Mcha+0x6 |  |  |  |  |
| 12669 | Person | Manager Data | Tactical Consistency | Byte |  | ptrHumanStaff | mano.Mcha+0x3 |  |  |  |  |
| 12667 | Person | Manager Data | Hands On Approach | Byte |  | ptrHumanStaff | mano.Mcha+0x5 |  |  |  |  |
| 12672 | Person | Manager Data | Managing Finances | Byte |  | ptrHumanStaff | mano.Mcha |  |  |  |  |
| 12671 | Person | Manager Data | Handling Team Discipline | Byte |  | ptrHumanStaff | mano.Mcha+0x1 |  |  |  |  |
| 12670 | Person | Manager Data | Loyalty To Players | Byte |  | ptrHumanStaff | mano.Mcha+0x2 |  |  |  |  |
| 12668 | Person | Manager Data | Domestic Player Bias | Byte |  | ptrHumanStaff | mano.Mcha+0x4 |  |  |  |  |
| 17742 | Person | Manager Data | Recruitment Package | Byte |  | ptrHumanStaff | mano.Msrp -> mano.Mscc |  |  |  |  |
| 17743 | Person | Manager Data | Scouting Budget (Season) | 4 Bytes |  | ptrHumanStaff | mano.Mscb -> mano.Mscc |  |  |  |  |
| 17744 | Person | Manager Data | Scouting Budget (Rem.) | 4 Bytes |  | ptrHumanStaff | mano.Mscb+0x4 -> mano.Mscc |  |  |  |  |
| 11569 | Person | Manager Data | Coaching Staff | Byte |  | ptrHumanStaff | mano.Mest -> mano.Mscc |  |  |  |  |
| 11578 | Person | Manager Data | Physio | Byte |  | ptrHumanStaff | mano.Mest+0x3 -> mano.Mscc |  |  |  |  |
| 11577 | Person | Manager Data | Scouts | Byte |  | ptrHumanStaff | mano.Mest+0x13 -> mano.Mscc |  |  |  |  |
| 11576 | Person | Manager Data | Sport Scientists | Byte |  | ptrHumanStaff | mano.Mest+0x9 -> mano.Mscc |  |  |  |  |
| 11575 | Person | Manager Data | Performance Analyst | Byte |  | ptrHumanStaff | mano.Mest+0xC -> mano.Mscc |  |  |  |  |
| 22760 | Person | Manager Data | Recruitment Analyst | Byte |  | ptrHumanStaff | mano.Mest+0x14 -> mano.Mscc |  |  |  |  |
| 11584 | Person | Manager Data | Coaching Staff | Byte |  | ptrHumanStaff | mano.Mest+0x1 -> mano.Mscc |  |  |  |  |
| 22741 | Person | Manager Data | Physio | Byte |  | ptrHumanStaff | mano.Mest+0x3+0x1 -> mano.Mscc |  |  |  |  |
| 11587 | Person | Manager Data | Sport Scientists | Byte |  | ptrHumanStaff | mano.Mest+0x9+0x1 -> mano.Mscc |  |  |  |  |
| 11588 | Person | Manager Data | Performance Analyst | Byte |  | ptrHumanStaff | mano.Mest+0xC+0x1 -> mano.Mscc |  |  |  |  |
| 24401 | Person | Manager Data | Coaching Staff | Byte |  | ptrHumanStaff | mano.Mest+0x2 -> mano.Mscc |  |  |  |  |
| 24402 | Person | Manager Data | Physio | Byte |  | ptrHumanStaff | mano.Mest+0x3+0x2 -> mano.Mscc |  |  |  |  |
| 24403 | Person | Manager Data | Sport Scientists | Byte |  | ptrHumanStaff | mano.Mest+0x9+0x2 -> mano.Mscc |  |  |  |  |
| 24404 | Person | Manager Data | Performance Analyst | Byte |  | ptrHumanStaff | mano.Mest+0xC+0x2 -> mano.Mscc |  |  |  |  |
| 24022 | Person | Manager Data | All Players Interested | Binary |  | ptrHumanStaff | mano.Pfl1 | 0 | 1 |  |  |
| 24024 | Person | Manager Data | Become Unsackable | Binary |  | ptrHumanStaff | mano.Pfl1 | 1 | 1 |  |  |
| 24023 | Person | Manager Data | Unlimited Scouting | Binary |  | ptrHumanStaff | mano.Pfl1 | 2 | 1 |  |  |
| 24026 | Person | Manager Data | Attribute Masking | Binary |  | ptrHumanStaff | mano.Pfl1 | 4 | 1 |  |  |
| 24027 | Person | Manager Data | Squad Registration Anytime | Binary |  | ptrHumanStaff | mano.Pfl2 | 0 | 1 |  |  |
| 24028 | Person | Manager Data | Squad Numbers Anytime | Binary |  | ptrHumanStaff | mano.Pfl2 | 1 | 1 |  |  |
| 24040 | Person | Manager Data | Show All Players In Search (Requires save and reload) | Byte |  | ptrHumanStaff | mano.Mrfl -> 0x0 -> mano.Mrfi |  |  |  |  |
| 24041 | Person | Manager Data | Show All Staff In Search (Requires save and reload) | Byte |  | ptrHumanStaff | mano.Mrfl -> 0x8 -> mano.Mrfi |  |  |  |  |
| 17206 | Stadium | Details | Row ID | 4 Bytes |  | ptrStadium | objo.Rwid |  |  |  |  |
| 17207 | Stadium | Details | Unique ID | 4 Bytes |  | ptrStadium | objo.Duni |  |  |  |  |
| 17430 | Stadium | Details | Random ID | 4 Bytes |  | ptrStadium | objo.Rdui |  |  |  |  |
| 17208 | Stadium | Details | Name | String |  | ptrStadium | 4 -> stao.Snam |  |  | 64 | 0 |
| 17209 | Stadium | Details | City | String |  | ptrStadium | 4 -> ctyo.Cnam -> stao.Scti |  |  | 32 | 0 |
| 17210 | Stadium | Details | Owner | String |  | ptrStadium | 4 -> cluo.Cnam -> stao.Sowi |  |  | 32 | 0 |
| 17211 | Stadium | Details | Owner Type | Byte |  | ptrStadium | stao.Soty |  |  |  |  |
| 17212 | Stadium | Details | Is Training Ground | Binary |  | ptrStadium | stao.Stf1 | 2 | 1 |  |  |
| 17214 | Stadium | Details | Hex | 4 Bytes |  | ptrStadium | stao.Sscl |  |  |  |  |
| 17216 | Stadium | Details | Red | Byte |  | ptrStadium | stao.Sscl+2 |  |  |  |  |
| 17217 | Stadium | Details | Green | Byte |  | ptrStadium | stao.Sscl+1 |  |  |  |  |
| 17218 | Stadium | Details | Blue | Byte |  | ptrStadium | stao.Sscl |  |  |  |  |
| 17219 | Stadium | Details | Opacity | Byte |  | ptrStadium | stao.Sscl+3 |  |  |  |  |
| 17317 | Stadium | Details | Capacity | 4 Bytes |  | ptrStadium | stao.Scpy |  |  |  |  |
| 17318 | Stadium | Details | Seating Capacity | 4 Bytes |  | ptrStadium | stao.Scpy+0x4 |  |  |  |  |
| 17319 | Stadium | Details | Capacity for All-Seater Competitions | 4 Bytes |  | ptrStadium | stao.Scpy+0xC |  |  |  |  |
| 17320 | Stadium | Details | Expansion Capacity | 4 Bytes |  | ptrStadium | stao.Scpy+0x10 |  |  |  |  |
| 17321 | Stadium | Details | Used Capacity | 4 Bytes |  | ptrStadium | stao.Scpy+0x8 |  |  |  |  |
| 17322 | Stadium | Details | Pitch Type | Byte |  | ptrStadium | stao.Spty |  |  |  |  |
| 17323 | Stadium | Details | Pitch Condition | Byte |  | ptrStadium | stao.Sptc |  |  |  |  |
| 17324 | Stadium | Details | Pitch Deterioration Rate | Byte |  | ptrStadium | stao.Sdtr |  |  |  |  |
| 17325 | Stadium | Details | Pitch Recovery Rate | Byte |  | ptrStadium | stao.Sprr |  |  |  |  |
| 17326 | Stadium | Details | Pitch Length | 2 Bytes |  | ptrStadium | stao.Spdm |  |  |  |  |
| 17327 | Stadium | Details | Pitch Width | 2 Bytes |  | ptrStadium | stao.Spdm+0x2 |  |  |  |  |
| 17328 | Stadium | Details | Pitch Length for Int. Matches | 2 Bytes |  | ptrStadium | stao.Spdm+0x4 |  |  |  |  |
| 17329 | Stadium | Details | Pitch Width for Int. Matches | 2 Bytes |  | ptrStadium | stao.Spdm+0x6 |  |  |  |  |
| 17330 | Stadium | Details | Minimum Pitch Length | 2 Bytes |  | ptrStadium | stao.Spdm+0x8 |  |  |  |  |
| 17331 | Stadium | Details | Minimum Pitch Width | 2 Bytes |  | ptrStadium | stao.Spdm+0xA |  |  |  |  |
| 17332 | Stadium | Details | Maximum Pitch Length | 2 Bytes |  | ptrStadium | stao.Spdm+0xC |  |  |  |  |
| 17333 | Stadium | Details | Maximum Pitch Width | 2 Bytes |  | ptrStadium | stao.Spdm+0xE |  |  |  |  |
| 17827 | Stadium | Details | Date Pitch Last Relaid | Custom | FM Date | ptrStadium | stao.Splr |  |  |  |  |
| 17828 | Stadium | Details | Pitch Relay Required Date | Custom | FM Date | ptrStadium | stao.Sprl |  |  |  |  |
| 17829 | Stadium | Details | Built Date | Custom | FM Date | ptrStadium | stao.Sbld |  |  |  |  |
| 17830 | Stadium | Details | Re-Built Date | Custom | FM Date | ptrStadium | stao.Srbd |  |  |  |  |
| 18020 | Stadium | Details | Current Owneship Date | Custom | FM Date | ptrStadium | stao.Doco |  |  |  |  |
| 17350 | Stadium | Details | Latitude | Float |  | ptrStadium | stao.Slat |  |  |  |  |
| 17351 | Stadium | Details | Longitude | Float |  | ptrStadium | stao.Slon |  |  |  |  |
| 17352 | Stadium | Details | State | Byte |  | ptrStadium | stao.Sste |  |  |  |  |
| 17353 | Stadium | Details | Decay | Byte |  | ptrStadium | stao.Sdcy |  |  |  |  |
| 17354 | Stadium | Details | Environment | Byte |  | ptrStadium | stao.Senv |  |  |  |  |
| 17355 | Stadium | Details | Used By National Team | Byte |  | ptrStadium | stao.Sunt |  |  |  |  |
| 17356 | Stadium | Details | Used By National U21 Team | Byte |  | ptrStadium | stao.Su21 |  |  |  |  |
| 17357 | Stadium | Details | Used By National U19 Team | Byte |  | ptrStadium | stao.Su19 |  |  |  |  |
| 17358 | Stadium | Details | Not Used In Continental Final | Binary |  | ptrStadium | stao.Stf2 | 7 | 1 |  |  |
| 17359 | Stadium | Details | Extinct | Binary |  | ptrStadium | stao.Stf1 | 0 | 1 |  |  |
| 17360 | Stadium | Details | Roof | Binary |  | ptrStadium | stao.Stf2 | 0 | 1 |  |  |
| 17361 | Stadium | Details | Retractable Roof | Binary |  | ptrStadium | stao.Stf2 | 6 | 1 |  |  |
| 17362 | Stadium | Details | Has Undersoil Heating | Binary |  | ptrStadium | stao.Stf2 | 1 | 1 |  |  |
| 17363 | Stadium | Details | Has Digital Ad Hoarding | Binary |  | ptrStadium | stao.Stf1 | 6 | 1 |  |  |
| 17364 | Stadium | Details | Has Capacity Changes | Binary |  | ptrStadium | stao.Stf1 | 5 | 1 |  |  |
| 17365 | Stadium | Details | Nearby Stadium | String |  | ptrStadium | 4 -> stao.Snam -> stao.Snbs |  |  | 64 | 0 |
| 17223 | Stadium | Appereance | Capacity | 4 Bytes |  | ptrStadium | stao.Shts -> stao.Ssds |  |  |  |  |
| 17224 | Stadium | Appereance | Condition | Byte |  | ptrStadium | stao.Shts+0x6 -> stao.Ssds |  |  |  |  |
| 17225 | Stadium | Appereance | Age | Byte |  | ptrStadium | stao.Shts+0x4 -> stao.Ssds |  |  |  |  |
| 17226 | Stadium | Appereance | In Use | Binary |  | ptrStadium | stao.Shts+0x7 -> stao.Ssds | 0 | 1 |  |  |
| 17227 | Stadium | Appereance | Seated | Binary |  | ptrStadium | stao.Shts+0x7 -> stao.Ssds | 1 | 1 |  |  |
| 17228 | Stadium | Appereance | Has Tunnel | Binary |  | ptrStadium | stao.Shts+0x7 -> stao.Ssds | 3 | 1 |  |  |
| 17229 | Stadium | Appereance | Has Roof | Binary |  | ptrStadium | stao.Shts+0x7 -> stao.Ssds | 4 | 1 |  |  |
| 17230 | Stadium | Appereance | Has Roof Support | Binary |  | ptrStadium | stao.Shts+0x7 -> stao.Ssds | 5 | 1 |  |  |
| 17231 | Stadium | Appereance | Temporarily Closed | Binary |  | ptrStadium | stao.Shts+0x7 -> stao.Ssds | 6 | 1 |  |  |
| 17232 | Stadium | Appereance | Under Construction | Binary |  | ptrStadium | stao.Shts+0x7 -> stao.Ssds | 7 | 1 |  |  |
| 17235 | Stadium | Appereance | Capacity | 4 Bytes |  | ptrStadium | stao.Shbs -> stao.Ssds |  |  |  |  |
| 17236 | Stadium | Appereance | Condition | Byte |  | ptrStadium | stao.Shbs+0x6 -> stao.Ssds |  |  |  |  |
| 17237 | Stadium | Appereance | Age | Byte |  | ptrStadium | stao.Shbs+0x4 -> stao.Ssds |  |  |  |  |
| 17238 | Stadium | Appereance | In Use | Binary |  | ptrStadium | stao.Shbs+0x7 -> stao.Ssds | 0 | 1 |  |  |
| 17239 | Stadium | Appereance | Seated | Binary |  | ptrStadium | stao.Shbs+0x7 -> stao.Ssds | 1 | 1 |  |  |
| 17240 | Stadium | Appereance | Has Tunnel | Binary |  | ptrStadium | stao.Shbs+0x7 -> stao.Ssds | 3 | 1 |  |  |
| 17241 | Stadium | Appereance | Has Roof | Binary |  | ptrStadium | stao.Shbs+0x7 -> stao.Ssds | 4 | 1 |  |  |
| 17242 | Stadium | Appereance | Has Roof Support | Binary |  | ptrStadium | stao.Shbs+0x7 -> stao.Ssds | 5 | 1 |  |  |
| 17243 | Stadium | Appereance | Temporarily Closed | Binary |  | ptrStadium | stao.Shbs+0x7 -> stao.Ssds | 6 | 1 |  |  |
| 17244 | Stadium | Appereance | Under Construction | Binary |  | ptrStadium | stao.Shbs+0x7 -> stao.Ssds | 7 | 1 |  |  |
| 17247 | Stadium | Appereance | Capacity | 4 Bytes |  | ptrStadium | stao.Shrs -> stao.Ssds |  |  |  |  |
| 17248 | Stadium | Appereance | Condition | Byte |  | ptrStadium | stao.Shrs+0x6 -> stao.Ssds |  |  |  |  |
| 17249 | Stadium | Appereance | Age | Byte |  | ptrStadium | stao.Shrs+0x4 -> stao.Ssds |  |  |  |  |
| 17250 | Stadium | Appereance | In Use | Binary |  | ptrStadium | stao.Shrs+0x7 -> stao.Ssds | 0 | 1 |  |  |
| 17251 | Stadium | Appereance | Seated | Binary |  | ptrStadium | stao.Shrs+0x7 -> stao.Ssds | 1 | 1 |  |  |
| 17252 | Stadium | Appereance | Has Tunnel | Binary |  | ptrStadium | stao.Shrs+0x7 -> stao.Ssds | 3 | 1 |  |  |
| 17253 | Stadium | Appereance | Has Roof | Binary |  | ptrStadium | stao.Shrs+0x7 -> stao.Ssds | 4 | 1 |  |  |
| 17254 | Stadium | Appereance | Has Roof Support | Binary |  | ptrStadium | stao.Shrs+0x7 -> stao.Ssds | 5 | 1 |  |  |
| 17255 | Stadium | Appereance | Temporarily Closed | Binary |  | ptrStadium | stao.Shrs+0x7 -> stao.Ssds | 6 | 1 |  |  |
| 17256 | Stadium | Appereance | Under Construction | Binary |  | ptrStadium | stao.Shrs+0x7 -> stao.Ssds | 7 | 1 |  |  |
| 17259 | Stadium | Appereance | Capacity | 4 Bytes |  | ptrStadium | stao.Shls -> stao.Ssds |  |  |  |  |
| 17260 | Stadium | Appereance | Condition | Byte |  | ptrStadium | stao.Shls+0x6 -> stao.Ssds |  |  |  |  |
| 17261 | Stadium | Appereance | Age | Byte |  | ptrStadium | stao.Shls+0x4 -> stao.Ssds |  |  |  |  |
| 17262 | Stadium | Appereance | In Use | Binary |  | ptrStadium | stao.Shls+0x7 -> stao.Ssds | 0 | 1 |  |  |
| 17263 | Stadium | Appereance | Seated | Binary |  | ptrStadium | stao.Shls+0x7 -> stao.Ssds | 1 | 1 |  |  |
| 17264 | Stadium | Appereance | Has Tunnel | Binary |  | ptrStadium | stao.Shls+0x7 -> stao.Ssds | 3 | 1 |  |  |
| 17265 | Stadium | Appereance | Has Roof | Binary |  | ptrStadium | stao.Shls+0x7 -> stao.Ssds | 4 | 1 |  |  |
| 17266 | Stadium | Appereance | Has Roof Support | Binary |  | ptrStadium | stao.Shls+0x7 -> stao.Ssds | 5 | 1 |  |  |
| 17267 | Stadium | Appereance | Temporarily Closed | Binary |  | ptrStadium | stao.Shls+0x7 -> stao.Ssds | 6 | 1 |  |  |
| 17268 | Stadium | Appereance | Under Construction | Binary |  | ptrStadium | stao.Shls+0x7 -> stao.Ssds | 7 | 1 |  |  |
| 17271 | Stadium | Appereance | Capacity | 4 Bytes |  | ptrStadium | stao.Shtr -> stao.Ssds |  |  |  |  |
| 17272 | Stadium | Appereance | Condition | Byte |  | ptrStadium | stao.Shtr+0x6 -> stao.Ssds |  |  |  |  |
| 17273 | Stadium | Appereance | Age | Byte |  | ptrStadium | stao.Shtr+0x4 -> stao.Ssds |  |  |  |  |
| 17274 | Stadium | Appereance | In Use | Binary |  | ptrStadium | stao.Shtr+0x7 -> stao.Ssds | 0 | 1 |  |  |
| 17275 | Stadium | Appereance | Seated | Binary |  | ptrStadium | stao.Shtr+0x7 -> stao.Ssds | 1 | 1 |  |  |
| 17276 | Stadium | Appereance | Has Tunnel | Binary |  | ptrStadium | stao.Shtr+0x7 -> stao.Ssds | 3 | 1 |  |  |
| 17277 | Stadium | Appereance | Has Roof | Binary |  | ptrStadium | stao.Shtr+0x7 -> stao.Ssds | 4 | 1 |  |  |
| 17278 | Stadium | Appereance | Has Roof Support | Binary |  | ptrStadium | stao.Shtr+0x7 -> stao.Ssds | 5 | 1 |  |  |
| 17279 | Stadium | Appereance | Temporarily Closed | Binary |  | ptrStadium | stao.Shtr+0x7 -> stao.Ssds | 6 | 1 |  |  |
| 17280 | Stadium | Appereance | Under Construction | Binary |  | ptrStadium | stao.Shtr+0x7 -> stao.Ssds | 7 | 1 |  |  |
| 17283 | Stadium | Appereance | Capacity | 4 Bytes |  | ptrStadium | stao.Shbr -> stao.Ssds |  |  |  |  |
| 17284 | Stadium | Appereance | Condition | Byte |  | ptrStadium | stao.Shbr+0x6 -> stao.Ssds |  |  |  |  |
| 17285 | Stadium | Appereance | Age | Byte |  | ptrStadium | stao.Shbr+0x4 -> stao.Ssds |  |  |  |  |
| 17286 | Stadium | Appereance | In Use | Binary |  | ptrStadium | stao.Shbr+0x7 -> stao.Ssds | 0 | 1 |  |  |
| 17287 | Stadium | Appereance | Seated | Binary |  | ptrStadium | stao.Shbr+0x7 -> stao.Ssds | 1 | 1 |  |  |
| 17288 | Stadium | Appereance | Has Tunnel | Binary |  | ptrStadium | stao.Shbr+0x7 -> stao.Ssds | 3 | 1 |  |  |
| 17289 | Stadium | Appereance | Has Roof | Binary |  | ptrStadium | stao.Shbr+0x7 -> stao.Ssds | 4 | 1 |  |  |
| 17290 | Stadium | Appereance | Has Roof Support | Binary |  | ptrStadium | stao.Shbr+0x7 -> stao.Ssds | 5 | 1 |  |  |
| 17291 | Stadium | Appereance | Temporarily Closed | Binary |  | ptrStadium | stao.Shbr+0x7 -> stao.Ssds | 6 | 1 |  |  |
| 17292 | Stadium | Appereance | Under Construction | Binary |  | ptrStadium | stao.Shbr+0x7 -> stao.Ssds | 7 | 1 |  |  |
| 17295 | Stadium | Appereance | Capacity | 4 Bytes |  | ptrStadium | stao.Shtl -> stao.Ssds |  |  |  |  |
| 17296 | Stadium | Appereance | Condition | Byte |  | ptrStadium | stao.Shtl+0x6 -> stao.Ssds |  |  |  |  |
| 17297 | Stadium | Appereance | Age | Byte |  | ptrStadium | stao.Shtl+0x4 -> stao.Ssds |  |  |  |  |
| 17298 | Stadium | Appereance | In Use | Binary |  | ptrStadium | stao.Shtl+0x7 -> stao.Ssds | 0 | 1 |  |  |
| 17299 | Stadium | Appereance | Seated | Binary |  | ptrStadium | stao.Shtl+0x7 -> stao.Ssds | 1 | 1 |  |  |
| 17300 | Stadium | Appereance | Has Tunnel | Binary |  | ptrStadium | stao.Shtl+0x7 -> stao.Ssds | 3 | 1 |  |  |
| 17301 | Stadium | Appereance | Has Roof | Binary |  | ptrStadium | stao.Shtl+0x7 -> stao.Ssds | 4 | 1 |  |  |
| 17302 | Stadium | Appereance | Has Roof Support | Binary |  | ptrStadium | stao.Shtl+0x7 -> stao.Ssds | 5 | 1 |  |  |
| 17303 | Stadium | Appereance | Temporarily Closed | Binary |  | ptrStadium | stao.Shtl+0x7 -> stao.Ssds | 6 | 1 |  |  |
| 17304 | Stadium | Appereance | Under Construction | Binary |  | ptrStadium | stao.Shtl+0x7 -> stao.Ssds | 7 | 1 |  |  |
| 17307 | Stadium | Appereance | Capacity | 4 Bytes |  | ptrStadium | stao.Shbl -> stao.Ssds |  |  |  |  |
| 17308 | Stadium | Appereance | Condition | Byte |  | ptrStadium | stao.Shbl+0x6 -> stao.Ssds |  |  |  |  |
| 17309 | Stadium | Appereance | Age | Byte |  | ptrStadium | stao.Shbl+0x4 -> stao.Ssds |  |  |  |  |
| 17310 | Stadium | Appereance | In Use | Binary |  | ptrStadium | stao.Shbl+0x7 -> stao.Ssds | 0 | 1 |  |  |
| 17311 | Stadium | Appereance | Seated | Binary |  | ptrStadium | stao.Shbl+0x7 -> stao.Ssds | 1 | 1 |  |  |
| 17312 | Stadium | Appereance | Has Tunnel | Binary |  | ptrStadium | stao.Shbl+0x7 -> stao.Ssds | 3 | 1 |  |  |
| 17313 | Stadium | Appereance | Has Roof | Binary |  | ptrStadium | stao.Shbl+0x7 -> stao.Ssds | 4 | 1 |  |  |
| 17314 | Stadium | Appereance | Has Roof Support | Binary |  | ptrStadium | stao.Shbl+0x7 -> stao.Ssds | 5 | 1 |  |  |
| 17315 | Stadium | Appereance | Temporarily Closed | Binary |  | ptrStadium | stao.Shbl+0x7 -> stao.Ssds | 6 | 1 |  |  |
| 17316 | Stadium | Appereance | Under Construction | Binary |  | ptrStadium | stao.Shbl+0x7 -> stao.Ssds | 7 | 1 |  |  |
| 23933 | Presets (Global) | Golden Generation | Generate Wonderkids | Byte |  | hdeffxoa+0x2 |  |  |  |  |  |
| 23981 | Presets (Global) | Golden Generation | Modify the Number of Youth Intakes | Byte |  | hdeffxoa+0x3 |  |  |  |  |  |
| 23983 | Presets (Global) | Golden Generation | Number of Youth Intakes (Max. 100) | Byte |  | hdeffxoa+0x4 |  |  |  |  |  |
| 23921 | Presets (Global) | Golden Generation | Min PA | Byte |  | hdeffxoa |  |  |  |  |  |
| 23922 | Presets (Global) | Golden Generation | Max PA | Byte |  | hdeffxoa+0x1 |  |  |  |  |  |
| 24116 | Presets (Global) | Golden Generation | Max Address To Scan | 8 Bytes |  | hdeffxoa+0x5 |  |  |  |  |  |
| 18898 | Presets (Global) | Ignore Player Retirement | Start Age (default: 32) | Byte |  | ignoreRet |  |  |  |  |  |
| 18899 | Presets (Global) | Ignore Player Retirement | Start PA (default: 170) | Byte |  | ignoreRet+1 |  |  |  |  |  |
| 20738 | Presets (Global) | Ignore Player Retirement | Club UID | 4 Bytes |  | ignoreRet+2 |  |  |  |  |  |
| 20054 | Table Settings | Allocated Pointers | ptrAward | 8 Bytes |  | ptrAward |  |  |  |  |  |
| 20055 | Table Settings | Allocated Pointers | ptrCity | 8 Bytes |  | ptrCity |  |  |  |  |  |
| 11144 | Table Settings | Allocated Pointers | ptrClub | 8 Bytes |  | ptrClub |  |  |  |  |  |
| 11147 | Table Settings | Allocated Pointers | ptrComp | 8 Bytes |  | ptrComp |  |  |  |  |  |
| 20056 | Table Settings | Allocated Pointers | ptrContinent | 8 Bytes |  | ptrContinent |  |  |  |  |  |
| 20057 | Table Settings | Allocated Pointers | ptrFullContract | 8 Bytes |  | ptrFullContract |  |  |  |  |  |
| 20058 | Table Settings | Allocated Pointers | ptrHumanStaff | 8 Bytes |  | ptrHumanStaff |  |  |  |  |  |
| 11585 | Table Settings | Allocated Pointers | ptrLeagueStage | 8 Bytes |  | ptrLeagueStage |  |  |  |  |  |
| 20059 | Table Settings | Allocated Pointers | ptrLoanContract | 8 Bytes |  | ptrLoanContract |  |  |  |  |  |
| 11145 | Table Settings | Allocated Pointers | ptrNation | 8 Bytes |  | ptrNation |  |  |  |  |  |
| 20060 | Table Settings | Allocated Pointers | ptrNationContract | 8 Bytes |  | ptrNationContract |  |  |  |  |  |
| 20053 | Table Settings | Allocated Pointers | ptrPerson | 8 Bytes |  | ptrPerson |  |  |  |  |  |
| 11141 | Table Settings | Allocated Pointers | ptrPlayer | 8 Bytes |  | ptrPlayer |  |  |  |  |  |
| 20062 | Table Settings | Allocated Pointers | ptrRevClubContract | 8 Bytes |  | ptrRevClubContract |  |  |  |  |  |
| 20063 | Table Settings | Allocated Pointers | ptrStadium | 8 Bytes |  | ptrStadium |  |  |  |  |  |
| 11142 | Table Settings | Allocated Pointers | ptrStaff | 8 Bytes |  | ptrStaff |  |  |  |  |  |
| 11148 | Table Settings | Allocated Pointers | ptrTeam | 8 Bytes |  | ptrTeam |  |  |  |  |  |
| 11589 | Table Settings | Allocated Pointers | ptrSelectedObj | 8 Bytes |  | ptrSelectedObj |  |  |  |  |  |
| 12095 | Table Settings | Allocated Pointers | updSelect | Byte |  | updSelect |  |  |  |  |  |
| 20069 | Table Settings | Allocated Pointers | updAward | Byte |  | updAward |  |  |  |  |  |
| 20066 | Table Settings | Allocated Pointers | updCity | Byte |  | updCity |  |  |  |  |  |
| 12099 | Table Settings | Allocated Pointers | updClub | Byte |  | updClub |  |  |  |  |  |
| 12103 | Table Settings | Allocated Pointers | updComp | Byte |  | updComp |  |  |  |  |  |
| 20067 | Table Settings | Allocated Pointers | updContinent | Byte |  | updContinent |  |  |  |  |  |
| 12101 | Table Settings | Allocated Pointers | updNation | Byte |  | updNation |  |  |  |  |  |
| 20065 | Table Settings | Allocated Pointers | updPerson | Byte |  | updPerson |  |  |  |  |  |
| 20068 | Table Settings | Allocated Pointers | updStadium | Byte |  | updStadium |  |  |  |  |  |
| 12100 | Table Settings | Allocated Pointers | updTeam | Byte |  | updTeam |  |  |  |  |  |
| 20085 | Table Settings | Allocated Pointers | db::AGREEMENT | 8 Bytes |  | vtbAgreement |  |  |  |  |  |
| 20071 | Table Settings | Allocated Pointers | db::AWARD | 8 Bytes |  | vtbAward |  |  |  |  |  |
| 20072 | Table Settings | Allocated Pointers | db::CITY | 8 Bytes |  | vtbCity |  |  |  |  |  |
| 20073 | Table Settings | Allocated Pointers | db::CLUB | 8 Bytes |  | vtbClub |  |  |  |  |  |
| 20074 | Table Settings | Allocated Pointers | db::COMP | 8 Bytes |  | vtbCompetition |  |  |  |  |  |
| 20075 | Table Settings | Allocated Pointers | db::CONTINENT | 8 Bytes |  | vtbContinent |  |  |  |  |  |
| 20080 | Table Settings | Allocated Pointers | db::NATION | 8 Bytes |  | vtbNation |  |  |  |  |  |
| 20090 | Table Settings | Allocated Pointers | db::NATIONAL_TEAM | 8 Bytes |  | vtbNationalTeam |  |  |  |  |  |
| 24054 | Table Settings | Allocated Pointers | db::NATIONAL_TEAM_CONTAINER | 8 Bytes |  | vtbNationalTeaCont |  |  |  |  |  |
| 20087 | Table Settings | Allocated Pointers | db::ACTUAL_NON_PLAYER | 8 Bytes |  | vtbNonPlayer |  |  |  |  |  |
| 20084 | Table Settings | Allocated Pointers | db::ACTUAL_PERSON | 8 Bytes |  | vtbPlayer |  |  |  |  |  |
| 20089 | Table Settings | Allocated Pointers | db::ACTUAL_PLAYER_AND_NON_PLAYER | 8 Bytes |  | vtbPlayerStaff |  |  |  |  |  |
| 20091 | Table Settings | Allocated Pointers | db::REGION | 8 Bytes |  | vtbRegion |  |  |  |  |  |
| 20086 | Table Settings | Allocated Pointers | db::STADIUM | 8 Bytes |  | vtbStadium |  |  |  |  |  |
| 20088 | Table Settings | Allocated Pointers | db::TEAM | 8 Bytes |  | vtbTeam |  |  |  |  |  |
| 20077 | Table Settings | Allocated Pointers | db::HUMAN_NON_PLAYER | 8 Bytes |  | vtbHumanNonPlayer |  |  |  |  |  |
| 20079 | Table Settings | Allocated Pointers | db::RETIRED_PERSON_NAME_POINTERS | 8 Bytes |  | vtbRetiredPerson |  |  |  |  |  |
| 20081 | Table Settings | Allocated Pointers | db::VIRTUAL_PLAYER | 8 Bytes |  | vtbPlaceholderPerson |  |  |  |  |  |
| 20078 | Table Settings | Allocated Pointers | sicomps::LEAGUE_STAGE | 8 Bytes |  | vtbLeagueStage |  |  |  |  |  |
| 11636 | Table Settings | Useful Static Addresses | Current time (15 minute intervals after 6 AM) | Binary |  | datTimeRoot+1 |  | 1 | 7 |  |  |
| 11611 | Table Settings | Useful Static Addresses | Current Day | Custom | Mask 0x1FF | datTimeRoot |  |  |  |  |  |
| 11612 | Table Settings | Useful Static Addresses | Current Year | 2 Bytes |  | datTimeRoot+2 |  |  |  |  |  |
| 11328 | Table Settings | Useful Static Addresses | ptrPerson vtable offset 0 | 4 Bytes |  | ptrPerson | 0 -> -8 -> 0 |  |  |  |  |
| 11329 | Table Settings | Useful Static Addresses | ptrPerson vtable offset 1 | 4 Bytes |  | ptrPerson | 4 -> -8 -> 0 |  |  |  |  |
| 11330 | Table Settings | Useful Static Addresses | ptrPerson vtable offset 2 | 4 Bytes |  | ptrPerson | 8 -> -8 -> 0 |  |  |  |  |
| 20579 | Table Settings | Useful Static Addresses | ptrPlayer vtable offset | 4 Bytes |  | ptrPlayer | 4 -> 8 |  |  |  |  |
| 20580 | Table Settings | Useful Static Addresses | ptrStaff vtable offset | 4 Bytes |  | ptrStaff | 4 -> 8 |  |  |  |  |
| 20581 | Table Settings | Useful Static Addresses | ptrHumanStaff vtable offset | 4 Bytes |  | ptrHumanStaff | 4 -> 8 |  |  |  |  |
| 23666 | Table Settings | Useful Static Addresses | File Version (GamePass) | String |  | fm.exe+4A0F28E |  |  |  | 6 | 0 |
| 23667 | Table Settings | Useful Static Addresses | File Version (Steam) | String |  | fm.exe+4A05111 |  |  |  | 6 | 0 |

## Script Records

| id | object | group | description | kind | path |
| --- | --- | --- | --- | --- | --- |
| 0 | (root) |  | Run Table | Lua, focus/select, symbol |  |
| 17652 | Award |  | Award > | Lua, write | Award > |
| 22767 | Award | Presets | Change Competition | Lua | Award > > Presets > > Change Competition |
| 22766 | Award | Presets | Change Continent | Lua | Award > > Presets > > Change Continent |
| 22765 | Award | Presets | Change Nation | Lua | Award > > Presets > > Change Nation |
| 19666 | City |  | City > | Lua, write | City > |
| 1000 | Club |  | Club > | Lua, write | Club > |
| 18989 | Club | Presets | Maximise Existing Tactical Familiarity | Lua | Club > > Presets > > Maximise Existing Tactical Familiarity |
| 18981 | Club | Presets | Maximise Existing Training Happiness | Lua | Club > > Presets > > Maximise Existing Training Happiness |
| 18052 | Club | Presets | Improve Team Cohesion | Lua | Club > > Presets > > Improve Team Cohesion |
| 23747 | Club | Presets | Improve Team Condition | Lua | Club > > Presets > > Improve Team Condition |
| 17835 | Club | Presets | Destroy Team | Lua | Club > > Presets > > Destroy Team |
| 23650 | Club | Presets | Remove All Bans | Lua | Club > > Presets > > Remove All Bans |
| 17772 | Club | Presets | Remove All Injuries | Lua | Club > > Presets > > Remove All Injuries |
| 18916 | Club | Presets | Remove All Unhappiness | Lua | Club > > Presets > > Remove All Unhappiness |
| 20572 | Club | Presets | Register All Players for X Competition | Lua | Club > > Presets > > Register All Players for X Competition |
| 20573 | Club | Presets | Register All Players for Domestic Division | Lua | Club > > Presets > > Register All Players for Domestic Division |
| 20208 | Club | Presets | Register All Players for UEFA | Lua | Club > > Presets > > Register All Players for UEFA |
| 17981 | Club | Presets | Match Player CA / PA | Lua | Club > > Presets > > Match Player CA / PA |
| 20207 | Club | Presets | Randomize Professionalism (Restore Hacked Professionalism) | Lua | Club > > Presets > > Randomize Professionalism (Restore Hacked Professionalism) |
| 18993 | Club | Presets | Cancel Team Transfer | Lua | Club > > Presets > > Cancel Team Transfer |
| 23820 | Club | Presets | Complete Ongoing Board Requests | Lua | Club > > Presets > > Complete Ongoing Board Requests |
| 18990 | Club | Presets | Boost Bank Balance | Lua | Club > > Presets > > Boost Bank Balance |
| 20203 | Club | Presets | Boost Bank Balance by 50% | Lua | Club > > Presets > > Boost Bank Balance by 50% |
| 12859 | Club | Presets | Boost Bank Balance by 75% | Lua | Club > > Presets > > Boost Bank Balance by 75% |
| 12789 | Club | Presets | Clear Financial Expenditures | Lua | Club > > Presets > > Clear Financial Expenditures |
| 23746 | Club | Presets | Remove Debts & Loans | Lua | Club > > Presets > > Remove Debts & Loans |
| 12858 | Club | Presets | Average Attendance X% of Stadium Capacity | Lua | Club > > Presets > > Average Attendance X% of Stadium Capacity |
| 19967 | Club | Presets | Average Attendance 50% of Stadium Capacity | Lua | Club > > Presets > > Average Attendance 50% of Stadium Capacity |
| 19968 | Club | Presets | Average Attendance 75% of Stadium Capacity | Lua | Club > > Presets > > Average Attendance 75% of Stadium Capacity |
| 23821 | Club | Presets | Change Stadium | Lua | Club > > Presets > > Change Stadium |
| 23822 | Club | Presets | Change Training Ground | Lua | Club > > Presets > > Change Training Ground |
| 18019 | Club | Presets | Make This Club As Stadium Owner | Lua | Club > > Presets > > Make This Club As Stadium Owner |
| 24078 | Club | Presets | Maximize All Staff Scouting Knowledge Level | Lua | Club > > Presets > > Maximize All Staff Scouting Knowledge Level |
| 18910 | Club | Presets | Adjust All Players Salary to Nation's Weekly Wage Values by CA | Lua | Club > > Presets > > Player Contract > > Adjust All Players Salary to Nation's Weekly Wage Values by CA |
| 18911 | Club | Presets | Adjust All Players Salary to Nation's Weekly Wage Values by Reputation | Lua | Club > > Presets > > Player Contract > > Adjust All Players Salary to Nation's Weekly Wage Values by Reputation |
| 18904 | Club | Presets | Cut All Players Salary by X% | Lua | Club > > Presets > > Player Contract > > Cut All Players Salary by X% |
| 18900 | Club | Presets | Cut All Players Salary by 50% | Lua | Club > > Presets > > Player Contract > > Cut All Players Salary by 50% |
| 18903 | Club | Presets | Cut All Players Salary by 75% | Lua | Club > > Presets > > Player Contract > > Cut All Players Salary by 75% |
| 23900 | Club | Presets | Remove Bonus or Clause | Lua | Club > > Presets > > Player Contract > > Remove Bonus or Clause |
| 23901 | Club | Presets | Remove All Release Clauses | Lua | Club > > Presets > > Player Contract > > Remove All Release Clauses |
| 23902 | Club | Presets | Remove Exploring Options Clause | Lua | Club > > Presets > > Player Contract > > Remove Exploring Options Clause |
| 23903 | Club | Presets | Remove Match Highest Earner Clause | Lua | Club > > Presets > > Player Contract > > Remove Match Highest Earner Clause |
| 18070 | Club | Presets | Extend All Players Contract Length by X Years | Lua | Club > > Presets > > Player Contract > > Extend All Players Contract Length by X Years |
| 18068 | Club | Presets | Extend All Players Contract Length by 5 Years | Lua | Club > > Presets > > Player Contract > > Extend All Players Contract Length by 5 Years |
| 18069 | Club | Presets | Extend All Players Contract Length by 50 Years | Lua | Club > > Presets > > Player Contract > > Extend All Players Contract Length by 50 Years |
| 20204 | Club | Presets | Lifetime Contract All Players | Lua | Club > > Presets > > Player Contract > > Lifetime Contract All Players |
| 18912 | Club | Presets | Adjust All Staff Salary to Nation's Weekly Wage Values by CA | Lua | Club > > Presets > > Staff Contract > > Adjust All Staff Salary to Nation's Weekly Wage Values by CA |
| 18913 | Club | Presets | Adjust All Staff Salary to Nation's Weekly Wage Values by Reputation | Lua | Club > > Presets > > Staff Contract > > Adjust All Staff Salary to Nation's Weekly Wage Values by Reputation |
| 18905 | Club | Presets | Cut All Staff Salary by X% | Lua | Club > > Presets > > Staff Contract > > Cut All Staff Salary by X% |
| 18902 | Club | Presets | Cut All Staff Salary by 50% | Lua | Club > > Presets > > Staff Contract > > Cut All Staff Salary by 50% |
| 18901 | Club | Presets | Cut All Staff Salary by 75% | Lua | Club > > Presets > > Staff Contract > > Cut All Staff Salary by 75% |
| 18071 | Club | Presets | Extend All Staff Contract Length by X Years | Lua | Club > > Presets > > Staff Contract > > Extend All Staff Contract Length by X Years |
| 18066 | Club | Presets | Extend All Staff Contract Length by 5 Years | Lua | Club > > Presets > > Staff Contract > > Extend All Staff Contract Length by 5 Years |
| 18067 | Club | Presets | Extend All Staff Contract Length by 50 Years | Lua | Club > > Presets > > Staff Contract > > Extend All Staff Contract Length by 50 Years |
| 20205 | Club | Presets | Lifetime Contract All Staff | Lua | Club > > Presets > > Staff Contract > > Lifetime Contract All Staff |
| 19857 | Club | Presets | Add to Freezer | Lua, freeze | Club > > Presets > > Add to Freezer |
| 13016 | Club | Presets | Open in Dissect Data | Lua | Club > > Presets > > Open in Dissect Data |
| 12910 | Club | Finances | Sponsors > | Lua | Club > > Finances > > Sponsors > |
| 22846 | Club | Finances | Add Club Sponsor | Lua | Club > > Finances > > Sponsors > > Add Club Sponsor |
| 23744 | Club | Finances | Debts & Loans > | Lua | Club > > Finances > > Debts & Loans > |
| 23773 | Club | Club Culture -> | Board Requests > | Lua | Club > > Club Culture -> > Board Requests > |
| 24003 | Club | Club Culture -> | Objectives > | Lua | Club > > Club Culture -> > Objectives > |
| 24000 | Club | Club Culture -> | Relationships > | Lua | Club > > Club Culture -> > Relationships > |
| 23815 | Club | Club Culture -> | Training Camp > | Lua | Club > > Club Culture -> > Training Camp > |
| 13042 | Club | Staff | Board Members > | Lua | Club > > Staff > > Board Members > |
| 1011 | Club | Staff | Medical Team > | Lua | Club > > Staff > > Medical Team > |
| 1012 | Club | Staff | Coaching Team > | Lua | Club > > Staff > > Coaching Team > |
| 1013 | Club | Staff | Recruitment Team > | Lua | Club > > Staff > > Recruitment Team > |
| 1010 | Club | Teams | Teams > | Lua | Club > > Teams > |
| 12885 | Club | Affiliations | Affiliations > | Lua | Club > > Affiliations > |
| 23130 | Club | Affiliations | Add Club Affiliation | Lua, symbol | Club > > Affiliations > > Add Club Affiliation |
| 13041 | Club | Responsibilities | Responsibilities > | Lua | Club > > Responsibilities > |
| 4000 | Competition |  | Competition > | Lua, write | Competition > |
| 13027 | Competition | Presets | Open in Dissect Data | Lua | Competition > > Presets > > Open in Dissect Data |
| 18064 | Competition | League Table | League Table > | Lua | Competition > > League Table > |
| 12681 | Competition | Prize Money | Prize Money > | Lua | Competition > > Prize Money > |
| 19860 | Continent |  | Continent > | Lua, write | Continent > |
| 20698 | Continent | Fixture Rules | Fixture Rules > | Lua | Continent > > Fixture Rules > |
| 20641 | Derby |  | Derby > | Lua, write | Derby > |
| 20646 | Derby | Presets | Change Name | Lua | Derby > > Presets > > Change Name |
| 20650 | Derby | Presets | Change Team 1 | Lua | Derby > > Presets > > Change Team 1 |
| 20649 | Derby | Presets | Change Team 2 | Lua | Derby > > Presets > > Change Team 2 |
| 20652 | Derby | Presets | Change First Match Competition | Lua | Derby > > Presets > > Change First Match Competition |
| 20651 | Derby | Presets | Change First Match Stadium | Lua | Derby > > Presets > > Change First Match Stadium |
| 20648 | Derby | Presets | Open in Dissect Data | Lua | Derby > > Presets > > Open in Dissect Data |
| 3000 | Nation |  | Nation > | Lua, write | Nation > |
| 23651 | Nation | Presets | Maximise Existing Tactical Familiarity | Lua | Nation > > Presets > > Maximise Existing Tactical Familiarity |
| 23652 | Nation | Presets | Improve Team Cohesion | Lua | Nation > > Presets > > Improve Team Cohesion |
| 23645 | Nation | Presets | Destroy Team | Lua | Nation > > Presets > > Destroy Team |
| 23653 | Nation | Presets | Remove All Bans | Lua | Nation > > Presets > > Remove All Bans |
| 23646 | Nation | Presets | Remove All Injuries | Lua | Nation > > Presets > > Remove All Injuries |
| 23647 | Nation | Presets | Remove All Unhappiness | Lua | Nation > > Presets > > Remove All Unhappiness |
| 22731 | Nation | Presets | Add EU Rules | Lua | Nation > > Presets > > Add EU Rules |
| 22730 | Nation | Presets | Add Foreign Rules | Lua | Nation > > Presets > > Add Foreign Rules |
| 23665 | Nation | Presets | Add to Freezer | Lua, freeze | Nation > > Presets > > Add to Freezer |
| 13026 | Nation | Presets | Open in Dissect Data | Lua | Nation > > Presets > > Open in Dissect Data |
| 13017 | Nation | Staff | Medical Staff > | Lua | Nation > > Staff > > Medical Staff > |
| 3007 | Nation | Staff | Coaching Staff > | Lua | Nation > > Staff > > Coaching Staff > |
| 3006 | Nation | Teams | Teams > | Lua | Nation > > Teams > |
| 24267 | Nation | Relationships | Rival Nations > | Lua | Nation > > Relationships > > Rival Nations > |
| 18095 | Nation | Relationships | Nations Treated as EU > | Lua | Nation > > Relationships > > Nations Treated as EU > |
| 13044 | Nation | Relationships | Nations Treated as Non-Foreign > | Lua | Nation > > Relationships > > Nations Treated as Non-Foreign > |
| 24268 | Nation | Relationships | Languages > | Lua | Nation > > Relationships > > Languages > |
| 13043 | Nation | Responsibilities | Responsibilities > | Lua | Nation > > Responsibilities > |
| 2000 | Person |  | Person > | Lua, write | Person > |
| 17833 | Person | Presets | Change Nationality | Lua | Person > > Presets > > General > > Change Nationality |
| 20571 | Person | Presets | Add Other Nationality | Lua | Person > > Presets > > General > > Add Other Nationality |
| 23765 | Person | Presets | Change Birth Place | Lua | Person > > Presets > > General > > Change Birth Place |
| 12675 | Person | Presets | Change Birth Date | Lua | Person > > Presets > > General > > Change Birth Date |
| 17990 | Person | Presets | Generate Random Personality | Lua | Person > > Presets > > General > > Generate Random Personality |
| 12553 | Person | Presets | Match CA / PA | Lua | Person > > Presets > > General > > Match CA / PA |
| 12674 | Person | Presets | Extend Contract Length by X Years | Lua | Person > > Presets > > General > > Extend Contract Length by X Years |
| 12585 | Person | Presets | Extend Contract Length by 5 Years | Lua | Person > > Presets > > General > > Extend Contract Length by 5 Years |
| 12555 | Person | Presets | Extend Contract Length by 50 Years | Lua | Person > > Presets > > General > > Extend Contract Length by 50 Years |
| 17988 | Person | Presets | Adjust Salary to Nation's Weekly Wage Values by CA | Lua | Person > > Presets > > General > > Adjust Salary to Nation's Weekly Wage Values by CA |
| 18909 | Person | Presets | Adjust Salary to Nation's Weekly Wage Values by Reputation | Lua | Person > > Presets > > General > > Adjust Salary to Nation's Weekly Wage Values by Reputation |
| 18906 | Person | Presets | Cut Salary by X% | Lua | Person > > Presets > > General > > Cut Salary by X% |
| 18907 | Person | Presets | Cut Salary by 50% | Lua | Person > > Presets > > General > > Cut Salary by 50% |
| 18908 | Person | Presets | Cut Salary by 75% | Lua | Person > > Presets > > General > > Cut Salary by 75% |
| 23899 | Person | Presets | Remove Bonus or Clause | Lua | Person > > Presets > > General > > Remove Bonus or Clause |
| 23848 | Person | Presets | Remove All Release Clauses | Lua | Person > > Presets > > General > > Remove All Release Clauses |
| 23865 | Person | Presets | Remove Exploring Options Clause | Lua | Person > > Presets > > General > > Remove Exploring Options Clause |
| 23898 | Person | Presets | Remove Match Highest Earner Clause | Lua | Person > > Presets > > General > > Remove Match Highest Earner Clause |
| 12551 | Person | Presets | Set Contract Start Date to Current Date | Lua | Person > > Presets > > General > > Set Contract Start Date to Current Date |
| 12628 | Person | Presets | Set Contract to Expired | Lua | Person > > Presets > > General > > Set Contract to Expired |
| 20191 | Person | Presets | Lifetime Contract | Lua | Person > > Presets > > General > > Lifetime Contract |
| 18098 | Person | Presets | Terminate Contract | Lua | Person > > Presets > > General > > Terminate Contract |
| 18099 | Person | Presets | Terminate Loan | Lua | Person > > Presets > > General > > Terminate Loan |
| 17771 | Person | Presets | Cancel All Transfer Offers | Lua | Person > > Presets > > General > > Cancel All Transfer Offers |
| 13015 | Person | Presets | Open in Dissect Data | Lua | Person > > Presets > > General > > Open in Dissect Data |
| 23649 | Person | Presets | Remove All Bans | Lua | Person > > Presets > > Player > > Remove All Bans |
| 13045 | Person | Presets | Remove All Injuries | Lua | Person > > Presets > > Player > > Remove All Injuries |
| 17810 | Person | Presets | Remove All Unhappiness | Lua | Person > > Presets > > Player > > Remove All Unhappiness |
| 11399 | Person | Presets | Maximise Existing Training Happiness | Lua | Person > > Presets > > Player > > Maximise Existing Training Happiness |
| 17989 | Person | Presets | Improve Hidden Attributes | Lua | Person > > Presets > > Player > > Improve Hidden Attributes |
| 20110 | Person | Presets | Register Player for X Competition | Lua | Person > > Presets > > Player > > Register Player for X Competition |
| 20209 | Person | Presets | Register Player for Domestic Division | Lua | Person > > Presets > > Player > > Register Player for Domestic Division |
| 20175 | Person | Presets | Register Player for UEFA | Lua | Person > > Presets > > Player > > Register Player for UEFA |
| 23920 | Person | Presets | Remove All Traits | Lua | Person > > Presets > > Player > > Remove All Traits |
| 24384 | Person | Presets | Improve Agent - Club Manager Relationship | Lua | Person > > Presets > > Player > > Improve Agent - Club Manager Relationship |
| 24385 | Person | Presets | Improve Agent - Human Manager Relationship | Lua | Person > > Presets > > Player > > Improve Agent - Human Manager Relationship |
| 13048 | Person | Presets | Role Scores | Lua | Person > > Presets > > Player > > Role Scores |
| 19107 | Person | Presets | Amadeo Carrizo (24 years old) - ARG - 162/182 | Lua | Person > > Presets > > Player > > Legend Players > > Goalkeepers (GK) > > Amadeo Carrizo (24 years old) - ARG - 162/182 |
| 19119 | Person | Presets | Andreas Köpke (20 years old) - GER - 131/176 | Lua | Person > > Presets > > Player > > Legend Players > > Goalkeepers (GK) > > Andreas Köpke (20 years old) - GER - 131/176 |
| 23831 | Person | Presets | Dida (21 years old) - BRA - 161/186 | Lua | Person > > Presets > > Player > > Legend Players > > Goalkeepers (GK) > > Dida (21 years old) - BRA - 161/186 |
| 19101 | Person | Presets | Dino Zoff (22 years old) - ITA - 157/192 | Lua | Person > > Presets > > Player > > Legend Players > > Goalkeepers (GK) > > Dino Zoff (22 years old) - ITA - 157/192 |
| 19094 | Person | Presets | Edwin van der Sar (19 years old) - NED - 132/182 | Lua | Person > > Presets > > Player > > Legend Players > > Goalkeepers (GK) > > Edwin van der Sar (19 years old) - NED - 132/182 |
| 19104 | Person | Presets | Frantisek Planicka (26 years old) - CZE - 179/184 | Lua | Person > > Presets > > Player > > Legend Players > > Goalkeepers (GK) > > Frantisek Planicka (26 years old) - CZE - 179/184 |
| 19102 | Person | Presets | Gianluigi Buffon (19 years old) - ITA - 147/192 | Lua | Person > > Presets > > Player > > Legend Players > > Goalkeepers (GK) > > Gianluigi Buffon (19 years old) - ITA - 147/192 |
| 19100 | Person | Presets | Gordon Banks (23 years old) - ENG - 165/190 | Lua | Person > > Presets > > Player > > Legend Players > > Goalkeepers (GK) > > Gordon Banks (23 years old) - ENG - 165/190 |
| 19115 | Person | Presets | Gyula Grosics (24 years old) - HUN - 158/178 | Lua | Person > > Presets > > Player > > Legend Players > > Goalkeepers (GK) > > Gyula Grosics (24 years old) - HUN - 158/178 |
| 19108 | Person | Presets | Harald Schumacher (21 years old) - GER - 154/184 | Lua | Person > > Presets > > Player > > Legend Players > > Goalkeepers (GK) > > Harald Schumacher (21 years old) - GER - 154/184 |
| 19095 | Person | Presets | Iker Casillas (18 years old) - ESP - 139/184 | Lua | Person > > Presets > > Player > > Legend Players > > Goalkeepers (GK) > > Iker Casillas (18 years old) - ESP - 139/184 |
| 19114 | Person | Presets | Jan Oblak (17 years old) - SVN - 123/178 | Lua | Person > > Presets > > Player > > Legend Players > > Goalkeepers (GK) > > Jan Oblak (17 years old) - SVN - 123/178 |
| 19243 | Person | Presets | Jan Tomaszewski (22 years old) - POL - 140/170 | Lua | Person > > Presets > > Player > > Legend Players > > Goalkeepers (GK) > > Jan Tomaszewski (22 years old) - POL - 140/170 |
| 19109 | Person | Presets | Jean-Marie Pfaff (21 years old) - BEL - 144/184 | Lua | Person > > Presets > > Player > > Legend Players > > Goalkeepers (GK) > > Jean-Marie Pfaff (21 years old) - BEL - 144/184 |
| 19246 | Person | Presets | Jens Lehmann (20 years old) - GER - 123/168 | Lua | Person > > Presets > > Player > > Legend Players > > Goalkeepers (GK) > > Jens Lehmann (20 years old) - GER - 123/168 |
| 19236 | Person | Presets | José Luis Chilavert (20 years old) - PAR - 135/180 | Lua | Person > > Presets > > Player > > Legend Players > > Goalkeepers (GK) > > José Luis Chilavert (20 years old) - PAR - 135/180 |
| 19242 | Person | Presets | Józef Młynarczyk (21 years old) - POL - 135/170 | Lua | Person > > Presets > > Player > > Legend Players > > Goalkeepers (GK) > > Józef Młynarczyk (21 years old) - POL - 135/170 |
| 19118 | Person | Presets | Júlio César (19 years old) - BRA - 129/174 | Lua | Person > > Presets > > Player > > Legend Players > > Goalkeepers (GK) > > Júlio César (19 years old) - BRA - 129/174 |
| 19105 | Person | Presets | Ladislao Mazurkiewicz (22 years old) - URU - 159/184 | Lua | Person > > Presets > > Player > > Legend Players > > Goalkeepers (GK) > > Ladislao Mazurkiewicz (22 years old) - URU - 159/184 |
| 19090 | Person | Presets | Lev Yashin (24 years old) - RUS - 169/194 | Lua | Person > > Presets > > Player > > Legend Players > > Goalkeepers (GK) > > Lev Yashin (24 years old) - RUS - 169/194 |
| 19097 | Person | Presets | Manuel Neuer (18 years old) - GER - 142/193 | Lua | Person > > Presets > > Player > > Legend Players > > Goalkeepers (GK) > > Manuel Neuer (18 years old) - GER - 142/193 |
| 19239 | Person | Presets | Marc-André ter Stegen (17 years old) - GER - 119/174 | Lua | Person > > Presets > > Player > > Legend Players > > Goalkeepers (GK) > > Marc-André ter Stegen (17 years old) - GER - 119/174 |
| 19244 | Person | Presets | Milutin Šoškić (23 years old) - KVX - 145/170 | Lua | Person > > Presets > > Player > > Legend Players > > Goalkeepers (GK) > > Milutin Šoškić (23 years old) - KVX - 145/170 |
| 19116 | Person | Presets | Neville Southall (21 years old) - WAL - 141/176 | Lua | Person > > Presets > > Player > > Legend Players > > Goalkeepers (GK) > > Neville Southall (21 years old) - WAL - 141/176 |
| 19092 | Person | Presets | Oliver Kahn (20 years old) - GER - 155/190 | Lua | Person > > Presets > > Player > > Legend Players > > Goalkeepers (GK) > > Oliver Kahn (20 years old) - GER - 155/190 |
| 19110 | Person | Presets | Pat Jennings (22 years old) - NIR - 152/182 | Lua | Person > > Presets > > Player > > Legend Players > > Goalkeepers (GK) > > Pat Jennings (22 years old) - NIR - 152/182 |
| 19103 | Person | Presets | Peter Schmeichel (20 years old) - DEN - 147/192 | Lua | Person > > Presets > > Player > > Legend Players > > Goalkeepers (GK) > > Peter Schmeichel (20 years old) - DEN - 147/192 |
| 19106 | Person | Presets | Peter Shilton (22 years old) - ENG - 161/186 | Lua | Person > > Presets > > Player > > Legend Players > > Goalkeepers (GK) > > Peter Shilton (22 years old) - ENG - 161/186 |
| 19113 | Person | Presets | Petr Cech (18 years old) - CZE - 130/180 | Lua | Person > > Presets > > Player > > Legend Players > > Goalkeepers (GK) > > Petr Cech (18 years old) - CZE - 130/180 |
| 19099 | Person | Presets | Ricardo Zamora (26 years old) - ESP - 175/190 | Lua | Person > > Presets > > Player > > Legend Players > > Goalkeepers (GK) > > Ricardo Zamora (26 years old) - ESP - 175/190 |
| 19235 | Person | Presets | Rinat Dasaev (21 years old) - RUS - 147/182 | Lua | Person > > Presets > > Player > > Legend Players > > Goalkeepers (GK) > > Rinat Dasaev (21 years old) - RUS - 147/182 |
| 19237 | Person | Presets | Ronnie Hellström (22 years old) - SWE - 155/180 | Lua | Person > > Presets > > Player > > Legend Players > > Goalkeepers (GK) > > Ronnie Hellström (22 years old) - SWE - 155/180 |
| 19096 | Person | Presets | Rudolf Hiden (26 years old) - FRA - 173/178 | Lua | Person > > Presets > > Player > > Legend Players > > Goalkeepers (GK) > > Rudolf Hiden (26 years old) - FRA - 173/178 |
| 19245 | Person | Presets | Rüştü Reçber (19 years old) - TUR - 125/170 | Lua | Person > > Presets > > Player > > Legend Players > > Goalkeepers (GK) > > Rüştü Reçber (19 years old) - TUR - 125/170 |
| 19093 | Person | Presets | Sepp Maier (22 years old) - GER - 154/184 | Lua | Person > > Presets > > Player > > Legend Players > > Goalkeepers (GK) > > Sepp Maier (22 years old) - GER - 154/184 |
| 19120 | Person | Presets | Taffarel (20 years old) - BRA - 134/174 | Lua | Person > > Presets > > Player > > Legend Players > > Goalkeepers (GK) > > Taffarel (20 years old) - BRA - 134/174 |
| 19240 | Person | Presets | Thibaut Courtois (17 years old) - BEL - 117/172 | Lua | Person > > Presets > > Player > > Legend Players > > Goalkeepers (GK) > > Thibaut Courtois (17 years old) - BEL - 117/172 |
| 19238 | Person | Presets | Thomas Ravelli (21 years old) - SWE - 150/180 | Lua | Person > > Presets > > Player > > Legend Players > > Goalkeepers (GK) > > Thomas Ravelli (21 years old) - SWE - 150/180 |
| 19234 | Person | Presets | Ubaldo Fillol (21 years old) - ARG - 152/182 | Lua | Person > > Presets > > Player > > Legend Players > > Goalkeepers (GK) > > Ubaldo Fillol (21 years old) - ARG - 152/182 |
| 19241 | Person | Presets | Uli Stein (21 years old) - GER - 137/172 | Lua | Person > > Presets > > Player > > Legend Players > > Goalkeepers (GK) > > Uli Stein (21 years old) - GER - 137/172 |
| 19117 | Person | Presets | Viliam Schrojf (23 years old) - SVK - 151/176 | Lua | Person > > Presets > > Player > > Legend Players > > Goalkeepers (GK) > > Viliam Schrojf (23 years old) - SVK - 151/176 |
| 19111 | Person | Presets | Vladimir Beara (24 years old) - CRO - 162/182 | Lua | Person > > Presets > > Player > > Legend Players > > Goalkeepers (GK) > > Vladimir Beara (24 years old) - CRO - 162/182 |
| 19112 | Person | Presets | Walter Zenga (20 years old) - ITA - 142/182 | Lua | Person > > Presets > > Player > > Legend Players > > Goalkeepers (GK) > > Walter Zenga (20 years old) - ITA - 142/182 |
| 19255 | Person | Presets | Alan Hansen (21 years old) - SCO - 138/178 | Lua | Person > > Presets > > Player > > Legend Players > > Central Defenders (DC) > > Alan Hansen (21 years old) - SCO - 138/178 |
| 19135 | Person | Presets | Alessandro Nesta (19 years old) - ITA - 146/186 | Lua | Person > > Presets > > Player > > Legend Players > > Central Defenders (DC) > > Alessandro Nesta (19 years old) - ITA - 146/186 |
| 19256 | Person | Presets | Billy Wright (24 years old) - ENG - 163/178 | Lua | Person > > Presets > > Player > > Legend Players > > Central Defenders (DC) > > Billy Wright (24 years old) - ENG - 163/178 |
| 19127 | Person | Presets | Bobby Moore (22 years old) - ENG - 158/188 | Lua | Person > > Presets > > Player > > Legend Players > > Central Defenders (DC) > > Bobby Moore (22 years old) - ENG - 158/188 |
| 19151 | Person | Presets | Carles Puyol (19 years old) - ESP - 135/180 | Lua | Person > > Presets > > Player > > Legend Players > > Central Defenders (DC) > > Carles Puyol (19 years old) - ESP - 135/180 |
| 19258 | Person | Presets | Ciro Ferrara (20 years old) - ITA - 138/178 | Lua | Person > > Presets > > Player > > Legend Players > > Central Defenders (DC) > > Ciro Ferrara (20 years old) - ITA - 138/178 |
| 19137 | Person | Presets | Claudio Gentile (21 years old) - ITA - 147/182 | Lua | Person > > Presets > > Player > > Legend Players > > Central Defenders (DC) > > Claudio Gentile (21 years old) - ITA - 147/182 |
| 19134 | Person | Presets | Daniel Passarella (21 years old) - ARG - 151/186 | Lua | Person > > Presets > > Player > > Legend Players > > Central Defenders (DC) > > Daniel Passarella (21 years old) - ARG - 151/186 |
| 19271 | Person | Presets | Diego Godín (18 years old) - URU - 124/174 | Lua | Person > > Presets > > Player > > Legend Players > > Central Defenders (DC) > > Diego Godín (18 years old) - URU - 124/174 |
| 19279 | Person | Presets | Dimitar Penev (22 years old) - BUL - 138/168 | Lua | Person > > Presets > > Player > > Legend Players > > Central Defenders (DC) > > Dimitar Penev (22 years old) - BUL - 138/168 |
| 19254 | Person | Presets | Domingos da Guia (25 years old) - BRA - 163/178 | Lua | Person > > Presets > > Player > > Legend Players > > Central Defenders (DC) > > Domingos da Guia (25 years old) - BRA - 163/178 |
| 19125 | Person | Presets | Elías Figueroa (22 years old) - CHI - 163/188 | Lua | Person > > Presets > > Player > > Legend Players > > Central Defenders (DC) > > Elías Figueroa (22 years old) - CHI - 163/188 |
| 19139 | Person | Presets | Fabio Cannavaro (19 years old) - ITA - 134/184 | Lua | Person > > Presets > > Player > > Legend Players > > Central Defenders (DC) > > Fabio Cannavaro (19 years old) - ITA - 134/184 |
| 19128 | Person | Presets | Franco Baresi (20 years old) - ITA - 152/192 | Lua | Person > > Presets > > Player > > Legend Players > > Central Defenders (DC) > > Franco Baresi (20 years old) - ITA - 152/192 |
| 19273 | Person | Presets | Frank de Boer (19 years old) - NED - 132/172 | Lua | Person > > Presets > > Player > > Legend Players > > Central Defenders (DC) > > Frank de Boer (19 years old) - NED - 132/172 |
| 19122 | Person | Presets | Franz Beckenbauer (22 years old) - GER - 171/196 | Lua | Person > > Presets > > Player > > Legend Players > > Central Defenders (DC) > > Franz Beckenbauer (22 years old) - GER - 171/196 |
| 19126 | Person | Presets | Gaetano Scirea (21 years old) - ITA - 153/188 | Lua | Person > > Presets > > Player > > Legend Players > > Central Defenders (DC) > > Gaetano Scirea (21 years old) - ITA - 153/188 |
| 19270 | Person | Presets | Gerard Piqué (18 years old) - ESP - 124/174 | Lua | Person > > Presets > > Player > > Legend Players > > Central Defenders (DC) > > Gerard Piqué (18 years old) - ESP - 124/174 |
| 19264 | Person | Presets | Gică Popescu (20 years old) - ROU - 133/178 | Lua | Person > > Presets > > Player > > Legend Players > > Central Defenders (DC) > > Gică Popescu (20 years old) - ROU - 133/178 |
| 19269 | Person | Presets | Giorgio Chiellini (18 years old) - ITA - 124/174 | Lua | Person > > Presets > > Player > > Legend Players > > Central Defenders (DC) > > Giorgio Chiellini (18 years old) - ITA - 124/174 |
| 19143 | Person | Presets | Giuseppe Bergomi (20 years old) - ITA - 142/182 | Lua | Person > > Presets > > Player > > Legend Players > > Central Defenders (DC) > > Giuseppe Bergomi (20 years old) - ITA - 142/182 |
| 19132 | Person | Presets | Héctor Chumpitaz (22 years old) - PER - 154/184 | Lua | Person > > Presets > > Player > > Legend Players > > Central Defenders (DC) > > Héctor Chumpitaz (22 years old) - PER - 154/184 |
| 23837 | Person | Presets | Hong Myung-Bo (21 years old) - KOR - 127/162 | Lua | Person > > Presets > > Player > > Legend Players > > Central Defenders (DC) > > Hong Myung-Bo (21 years old) - KOR - 127/162 |
| 19263 | Person | Presets | Jaap Stam (19 years old) - NED - 133/178 | Lua | Person > > Presets > > Player > > Legend Players > > Central Defenders (DC) > > Jaap Stam (19 years old) - NED - 133/178 |
| 19249 | Person | Presets | Jan Popluhar (23 years old) - SVK - 155/180 | Lua | Person > > Presets > > Player > > Legend Players > > Central Defenders (DC) > > Jan Popluhar (23 years old) - SVK - 155/180 |
| 19262 | Person | Presets | John Terry (18 years old) - ENG - 128/178 | Lua | Person > > Presets > > Player > > Legend Players > > Central Defenders (DC) > > John Terry (18 years old) - ENG - 128/178 |
| 19138 | Person | Presets | José Nasazzi (26 years old) - URU - 172/182 | Lua | Person > > Presets > > Player > > Legend Players > > Central Defenders (DC) > > José Nasazzi (26 years old) - URU - 172/182 |
| 19248 | Person | Presets | José Santamaría (24 years old) - URU - 160/180 | Lua | Person > > Presets > > Player > > Legend Players > > Central Defenders (DC) > > José Santamaría (24 years old) - URU - 160/180 |
| 19278 | Person | Presets | Josip Katalinski (22 years old) - BIH - 138/168 | Lua | Person > > Presets > > Player > > Legend Players > > Central Defenders (DC) > > Josip Katalinski (22 years old) - BIH - 138/168 |
| 19145 | Person | Presets | Jürgen Kohler (20 years old) - GER - 142/182 | Lua | Person > > Presets > > Player > > Legend Players > > Central Defenders (DC) > > Jürgen Kohler (20 years old) - GER - 142/182 |
| 19150 | Person | Presets | Laurent Blanc (20 years old) - FRA - 140/180 | Lua | Person > > Presets > > Player > > Legend Players > > Central Defenders (DC) > > Laurent Blanc (20 years old) - FRA - 140/180 |
| 19275 | Person | Presets | Leonardo Bonucci (18 years old) - ITA - 122/172 | Lua | Person > > Presets > > Player > > Legend Players > > Central Defenders (DC) > > Leonardo Bonucci (18 years old) - ITA - 122/172 |
| 19493 | Person | Presets | Lúcio (19 years old) - BRA - 129/174 | Lua | Person > > Presets > > Player > > Legend Players > > Central Defenders (DC) > > Lúcio (19 years old) - BRA - 129/174 |
| 19152 | Person | Presets | Mats Hummels (18 years old) - GER - 128/178 | Lua | Person > > Presets > > Player > > Legend Players > > Central Defenders (DC) > > Mats Hummels (18 years old) - GER - 128/178 |
| 19123 | Person | Presets | Matthias Sammer (20 years old) - GER - 146/186 | Lua | Person > > Presets > > Player > > Legend Players > > Central Defenders (DC) > > Matthias Sammer (20 years old) - GER - 146/186 |
| 19274 | Person | Presets | Miodrag Belodedici (20 years old) - ROU - 132/172 | Lua | Person > > Presets > > Player > > Legend Players > > Central Defenders (DC) > > Miodrag Belodedici (20 years old) - ROU - 132/172 |
| 19261 | Person | Presets | Morten Olsen (22 years old) - DEN - 153/178 | Lua | Person > > Presets > > Player > > Legend Players > > Central Defenders (DC) > > Morten Olsen (22 years old) - DEN - 153/178 |
| 19259 | Person | Presets | Murtaz Khurtsilava (22 years old) - GEO - 148/178 | Lua | Person > > Presets > > Player > > Legend Players > > Central Defenders (DC) > > Murtaz Khurtsilava (22 years old) - GEO - 148/178 |
| 19142 | Person | Presets | Nemanja Vidić (18 years old) - SRB - 128/178 | Lua | Person > > Presets > > Player > > Legend Players > > Central Defenders (DC) > > Nemanja Vidić (18 years old) - SRB - 128/178 |
| 19253 | Person | Presets | Obdulio Varela (25 years old) - URU - 163/178 | Lua | Person > > Presets > > Player > > Legend Players > > Central Defenders (DC) > > Obdulio Varela (25 years old) - URU - 163/178 |
| 23842 | Person | Presets | Rafael Márquez (20 years old) - MEX - 135/164 | Lua | Person > > Presets > > Player > > Legend Players > > Central Defenders (DC) > > Rafael Márquez (20 years old) - MEX - 135/164 |
| 19272 | Person | Presets | Ricardo Carvalho (19 years old) - POR - 127/172 | Lua | Person > > Presets > > Player > > Legend Players > > Central Defenders (DC) > > Ricardo Carvalho (19 years old) - POR - 127/172 |
| 19260 | Person | Presets | Rio Ferdinand (19 years old) - ENG - 133/178 | Lua | Person > > Presets > > Player > > Legend Players > > Central Defenders (DC) > > Rio Ferdinand (19 years old) - ENG - 133/178 |
| 19267 | Person | Presets | Roberto Ayala (19 years old) - ARG - 129/174 | Lua | Person > > Presets > > Player > > Legend Players > > Central Defenders (DC) > > Roberto Ayala (19 years old) - ARG - 129/174 |
| 19141 | Person | Presets | Ronald Koeman (20 years old) - NED - 142/182 | Lua | Person > > Presets > > Player > > Legend Players > > Central Defenders (DC) > > Ronald Koeman (20 years old) - NED - 142/182 |
| 19277 | Person | Presets | Sami Hyypiä (19 years old) - FIN - 118/168 | Lua | Person > > Presets > > Player > > Legend Players > > Central Defenders (DC) > > Sami Hyypiä (19 years old) - FIN - 118/168 |
| 19252 | Person | Presets | Sergio Ramos (18 years old) - ESP - 128/178 | Lua | Person > > Presets > > Player > > Legend Players > > Central Defenders (DC) > > Sergio Ramos (18 years old) - ESP - 128/178 |
| 19265 | Person | Presets | Sol Campbell (19 years old) - ENG - 131/176 | Lua | Person > > Presets > > Player > > Legend Players > > Central Defenders (DC) > > Sol Campbell (19 years old) - ENG - 131/176 |
| 19153 | Person | Presets | Thiago Silva (18 years old) - BRA - 128/178 | Lua | Person > > Presets > > Player > > Legend Players > > Central Defenders (DC) > > Thiago Silva (18 years old) - BRA - 128/178 |
| 19257 | Person | Presets | Velibor Vasović (23 years old) - SRB - 153/178 | Lua | Person > > Presets > > Player > > Legend Players > > Central Defenders (DC) > > Velibor Vasović (23 years old) - SRB - 153/178 |
| 19276 | Person | Presets | Vincent Kompany (18 years old) - BEL - 120/170 | Lua | Person > > Presets > > Player > > Legend Players > > Central Defenders (DC) > > Vincent Kompany (18 years old) - BEL - 120/170 |
| 19147 | Person | Presets | Virgil van Dijk (17 years old) - NED - 115/180 | Lua | Person > > Presets > > Player > > Legend Players > > Central Defenders (DC) > > Virgil van Dijk (17 years old) - NED - 115/180 |
| 19250 | Person | Presets | Walter Samuel (19 years old) - ARG - 120/170 | Lua | Person > > Presets > > Player > > Legend Players > > Central Defenders (DC) > > Walter Samuel (19 years old) - ARG - 120/170 |
| 19494 | Person | Presets | Willi Schulz (23 years old) - GER - 155/180 | Lua | Person > > Presets > > Player > > Legend Players > > Central Defenders (DC) > > Willi Schulz (23 years old) - GER - 155/180 |
| 19266 | Person | Presets | Władysław Żmuda (21 years old) - POL - 139/174 | Lua | Person > > Presets > > Player > > Legend Players > > Central Defenders (DC) > > Władysław Żmuda (21 years old) - POL - 139/174 |
| 19475 | Person | Presets | Alfredo Foni (25 years old) - ITA - 157/172 | Lua | Person > > Presets > > Player > > Legend Players > > Wide Defenders (D/WB RL) > > Alfredo Foni (25 years old) - ITA - 157/172 |
| 19478 | Person | Presets | Anatoliy Demyanenko (21 years old) - UKR - 139/174 | Lua | Person > > Presets > > Player > > Legend Players > > Wide Defenders (D/WB RL) > > Anatoliy Demyanenko (21 years old) - UKR - 139/174 |
| 19144 | Person | Presets | Andreas Brehme (20 years old) - GER - 147/182 | Lua | Person > > Presets > > Player > > Legend Players > > Wide Defenders (D/WB RL) > > Andreas Brehme (20 years old) - GER - 147/182 |
| 19474 | Person | Presets | Antonio Cabrini (21 years old) - ITA - 143/178 | Lua | Person > > Presets > > Player > > Legend Players > > Wide Defenders (D/WB RL) > > Antonio Cabrini (21 years old) - ITA - 143/178 |
| 19482 | Person | Presets | Ashley Cole (18 years old) - ENG - 122/172 | Lua | Person > > Presets > > Player > > Legend Players > > Wide Defenders (D/WB RL) > > Ashley Cole (18 years old) - ENG - 122/172 |
| 19461 | Person | Presets | Berti Vogts (22 years old) - GER - 150/180 | Lua | Person > > Presets > > Player > > Legend Players > > Wide Defenders (D/WB RL) > > Berti Vogts (22 years old) - GER - 150/180 |
| 19480 | Person | Presets | Bixente Lizarazu (20 years old) - FRA - 132/172 | Lua | Person > > Presets > > Player > > Legend Players > > Wide Defenders (D/WB RL) > > Bixente Lizarazu (20 years old) - FRA - 132/172 |
| 19490 | Person | Presets | Branislav Ivanović (18 years old) - SRB - 114/164 | Lua | Person > > Presets > > Player > > Legend Players > > Wide Defenders (D/WB RL) > > Branislav Ivanović (18 years old) - SRB - 114/164 |
| 19488 | Person | Presets | Branko Stanković (24 years old) - SRB - 150/170 | Lua | Person > > Presets > > Player > > Legend Players > > Wide Defenders (D/WB RL) > > Branko Stanković (24 years old) - SRB - 150/170 |
| 19148 | Person | Presets | Cafu (19 years old) - 130/180 | Lua | Person > > Presets > > Player > > Legend Players > > Wide Defenders (D/WB RL) > > Cafu (19 years old) - 130/180 |
| 19460 | Person | Presets | Carlos Alberto (22 years old) - BRA - 148/178 | Lua | Person > > Presets > > Player > > Legend Players > > Wide Defenders (D/WB RL) > > Carlos Alberto (22 years old) - BRA - 148/178 |
| 23845 | Person | Presets | Dan Petrescu (25 years old) - ROU - 154/161 | Lua | Person > > Presets > > Player > > Legend Players > > Wide Defenders (D/WB RL) > > Dan Petrescu (25 years old) - ROU - 154/161 |
| 19472 | Person | Presets | Daniel Alves (18 years old) - BRA - 126/176 | Lua | Person > > Presets > > Player > > Legend Players > > Wide Defenders (D/WB RL) > > Daniel Alves (18 years old) - BRA - 126/176 |
| 19483 | Person | Presets | David Alaba (17 years old) - AUT - 117/172 | Lua | Person > > Presets > > Player > > Legend Players > > Wide Defenders (D/WB RL) > > David Alaba (17 years old) - AUT - 117/172 |
| 19468 | Person | Presets | Djalma Santos (24 years old) - BRA - 151/176 | Lua | Person > > Presets > > Player > > Legend Players > > Wide Defenders (D/WB RL) > > Djalma Santos (24 years old) - BRA - 151/176 |
| 19477 | Person | Presets | Éric Gerets (21 years old) - BEL - 137/172 | Lua | Person > > Presets > > Player > > Legend Players > > Wide Defenders (D/WB RL) > > Éric Gerets (21 years old) - BEL - 137/172 |
| 19487 | Person | Presets | Erik Nilsson (25 years old) - SWE - 153/168 | Lua | Person > > Presets > > Player > > Legend Players > > Wide Defenders (D/WB RL) > > Erik Nilsson (25 years old) - SWE - 153/168 |
| 19464 | Person | Presets | Fahrudin Jusufi (23 years old) - KVX - 154/174 | Lua | Person > > Presets > > Player > > Legend Players > > Wide Defenders (D/WB RL) > > Fahrudin Jusufi (23 years old) - KVX - 154/174 |
| 19465 | Person | Presets | Fritz Tarp (27 years old) - DEN - 169/174 | Lua | Person > > Presets > > Player > > Legend Players > > Wide Defenders (D/WB RL) > > Fritz Tarp (27 years old) - DEN - 169/174 |
| 19124 | Person | Presets | Giacinto Facchetti (22 years old) - ITA - 156/186 | Lua | Person > > Presets > > Player > > Legend Players > > Wide Defenders (D/WB RL) > > Giacinto Facchetti (22 years old) - ITA - 156/186 |
| 19466 | Person | Presets | Gianluca Zambrotta (19 years old) - ITA - 129/174 | Lua | Person > > Presets > > Player > > Legend Players > > Wide Defenders (D/WB RL) > > Gianluca Zambrotta (19 years old) - ITA - 129/174 |
| 19459 | Person | Presets | Hans-Peter Briegel (21 years old) - GER - 143/178 | Lua | Person > > Presets > > Player > > Legend Players > > Wide Defenders (D/WB RL) > > Hans-Peter Briegel (21 years old) - GER - 143/178 |
| 19146 | Person | Presets | Javier Zanetti (19 years old) - ARG - 135/180 | Lua | Person > > Presets > > Player > > Legend Players > > Wide Defenders (D/WB RL) > > Javier Zanetti (19 years old) - ARG - 135/180 |
| 19471 | Person | Presets | Joan Segarra (24 years old) - ESP - 156/176 | Lua | Person > > Presets > > Player > > Legend Players > > Wide Defenders (D/WB RL) > > Joan Segarra (24 years old) - ESP - 156/176 |
| 19491 | Person | Presets | Jordi Alba (18 years old) - ESP - 121/166 | Lua | Person > > Presets > > Player > > Legend Players > > Wide Defenders (D/WB RL) > > Jordi Alba (18 years old) - ESP - 121/166 |
| 19467 | Person | Presets | José Antonio Camacho (21 years old) - ESP - 146/176 | Lua | Person > > Presets > > Player > > Legend Players > > Wide Defenders (D/WB RL) > > José Antonio Camacho (21 years old) - ESP - 146/176 |
| 19469 | Person | Presets | Juan Evaristo (26 years old) - ARG - 166/176 | Lua | Person > > Presets > > Player > > Legend Players > > Wide Defenders (D/WB RL) > > Juan Evaristo (26 years old) - ARG - 166/176 |
| 19149 | Person | Presets | Júnior (21 years old) - BRA - 147/182 | Lua | Person > > Presets > > Player > > Legend Players > > Wide Defenders (D/WB RL) > > Júnior (21 years old) - BRA - 147/182 |
| 19462 | Person | Presets | Karl-Heinz Schnellinger (23 years old) - GER - 155/180 | Lua | Person > > Presets > > Player > > Legend Players > > Wide Defenders (D/WB RL) > > Karl-Heinz Schnellinger (23 years old) - GER - 155/180 |
| 19268 | Person | Presets | Károly Fogl (27 years old) - HUN - 169/174 | Lua | Person > > Presets > > Player > > Legend Players > > Wide Defenders (D/WB RL) > > Károly Fogl (27 years old) - HUN - 169/174 |
| 19484 | Person | Presets | Maicon (18 years old) - BRA - 122/172 | Lua | Person > > Presets > > Player > > Legend Players > > Wide Defenders (D/WB RL) > > Maicon (18 years old) - BRA - 122/172 |
| 19479 | Person | Presets | Manfred Kaltz (21 years old) - GER - 139/174 | Lua | Person > > Presets > > Player > > Legend Players > > Wide Defenders (D/WB RL) > > Manfred Kaltz (21 years old) - GER - 139/174 |
| 19463 | Person | Presets | Manuel Amoros (20 years old) - FRA - 140/180 | Lua | Person > > Presets > > Player > > Legend Players > > Wide Defenders (D/WB RL) > > Manuel Amoros (20 years old) - FRA - 140/180 |
| 19486 | Person | Presets | Marcelo (18 years old) - BRA - 125/170 | Lua | Person > > Presets > > Player > > Legend Players > > Wide Defenders (D/WB RL) > > Marcelo (18 years old) - BRA - 125/170 |
| 19131 | Person | Presets | Lilian Thuram (19 years old) - FRA - 139/184 | Lua | Person > > Presets > > Player > > Legend Players > > Wide Defenders (D/WB RL) > > Lilian Thuram (19 years old) - FRA - 139/184 |
| 19251 | Person | Presets | Nílton Santos (24 years old) - BRA - 157/182 | Lua | Person > > Presets > > Player > > Legend Players > > Wide Defenders (D/WB RL) > > Nílton Santos (24 years old) - BRA - 157/182 |
| 19458 | Person | Presets | Paul Breitner (21 years old) - GER - 154/184 | Lua | Person > > Presets > > Player > > Legend Players > > Wide Defenders (D/WB RL) > > Paul Breitner (21 years old) - GER - 154/184 |
| 19473 | Person | Presets | Paul Janes (25 years old) - GER - 163/178 | Lua | Person > > Presets > > Player > > Legend Players > > Wide Defenders (D/WB RL) > > Paul Janes (25 years old) - GER - 163/178 |
| 19129 | Person | Presets | Paolo Maldini (20 years old) - 154/194 | Lua | Person > > Presets > > Player > > Legend Players > > Wide Defenders (D/WB RL) > > Paolo Maldini (20 years old) - 154/194 |
| 19489 | Person | Presets | Patrice Evra (18 years old) - FRA - 118/168 | Lua | Person > > Presets > > Player > > Legend Players > > Wide Defenders (D/WB RL) > > Patrice Evra (18 years old) - FRA - 118/168 |
| 19140 | Person | Presets | Philipp Lahm (18 years old) - 130/180 | Lua | Person > > Presets > > Player > > Legend Players > > Wide Defenders (D/WB RL) > > Philipp Lahm (18 years old) - 130/180 |
| 19130 | Person | Presets | Roberto Carlos (19 years old) - 139/184 | Lua | Person > > Presets > > Player > > Legend Players > > Wide Defenders (D/WB RL) > > Roberto Carlos (19 years old) - 139/184 |
| 19485 | Person | Presets | Rudolf Ramseyer (27 years old) - SUI - 163/168 | Lua | Person > > Presets > > Player > > Legend Players > > Wide Defenders (D/WB RL) > > Rudolf Ramseyer (27 years old) - SUI - 163/168 |
| 19133 | Person | Presets | Ruud Krol (22 years old) - NED - 154/184 | Lua | Person > > Presets > > Player > > Legend Players > > Wide Defenders (D/WB RL) > > Ruud Krol (22 years old) - NED - 154/184 |
| 19476 | Person | Presets | Sergio Cervato (24 years old) - ITA - 152/172 | Lua | Person > > Presets > > Player > > Legend Players > > Wide Defenders (D/WB RL) > > Sergio Cervato (24 years old) - ITA - 152/172 |
| 19481 | Person | Presets | Severino Minelli (26 years old) - SUI - 162/172 | Lua | Person > > Presets > > Player > > Legend Players > > Wide Defenders (D/WB RL) > > Severino Minelli (26 years old) - SUI - 162/172 |
| 19470 | Person | Presets | Víctor Andrade (24 years old) - URU - 156/176 | Lua | Person > > Presets > > Player > > Legend Players > > Wide Defenders (D/WB RL) > > Víctor Andrade (24 years old) - URU - 156/176 |
| 19336 | Person | Presets | Abedi Pelé (20 years old) - GHA - 136/176 | Lua | Person > > Presets > > Player > > Legend Players > > Central Midfielders (DM/M/AM C) > > Abedi Pelé (20 years old) - GHA - 136/176 |
| 19161 | Person | Presets | Adolfo Pedernera (25 years old) - ARG - 171/186 | Lua | Person > > Presets > > Player > > Legend Players > > Central Midfielders (DM/M/AM C) > > Adolfo Pedernera (25 years old) - ARG - 171/186 |
| 19306 | Person | Presets | Andrea Pirlo (19 years old) - ITA - 137/182 | Lua | Person > > Presets > > Player > > Legend Players > > Central Midfielders (DM/M/AM C) > > Andrea Pirlo (19 years old) - ITA - 137/182 |
| 19280 | Person | Presets | Andrés Iniesta (18 years old) - ESP - 136/186 | Lua | Person > > Presets > > Player > > Legend Players > > Central Midfielders (DM/M/AM C) > > Andrés Iniesta (18 years old) - ESP - 136/186 |
| 19356 | Person | Presets | Antonin Panenka (22 years old) - CZE - 140/170 | Lua | Person > > Presets > > Player > > Legend Players > > Central Midfielders (DM/M/AM C) > > Antonin Panenka (22 years old) - CZE - 140/170 |
| 19346 | Person | Presets | Arturo Vidal (18 years old) - CHI - 124/174 | Lua | Person > > Presets > > Player > > Legend Players > > Central Midfielders (DM/M/AM C) > > Arturo Vidal (18 years old) - CHI - 124/174 |
| 19348 | Person | Presets | Bastian Schweinsteiger (18 years old) - GER - 122/172 | Lua | Person > > Presets > > Player > > Legend Players > > Central Midfielders (DM/M/AM C) > > Bastian Schweinsteiger (18 years old) - GER - 122/172 |
| 19312 | Person | Presets | Bernd Schuster (21 years old) - GER - 150/180 | Lua | Person > > Presets > > Player > > Legend Players > > Central Midfielders (DM/M/AM C) > > Bernd Schuster (21 years old) - GER - 150/180 |
| 19171 | Person | Presets | Bobby Charlton (23 years old) - ENG - 167/192 | Lua | Person > > Presets > > Player > > Legend Players > > Central Midfielders (DM/M/AM C) > > Bobby Charlton (23 years old) - ENG - 167/192 |
| 19344 | Person | Presets | Branko Oblak (22 years old) - SVN - 142/172 | Lua | Person > > Presets > > Player > > Legend Players > > Central Midfielders (DM/M/AM C) > > Branko Oblak (22 years old) - SVN - 142/172 |
| 19340 | Person | Presets | Cesc Fàbregas (18 years old) - ESP - 131/176 | Lua | Person > > Presets > > Player > > Legend Players > > Central Midfielders (DM/M/AM C) > > Cesc Fàbregas (18 years old) - ESP - 131/176 |
| 19313 | Person | Presets | Clarence Seedorf (19 years old) - NED - 140/180 | Lua | Person > > Presets > > Player > > Legend Players > > Central Midfielders (DM/M/AM C) > > Clarence Seedorf (19 years old) - NED - 140/180 |
| 19343 | Person | Presets | Claude Makélélé (19 years old) - FRA - 122/172 | Lua | Person > > Presets > > Player > > Legend Players > > Central Midfielders (DM/M/AM C) > > Claude Makélélé (19 years old) - FRA - 122/172 |
| 19355 | Person | Presets | Daniele De Rossi (18 years old) - ITA - 120/170 | Lua | Person > > Presets > > Player > > Legend Players > > Central Midfielders (DM/M/AM C) > > Daniele De Rossi (18 years old) - ITA - 120/170 |
| 19308 | Person | Presets | Danny Blanchflower (24 years old) - NIR - 162/182 | Lua | Person > > Presets > > Player > > Legend Players > > Central Midfielders (DM/M/AM C) > > Danny Blanchflower (24 years old) - NIR - 162/182 |
| 19322 | Person | Presets | Dave Mackay (23 years old) - SCO - 153/178 | Lua | Person > > Presets > > Player > > Legend Players > > Central Midfielders (DM/M/AM C) > > Dave Mackay (23 years old) - SCO - 153/178 |
| 19323 | Person | Presets | David Kipiani (21 years old) - GEO - 141/176 | Lua | Person > > Presets > > Player > > Legend Players > > Central Midfielders (DM/M/AM C) > > David Kipiani (21 years old) - GEO - 141/176 |
| 19326 | Person | Presets | David Silva (18 years old) - ESP - 128/178 | Lua | Person > > Presets > > Player > > Legend Players > > Central Midfielders (DM/M/AM C) > > David Silva (18 years old) - ESP - 128/178 |
| 19495 | Person | Presets | Deco (19 years old) - POR - 131/176 | Lua | Person > > Presets > > Player > > Legend Players > > Central Midfielders (DM/M/AM C) > > Deco (19 years old) - POR - 131/176 |
| 23835 | Person | Presets | Dennis Wise (22 years old) - ENG - 160/180 | Lua | Person > > Presets > > Player > > Legend Players > > Central Midfielders (DM/M/AM C) > > Dennis Wise (22 years old) - ENG - 160/180 |
| 19186 | Person | Presets | Didi (24 years old) - BRA - 163/188 | Lua | Person > > Presets > > Player > > Legend Players > > Central Midfielders (DM/M/AM C) > > Didi (24 years old) - BRA - 163/188 |
| 19342 | Person | Presets | Didier Deschamps (20 years old) - FRA - 132/172 | Lua | Person > > Presets > > Player > > Legend Players > > Central Midfielders (DM/M/AM C) > > Didier Deschamps (20 years old) - FRA - 132/172 |
| 19162 | Person | Presets | Diego Maradona (20 years old) - ARG - 173/198 | Lua | Person > > Presets > > Player > > Legend Players > > Central Midfielders (DM/M/AM C) > > Diego Maradona (20 years old) - ARG - 173/198 |
| 19352 | Person | Presets | Diego Simeone (19 years old) - ARG - 130/170 | Lua | Person > > Presets > > Player > > Legend Players > > Central Midfielders (DM/M/AM C) > > Diego Simeone (19 years old) - ARG - 130/170 |
| 19317 | Person | Presets | Dragan Stojković (20 years old) - SRB - 143/178 | Lua | Person > > Presets > > Player > > Legend Players > > Central Midfielders (DM/M/AM C) > > Dragan Stojković (20 years old) - SRB - 143/178 |
| 19338 | Person | Presets | Edgar Davids (19 years old) - NED - 134/174 | Lua | Person > > Presets > > Player > > Legend Players > > Central Midfielders (DM/M/AM C) > > Edgar Davids (19 years old) - NED - 134/174 |
| 19351 | Person | Presets | Emerson (19 years old) - BRA - 125/170 | Lua | Person > > Presets > > Player > > Legend Players > > Central Midfielders (DM/M/AM C) > > Emerson (19 years old) - BRA - 125/170 |
| 19281 | Person | Presets | Ernst Ocwirk (24 years old) - AUT - 166/186 | Lua | Person > > Presets > > Player > > Legend Players > > Central Midfielders (DM/M/AM C) > > Ernst Ocwirk (24 years old) - AUT - 166/186 |
| 19361 | Person | Presets | Esteban Cambiasso (18 years old) - ARG - 118/168 | Lua | Person > > Presets > > Player > > Legend Players > > Central Midfielders (DM/M/AM C) > > Esteban Cambiasso (18 years old) - ARG - 118/168 |
| 19209 | Person | Presets | Falcão (21 years old) - BRA - 146/186 | Lua | Person > > Presets > > Player > > Legend Players > > Central Midfielders (DM/M/AM C) > > Falcão (21 years old) - BRA - 146/186 |
| 19283 | Person | Presets | Francesco Totti (19 years old) - ITA - 139/184 | Lua | Person > > Presets > > Player > > Legend Players > > Central Midfielders (DM/M/AM C) > > Francesco Totti (19 years old) - ITA - 139/184 |
| 19299 | Person | Presets | Frank Lampard (19 years old) - ENG - 137/182 | Lua | Person > > Presets > > Player > > Legend Players > > Central Midfielders (DM/M/AM C) > > Frank Lampard (19 years old) - ENG - 137/182 |
| 19182 | Person | Presets | Frank Rijkaard (20 years old) - NED - 148/188 | Lua | Person > > Presets > > Player > > Legend Players > > Central Midfielders (DM/M/AM C) > > Frank Rijkaard (20 years old) - NED - 148/188 |
| 19177 | Person | Presets | Fritz Walter (24 years old) - GER - 175/190 | Lua | Person > > Presets > > Player > > Legend Players > > Central Midfielders (DM/M/AM C) > > Fritz Walter (24 years old) - GER - 175/190 |
| 19319 | Person | Presets | Fulvio Bernardini (26 years old) - ITA - 168/178 | Lua | Person > > Presets > > Player > > Legend Players > > Central Midfielders (DM/M/AM C) > > Fulvio Bernardini (26 years old) - ITA - 168/178 |
| 19353 | Person | Presets | Gennaro Gattuso (19 years old) - ITA - 125/170 | Lua | Person > > Presets > > Player > > Legend Players > > Central Midfielders (DM/M/AM C) > > Gennaro Gattuso (19 years old) - ITA - 125/170 |
| 19287 | Person | Presets | Gheorghe Hagi (20 years old) - ROU - 146/186 | Lua | Person > > Presets > > Player > > Legend Players > > Central Midfielders (DM/M/AM C) > > Gheorghe Hagi (20 years old) - ROU - 146/186 |
| 19332 | Person | Presets | Gianfranco Zola (20 years old) - ITA - 131/176 | Lua | Person > > Presets > > Player > > Legend Players > > Central Midfielders (DM/M/AM C) > > Gianfranco Zola (20 years old) - ITA - 131/176 |
| 19173 | Person | Presets | Gianni Rivera (22 years old) - ITA - 165/190 | Lua | Person > > Presets > > Player > > Legend Players > > Central Midfielders (DM/M/AM C) > > Gianni Rivera (22 years old) - ITA - 165/190 |
| 19300 | Person | Presets | György Orth (26 years old) - HUN - 177/182 | Lua | Person > > Presets > > Player > > Legend Players > > Central Midfielders (DM/M/AM C) > > György Orth (26 years old) - HUN - 177/182 |
| 19183 | Person | Presets | György Sárosi (25 years old) - HUN - 173/188 | Lua | Person > > Presets > > Player > > Legend Players > > Central Midfielders (DM/M/AM C) > > György Sárosi (25 years old) - HUN - 173/188 |
| 19215 | Person | Presets | Héctor Scarone (27 years old) - URU - 181/186 | Lua | Person > > Presets > > Player > > Legend Players > > Central Midfielders (DM/M/AM C) > > Héctor Scarone (27 years old) - URU - 181/186 |
| 19337 | Person | Presets | Igor Belanov (20 years old) - UKR - 134/174 | Lua | Person > > Presets > > Player > > Legend Players > > Central Midfielders (DM/M/AM C) > > Igor Belanov (20 years old) - UKR - 134/174 |
| 19297 | Person | Presets | Igor Netto (23 years old) - RUS - 157/182 | Lua | Person > > Presets > > Player > > Legend Players > > Central Midfielders (DM/M/AM C) > > Igor Netto (23 years old) - RUS - 157/182 |
| 19354 | Person | Presets | Jari Litmanen (19 years old) - FIN - 132/172 | Lua | Person > > Presets > > Player > > Legend Players > > Central Midfielders (DM/M/AM C) > > Jari Litmanen (19 years old) - FIN - 132/172 |
| 19347 | Person | Presets | Javier Mascherano (18 years old) - ARG - 122/172 | Lua | Person > > Presets > > Player > > Legend Players > > Central Midfielders (DM/M/AM C) > > Javier Mascherano (18 years old) - ARG - 122/172 |
| 19163 | Person | Presets | Johan Cruijff (22 years old) - NED - 168/198 | Lua | Person > > Presets > > Player > > Legend Players > > Central Midfielders (DM/M/AM C) > > Johan Cruijff (22 years old) - NED - 168/198 |
| 19167 | Person | Presets | José Manuel Moreno (25 years old) - ARG - 182/192 | Lua | Person > > Presets > > Player > > Legend Players > > Central Midfielders (DM/M/AM C) > > José Manuel Moreno (25 years old) - ARG - 182/192 |
| 19311 | Person | Presets | Josef Smistik (26 years old) - AUT - 168/178 | Lua | Person > > Presets > > Player > > Legend Players > > Central Midfielders (DM/M/AM C) > > Josef Smistik (26 years old) - AUT - 168/178 |
| 19293 | Person | Presets | József Bozsik (24 years old) - HUN - 166/186 | Lua | Person > > Presets > > Player > > Legend Players > > Central Midfielders (DM/M/AM C) > > József Bozsik (24 years old) - HUN - 166/186 |
| 19288 | Person | Presets | Juan Alberto Schiaffino (24 years old) - URU - 166/186 | Lua | Person > > Presets > > Player > > Legend Players > > Central Midfielders (DM/M/AM C) > > Juan Alberto Schiaffino (24 years old) - URU - 166/186 |
| 19185 | Person | Presets | Kaká (18 years old) - BRA - 138/188 | Lua | Person > > Presets > > Player > > Legend Players > > Central Midfielders (DM/M/AM C) > > Kaká (18 years old) - BRA - 138/188 |
| 19285 | Person | Presets | Kevin De Bruyne (17 years old) - BEL - 136/186 | Lua | Person > > Presets > > Player > > Legend Players > > Central Midfielders (DM/M/AM C) > > Kevin De Bruyne (17 years old) - BEL - 136/186 |
| 19290 | Person | Presets | Kevin Keegan (21 years old) - ENG - 151/186 | Lua | Person > > Presets > > Player > > Legend Players > > Central Midfielders (DM/M/AM C) > > Kevin Keegan (21 years old) - ENG - 151/186 |
| 19295 | Person | Presets | Larbi Ben Barek (25 years old) - FRA - 162/182 | Lua | Person > > Presets > > Player > > Legend Players > > Central Midfielders (DM/M/AM C) > > Larbi Ben Barek (25 years old) - FRA - 162/182 |
| 19334 | Person | Presets | Liam Brady (21 years old) - IRL - 141/176 | Lua | Person > > Presets > > Player > > Legend Players > > Central Midfielders (DM/M/AM C) > > Liam Brady (21 years old) - IRL - 141/176 |
| 19157 | Person | Presets | Lothar Matthäus (20 years old) - GER - 147/192 | Lua | Person > > Presets > > Player > > Legend Players > > Central Midfielders (DM/M/AM C) > > Lothar Matthäus (20 years old) - GER - 147/192 |
| 19330 | Person | Presets | Luis Enrique (19 years old) - ESP - 131/176 | Lua | Person > > Presets > > Player > > Legend Players > > Central Midfielders (DM/M/AM C) > > Luis Enrique (19 years old) - ESP - 131/176 |
| 19307 | Person | Presets | Luis Monti (26 years old) - ARG - 177/182 | Lua | Person > > Presets > > Player > > Legend Players > > Central Midfielders (DM/M/AM C) > > Luis Monti (26 years old) - ARG - 177/182 |
| 19180 | Person | Presets | Luis Suárez (23 years old) - ESP - 168/188 | Lua | Person > > Presets > > Player > > Legend Players > > Central Midfielders (DM/M/AM C) > > Luis Suárez (23 years old) - ESP - 168/188 |
| 19314 | Person | Presets | Luka Modrić (18 years old) - CRO - 130/180 | Lua | Person > > Presets > > Player > > Legend Players > > Central Midfielders (DM/M/AM C) > > Luka Modrić (18 years old) - CRO - 130/180 |
| 23841 | Person | Presets | Mágico González (22 years old) - SLV - 138/168 | Lua | Person > > Presets > > Player > > Legend Players > > Central Midfielders (DM/M/AM C) > > Mágico González (22 years old) - SLV - 138/168 |
| 19303 | Person | Presets | Marco Tardelli (21 years old) - ITA - 147/182 | Lua | Person > > Presets > > Player > > Legend Players > > Central Midfielders (DM/M/AM C) > > Marco Tardelli (21 years old) - ITA - 147/182 |
| 19321 | Person | Presets | Mesut Özil (18 years old) - GER - 128/178 | Lua | Person > > Presets > > Player > > Legend Players > > Central Midfielders (DM/M/AM C) > > Mesut Özil (18 years old) - GER - 128/178 |
| 19329 | Person | Presets | Michael Ballack (19 years old) - GER - 131/176 | Lua | Person > > Presets > > Player > > Legend Players > > Central Midfielders (DM/M/AM C) > > Michael Ballack (19 years old) - GER - 131/176 |
| 19318 | Person | Presets | Michael Essien (18 years old) - GHA - 128/178 | Lua | Person > > Presets > > Player > > Legend Players > > Central Midfielders (DM/M/AM C) > > Michael Essien (18 years old) - GHA - 128/178 |
| 19175 | Person | Presets | Michael Laudrup (20 years old) - DEN - 150/190 | Lua | Person > > Presets > > Player > > Legend Players > > Central Midfielders (DM/M/AM C) > > Michael Laudrup (20 years old) - DEN - 150/190 |
| 19159 | Person | Presets | Michel Platini (21 years old) - FRA - 159/194 | Lua | Person > > Presets > > Player > > Legend Players > > Central Midfielders (DM/M/AM C) > > Michel Platini (21 years old) - FRA - 159/194 |
| 19350 | Person | Presets | N'Golo Kanté (17 years old) - FRA - 112/172 | Lua | Person > > Presets > > Player > > Legend Players > > Central Midfielders (DM/M/AM C) > > N'Golo Kanté (17 years old) - FRA - 112/172 |
| 19309 | Person | Presets | Néstor Rossi (24 years old) - ARG - 158/178 | Lua | Person > > Presets > > Player > > Legend Players > > Central Midfielders (DM/M/AM C) > > Néstor Rossi (24 years old) - ARG - 158/178 |
| 23829 | Person | Presets | Owen Hargreaves (21 years old) - CAN - 152/179 | Lua | Person > > Presets > > Player > > Legend Players > > Central Midfielders (DM/M/AM C) > > Owen Hargreaves (21 years old) - CAN - 152/179 |
| 19305 | Person | Presets | Patrick Vieira (19 years old) - FRA - 135/180 | Lua | Person > > Presets > > Player > > Legend Players > > Central Midfielders (DM/M/AM C) > > Patrick Vieira (19 years old) - FRA - 135/180 |
| 19316 | Person | Presets | Paul Scholes (19 years old) - ENG - 133/178 | Lua | Person > > Presets > > Player > > Legend Players > > Central Midfielders (DM/M/AM C) > > Paul Scholes (19 years old) - ENG - 133/178 |
| 19324 | Person | Presets | Paul Pogba (17 years old) - FRA - 128/178 | Lua | Person > > Presets > > Player > > Legend Players > > Central Midfielders (DM/M/AM C) > > Paul Pogba (17 years old) - FRA - 128/178 |
| 19360 | Person | Presets | Paulo Sousa (19 years old) - POR - 123/168 | Lua | Person > > Presets > > Player > > Legend Players > > Central Midfielders (DM/M/AM C) > > Paulo Sousa (19 years old) - POR - 123/168 |
| 19187 | Person | Presets | Pavel Nedved (19 years old) - CZE - 136/186 | Lua | Person > > Presets > > Player > > Legend Players > > Central Midfielders (DM/M/AM C) > > Pavel Nedved (19 years old) - CZE - 136/186 |
| 19331 | Person | Presets | Pep Guardiola (19 years old) - ESP - 131/176 | Lua | Person > > Presets > > Player > > Legend Players > > Central Midfielders (DM/M/AM C) > > Pep Guardiola (19 years old) - ESP - 131/176 |
| 19301 | Person | Presets | Pirri (22 years old) - ESP - 157/182 | Lua | Person > > Presets > > Player > > Legend Players > > Central Midfielders (DM/M/AM C) > > Pirri (22 years old) - ESP - 157/182 |
| 19345 | Person | Presets | Rainer Bonhof (21 years old) - GER - 139/174 | Lua | Person > > Presets > > Player > > Legend Players > > Central Midfielders (DM/M/AM C) > > Rainer Bonhof (21 years old) - GER - 139/174 |
| 19179 | Person | Presets | Raymond Kopa (23 years old) - FRA - 165/190 | Lua | Person > > Presets > > Player > > Legend Players > > Central Midfielders (DM/M/AM C) > > Raymond Kopa (23 years old) - FRA - 165/190 |
| 19176 | Person | Presets | Rivellino (22 years old) - BRA - 158/188 | Lua | Person > > Presets > > Player > > Legend Players > > Central Midfielders (DM/M/AM C) > > Rivellino (22 years old) - BRA - 158/188 |
| 19339 | Person | Presets | Roberto Mancini (20 years old) - ITA - 134/174 | Lua | Person > > Presets > > Player > > Legend Players > > Central Midfielders (DM/M/AM C) > > Roberto Mancini (20 years old) - ITA - 134/174 |
| 19327 | Person | Presets | Romerito (20 years old) - PAR - 136/176 | Lua | Person > > Presets > > Player > > Legend Players > > Central Midfielders (DM/M/AM C) > > Romerito (20 years old) - PAR - 136/176 |
| 19168 | Person | Presets | Ronaldinho (18 years old) - BRA - 142/192 | Lua | Person > > Presets > > Player > > Legend Players > > Central Midfielders (DM/M/AM C) > > Ronaldinho (18 years old) - BRA - 142/192 |
| 19320 | Person | Presets | Roy Keane (19 years old) - IRL - 133/178 | Lua | Person > > Presets > > Player > > Legend Players > > Central Midfielders (DM/M/AM C) > > Roy Keane (19 years old) - IRL - 133/178 |
| 19359 | Person | Presets | Rubén Paz (21 years old) - URU - 133/168 | Lua | Person > > Presets > > Player > > Legend Players > > Central Midfielders (DM/M/AM C) > > Rubén Paz (21 years old) - URU - 133/168 |
| 19325 | Person | Presets | Rui Costa (19 years old) - POR - 133/178 | Lua | Person > > Presets > > Player > > Legend Players > > Central Midfielders (DM/M/AM C) > > Rui Costa (19 years old) - POR - 133/178 |
| 19156 | Person | Presets | Ruud Gullit (20 years old) - NED - 152/192 | Lua | Person > > Presets > > Player > > Legend Players > > Central Midfielders (DM/M/AM C) > > Ruud Gullit (20 years old) - NED - 152/192 |
| 19291 | Person | Presets | Sandro Mazzola (22 years old) - ITA - 161/186 | Lua | Person > > Presets > > Player > > Legend Players > > Central Midfielders (DM/M/AM C) > > Sandro Mazzola (22 years old) - ITA - 161/186 |
| 19349 | Person | Presets | Sergio Busquets (18 years old) - ESP - 122/172 | Lua | Person > > Presets > > Player > > Legend Players > > Central Midfielders (DM/M/AM C) > > Sergio Busquets (18 years old) - ESP - 122/172 |
| 19292 | Person | Presets | Sócrates (21 years old) - BRA - 149/184 | Lua | Person > > Presets > > Player > > Legend Players > > Central Midfielders (DM/M/AM C) > > Sócrates (21 years old) - BRA - 149/184 |
| 19298 | Person | Presets | Steven Gerrard (18 years old) - ENG - 134/184 | Lua | Person > > Presets > > Player > > Legend Players > > Central Midfielders (DM/M/AM C) > > Steven Gerrard (18 years old) - ENG - 134/184 |
| 19296 | Person | Presets | Teófilo Cubillas (22 years old) - PER - 159/184 | Lua | Person > > Presets > > Player > > Legend Players > > Central Midfielders (DM/M/AM C) > > Teófilo Cubillas (22 years old) - PER - 159/184 |
| 19386 | Person | Presets | Thomas Häßler (20 years old) - GER - 140/180 | Lua | Person > > Presets > > Player > > Legend Players > > Central Midfielders (DM/M/AM C) > > Thomas Häßler (20 years old) - GER - 140/180 |
| 23840 | Person | Presets | Tim Cahill (20 years old) - AUS - 120/160 | Lua | Person > > Presets > > Player > > Legend Players > > Central Midfielders (DM/M/AM C) > > Tim Cahill (20 years old) - AUS - 120/160 |
| 19335 | Person | Presets | Toni Kroos (17 years old) - GER - 126/176 | Lua | Person > > Presets > > Player > > Legend Players > > Central Midfielders (DM/M/AM C) > > Toni Kroos (17 years old) - GER - 126/176 |
| 19184 | Person | Presets | Valentino Mazzola (25 years old) - ITA - 173/188 | Lua | Person > > Presets > > Player > > Legend Players > > Central Midfielders (DM/M/AM C) > > Valentino Mazzola (25 years old) - ITA - 173/188 |
| 19328 | Person | Presets | Valery Voronin (23 years old) - RUS - 151/176 | Lua | Person > > Presets > > Player > > Legend Players > > Central Midfielders (DM/M/AM C) > > Valery Voronin (23 years old) - RUS - 151/176 |
| 19357 | Person | Presets | Vladimir Petrović (21 years old) - SRB - 133/168 | Lua | Person > > Presets > > Player > > Legend Players > > Central Midfielders (DM/M/AM C) > > Vladimir Petrović (21 years old) - SRB - 133/168 |
| 19315 | Person | Presets | Wesley Sneijder (18 years old) - NED - 128/178 | Lua | Person > > Presets > > Player > > Legend Players > > Central Midfielders (DM/M/AM C) > > Wesley Sneijder (18 years old) - NED - 128/178 |
| 19302 | Person | Presets | Willem van Hanegem (22 years old) - NED - 152/182 | Lua | Person > > Presets > > Player > > Legend Players > > Central Midfielders (DM/M/AM C) > > Willem van Hanegem (22 years old) - NED - 152/182 |
| 19333 | Person | Presets | Xabi Alonso (18 years old) - ESP - 126/176 | Lua | Person > > Presets > > Player > > Legend Players > > Central Midfielders (DM/M/AM C) > > Xabi Alonso (18 years old) - ESP - 126/176 |
| 19289 | Person | Presets | Xavi (18 years old) - ESP - 136/186 | Lua | Person > > Presets > > Player > > Legend Players > > Central Midfielders (DM/M/AM C) > > Xavi (18 years old) - ESP - 136/186 |
| 19341 | Person | Presets | Yaya Touré (18 years old) - CIV - 121/176 | Lua | Person > > Presets > > Player > > Legend Players > > Central Midfielders (DM/M/AM C) > > Yaya Touré (18 years old) - CIV - 121/176 |
| 19294 | Person | Presets | Zbigniew Boniek (21 years old) - POL - 151/186 | Lua | Person > > Presets > > Player > > Legend Players > > Central Midfielders (DM/M/AM C) > > Zbigniew Boniek (21 years old) - POL - 151/186 |
| 19160 | Person | Presets | Zico (21 years old) - BRA - 159/194 | Lua | Person > > Presets > > Player > > Legend Players > > Central Midfielders (DM/M/AM C) > > Zico (21 years old) - BRA - 159/194 |
| 19158 | Person | Presets | Zinedine Zidane (19 years old) - FRA - 149/194 | Lua | Person > > Presets > > Player > > Legend Players > > Central Midfielders (DM/M/AM C) > > Zinedine Zidane (19 years old) - FRA - 149/194 |
| 19169 | Person | Presets | Zizinho (24 years old) - BRA - 172/192 | Lua | Person > > Presets > > Player > > Legend Players > > Central Midfielders (DM/M/AM C) > > Zizinho (24 years old) - BRA - 172/192 |
| 19310 | Person | Presets | Zlatko Čajkovski (24 years old) - CRO - 158/178 | Lua | Person > > Presets > > Player > > Legend Players > > Central Midfielders (DM/M/AM C) > > Zlatko Čajkovski (24 years old) - CRO - 158/178 |
| 19377 | Person | Presets | Alan Morton (27 years old) - SCO - 168/178 | Lua | Person > > Presets > > Player > > Legend Players > > Wide Midfielders (M/AM RL) > > Alan Morton (27 years old) - SCO - 168/178 |
| 19388 | Person | Presets | Alexis Sánchez (18 years old) - CHI - 130/180 | Lua | Person > > Presets > > Player > > Legend Players > > Wide Midfielders (M/AM RL) > > Alexis Sánchez (18 years old) - CHI - 130/180 |
| 19375 | Person | Presets | Amancio (23 years old) - ESP - 153/178 | Lua | Person > > Presets > > Player > > Legend Players > > Wide Midfielders (M/AM RL) > > Amancio (23 years old) - ESP - 153/178 |
| 19395 | Person | Presets | Ángel Di María (18 years old) - ARG - 131/176 | Lua | Person > > Presets > > Player > > Legend Players > > Wide Midfielders (M/AM RL) > > Ángel Di María (18 years old) - ARG - 131/176 |
| 19390 | Person | Presets | Antoine Griezmann (17 years old) - FRA - 127/182 | Lua | Person > > Presets > > Player > > Legend Players > > Wide Midfielders (M/AM RL) > > Antoine Griezmann (17 years old) - FRA - 127/182 |
| 19385 | Person | Presets | Allan Simonsen (21 years old) - DEN - 145/180 | Lua | Person > > Presets > > Player > > Legend Players > > Wide Midfielders (M/AM RL) > > Allan Simonsen (21 years old) - DEN - 145/180 |
| 19231 | Person | Presets | Arjen Robben (18 years old) - NED - 132/182 | Lua | Person > > Presets > > Player > > Legend Players > > Wide Midfielders (M/AM RL) > > Arjen Robben (18 years old) - NED - 132/182 |
| 19373 | Person | Presets | Bernard Vukas (24 years old) - CRO - 164/184 | Lua | Person > > Presets > > Player > > Legend Players > > Wide Midfielders (M/AM RL) > > Bernard Vukas (24 years old) - CRO - 164/184 |
| 19384 | Person | Presets | Billy Meredith (29 years old) - WAL - 180/180 | Lua | Person > > Presets > > Player > > Legend Players > > Wide Midfielders (M/AM RL) > > Billy Meredith (29 years old) - WAL - 180/180 |
| 23847 | Person | Presets | Boaz (19 years old) - IDN - 110/126 | Lua | Person > > Presets > > Player > > Legend Players > > Wide Midfielders (M/AM RL) > > Boaz (19 years old) - IDN - 110/126 |
| 19374 | Person | Presets | Brian Laudrup (20 years old) - DEN - 138/178 | Lua | Person > > Presets > > Player > > Legend Players > > Wide Midfielders (M/AM RL) > > Brian Laudrup (20 years old) - DEN - 138/178 |
| 19379 | Person | Presets | Bruno Conti (21 years old) - ITA - 143/178 | Lua | Person > > Presets > > Player > > Legend Players > > Wide Midfielders (M/AM RL) > > Bruno Conti (21 years old) - ITA - 143/178 |
| 19402 | Person | Presets | Caju (22 years old) - BRA - 147/172 | Lua | Person > > Presets > > Player > > Legend Players > > Wide Midfielders (M/AM RL) > > Caju (22 years old) - BRA - 147/172 |
| 19405 | Person | Presets | Cliff Jones (23 years old) - WAL - 147/172 | Lua | Person > > Presets > > Player > > Legend Players > > Wide Midfielders (M/AM RL) > > Cliff Jones (23 years old) - WAL - 147/172 |
| 19398 | Person | Presets | Coen Moulijn (23 years old) - NED - 151/176 | Lua | Person > > Presets > > Player > > Legend Players > > Wide Midfielders (M/AM RL) > > Coen Moulijn (23 years old) - NED - 151/176 |
| 19230 | Person | Presets | Cristiano Ronaldo (18 years old) - POR - 148/198 | Lua | Person > > Presets > > Player > > Legend Players > > Wide Midfielders (M/AM RL) > > Cristiano Ronaldo (18 years old) - POR - 148/198 |
| 19155 | Person | Presets | David Beckham (19 years old) - ENG - 133/178 | Lua | Person > > Presets > > Player > > Legend Players > > Wide Midfielders (M/AM RL) > > David Beckham (19 years old) - ENG - 133/178 |
| 19367 | Person | Presets | Dragan Džajić (22 years old) - SRB - 168/188 | Lua | Person > > Presets > > Player > > Legend Players > > Wide Midfielders (M/AM RL) > > Dragan Džajić (22 years old) - SRB - 168/188 |
| 19370 | Person | Presets | Eden Hazard (17 years old) - BEL - 127/182 | Lua | Person > > Presets > > Player > > Legend Players > > Wide Midfielders (M/AM RL) > > Eden Hazard (17 years old) - BEL - 127/182 |
| 19372 | Person | Presets | Ferenc Bene (22 years old) - HUN - 154/184 | Lua | Person > > Presets > > Player > > Legend Players > > Wide Midfielders (M/AM RL) > > Ferenc Bene (22 years old) - HUN - 154/184 |
| 19380 | Person | Presets | Franck Ribéry (18 years old) - FRA - 130/180 | Lua | Person > > Presets > > Player > > Legend Players > > Wide Midfielders (M/AM RL) > > Franck Ribéry (18 years old) - FRA - 130/180 |
| 19383 | Person | Presets | Franco Causio (22 years old) - ITA - 150/180 | Lua | Person > > Presets > > Player > > Legend Players > > Wide Midfielders (M/AM RL) > > Franco Causio (22 years old) - ITA - 150/180 |
| 19364 | Person | Presets | Gareth Bale (18 years old) - WAL - 134/184 | Lua | Person > > Presets > > Player > > Legend Players > > Wide Midfielders (M/AM RL) > > Gareth Bale (18 years old) - WAL - 134/184 |
| 19228 | Person | Presets | Garrincha (23 years old) - BRA - 167/192 | Lua | Person > > Presets > > Player > > Legend Players > > Wide Midfielders (M/AM RL) > > Garrincha (23 years old) - BRA - 167/192 |
| 19227 | Person | Presets | George Best (22 years old) - NIR - 167/192 | Lua | Person > > Presets > > Player > > Legend Players > > Wide Midfielders (M/AM RL) > > George Best (22 years old) - NIR - 167/192 |
| 19387 | Person | Presets | Giampiero Boniperti (24 years old) - ITA - 160/180 | Lua | Person > > Presets > > Player > > Legend Players > > Wide Midfielders (M/AM RL) > > Giampiero Boniperti (24 years old) - ITA - 160/180 |
| 19382 | Person | Presets | Grzegorz Lato (21 years old) - POL - 145/180 | Lua | Person > > Presets > > Player > > Legend Players > > Wide Midfielders (M/AM RL) > > Grzegorz Lato (21 years old) - POL - 145/180 |
| 23836 | Person | Presets | Heung-Min Son (18 years old) - KOR - 115/170 | Lua | Person > > Presets > > Player > > Legend Players > > Wide Midfielders (M/AM RL) > > Heung-Min Son (18 years old) - KOR - 115/170 |
| 19404 | Person | Presets | Ivan Kolev (23 years old) - BUL - 147/172 | Lua | Person > > Presets > > Player > > Legend Players > > Wide Midfielders (M/AM RL) > > Ivan Kolev (23 years old) - BUL - 147/172 |
| 19381 | Person | Presets | Jair da Rosa (24 years old) - BRA - 160/180 | Lua | Person > > Presets > > Player > > Legend Players > > Wide Midfielders (M/AM RL) > > Jair da Rosa (24 years old) - BRA - 160/180 |
| 19366 | Person | Presets | Jairzinho (22 years old) - BRA - 156/186 | Lua | Person > > Presets > > Player > > Legend Players > > Wide Midfielders (M/AM RL) > > Jairzinho (22 years old) - BRA - 156/186 |
| 23838 | Person | Presets | Ji-Sung Park (19 years old) - KOR - 115/160 | Lua | Person > > Presets > > Player > > Legend Players > > Wide Midfielders (M/AM RL) > > Ji-Sung Park (19 years old) - KOR - 115/160 |
| 19397 | Person | Presets | Juan Joya (23 years old) - PER - 151/176 | Lua | Person > > Presets > > Player > > Legend Players > > Wide Midfielders (M/AM RL) > > Juan Joya (23 years old) - PER - 151/176 |
| 19378 | Person | Presets | Kálmán Konrád (27 years old) - HUN - 178/178 | Lua | Person > > Presets > > Player > > Legend Players > > Wide Midfielders (M/AM RL) > > Kálmán Konrád (27 years old) - HUN - 178/178 |
| 19369 | Person | Presets | Kurt Hamrin (23 years old) - SWE - 162/182 | Lua | Person > > Presets > > Player > > Legend Players > > Wide Midfielders (M/AM RL) > > Kurt Hamrin (23 years old) - SWE - 162/182 |
| 19229 | Person | Presets | Kylian Mbappé (17 years old) - FRA - 139/194 | Lua | Person > > Presets > > Player > > Legend Players > > Wide Midfielders (M/AM RL) > > Kylian Mbappé (17 years old) - FRA - 139/194 |
| 19396 | Person | Presets | Lennart Skoglund (24 years old) - SWE - 161/176 | Lua | Person > > Presets > > Player > > Legend Players > > Wide Midfielders (M/AM RL) > > Lennart Skoglund (24 years old) - SWE - 161/176 |
| 19225 | Person | Presets | Lionel Messi (18 years old) - ARG - 150/200 | Lua | Person > > Presets > > Player > > Legend Players > > Wide Midfielders (M/AM RL) > > Lionel Messi (18 years old) - ARG - 150/200 |
| 19233 | Person | Presets | Luís Figo (19 years old) - POR - 143/188 | Lua | Person > > Presets > > Player > > Legend Players > > Wide Midfielders (M/AM RL) > > Luís Figo (19 years old) - POR - 143/188 |
| 19394 | Person | Presets | Marco Reus (18 years old) - GER - 124/174 | Lua | Person > > Presets > > Player > > Legend Players > > Wide Midfielders (M/AM RL) > > Marco Reus (18 years old) - GER - 124/174 |
| 19403 | Person | Presets | Mario Corso (22 years old) - ITA - 147/172 | Lua | Person > > Presets > > Player > > Legend Players > > Wide Midfielders (M/AM RL) > > Mario Corso (22 years old) - ITA - 147/172 |
| 19232 | Person | Presets | Mohamed Salah (17 years old) - EGY - 122/182 | Lua | Person > > Presets > > Player > > Legend Players > > Wide Midfielders (M/AM RL) > > Mohamed Salah (17 years old) - EGY - 122/182 |
| 19358 | Person | Presets | Neymar (17 years old) - BRA - 140/190 | Lua | Person > > Presets > > Player > > Legend Players > > Wide Midfielders (M/AM RL) > > Neymar (17 years old) - BRA - 140/190 |
| 19371 | Person | Presets | Oleg Blokhin (21 years old) - UKR - 154/184 | Lua | Person > > Presets > > Player > > Legend Players > > Wide Midfielders (M/AM RL) > > Oleg Blokhin (21 years old) - UKR - 154/184 |
| 19365 | Person | Presets | Paco Gento (23 years old) - ESP - 166/186 | Lua | Person > > Presets > > Player > > Legend Players > > Wide Midfielders (M/AM RL) > > Paco Gento (23 years old) - ESP - 166/186 |
| 19407 | Person | Presets | Patsy Gallagher (27 years old) - IRL - 163/168 | Lua | Person > > Presets > > Player > > Legend Players > > Wide Midfielders (M/AM RL) > > Patsy Gallagher (27 years old) - IRL - 163/168 |
| 19391 | Person | Presets | Pierre Littbarski (20 years old) - GER - 142/182 | Lua | Person > > Presets > > Player > > Legend Players > > Wide Midfielders (M/AM RL) > > Pierre Littbarski (20 years old) - GER - 142/182 |
| 19393 | Person | Presets | Raheem Sterling (17 years old) - ENG - 124/174 | Lua | Person > > Presets > > Player > > Legend Players > > Wide Midfielders (M/AM RL) > > Raheem Sterling (17 years old) - ENG - 124/174 |
| 19406 | Person | Presets | Riyad Mahrez (17 years old) - ALG - 106/166 | Lua | Person > > Presets > > Player > > Legend Players > > Wide Midfielders (M/AM RL) > > Riyad Mahrez (17 years old) - ALG - 106/166 |
| 19392 | Person | Presets | Robert Pirès (19 years old) - FRA - 129/174 | Lua | Person > > Presets > > Player > > Legend Players > > Wide Midfielders (M/AM RL) > > Robert Pirès (19 years old) - FRA - 129/174 |
| 19401 | Person | Presets | Roberto Donadoni (20 years old) - ITA - 132/172 | Lua | Person > > Presets > > Player > > Legend Players > > Wide Midfielders (M/AM RL) > > Roberto Donadoni (20 years old) - ITA - 132/172 |
| 19389 | Person | Presets | Ryan Giggs (19 years old) - WAL - 137/182 | Lua | Person > > Presets > > Player > > Legend Players > > Wide Midfielders (M/AM RL) > > Ryan Giggs (19 years old) - WAL - 137/182 |
| 19376 | Person | Presets | Sadio Mané (17 years old) - SEN - 118/178 | Lua | Person > > Presets > > Player > > Legend Players > > Wide Midfielders (M/AM RL) > > Sadio Mané (17 years old) - SEN - 118/178 |
| 19226 | Person | Presets | Stanley Matthews (25 years old) - ENG - 168/188 | Lua | Person > > Presets > > Player > > Legend Players > > Wide Midfielders (M/AM RL) > > Stanley Matthews (25 years old) - ENG - 168/188 |
| 19408 | Person | Presets | Tesourinha (24 years old) - BRA - 148/168 | Lua | Person > > Presets > > Player > > Legend Players > > Wide Midfielders (M/AM RL) > > Tesourinha (24 years old) - BRA - 148/168 |
| 19222 | Person | Presets | Thomas Müller (18 years old) - GER - 128/178 | Lua | Person > > Presets > > Player > > Legend Players > > Wide Midfielders (M/AM RL) > > Thomas Müller (18 years old) - GER - 128/178 |
| 19363 | Person | Presets | Tom Finney (24 years old) - ENG - 159/184 | Lua | Person > > Presets > > Player > > Legend Players > > Wide Midfielders (M/AM RL) > > Tom Finney (24 years old) - ENG - 159/184 |
| 19400 | Person | Presets | Willington Ortíz (21 years old) - COL - 142/172 | Lua | Person > > Presets > > Player > > Legend Players > > Wide Midfielders (M/AM RL) > > Willington Ortíz (21 years old) - COL - 142/172 |
| 19409 | Person | Presets | Zé Roberto (19 years old) - BRA - 125/170 | Lua | Person > > Presets > > Player > > Legend Players > > Wide Midfielders (M/AM RL) > > Zé Roberto (19 years old) - BRA - 125/170 |
| 19368 | Person | Presets | Zoltán Czibor (24 years old) - HUN - 167/182 | Lua | Person > > Presets > > Player > > Legend Players > > Wide Midfielders (M/AM RL) > > Zoltán Czibor (24 years old) - HUN - 167/182 |
| 19416 | Person | Presets | Ademir Menezes (24 years old) - BRA - 166/186 | Lua | Person > > Presets > > Player > > Legend Players > > Strikers (ST) > > Ademir Menezes (24 years old) - BRA - 166/186 |
| 19422 | Person | Presets | Adolfo Baloncieri (27 years old) - ITA - 175/180 | Lua | Person > > Presets > > Player > > Legend Players > > Strikers (ST) > > Adolfo Baloncieri (27 years old) - ITA - 175/180 |
| 23844 | Person | Presets | Adrian Mutu (22 years old) - ROU - 135/169 | Lua | Person > > Presets > > Player > > Legend Players > > Strikers (ST) > > Adrian Mutu (22 years old) - ROU - 135/169 |
| 19492 | Person | Presets | Adriano (18 years old) - BRA - 125/170 | Lua | Person > > Presets > > Player > > Legend Players > > Strikers (ST) > > Adriano (18 years old) - BRA - 125/170 |
| 19429 | Person | Presets | Alan Shearer (19 years old) - ENG - 135/180 | Lua | Person > > Presets > > Player > > Legend Players > > Strikers (ST) > > Alan Shearer (19 years old) - ENG - 135/180 |
| 19411 | Person | Presets | Alberto Spencer (23 years old) - ECU - 159/184 | Lua | Person > > Presets > > Player > > Legend Players > > Strikers (ST) > > Alberto Spencer (23 years old) - ECU - 159/184 |
| 19212 | Person | Presets | Alessandro Del Piero (19 years old) - ITA - 142/182 | Lua | Person > > Presets > > Player > > Legend Players > > Strikers (ST) > > Alessandro Del Piero (19 years old) - ITA - 142/182 |
| 19286 | Person | Presets | Alfredo Di Stéfano (24 years old) - ESP - 176/196 | Lua | Person > > Presets > > Player > > Legend Players > > Strikers (ST) > > Alfredo Di Stéfano (24 years old) - ESP - 176/196 |
| 19200 | Person | Presets | Andriy Shevchenko (19 years old) - UKR - 141/186 | Lua | Person > > Presets > > Player > > Legend Players > > Strikers (ST) > > Andriy Shevchenko (19 years old) - UKR - 141/186 |
| 19427 | Person | Presets | Ángel Labruna (25 years old) - ARG - 167/182 | Lua | Person > > Presets > > Player > > Legend Players > > Strikers (ST) > > Ángel Labruna (25 years old) - ARG - 167/182 |
| 19457 | Person | Presets | Anthony Yeboah (20 years old) - GHA - 128/168 | Lua | Person > > Presets > > Player > > Legend Players > > Strikers (ST) > > Anthony Yeboah (20 years old) - GHA - 128/168 |
| 19431 | Person | Presets | Arthur Friedenreich (27 years old) - BRA - 175/180 | Lua | Person > > Presets > > Player > > Legend Players > > Strikers (ST) > > Arthur Friedenreich (27 years old) - BRA - 175/180 |
| 19410 | Person | Presets | Bum-Kun Cha (21 years old) - KOR - 135/170 | Lua | Person > > Presets > > Player > > Legend Players > > Strikers (ST) > > Bum-Kun Cha (21 years old) - KOR - 135/170 |
| 19444 | Person | Presets | Carlos Tevez (18 years old) - ARG - 131/176 | Lua | Person > > Presets > > Player > > Legend Players > > Strikers (ST) > > Carlos Tevez (18 years old) - ARG - 131/176 |
| 19224 | Person | Presets | Charlie Buchan (27 years old) - ENG - 176/176 | Lua | Person > > Presets > > Player > > Legend Players > > Strikers (ST) > > Charlie Buchan (27 years old) - ENG - 176/176 |
| 19436 | Person | Presets | Christian Vieri (19 years old) - ITA - 133/178 | Lua | Person > > Presets > > Player > > Legend Players > > Strikers (ST) > > Christian Vieri (19 years old) - ITA - 133/178 |
| 19449 | Person | Presets | Darko Pancev (20 years old) - MKD - 134/174 | Lua | Person > > Presets > > Player > > Legend Players > > Strikers (ST) > > Darko Pancev (20 years old) - MKD - 134/174 |
| 19399 | Person | Presets | David Jack (27 years old) - ENG - 167/172 | Lua | Person > > Presets > > Player > > Legend Players > > Strikers (ST) > > David Jack (27 years old) - ENG - 167/172 |
| 19441 | Person | Presets | David Trezeguet (19 years old) - FRA - 133/178 | Lua | Person > > Presets > > Player > > Legend Players > > Strikers (ST) > > David Trezeguet (19 years old) - FRA - 133/178 |
| 19435 | Person | Presets | David Villa (18 years old) - ESP - 128/178 | Lua | Person > > Presets > > Player > > Legend Players > > Strikers (ST) > > David Villa (18 years old) - ESP - 128/178 |
| 19421 | Person | Presets | Denis Law (22 years old) - SCO - 154/184 | Lua | Person > > Presets > > Player > > Legend Players > > Strikers (ST) > > Denis Law (22 years old) - SCO - 154/184 |
| 19208 | Person | Presets | Dennis Bergkamp (20 years old) - NED - 144/184 | Lua | Person > > Presets > > Player > > Legend Players > > Strikers (ST) > > Dennis Bergkamp (20 years old) - NED - 144/184 |
| 19218 | Person | Presets | Didier Drogba (19 years old) - CIV - 130/180 | Lua | Person > > Presets > > Player > > Legend Players > > Strikers (ST) > > Didier Drogba (19 years old) - CIV - 130/180 |
| 19434 | Person | Presets | Dimitar Berbatov (18 years old) - BUL - 127/172 | Lua | Person > > Presets > > Player > > Legend Players > > Strikers (ST) > > Dimitar Berbatov (18 years old) - BUL - 127/172 |
| 19450 | Person | Presets | Diego Forlán (19 years old) - URU - 133/178 | Lua | Person > > Presets > > Player > > Legend Players > > Strikers (ST) > > Diego Forlán (19 years old) - URU - 133/178 |
| 19247 | Person | Presets | Dixie Dean (26 years old) - ENG - 174/184 | Lua | Person > > Presets > > Player > > Legend Players > > Strikers (ST) > > Dixie Dean (26 years old) - ENG - 174/184 |
| 19445 | Person | Presets | Edin Džeko (18 years old) - BIH - 122/172 | Lua | Person > > Presets > > Player > > Legend Players > > Strikers (ST) > > Edin Džeko (18 years old) - BIH - 122/172 |
| 19452 | Person | Presets | Edinson Cavani (18 years old) - URU - 126/176 | Lua | Person > > Presets > > Player > > Legend Players > > Strikers (ST) > > Edinson Cavani (18 years old) - URU - 126/176 |
| 23843 | Person | Presets | Eiður Guðjohnsen (22 years old) - ISL - 140/166 | Lua | Person > > Presets > > Player > > Legend Players > > Strikers (ST) > > Eiður Guðjohnsen (22 years old) - ISL - 140/166 |
| 19219 | Person | Presets | Éric Cantona (20 years old) - FRA - 140/180 | Lua | Person > > Presets > > Player > > Legend Players > > Strikers (ST) > > Éric Cantona (20 years old) - FRA - 140/180 |
| 19418 | Person | Presets | Ernst Kuzorra (26 years old) - GER - 177/182 | Lua | Person > > Presets > > Player > > Legend Players > > Strikers (ST) > > Ernst Kuzorra (26 years old) - GER - 177/182 |
| 19191 | Person | Presets | Eusébio (22 years old) - POR - 164/194 | Lua | Person > > Presets > > Player > > Legend Players > > Strikers (ST) > > Eusébio (22 years old) - POR - 164/194 |
| 19195 | Person | Presets | Ferenc Puskás (24 years old) - HUN - 175/190 | Lua | Person > > Presets > > Player > > Legend Players > > Strikers (ST) > > Ferenc Puskás (24 years old) - HUN - 175/190 |
| 19442 | Person | Presets | Fernando Peyroteo (25 years old) - POR - 161/176 | Lua | Person > > Presets > > Player > > Legend Players > > Strikers (ST) > > Fernando Peyroteo (25 years old) - POR - 161/176 |
| 19451 | Person | Presets | Fernando Torres (18 years old) - ESP - 124/174 | Lua | Person > > Presets > > Player > > Legend Players > > Strikers (ST) > > Fernando Torres (18 years old) - ESP - 124/174 |
| 19454 | Person | Presets | Filippo Inzaghi (19 years old) - ITA - 127/172 | Lua | Person > > Presets > > Player > > Legend Players > > Strikers (ST) > > Filippo Inzaghi (19 years old) - ITA - 127/172 |
| 19282 | Person | Presets | Flórián Albert (22 years old) - HUN - 156/186 | Lua | Person > > Presets > > Player > > Legend Players > > Strikers (ST) > > Flórián Albert (22 years old) - HUN - 156/186 |
| 19210 | Person | Presets | Gabriel Batistuta (20 years old) - ARG - 142/182 | Lua | Person > > Presets > > Player > > Legend Players > > Strikers (ST) > > Gabriel Batistuta (20 years old) - ARG - 142/182 |
| 19223 | Person | Presets | Gary Lineker (20 years old) - ENG - 138/178 | Lua | Person > > Presets > > Player > > Legend Players > > Strikers (ST) > > Gary Lineker (20 years old) - ENG - 138/178 |
| 19207 | Person | Presets | George Weah (20 years old) - LBR - 139/184 | Lua | Person > > Presets > > Player > > Legend Players > > Strikers (ST) > > George Weah (20 years old) - LBR - 139/184 |
| 19425 | Person | Presets | Georgi Asparuhov (22 years old) - BUL - 155/180 | Lua | Person > > Presets > > Player > > Legend Players > > Strikers (ST) > > Georgi Asparuhov (22 years old) - BUL - 155/180 |
| 19188 | Person | Presets | Gerd Müller (22 years old) - GER - 162/192 | Lua | Person > > Presets > > Player > > Legend Players > > Strikers (ST) > > Gerd Müller (22 years old) - GER - 162/192 |
| 19170 | Person | Presets | Giuseppe Meazza (25 years old) - ITA - 182/192 | Lua | Person > > Presets > > Player > > Legend Players > > Strikers (ST) > > Giuseppe Meazza (25 years old) - ITA - 182/192 |
| 19440 | Person | Presets | Gonzalo Higuaín (18 years old) - ARG - 128/178 | Lua | Person > > Presets > > Player > > Legend Players > > Strikers (ST) > > Gonzalo Higuaín (18 years old) - ARG - 128/178 |
| 19414 | Person | Presets | Gunnar Nordahl (24 years old) - SWE - 166/186 | Lua | Person > > Presets > > Player > > Legend Players > > Strikers (ST) > > Gunnar Nordahl (24 years old) - SWE - 166/186 |
| 19304 | Person | Presets | Gyula Zsengellér (25 years old) - HUN - 167/182 | Lua | Person > > Presets > > Player > > Legend Players > > Strikers (ST) > > Gyula Zsengellér (25 years old) - HUN - 167/182 |
| 19284 | Person | Presets | Harry Kane (17 years old) - ENG - 127/182 | Lua | Person > > Presets > > Player > > Legend Players > > Strikers (ST) > > Harry Kane (17 years old) - ENG - 127/182 |
| 19439 | Person | Presets | Hernán Crespo (19 years old) - ARG - 133/178 | Lua | Person > > Presets > > Player > > Legend Players > > Strikers (ST) > > Hernán Crespo (19 years old) - ARG - 133/178 |
| 19202 | Person | Presets | Hristo Stoichkov (20 years old) - BUL - 146/186 | Lua | Person > > Presets > > Player > > Legend Players > > Strikers (ST) > > Hristo Stoichkov (20 years old) - BUL - 146/186 |
| 19412 | Person | Presets | Hugo Sánchez (21 years old) - MEX - 149/184 | Lua | Person > > Presets > > Player > > Legend Players > > Strikers (ST) > > Hugo Sánchez (21 years old) - MEX - 149/184 |
| 19419 | Person | Presets | Ian Rush (20 years old) - WAL - 138/178 | Lua | Person > > Presets > > Player > > Legend Players > > Strikers (ST) > > Ian Rush (20 years old) - WAL - 138/178 |
| 19437 | Person | Presets | Imre Schlosser (28 years old) - HUN - 178/178 | Lua | Person > > Presets > > Player > > Legend Players > > Strikers (ST) > > Imre Schlosser (28 years old) - HUN - 178/178 |
| 19433 | Person | Presets | Isidro Lángara (25 years old) - ESP - 170/180 | Lua | Person > > Presets > > Player > > Legend Players > > Strikers (ST) > > Isidro Lángara (25 years old) - ESP - 170/180 |
| 19136 | Person | Presets | John Charles (23 years old) - WAL - 157/182 | Lua | Person > > Presets > > Player > > Legend Players > > Strikers (ST) > > John Charles (23 years old) - WAL - 157/182 |
| 19447 | Person | Presets | José Piendibene (27 years old) - URU - 174/174 | Lua | Person > > Presets > > Player > > Legend Players > > Strikers (ST) > > José Piendibene (27 years old) - URU - 174/174 |
| 19198 | Person | Presets | Josef Bican (25 years old) - AUT - 178/188 | Lua | Person > > Presets > > Player > > Legend Players > > Strikers (ST) > > Josef Bican (25 years old) - AUT - 178/188 |
| 19424 | Person | Presets | Josip Skoblar (22 years old) - CRO - 145/180 | Lua | Person > > Presets > > Player > > Legend Players > > Strikers (ST) > > Josip Skoblar (22 years old) - CRO - 145/180 |
| 19221 | Person | Presets | Jupp Heynckes (22 years old) - GER - 150/180 | Lua | Person > > Presets > > Player > > Legend Players > > Strikers (ST) > > Jupp Heynckes (22 years old) - GER - 150/180 |
| 19216 | Person | Presets | Jürgen Klinsmann (20 years old) - GER - 142/182 | Lua | Person > > Presets > > Player > > Legend Players > > Strikers (ST) > > Jürgen Klinsmann (20 years old) - GER - 142/182 |
| 19199 | Person | Presets | Karl-Heinz Rummenigge (21 years old) - GER - 153/188 | Lua | Person > > Presets > > Player > > Legend Players > > Strikers (ST) > > Karl-Heinz Rummenigge (21 years old) - GER - 153/188 |
| 23839 | Person | Presets | Kazuyoshi Miura (23 years old) - JPN - 150/158 | Lua | Person > > Presets > > Player > > Legend Players > > Strikers (ST) > > Kazuyoshi Miura (23 years old) - JPN - 150/158 |
| 19204 | Person | Presets | Kenny Dalglish (21 years old) - SCO - 149/184 | Lua | Person > > Presets > > Player > > Legend Players > > Strikers (ST) > > Kenny Dalglish (21 years old) - SCO - 149/184 |
| 19178 | Person | Presets | László Kubala (24 years old) - ESP - 170/190 | Lua | Person > > Presets > > Player > > Legend Players > > Strikers (ST) > > László Kubala (24 years old) - ESP - 170/190 |
| 19196 | Person | Presets | Leônidas (25 years old) - BRA - 178/188 | Lua | Person > > Presets > > Player > > Legend Players > > Strikers (ST) > > Leônidas (25 years old) - BRA - 178/188 |
| 19455 | Person | Presets | Luca Toni (19 years old) - ITA - 125/170 | Lua | Person > > Presets > > Player > > Legend Players > > Strikers (ST) > > Luca Toni (19 years old) - ITA - 125/170 |
| 19201 | Person | Presets | Luis Suárez (18 years old) - URU - 136/186 | Lua | Person > > Presets > > Player > > Legend Players > > Strikers (ST) > > Luis Suárez (18 years old) - URU - 136/186 |
| 19190 | Person | Presets | Marco van Basten (20 years old) - NED - 154/194 | Lua | Person > > Presets > > Player > > Legend Players > > Strikers (ST) > > Marco van Basten (20 years old) - NED - 154/194 |
| 19206 | Person | Presets | Mario Kempes (21 years old) - ARG - 149/184 | Lua | Person > > Presets > > Player > > Legend Players > > Strikers (ST) > > Mario Kempes (21 years old) - ARG - 149/184 |
| 19172 | Person | Presets | Matthias Sindelar (26 years old) - AUT - 180/190 | Lua | Person > > Presets > > Player > > Legend Players > > Strikers (ST) > > Matthias Sindelar (26 years old) - AUT - 180/190 |
| 19443 | Person | Presets | Michael Owen (19 years old) - ENG - 141/176 | Lua | Person > > Presets > > Player > > Legend Players > > Strikers (ST) > > Michael Owen (19 years old) - ENG - 141/176 |
| 23834 | Person | Presets | Mido (22 years old) - EGY - 140/168 | Lua | Person > > Presets > > Player > > Legend Players > > Strikers (ST) > > Mido (22 years old) - EGY - 140/168 |
| 19448 | Person | Presets | Miroslav Klose (19 years old) - GER - 129/174 | Lua | Person > > Presets > > Player > > Legend Players > > Strikers (ST) > > Miroslav Klose (19 years old) - GER - 129/174 |
| 19430 | Person | Presets | Nat Lofthouse (24 years old) - ENG - 165/180 | Lua | Person > > Presets > > Player > > Legend Players > > Strikers (ST) > > Nat Lofthouse (24 years old) - ENG - 165/180 |
| 19432 | Person | Presets | Oldrich Nejedly (26 years old) - CZE - 170/180 | Lua | Person > > Presets > > Player > > Legend Players > > Strikers (ST) > > Oldrich Nejedly (26 years old) - CZE - 170/180 |
| 23846 | Person | Presets | Ole Gunnar Solskjær (22 years old) - NOR - 140/165 | Lua | Person > > Presets > > Player > > Legend Players > > Strikers (ST) > > Ole Gunnar Solskjær (22 years old) - NOR - 140/165 |
| 23832 | Person | Presets | Paolo Wanchope (22 years old) - CRC - 140/156 | Lua | Person > > Presets > > Player > > Legend Players > > Strikers (ST) > > Paolo Wanchope (22 years old) - CRC - 140/156 |
| 19420 | Person | Presets | Patrick Kluivert (19 years old) - NED - 125/170 | Lua | Person > > Presets > > Player > > Legend Players > > Strikers (ST) > > Patrick Kluivert (19 years old) - NED - 125/170 |
| 19456 | Person | Presets | Paul Van Himst (22 years old) - BEL - 159/184 | Lua | Person > > Presets > > Player > > Legend Players > > Strikers (ST) > > Paul Van Himst (22 years old) - BEL - 159/184 |
| 19164 | Person | Presets | Pelé (22 years old) - BRA - 180/200 | Lua | Person > > Presets > > Player > > Legend Players > > Strikers (ST) > > Pelé (22 years old) - BRA - 180/200 |
| 19446 | Person | Presets | Pierre-Emerick Aubameyang (18 years old) - GAB - 124/174 | Lua | Person > > Presets > > Player > > Legend Players > > Strikers (ST) > > Pierre-Emerick Aubameyang (18 years old) - GAB - 124/174 |
| 19203 | Person | Presets | Radamel Falcao (18 years old) - COL - 122/172 | Lua | Person > > Presets > > Player > > Legend Players > > Strikers (ST) > > Radamel Falcao (18 years old) - COL - 122/172 |
| 19453 | Person | Presets | Raúl (19 years old) - ESP - 144/184 | Lua | Person > > Presets > > Player > > Legend Players > > Strikers (ST) > > Raúl (19 years old) - ESP - 144/184 |
| 19423 | Person | Presets | Raymond Braine (26 years old) - BEL - 170/180 | Lua | Person > > Presets > > Player > > Legend Players > > Strikers (ST) > > Raymond Braine (26 years old) - BEL - 170/180 |
| 19181 | Person | Presets | Rivaldo (19 years old) - BRA - 143/188 | Lua | Person > > Presets > > Player > > Legend Players > > Strikers (ST) > > Rivaldo (19 years old) - BRA - 143/188 |
| 19205 | Person | Presets | Robert Lewandowski (18 years old) - POL - 129/184 | Lua | Person > > Presets > > Player > > Legend Players > > Strikers (ST) > > Robert Lewandowski (18 years old) - POL - 129/184 |
| 19174 | Person | Presets | Roberto Baggio (20 years old) - ITA - 150/190 | Lua | Person > > Presets > > Player > > Legend Players > > Strikers (ST) > > Roberto Baggio (20 years old) - ITA - 150/190 |
| 19413 | Person | Presets | Roberto Bettega (21 years old) - ITA - 145/180 | Lua | Person > > Presets > > Player > > Legend Players > > Strikers (ST) > > Roberto Bettega (21 years old) - ITA - 145/180 |
| 19220 | Person | Presets | Robin van Persie (18 years old) - NED - 125/180 | Lua | Person > > Presets > > Player > > Legend Players > > Strikers (ST) > > Robin van Persie (18 years old) - NED - 125/180 |
| 23833 | Person | Presets | Roger Milla (22 years old) - CMR - 149/168 | Lua | Person > > Presets > > Player > > Legend Players > > Strikers (ST) > > Roger Milla (22 years old) - CMR - 149/168 |
| 19189 | Person | Presets | Romário (20 years old) - BRA - 152/192 | Lua | Person > > Presets > > Player > > Legend Players > > Strikers (ST) > > Romário (20 years old) - BRA - 152/192 |
| 19192 | Person | Presets | Ronaldo (19 years old) - BRA - 156/196 | Lua | Person > > Presets > > Player > > Legend Players > > Strikers (ST) > > Ronaldo (19 years old) - BRA - 156/196 |
| 19428 | Person | Presets | Rudi Völler (20 years old) - GER - 142/182 | Lua | Person > > Presets > > Player > > Legend Players > > Strikers (ST) > > Rudi Völler (20 years old) - GER - 142/182 |
| 19213 | Person | Presets | Ruud van Nistelrooij (19 years old) - NED - 137/182 | Lua | Person > > Presets > > Player > > Legend Players > > Strikers (ST) > > Ruud van Nistelrooij (19 years old) - NED - 137/182 |
| 19211 | Person | Presets | Samuel Eto'o (18 years old) - CMR - 132/182 | Lua | Person > > Presets > > Player > > Legend Players > > Strikers (ST) > > Samuel Eto'o (18 years old) - CMR - 132/182 |
| 19415 | Person | Presets | Sándor Kocsis (24 years old) - HUN - 166/186 | Lua | Person > > Presets > > Player > > Legend Players > > Strikers (ST) > > Sándor Kocsis (24 years old) - HUN - 166/186 |
| 19214 | Person | Presets | Sergio Agüero (18 years old) - ARG - 137/182 | Lua | Person > > Presets > > Player > > Legend Players > > Strikers (ST) > > Sergio Agüero (18 years old) - ARG - 137/182 |
| 19426 | Person | Presets | Silvio Piola (25 years old) - ITA - 172/182 | Lua | Person > > Presets > > Player > > Legend Players > > Strikers (ST) > > Silvio Piola (25 years old) - ITA - 172/182 |
| 19193 | Person | Presets | Thierry Henry (19 years old) - FRA - 143/188 | Lua | Person > > Presets > > Player > > Legend Players > > Strikers (ST) > > Thierry Henry (19 years old) - FRA - 143/188 |
| 19417 | Person | Presets | Tostão (22 years old) - BRA - 166/186 | Lua | Person > > Presets > > Player > > Legend Players > > Strikers (ST) > > Tostão (22 years old) - BRA - 166/186 |
| 19194 | Person | Presets | Uwe Seeler (23 years old) - GER - 165/190 | Lua | Person > > Presets > > Player > > Legend Players > > Strikers (ST) > > Uwe Seeler (23 years old) - GER - 165/190 |
| 19217 | Person | Presets | Wayne Rooney (18 years old) - ENG - 142/182 | Lua | Person > > Presets > > Player > > Legend Players > > Strikers (ST) > > Wayne Rooney (18 years old) - ENG - 142/182 |
| 19438 | Person | Presets | Włodzimierz Lubański (22 years old) - POL - 153/178 | Lua | Person > > Presets > > Player > > Legend Players > > Strikers (ST) > > Włodzimierz Lubański (22 years old) - POL - 153/178 |
| 19197 | Person | Presets | Zlatan Ibrahimovic (18 years old) - SWE - 138/188 | Lua | Person > > Presets > > Player > > Legend Players > > Strikers (ST) > > Zlatan Ibrahimovic (18 years old) - SWE - 138/188 |
| 13083 | Person | Presets | Open in Dissect Data | Lua | Person > > Presets > > Player > > Open in Dissect Data |
| 12524 | Person | Presets | Generate a DOF | Lua | Person > > Presets > > Non-Player > > Generate a DOF |
| 17984 | Person | Presets | Generate a Technical Director | Lua | Person > > Presets > > Non-Player > > Generate a Technical Director |
| 12823 | Person | Presets | Generate a Scout | Lua | Person > > Presets > > Non-Player > > Generate a Scout |
| 20704 | Person | Presets | Generate a Performance Analyst | Lua | Person > > Presets > > Non-Player > > Generate a Performance Analyst |
| 20705 | Person | Presets | Generate a Recruitment Analyst | Lua | Person > > Presets > > Non-Player > > Generate a Recruitment Analyst |
| 20706 | Person | Presets | Generate a Loan Manager | Lua | Person > > Presets > > Non-Player > > Generate a Loan Manager |
| 12554 | Person | Presets | Generate a Physio | Lua | Person > > Presets > > Non-Player > > Generate a Physio |
| 18043 | Person | Presets | Generate a Sports Scientist | Lua | Person > > Presets > > Non-Player > > Generate a Sports Scientist |
| 12549 | Person | Presets | Generate a Coach (General) | Lua | Person > > Presets > > Non-Player > > Generate a Coach (General) |
| 20702 | Person | Presets | Generate a Coach (Attacking) | Lua | Person > > Presets > > Non-Player > > Generate a Coach (Attacking) |
| 20703 | Person | Presets | Generate a Coach (Defending) | Lua | Person > > Presets > > Non-Player > > Generate a Coach (Defending) |
| 20700 | Person | Presets | Generate a Coach (Tactical) | Lua | Person > > Presets > > Non-Player > > Generate a Coach (Tactical) |
| 20699 | Person | Presets | Generate a Coach (Technical) | Lua | Person > > Presets > > Non-Player > > Generate a Coach (Technical) |
| 20701 | Person | Presets | Generate a Coach (Mental) | Lua | Person > > Presets > > Non-Player > > Generate a Coach (Mental) |
| 17985 | Person | Presets | Generate a Fitness Coach | Lua | Person > > Presets > > Non-Player > > Generate a Fitness Coach |
| 18042 | Person | Presets | Generate a Goalkeeping Coach | Lua | Person > > Presets > > Non-Player > > Generate a Goalkeeping Coach |
| 24076 | Person | Presets | Maximize Scouting Knowledge Level | Lua | Person > > Presets > > Non-Player > > Maximize Scouting Knowledge Level |
| 13085 | Person | Presets | Open in Dissect Data | Lua | Person > > Presets > > Non-Player > > Open in Dissect Data |
| 23767 | Person | Presets | Improve Player Partnerships | Lua | Person > > Presets > > Manager > > Improve Player Partnerships |
| 19897 | Person | Presets | Add Managing Club to Freezer | Lua, freeze | Person > > Presets > > Manager > > Add Managing Club to Freezer |
| 17759 | Person | Presets | Open in Dissect Data | Lua | Person > > Presets > > Manager > > Open in Dissect Data |
| 11331 | Person | Contract | Bonuses & Clauses > | Lua | Person > > Contract > > Full Contract > > Bonuses & Clauses > |
| 16863 | Person | Transfers | Transfers > | Lua | Person > > Transfers > |
| 22739 | Person | Person Data | Career Plans > | Lua | Person > > Person Data > > Career Plans > |
| 23249 | Person | Person Data | Add Career Plans | Lua | Person > > Person Data > > Career Plans > > Add Career Plans |
| 18072 | Person | Person Data | Days At Club / In Nation > | Lua | Person > > Person Data > > Days At Club / In Nation > |
| 20100 | Person | Person Data | Eligibility > | Lua | Person > > Person Data > > Eligibility > |
| 23264 | Person | Person Data | Add Eligibility | Lua | Person > > Person Data > > Eligibility > > Add Eligibility |
| 24077 | Person | Person Data | Languages > | Lua | Person > > Person Data > > Languages > |
| 11071 | Person | Person Data | Relationships > | Lua | Person > > Person Data > > Relationships > |
| 23618 | Person | Person Data | Add Relationships | Lua | Person > > Person Data > > Relationships > > Add Relationships |
| 20109 | Person | Person Data | Status > | Lua | Person > > Person Data > > Status > |
| 23825 | Person | Player Data | Show Attributes 1 - 100 | Lua | Person > > Player Data > > Attributes > > Show Attributes 1 - 100 |
| 12620 | Person | Staff Data | Tendencies > | Lua | Person > > Staff Data > > Tendencies > |
| 24053 | Person | Staff Data | Knowledge > | Lua | Person > > Staff Data > > Knowledge > |
| 17204 | Stadium |  | Stadium > | Lua, write | Stadium > |
| 18023 | Stadium | Presets | Appereance - All Corners/All Seated/Roof | Lua | Stadium > > Presets > > Appereance - All Corners/All Seated/Roof |
| 18028 | Stadium | Presets | Appereance - All Corners/All Seated/No Roof | Lua | Stadium > > Presets > > Appereance - All Corners/All Seated/No Roof |
| 19966 | Stadium | Presets | Stadium Setting - Grass/Synthetic Mix/Very Good/Has Digital Ad Hoarding | Lua, write | Stadium > > Presets > > Stadium Setting - Grass/Synthetic Mix/Very Good/Has Digital Ad Hoarding |
| 18025 | Stadium | Presets | Open in Dissect Data | Lua | Stadium > > Presets > > Open in Dissect Data |
| 19898 | Freezer | Freezer (Off) | Freezer (Off) | Lua, freeze | Freezer > > Freezer (Off) |
| 13203 | Database List | Agreement | Agreement > | Lua | Database List > > Agreement > |
| 13202 | Database List | Continent | Continent > | Lua | Database List > > Continent > |
| 17811 | Database List | Future Transfer | Future Transfer > | Lua | Database List > > Future Transfer > |
| 17785 | Database List | Hall of Fame | Hall of Fame > | Lua | Database List > > Hall of Fame > |
| 17654 | Database List | Human Manager | Human Manager > | Lua | Database List > > Human Manager > |
| 13089 | Database List | Region | Region > | Lua | Database List > > Region > |
| 18041 | Print List | People w/ Freeze Attributes Flag | People w/ Freeze Attributes Flag | Lua, freeze | Print List > > People w/ Freeze Attributes Flag |
| 19600 | Print List | People w/ Professionalism Hacked | People w/ Professionalism Hacked | Lua | Print List > > People w/ Professionalism Hacked |
| 20096 | Print List | Talented Regens | Talented Regens | Lua | Print List > > Talented Regens |
| 19945 | Useful Tools | Open Comparison GUI | Open Comparison GUI | Lua | Useful Tools > > Open Comparison GUI |
| 22761 | Useful Tools | Open Mass Edit Manager | Open Mass Edit Manager | Lua | Useful Tools > > Open Mass Edit Manager |
| 22762 | Useful Tools | Open Swap Manager | Open Swap Manager | Lua | Useful Tools > > Open Swap Manager |
| 19946 | Useful Tools | Open Mini Scouting Tool GUI | Open Mini Scouting Tool GUI | Lua | Useful Tools > > Open Mini Scouting Tool GUI |
| 20696 | Presets (Global) | Accelerate Player Development | Accelerate Player Development | Lua | Presets (Global) > > Accelerate Player Development |
| 23770 | Presets (Global) | Accelerate Player Development | 1. Notes | Lua | Presets (Global) > > Accelerate Player Development > 1. Notes |
| 23685 | Presets (Global) | Accelerate Player Development | Search Item | AA | Presets (Global) > > Accelerate Player Development > 2. Setup - Items List > Search Item |
| 24316 | Presets (Global) | Accelerate Player Development | Export All Items | AA | Presets (Global) > > Accelerate Player Development > 2. Setup - Items List > Export All Items |
| 24315 | Presets (Global) | Accelerate Player Development | Import Items | AA | Presets (Global) > > Accelerate Player Development > 2. Setup - Items List > Import Items |
| 23635 | Presets (Global) | Golden Generation | Golden Generation | Lua, write | Presets (Global) > > Golden Generation |
| 23768 | Presets (Global) | Golden Generation | 1. Notes | Lua | Presets (Global) > > Golden Generation > 1. Notes |
| 24006 | Presets (Global) | Golden Generation | Search | AA | Presets (Global) > > Golden Generation > 2. Setup > Items List > > Search |
| 23934 | Presets (Global) | On-Match Player Ability Modifier | On-Match Player Ability Modifier | Lua | Presets (Global) > > On-Match Player Ability Modifier |
| 23935 | Presets (Global) | On-Match Player Ability Modifier | 1. Notes | Lua | Presets (Global) > > On-Match Player Ability Modifier > 1. Notes |
| 24080 | Presets (Global) | On-Match Player Ability Modifier | Search Item | AA | Presets (Global) > > On-Match Player Ability Modifier > 2. Setup - Items List > Search Item |
| 24360 | Presets (Global) | On-Match Player Ability Modifier | Export All Items | AA | Presets (Global) > > On-Match Player Ability Modifier > 2. Setup - Items List > Export All Items |
| 24359 | Presets (Global) | On-Match Player Ability Modifier | Import Items | AA | Presets (Global) > > On-Match Player Ability Modifier > 2. Setup - Items List > Import Items |
| 17839 | Presets (Global) | Force Board to Accept Your Requests (Including Club Vision) | Force Board to Accept Your Requests (Including Club Vision) | AA | Presets (Global) > > Force Board to Accept Your Requests (Including Club Vision) |
| 24406 | Presets (Global) | Force Board to Accept Your Requests (Including Club Vision) | 1. Notes | Lua | Presets (Global) > > Force Board to Accept Your Requests (Including Club Vision) > 1. Notes |
| 22720 | Presets (Global) | Force Players and Staff to Accept Your Contract Offers | Force Players and Staff to Accept Your Contract Offers | AA | Presets (Global) > > Force Players and Staff to Accept Your Contract Offers |
| 24405 | Presets (Global) | Force Players and Staff to Accept Your Contract Offers | 1. Notes | Lua | Presets (Global) > > Force Players and Staff to Accept Your Contract Offers > 1. Notes |
| 23766 | Presets (Global) | Force Other Clubs to Accept Your Transfer Offers | Force Other Clubs to Accept Your Transfer Offers | AA | Presets (Global) > > Force Other Clubs to Accept Your Transfer Offers |
| 23769 | Presets (Global) | Force Other Clubs to Accept Your Transfer Offers | 1. Instructions | Lua | Presets (Global) > > Force Other Clubs to Accept Your Transfer Offers > 1. Instructions |
| 24042 | Presets (Global) | No Work Permits | No Work Permits | AA | Presets (Global) > > No Work Permits |
| 24043 | Presets (Global) | No Work Permits | 1. Notes | Lua | Presets (Global) > > No Work Permits > 1. Notes |
| 24044 | Presets (Global) | No Transfer Windows | No Transfer Windows | AA | Presets (Global) > > No Transfer Windows |
| 24045 | Presets (Global) | No Transfer Windows | 1. Notes | Lua | Presets (Global) > > No Transfer Windows > 1. Notes |
| 24046 | Presets (Global) | No Loan Restrictions | No Loan Restrictions | AA | Presets (Global) > > No Loan Restrictions |
| 24047 | Presets (Global) | No Loan Restrictions | 1. Notes | Lua | Presets (Global) > > No Loan Restrictions > 1. Notes |
| 24048 | Presets (Global) | Nationality Restrictions Lifted | Nationality Restrictions Lifted | AA | Presets (Global) > > Nationality Restrictions Lifted |
| 24049 | Presets (Global) | Nationality Restrictions Lifted | 1. Instructions | Lua | Presets (Global) > > Nationality Restrictions Lifted > 1. Instructions |
| 23978 | Presets (Global) | Override and Max Out Extra Staff Limit | Override and Max Out Extra Staff Limit | AA | Presets (Global) > > Override and Max Out Extra Staff Limit |
| 23979 | Presets (Global) | Override and Max Out Extra Staff Limit | 1. Instructions | Lua | Presets (Global) > > Override and Max Out Extra Staff Limit > 1. Instructions |
| 17843 | Presets (Global) | Ignore Player Retirement | Ignore Player Retirement | Lua, write, symbol | Presets (Global) > > Ignore Player Retirement |
| 20739 | Presets (Global) | Ignore Player Retirement | Get My Club UID | Lua, write | Presets (Global) > > Ignore Player Retirement > 1. Setup > Club UID > Get My Club UID |
| 20741 | Presets (Global) | Ignore Player Retirement | 2. Apply | AA | Presets (Global) > > Ignore Player Retirement > 2. Apply |
| 1930 | Table Settings |  | Table Settings > | AA | Table Settings > |
| 18992 | Table Settings | Add Drop Down List Item | Add Drop Down List Item | Lua | Table Settings > > Add Drop Down List Item |
| 20669 | Table Settings | Pointer Code Locations | Pointer Code Locations | AOB hook, symbol | Table Settings > > Pointer Code Locations |
| 12109 | Table Settings | Savegame Check | Savegame Check | Lua | Table Settings > > Savegame Check |
| 19947 | Table Settings | Table Timer | Table Timer | Lua | Table Settings > > Table Timer |
| 23688 | Table Settings | Update Global Pointers | Update Global Pointers | Lua | Table Settings > > Update Global Pointers |
| 1 | Table Settings | Update On Focus Change or Hover Tooltip | Update On Focus Change or Hover Tooltip | AOB hook, focus/select, symbol | Table Settings > > Update On Focus Change or Hover Tooltip |
| 24269 | Table Settings | Create Currency Data Types | Create Currency Data Types | Lua | Table Settings > > Create Currency Data Types |
| 24282 | Table Settings | Change Currency | Change Currency | Lua | Table Settings > > Change Currency |
| 17809 | Table Settings | Reload Settings | Reload Settings | Lua | Table Settings > > Reload Settings |
| 17805 | Table Settings | Debug | Game Module Info | Lua | Table Settings > > Debug > > Game Module Info |
| 10433 | Read Me! |  | Read Me! | Lua | Read Me! |
