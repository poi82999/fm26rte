using System;
using System.Collections.Generic;
using System.Threading;

namespace FM26RTE;

public readonly record struct PersonHit(IntPtr Addr, short CA, short PA, short BirthYear, byte BirthMonth);

public static class PersonScanner
{
    /// <summary>
    /// Heuristic: real Person Record has CA ∈ [1,200], PA ∈ [1,200], BirthYear ∈ [1970,2015],
    /// BirthMonth ∈ [1,12]. Returns parsed values via out param when valid.
    /// </summary>
    public static bool TryValidate(Target t, IntPtr uidAddr, out PersonHit hit)
    {
        hit = default;
        var buf = t.Read((IntPtr)((long)uidAddr - 0x30), 0x30 + 0x85);
        if (buf == null) return false;

        short ca  = BitConverter.ToInt16(buf, 0);            // UID - 0x30
        short pa  = BitConverter.ToInt16(buf, 2);            // UID - 0x2E
        short by_ = BitConverter.ToInt16(buf, 0x30 + 0x7E);  // UID + 0x7E
        byte  bm  = buf[0x30 + 0x84];                        // UID + 0x84

        if (ca is < 1 or > 200) return false;
        if (pa is < 1 or > 200) return false;
        if (by_ is < 1970 or > 2015) return false;
        if (bm is < 1 or > 12) return false;

        hit = new PersonHit(uidAddr, ca, pa, by_, bm);
        return true;
    }

    /// <summary>
    /// Brute-force every committed readable page for the UID bytes, validate each match.
    /// Returns ALL passing hits up to maxHits.
    /// </summary>
    public static List<PersonHit> FindAll(Target t, uint uid, CancellationToken cancel,
        Action<int, int> progress = null, int maxHits = 16)
    {
        var needle = BitConverter.GetBytes(uid);
        var hits = new List<PersonHit>();

        var regions = new List<Native.MEMORY_BASIC_INFORMATION>();
        foreach (var r in t.EnumerateRegions())
        {
            if (r.State != Native.MEM_COMMIT) continue;
            if (!Native.IsReadable(r.Protect)) continue;
            regions.Add(r);
        }

        int total = regions.Count;
        int done = 0;

        foreach (var region in regions)
        {
            if (cancel.IsCancellationRequested) break;

            long size = (long)region.RegionSize;
            if (size > 256 * 1024 * 1024) continue;

            var buf = new byte[size];
            if (!t.TryRead(region.BaseAddress, buf)) { done++; continue; }

            int max = (int)size - needle.Length;
            for (int i = 0; i <= max; i++)
            {
                if (buf[i] != needle[0]) continue;
                bool match = true;
                for (int j = 1; j < needle.Length; j++)
                    if (buf[i + j] != needle[j]) { match = false; break; }
                if (!match) continue;

                var hitAddr = (IntPtr)((long)region.BaseAddress + i);
                if (TryValidate(t, hitAddr, out var h))
                {
                    hits.Add(h);
                    if (hits.Count >= maxHits) return hits;
                }
            }

            done++;
            progress?.Invoke(done, total);
        }

        return hits;
    }
}
