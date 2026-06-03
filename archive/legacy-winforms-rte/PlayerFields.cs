using System.Linq;

namespace FM26RTE;

public enum FieldCat { Core, Hidden, Attr, Position, PPM }

public sealed record FieldDef(string Name, string KorName, int Offset, int Size, FieldCat Category);

/// <summary>
/// Single source of truth for Person Record field offsets (relative to UID address).
///
/// Memory is organized in 3 layers:
///   Header  (-0x080 ~ 0x000): Fixed metadata, hidden stats, PA/CA, PPMs
///   Attr    (+0x050 ~ +0x0A0): Runtime base attributes (subject to morale buff)
///   Position(+0x285 ~):        24 positional ratings in PositionID order (GK..STL), values 1-20
/// </summary>
public static class PlayerFields
{
    public static readonly FieldDef[] All =
    {
        // ── Core / Header ──
        new("CA",      "현재 능력",    -0x30, 2, FieldCat.Core),
        new("PA",      "잠재 능력",    -0x2E, 2, FieldCat.Core),
        new("Height",  "신장 (cm)",    -0x66, 1, FieldCat.Core),
        new("RFoot",   "오른발",       -0x28, 1, FieldCat.Core),
        new("Determ",  "승부욕",       -0x23, 1, FieldCat.Core),
        new("BirthYr", "출생 연도",    +0x7E, 2, FieldCat.Core),
        new("BirthMo", "출생 월",      +0x84, 1, FieldCat.Core),

        // ── Hidden (header area, tentative) ──
        new("Hid -5D", "히든(-5D)",    -0x5D, 1, FieldCat.Hidden),
        new("Hid -58", "히든(-58)",    -0x58, 1, FieldCat.Hidden),
        new("Hid -57", "히든(-57)",    -0x57, 1, FieldCat.Hidden),

        // ── PPM probe block: raw bytes -0x25 ~ -0x10 for mapping investigation.
        // Change a player's PPM in-game and watch which byte flips.
        // Once confirmed, replace probe entries with named PPM slots.
        new("P-25", "PPM조사 -25", -0x25, 1, FieldCat.PPM),
        new("P-24", "PPM조사 -24", -0x24, 1, FieldCat.PPM),
        // -0x23 = Determ (Core); 중복 제거됨
        new("P-22", "PPM조사 -22", -0x22, 1, FieldCat.PPM),
        new("P-21", "PPM조사 -21", -0x21, 1, FieldCat.PPM),
        new("P-20", "PPM조사 -20", -0x20, 1, FieldCat.PPM),
        new("P-1F", "PPM조사 -1F", -0x1F, 1, FieldCat.PPM),
        new("P-1E", "PPM조사 -1E", -0x1E, 1, FieldCat.PPM),
        new("P-1D", "PPM조사 -1D", -0x1D, 1, FieldCat.PPM),
        new("P-1C", "PPM조사 -1C", -0x1C, 1, FieldCat.PPM),
        new("P-1B", "PPM조사 -1B", -0x1B, 1, FieldCat.PPM),
        new("P-1A", "PPM조사 -1A", -0x1A, 1, FieldCat.PPM),
        new("P-19", "PPM조사 -19", -0x19, 1, FieldCat.PPM),
        new("P-18", "PPM조사 -18", -0x18, 1, FieldCat.PPM),
        new("P-17", "PPM조사 -17 (PPM?)", -0x17, 1, FieldCat.PPM),
        new("P-16", "PPM조사 -16 (PPM?)", -0x16, 1, FieldCat.PPM),
        new("P-15", "PPM조사 -15 (PPM?)", -0x15, 1, FieldCat.PPM),
        new("P-14", "PPM조사 -14", -0x14, 1, FieldCat.PPM),
        new("P-13", "PPM조사 -13", -0x13, 1, FieldCat.PPM),
        new("P-12", "PPM조사 -12", -0x12, 1, FieldCat.PPM),
        new("P-11", "PPM조사 -11", -0x11, 1, FieldCat.PPM),
        new("P-10", "PPM조사 -10", -0x10, 1, FieldCat.PPM),

        // ── Attribute block (+0x064~). +0x069 = Tackling (CONFIRMED). ──
        new("Attr64",  "능력치+64",    +0x064, 1, FieldCat.Attr),
        new("Attr65",  "능력치+65",    +0x065, 1, FieldCat.Attr),
        new("Attr66",  "능력치+66",    +0x066, 1, FieldCat.Attr),
        new("Attr67",  "능력치+67",    +0x067, 1, FieldCat.Attr),
        new("Attr68",  "능력치+68",    +0x068, 1, FieldCat.Attr),
        new("Tackle",  "태클 ✓",       +0x069, 1, FieldCat.Attr),
        new("Attr6A",  "능력치+6A",    +0x06A, 1, FieldCat.Attr),
        new("Attr6B",  "능력치+6B",    +0x06B, 1, FieldCat.Attr),

        // ── Position adaptation. 24 slots, values 1-20. ──
        // Order matches FMPositionHelper.PositionID enum (dump.cs:84448):
        //   GK=1, DR=2, DCR=3, DC=4, DCL=5, DL=6, WBR=7,
        //   DMR=8, DMC=9, DML=10, WBL=11, MR=12, MCR=13, MC=14, MCL=15, ML=16,
        //   AMR=17, AMCR=18, AMC=19, AMCL=20, AML=21, STR=22, ST=23, STL=24
        // Starting offset +0x285 tentative; end +0x29C follows from PositionID ordering.
        new("GK",   "골키퍼",      +0x285, 1, FieldCat.Position),
        new("DR",   "우측 수비수",  +0x286, 1, FieldCat.Position),
        new("DCR",  "중앙 수비(우)", +0x287, 1, FieldCat.Position),
        new("DC",   "중앙 수비수",  +0x288, 1, FieldCat.Position),
        new("DCL",  "중앙 수비(좌)", +0x289, 1, FieldCat.Position),
        new("DL",   "좌측 수비수",  +0x28A, 1, FieldCat.Position),
        new("WBR",  "우측 윙백",    +0x28B, 1, FieldCat.Position),
        new("DMR",  "수비형 미드(우)", +0x28C, 1, FieldCat.Position),
        new("DMC",  "수비형 미드",  +0x28D, 1, FieldCat.Position),
        new("DML",  "수비형 미드(좌)", +0x28E, 1, FieldCat.Position),
        new("WBL",  "좌측 윙백",    +0x28F, 1, FieldCat.Position),
        new("MR",   "우측 미드필더", +0x290, 1, FieldCat.Position),
        new("MCR",  "중앙 미드(우)", +0x291, 1, FieldCat.Position),
        new("MC",   "중앙 미드필더", +0x292, 1, FieldCat.Position),
        new("MCL",  "중앙 미드(좌)", +0x293, 1, FieldCat.Position),
        new("ML",   "좌측 미드필더", +0x294, 1, FieldCat.Position),
        new("AMR",  "우측 공격형 미드", +0x295, 1, FieldCat.Position),
        new("AMCR", "공격형 미드(우)", +0x296, 1, FieldCat.Position),
        new("AMC",  "공격형 미드",  +0x297, 1, FieldCat.Position),
        new("AMCL", "공격형 미드(좌)", +0x298, 1, FieldCat.Position),
        new("AML",  "좌측 공격형 미드", +0x299, 1, FieldCat.Position),
        new("STR",  "스트라이커(우)", +0x29A, 1, FieldCat.Position),
        new("ST",   "스트라이커",   +0x29B, 1, FieldCat.Position),
        new("STL",  "스트라이커(좌)", +0x29C, 1, FieldCat.Position),
    };

    public static FieldDef ByName(string name) => All.First(f => f.Name == name);
}
