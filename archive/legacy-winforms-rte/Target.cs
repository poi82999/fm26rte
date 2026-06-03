using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Runtime.InteropServices;

namespace FM26RTE;

/// <summary>
/// Owns an OpenProcess handle and exposes typed read / write / region enumeration.
/// </summary>
public sealed class Target : IDisposable
{
    public int Pid { get; }
    public string ProcessName { get; }
    public IntPtr Handle { get; }

    private static readonly int MbiSize = Marshal.SizeOf<Native.MEMORY_BASIC_INFORMATION>();

    private Target(int pid, string name, IntPtr handle)
    { Pid = pid; ProcessName = name; Handle = handle; }

    public static bool SeDebugEnabled { get; private set; }

    static Target()
    {
        // Best-effort: try to enable SeDebugPrivilege at startup. Mirrors fmkedt26's pattern
        // (it calls OpenProcessToken; presumably to enable this same privilege).
        SeDebugEnabled = Native.TryEnableSeDebugPrivilege();
    }

    public static Target Attach(int pid)
    {
        // Step 1: confirm the process is even visible to us.
        Process p;
        try { p = Process.GetProcessById(pid); }
        catch (Exception ex) { throw new InvalidOperationException($"Process {pid} not found: {ex.Message}"); }

        // Step 2: try the full R/W access set. If that fails, fall back through smaller sets so
        // we can tell *what* level is failing.
        var attempts = new (uint flags, string name)[]
        {
            (Native.PROCESS_RW, "PROCESS_RW (0x438)"),
            (Native.PROCESS_VM_READ | Native.PROCESS_QUERY_INFORMATION, "READ+QUERY (0x410)"),
            (Native.PROCESS_VM_READ, "VM_READ (0x10)"),
            (Native.PROCESS_QUERY_LIMITED_INFORMATION, "QUERY_LIMITED (0x1000)"),
        };

        var errors = new List<string>();
        IntPtr h = IntPtr.Zero;
        string usedFlags = null;

        foreach (var (flags, name) in attempts)
        {
            h = Native.OpenProcess(flags, false, (uint)pid);
            if (h != IntPtr.Zero) { usedFlags = name; break; }
            int err = Marshal.GetLastWin32Error();
            string msg = new System.ComponentModel.Win32Exception(err).Message;
            errors.Add($"{name}: Win32 {err} ({msg})");
        }

        if (h == IntPtr.Zero)
        {
            throw new InvalidOperationException(
                $"OpenProcess failed for PID {pid} ({p.ProcessName}.exe). Tried:\n  " +
                string.Join("\n  ", errors) +
                "\n\nLikely causes:\n" +
                "  - fm.exe is running as Administrator but FM26RTE is not (or vice versa). Run both at the same level.\n" +
                "  - Anti-cheat / anti-debug intercepting OpenProcess.\n" +
                "  - Wrong PID (process exited).");
        }

        // If we only got a read-only or query-only handle, warn the caller — write will not work.
        if (usedFlags != "PROCESS_RW (0x438)")
        {
            // Close and retry once more with full flags to surface the precise reason.
            Native.CloseHandle(h);
            h = Native.OpenProcess(Native.PROCESS_RW, false, (uint)pid);
            if (h == IntPtr.Zero)
            {
                int err = Marshal.GetLastWin32Error();
                string msg = new System.ComponentModel.Win32Exception(err).Message;
                throw new InvalidOperationException(
                    $"Process {pid} ({p.ProcessName}.exe) is reachable with {usedFlags} " +
                    $"but full R/W (0x438) failed: Win32 {err} ({msg}).\n\n" +
                    $"SeDebugPrivilege enabled: {SeDebugEnabled}\n\n" +
                    "Most common fix: right-click FM26RTE.exe → Run as administrator.\n" +
                    "If that does not help, fm.exe may be running at a higher integrity level (e.g. Steam launched as admin) " +
                    "or has anti-debug DACL protection.");
            }
        }

        return new Target(pid, p.ProcessName, h);
    }

    public void Dispose()
    {
        if (Handle != IntPtr.Zero) Native.CloseHandle(Handle);
    }

    // --- Read ---

    public bool TryRead(IntPtr addr, byte[] buf)
    {
        return Native.ReadProcessMemory(Handle, addr, buf, (IntPtr)buf.Length, out var read)
               && (long)read == buf.Length;
    }

    /// <summary>
    /// Reads exactly <paramref name="length"/> bytes. Returns null on RPM failure or partial read
    /// — callers must null-check, otherwise stale/zero bytes can corrupt heuristics.
    /// </summary>
    public byte[] Read(IntPtr addr, int length)
    {
        var buf = new byte[length];
        return TryRead(addr, buf) ? buf : null;
    }

    public byte ReadByte(IntPtr addr) { var b = new byte[1]; TryRead(addr, b); return b[0]; }
    public short ReadInt16(IntPtr addr) { var b = new byte[2]; TryRead(addr, b); return BitConverter.ToInt16(b, 0); }
    public ushort ReadUInt16(IntPtr addr) { var b = new byte[2]; TryRead(addr, b); return BitConverter.ToUInt16(b, 0); }
    public int ReadInt32(IntPtr addr) { var b = new byte[4]; TryRead(addr, b); return BitConverter.ToInt32(b, 0); }
    public uint ReadUInt32(IntPtr addr) { var b = new byte[4]; TryRead(addr, b); return BitConverter.ToUInt32(b, 0); }
    public long ReadInt64(IntPtr addr) { var b = new byte[8]; TryRead(addr, b); return BitConverter.ToInt64(b, 0); }
    public ulong ReadUInt64(IntPtr addr) { var b = new byte[8]; TryRead(addr, b); return BitConverter.ToUInt64(b, 0); }
    public IntPtr ReadIntPtr(IntPtr addr) { return (IntPtr)ReadInt64(addr); }
    public float ReadFloat(IntPtr addr) { var b = new byte[4]; TryRead(addr, b); return BitConverter.ToSingle(b, 0); }

    // --- Write ---

    public bool TryWrite(IntPtr addr, byte[] buf)
    {
        return Native.WriteProcessMemory(Handle, addr, buf, (IntPtr)buf.Length, out _);
    }

    public bool WriteByte(IntPtr addr, byte v) => TryWrite(addr, new[] { v });
    public bool WriteInt16(IntPtr addr, short v) => TryWrite(addr, BitConverter.GetBytes(v));
    public bool WriteUInt16(IntPtr addr, ushort v) => TryWrite(addr, BitConverter.GetBytes(v));
    public bool WriteInt32(IntPtr addr, int v) => TryWrite(addr, BitConverter.GetBytes(v));
    public bool WriteUInt32(IntPtr addr, uint v) => TryWrite(addr, BitConverter.GetBytes(v));
    public bool WriteInt64(IntPtr addr, long v) => TryWrite(addr, BitConverter.GetBytes(v));
    public bool WriteFloat(IntPtr addr, float v) => TryWrite(addr, BitConverter.GetBytes(v));

    // --- Region enumeration ---

    public IEnumerable<Native.MEMORY_BASIC_INFORMATION> EnumerateRegions(IntPtr fromAddr = default, IntPtr toAddr = default)
    {
        IntPtr addr = fromAddr;
        IntPtr cap = toAddr == IntPtr.Zero ? unchecked((IntPtr)0x7FFFFFFFFFFFL) : toAddr;

        while ((long)addr < (long)cap)
        {
            if (Native.VirtualQueryEx(Handle, addr, out var mbi, (IntPtr)MbiSize) == IntPtr.Zero)
                yield break;
            yield return mbi;
            long next = (long)mbi.BaseAddress + (long)mbi.RegionSize;
            if (next <= (long)addr) yield break; // safety
            addr = (IntPtr)next;
        }
    }
}
