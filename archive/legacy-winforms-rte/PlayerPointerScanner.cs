using System;
using System.Collections.Generic;
using System.Threading;

namespace FM26RTE;

public readonly record struct PlayerPointerHit(
    PlayerEditPointers Pointers,
    uint Uid,
    ushort CA,
    ushort PA,
    int DynamicOffset);

public static class PlayerPointerScanner
{
    private const int ObjDuni = 0x0C;
    private static readonly int[] PlayerDynamicOffsets =
    {
        PlayerEditCatalog.PlayerOffset,
        PlayerEditCatalog.PlayerStaffOffset,
    };

    public static bool TryResolveFromPerson(Target target, IntPtr person, uint uid, out PlayerPointerHit hit)
    {
        hit = default;
        if (person == IntPtr.Zero) return false;

        if (target.ReadUInt32((IntPtr)((long)person + ObjDuni)) != uid)
            return false;

        int dynamicOffset = ReadDynamicOffset(target, person);
        if (Array.IndexOf(PlayerDynamicOffsets, dynamicOffset) < 0)
            return false;

        var player = (IntPtr)((long)person - dynamicOffset);
        ushort ca = target.ReadUInt16((IntPtr)((long)player + PlayerEditCatalog.PlaoPcab));
        ushort pa = target.ReadUInt16((IntPtr)((long)player + PlayerEditCatalog.PlaoPpab));

        if (ca is < 1 or > 200) return false;
        if (pa is < 1 or > 200) return false;

        hit = new PlayerPointerHit(new PlayerEditPointers(person, player), uid, ca, pa, dynamicOffset);
        return true;
    }

    public static List<PlayerPointerHit> FindByUid(
        Target target,
        uint uid,
        CancellationToken cancel,
        Action<int, int> progress = null,
        int maxHits = 16)
    {
        var needle = BitConverter.GetBytes(uid);
        var hits = new List<PlayerPointerHit>();
        var seenPeople = new HashSet<long>();

        var regions = new List<Native.MEMORY_BASIC_INFORMATION>();
        foreach (var region in target.EnumerateRegions())
        {
            if (region.State != Native.MEM_COMMIT) continue;
            if (!Native.IsReadable(region.Protect)) continue;
            regions.Add(region);
        }

        int done = 0;
        foreach (var region in regions)
        {
            if (cancel.IsCancellationRequested) break;

            long size = (long)region.RegionSize;
            if (size <= needle.Length || size > 256 * 1024 * 1024)
            {
                done++;
                progress?.Invoke(done, regions.Count);
                continue;
            }

            var bytes = target.Read(region.BaseAddress, (int)size);
            if (bytes == null)
            {
                done++;
                progress?.Invoke(done, regions.Count);
                continue;
            }

            int max = bytes.Length - needle.Length;
            for (int i = 0; i <= max; i++)
            {
                if (bytes[i] != needle[0]) continue;

                bool match = true;
                for (int j = 1; j < needle.Length; j++)
                {
                    if (bytes[i + j] == needle[j]) continue;
                    match = false;
                    break;
                }
                if (!match) continue;

                var person = (IntPtr)((long)region.BaseAddress + i - ObjDuni);
                if (!seenPeople.Add((long)person)) continue;

                if (TryResolveFromPerson(target, person, uid, out var hit))
                {
                    hits.Add(hit);
                    if (hits.Count >= maxHits) return hits;
                }
            }

            done++;
            progress?.Invoke(done, regions.Count);
        }

        return hits;
    }

    private static int ReadDynamicOffset(Target target, IntPtr person)
    {
        // Cheat Table equivalent:
        //   vtable = readQword(person)
        //   meta = readQword(vtable - 8)
        //   offset = readInteger(meta + 4)
        var vtable = target.ReadIntPtr(person);
        if (vtable == IntPtr.Zero) return 0;

        var meta = target.ReadIntPtr((IntPtr)((long)vtable - 8));
        if (meta == IntPtr.Zero) return 0;

        return target.ReadInt32((IntPtr)((long)meta + 4));
    }
}
