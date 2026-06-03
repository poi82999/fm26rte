using System;
using System.Collections.Generic;
using System.Linq;

namespace FM26RTE;

public enum EditBaseKind
{
    Person,
    Player,
}

public enum EditCategory
{
    Basic,
    Technical,
    Mental,
    Physical,
    Goalkeeping,
    Hidden,
    Positions,
    Traits,
}

public enum EditValueKind
{
    Byte,
    Int16,
    UInt16,
    FMAttribute,
    Bit,
}

public sealed record EditFieldDef(
    string Key,
    string Label,
    EditCategory Category,
    EditBaseKind Base,
    int Offset,
    EditValueKind Kind,
    int Size = 1,
    int Bit = -1,
    int Min = 0,
    int Max = 255);

public sealed class EditFieldState
{
    public bool Loaded { get; set; }
    public object OriginalValue { get; set; }
    public object EditedValue { get; set; }
    public bool Dirty { get; set; }
}

public readonly record struct PlayerEditPointers(IntPtr Person, IntPtr Player)
{
    public bool Has(EditBaseKind kind) =>
        kind == EditBaseKind.Person ? Person != IntPtr.Zero : Player != IntPtr.Zero;

    public IntPtr GetBase(EditBaseKind kind) =>
        kind == EditBaseKind.Person ? Person : Player;
}

public static class EditFieldCodec
{
    public static IntPtr GetAddress(PlayerEditPointers pointers, EditFieldDef field)
    {
        return (IntPtr)((long)pointers.GetBase(field.Base) + field.Offset);
    }

    public static bool TryRead(Target target, PlayerEditPointers pointers, EditFieldDef field, out object value)
    {
        value = null;
        if (!pointers.Has(field.Base)) return false;

        var addr = GetAddress(pointers, field);
        var bytes = target.Read(addr, field.Size);
        if (bytes == null || bytes.Length != field.Size) return false;

        value = field.Kind switch
        {
            EditValueKind.Byte => bytes[0],
            EditValueKind.Int16 => BitConverter.ToInt16(bytes, 0),
            EditValueKind.UInt16 => BitConverter.ToUInt16(bytes, 0),
            EditValueKind.FMAttribute => (int)Math.Floor(bytes[0] / 5.0 + 0.5),
            EditValueKind.Bit => (bytes[0] & (1 << field.Bit)) != 0,
            _ => null,
        };
        return value != null;
    }

    public static bool TryWrite(Target target, PlayerEditPointers pointers, EditFieldDef field, object value)
    {
        if (!pointers.Has(field.Base)) return false;

        var addr = GetAddress(pointers, field);
        return field.Kind switch
        {
            EditValueKind.Bit => TryWriteBit(target, addr, field.Bit, Convert.ToBoolean(value)),
            EditValueKind.Byte => target.WriteByte(addr, ClampByte(value, field.Min, field.Max)),
            EditValueKind.FMAttribute => target.WriteByte(addr, (byte)(ClampInt(value, field.Min, field.Max) * 5)),
            EditValueKind.Int16 => target.WriteInt16(addr, (short)ClampInt(value, field.Min, field.Max)),
            EditValueKind.UInt16 => target.WriteUInt16(addr, (ushort)ClampInt(value, field.Min, field.Max)),
            _ => false,
        };
    }

    private static bool TryWriteBit(Target target, IntPtr addr, int bit, bool enabled)
    {
        var bytes = target.Read(addr, 1);
        if (bytes == null || bytes.Length != 1) return false;

        int mask = 1 << bit;
        byte next = enabled
            ? (byte)(bytes[0] | mask)
            : (byte)(bytes[0] & ~mask);
        return target.WriteByte(addr, next);
    }

    private static byte ClampByte(object value, int min, int max)
    {
        return (byte)ClampInt(value, min, Math.Min(max, 255));
    }

    private static int ClampInt(object value, int min, int max)
    {
        int n = Convert.ToInt32(value);
        if (n < min) return min;
        if (n > max) return max;
        return n;
    }
}

public static class PlayerEditCatalog
{
    public const int PlayerOffset = 0x288;
    public const int PlayerStaffOffset = 0x380;

    public const int PlaoPcab = 0x264;
    public const int PlaoPpab = 0x266;
    public const int PlaoPcrp = 0x260;
    public const int PlaoPhrp = 0x25E;
    public const int PlaoPwrp = 0x262;
    public const int PlaoPatr = 0x15F;
    public const int PlaoPpos = 0x150;
    public const int PlaoPprm = 0x0C0;
    public const int PlaoPlcp = 0x276;

    public static readonly IReadOnlyList<EditFieldDef> All = Build();

    public static IEnumerable<EditFieldDef> ByCategory(EditCategory category) =>
        All.Where(field => field.Category == category);

    public static EditFieldDef ByKey(string key) =>
        All.First(field => field.Key == key);

    private static IReadOnlyList<EditFieldDef> Build()
    {
        var fields = new List<EditFieldDef>();

        void Add(EditFieldDef field) => fields.Add(field);
        void Basic(string key, string label, int offset, EditValueKind kind, int size, int min, int max) =>
            Add(new EditFieldDef(key, label, EditCategory.Basic, EditBaseKind.Player, offset, kind, size, -1, min, max));
        void Attr(EditCategory category, string key, string label, int attrOffset) =>
            Add(new EditFieldDef(key, label, category, EditBaseKind.Player, PlaoPatr + attrOffset, EditValueKind.FMAttribute, 1, -1, 1, 20));
        void Pos(string key, string label, int posOffset) =>
            Add(new EditFieldDef(key, label, EditCategory.Positions, EditBaseKind.Player, PlaoPpos + posOffset, EditValueKind.Byte, 1, -1, 1, 20));
        void Trait(string key, string label, int byteOffset, int bit) =>
            Add(new EditFieldDef(key, label, EditCategory.Traits, EditBaseKind.Person, PlaoPprm + byteOffset, EditValueKind.Bit, 1, bit, 0, 1));

        Basic("ca", "현재 능력", PlaoPcab, EditValueKind.Int16, 2, 1, 200);
        Basic("pa", "잠재 능력", PlaoPpab, EditValueKind.Int16, 2, 1, 200);
        Basic("current_rep", "현재 명성", PlaoPcrp, EditValueKind.Int16, 2, 0, 10000);
        Basic("home_rep", "국내 명성", PlaoPhrp, EditValueKind.Int16, 2, 0, 10000);
        Basic("world_rep", "세계 명성", PlaoPwrp, EditValueKind.Int16, 2, 0, 10000);
        Basic("height", "키", 0x22E, EditValueKind.Int16, 2, 0, 250);
        Basic("left_foot", "왼발", PlaoPatr + 0x18, EditValueKind.FMAttribute, 1, 1, 20);
        Basic("right_foot", "오른발", PlaoPatr + 0x19, EditValueKind.FMAttribute, 1, 1, 20);
        Basic("morale", "사기", 0x26C, EditValueKind.Byte, 1, 1, 20);
        Basic("condition", "몸 상태", 0x258, EditValueKind.Int16, 2, 0, 10000);
        Basic("match_sharpness", "경기 감각", 0x25C, EditValueKind.Int16, 2, 0, 10000);
        Basic("fatigue", "피로도", 0x25A, EditValueKind.Int16, 2, 0, 10000);

        Attr(EditCategory.Technical, "crossing", "크로스", 0x00);
        Attr(EditCategory.Technical, "dribbling", "드리블", 0x01);
        Attr(EditCategory.Technical, "finishing", "골 결정력", 0x02);
        Attr(EditCategory.Technical, "heading", "헤더", 0x03);
        Attr(EditCategory.Technical, "long_shots", "중거리 슛", 0x04);
        Attr(EditCategory.Technical, "marking", "마크", 0x05);
        Attr(EditCategory.Technical, "passing", "패스", 0x07);
        Attr(EditCategory.Technical, "penalty_taking", "페널티 킥", 0x08);
        Attr(EditCategory.Technical, "tackling", "태클", 0x09);
        Attr(EditCategory.Technical, "first_touch", "퍼스트 터치", 0x16);
        Attr(EditCategory.Technical, "technique", "개인기", 0x17);
        Attr(EditCategory.Technical, "corners", "코너킥", 0x1B);
        Attr(EditCategory.Technical, "free_kick_taking", "프리킥", 0x23);
        Attr(EditCategory.Technical, "long_throws", "롱 스로인", 0x1E);

        Attr(EditCategory.Mental, "off_the_ball", "오프 더 볼", 0x06);
        Attr(EditCategory.Mental, "vision", "시야", 0x0A);
        Attr(EditCategory.Mental, "anticipation", "예측력", 0x11);
        Attr(EditCategory.Mental, "decisions", "판단력", 0x12);
        Attr(EditCategory.Mental, "positioning", "위치 선정", 0x14);
        Attr(EditCategory.Mental, "flair", "천재성", 0x1A);
        Attr(EditCategory.Mental, "teamwork", "팀워크", 0x1C);
        Attr(EditCategory.Mental, "work_rate", "활동량", 0x1D);
        Attr(EditCategory.Mental, "leadership", "리더십", 0x28);
        Attr(EditCategory.Mental, "bravery", "대담성", 0x2B);
        Attr(EditCategory.Mental, "aggression", "적극성", 0x2D);
        Attr(EditCategory.Mental, "determination", "승부욕", 0x33);
        Attr(EditCategory.Mental, "composure", "침착성", 0x34);
        Attr(EditCategory.Mental, "concentration", "집중력", 0x35);

        Attr(EditCategory.Physical, "acceleration", "순간 속도", 0x22);
        Attr(EditCategory.Physical, "strength", "몸싸움", 0x24);
        Attr(EditCategory.Physical, "stamina", "지구력", 0x25);
        Attr(EditCategory.Physical, "pace", "주력", 0x26);
        Attr(EditCategory.Physical, "jumping_reach", "점프 거리", 0x27);
        Attr(EditCategory.Physical, "balance", "균형 감각", 0x2A);
        Attr(EditCategory.Physical, "agility", "민첩성", 0x2E);
        Attr(EditCategory.Physical, "natural_fitness", "타고난 체력", 0x32);

        Attr(EditCategory.Goalkeeping, "handling", "핸들링", 0x0B);
        Attr(EditCategory.Goalkeeping, "aerial_reach", "공중 장악력", 0x0C);
        Attr(EditCategory.Goalkeeping, "command_of_area", "장악력", 0x0D);
        Attr(EditCategory.Goalkeeping, "communication", "수비 조율", 0x0E);
        Attr(EditCategory.Goalkeeping, "kicking", "킥", 0x0F);
        Attr(EditCategory.Goalkeeping, "throwing", "던지기", 0x10);
        Attr(EditCategory.Goalkeeping, "one_on_ones", "일대일 방어", 0x13);
        Attr(EditCategory.Goalkeeping, "reflexes", "반사 신경", 0x15);
        Attr(EditCategory.Goalkeeping, "eccentricity", "돌발 행동", 0x1F);
        Attr(EditCategory.Goalkeeping, "rushing_out", "뛰쳐나가기", 0x20);
        Attr(EditCategory.Goalkeeping, "punching", "펀칭 빈도", 0x21);

        Attr(EditCategory.Hidden, "dirtiness", "더티 플레이", 0x29);
        Attr(EditCategory.Hidden, "consistency", "꾸준함", 0x2C);
        Attr(EditCategory.Hidden, "important_matches", "중요 경기", 0x2F);
        Attr(EditCategory.Hidden, "injury_proneness", "부상 빈도", 0x30);
        Attr(EditCategory.Hidden, "versatility", "다재다능", 0x31);

        Pos("pos_gk", "골키퍼", 0x00);
        Pos("pos_sw", "스위퍼", 0x01);
        Pos("pos_dl", "왼쪽 수비수", 0x02);
        Pos("pos_dc", "중앙 수비수", 0x03);
        Pos("pos_dr", "오른쪽 수비수", 0x04);
        Pos("pos_dm", "수비형 미드필더", 0x05);
        Pos("pos_ml", "왼쪽 미드필더", 0x06);
        Pos("pos_mc", "중앙 미드필더", 0x07);
        Pos("pos_mr", "오른쪽 미드필더", 0x08);
        Pos("pos_aml", "왼쪽 윙어", 0x09);
        Pos("pos_amc", "공격형 미드필더", 0x0A);
        Pos("pos_amr", "오른쪽 윙어", 0x0B);
        Pos("pos_st", "스트라이커", 0x0C);
        Pos("pos_wbl", "왼쪽 윙백", 0x0D);
        Pos("pos_wbr", "오른쪽 윙백", 0x0E);
        Add(new EditFieldDef("preferred_central_position", "선호 중앙 위치", EditCategory.Positions, EditBaseKind.Player, PlaoPlcp, EditValueKind.Byte, 1, -1, 0, 7));

        Trait("trait_run_left", "왼쪽 측면 돌파 선호", 0, 0);
        Trait("trait_run_right", "오른쪽 측면 돌파 선호", 0, 1);
        Trait("trait_run_center", "중앙 돌파 선호", 0, 2);
        Trait("trait_gets_into_area", "상대 박스 침투 선호", 0, 3);
        Trait("trait_moves_channels", "측면 공간 침투 선호", 0, 4);
        Trait("trait_gets_forward", "틈날 때마다 전방 침투", 0, 5);
        Trait("trait_short_simple_passes", "짧고 간단한 패스 선호", 0, 6);
        Trait("trait_killer_balls", "침투 패스 자주 시도", 0, 7);
        Trait("trait_shoots_distance", "먼 거리에서 슛 선호", 1, 0);
        Trait("trait_shoots_power", "강슛 선호", 1, 1);
        Trait("trait_places_shots", "정확한 슛 선호", 1, 2);
        Trait("trait_curls_ball", "감아차기 선호", 1, 3);
        Trait("trait_round_keeper", "골키퍼 제치기 선호", 1, 4);
        Trait("trait_break_offside_trap", "오프사이드 트랩 돌파", 1, 5);
        Trait("trait_outside_foot", "아웃사이드 킥 사용", 1, 6);
        Trait("trait_marks_tightly", "상대 밀착 마크", 1, 7);
        Trait("trait_winds_up", "상대 자극", 2, 0);
        Trait("trait_argues_officials", "심판에게 항의", 2, 1);
        Trait("trait_back_to_goal", "등지고 플레이", 2, 2);
        Trait("trait_comes_deep", "공 받으러 내려옴", 2, 3);
        Trait("trait_one_twos", "2대1 패스 선호", 2, 4);
        Trait("trait_lob_keeper", "골키퍼 넘기는 슛 선호", 2, 5);
        Trait("trait_dictates_tempo", "템포 조절", 2, 6);
        Trait("trait_overhead_kicks", "오버헤드킥 시도", 2, 7);
        Trait("trait_pass_not_score", "슛보다 패스 선호", 3, 0);
        Trait("trait_no_through_balls", "스루 패스 자제", 3, 1);
        Trait("trait_stops_play", "플레이 템포를 끊음", 3, 2);
        Trait("trait_knocks_past", "공 차놓고 제치기", 3, 3);
        Trait("trait_right_foot_dribble", "드리블 전 오른발로 옮김", 3, 4);
        Trait("trait_left_foot_dribble", "드리블 전 왼발로 옮김", 3, 5);
        Trait("trait_dwells_ball", "공을 오래 끔", 3, 6);
        Trait("trait_arrives_late", "상대 박스 늦게 침투", 3, 7);
        Trait("trait_play_out_trouble", "위기에서 공 몰고 탈출", 4, 0);
        Trait("trait_stays_back", "항상 후방에 머무름", 4, 1);
        Trait("trait_avoids_weaker_foot", "약한 발 사용 회피", 4, 2);
        Trait("trait_tries_tricks", "개인기 시도", 4, 3);
        Trait("trait_long_free_kicks", "장거리 프리킥 시도", 4, 4);
        Trait("trait_dives_tackles", "태클에 적극적으로 뛰어듦", 4, 5);
        Trait("trait_no_dives_tackles", "무리한 태클 자제", 4, 6);
        Trait("trait_cuts_inside_both", "양쪽 측면에서 안쪽 침투", 4, 7);
        Trait("trait_hugs_line", "터치라인 따라 움직임", 5, 0);
        Trait("trait_gets_crowd_going", "관중 호응 유도", 5, 1);
        Trait("trait_first_time_shots", "논스톱 슛 시도", 5, 2);
        Trait("trait_long_passes", "긴 패스 시도", 5, 3);
        Trait("trait_ball_into_feet", "발밑 패스 선호", 5, 4);
        Trait("trait_fk_power", "강한 프리킥 선호", 5, 5);
        Trait("trait_beat_man_repeatedly", "상대 반복 돌파 선호", 5, 6);
        Trait("trait_switch_flank", "반대편 측면 전환 선호", 5, 7);
        Trait("trait_long_flat_throw", "빠르고 낮은 장거리 스로인", 6, 2);
        Trait("trait_runs_often", "공을 자주 몰고 전진", 6, 3);
        Trait("trait_runs_rarely", "공 몰고 전진 자제", 6, 4);
        Trait("trait_no_moves_channels", "측면 공간 침투 자제", 6, 6);
        Trait("trait_long_throw_counters", "긴 스로인으로 역습 시작", 6, 7);
        Trait("trait_no_long_shots", "중거리 슛 자제", 7, 0);
        Trait("trait_cuts_inside_left", "왼쪽에서 안쪽 침투", 7, 1);
        Trait("trait_cuts_inside_right", "오른쪽에서 안쪽 침투", 7, 2);
        Trait("trait_crosses_early", "이른 크로스 시도", 7, 3);
        Trait("trait_brings_ball_out", "수비 지역에서 공 몰고 나옴", 7, 4);
        Trait("trait_plays_ball_feet", "발로 플레이 선호", 7, 7);

        return fields;
    }
}
