using System;
using System.Runtime.InteropServices;

namespace FM26RTE;

public static class Native
{
    public const uint PROCESS_VM_READ          = 0x0010;
    public const uint PROCESS_VM_WRITE         = 0x0020;
    public const uint PROCESS_VM_OPERATION     = 0x0008;
    public const uint PROCESS_QUERY_INFORMATION = 0x0400;
    public const uint PROCESS_QUERY_LIMITED_INFORMATION = 0x1000;

    // Combination used for memory R/W; matches one of the access flags fmkedt26 uses (0x438).
    public const uint PROCESS_RW = PROCESS_VM_READ | PROCESS_VM_WRITE | PROCESS_VM_OPERATION | PROCESS_QUERY_INFORMATION;

    public const uint MEM_COMMIT  = 0x1000;
    public const uint MEM_PRIVATE = 0x20000;
    public const uint MEM_MAPPED  = 0x40000;
    public const uint MEM_IMAGE   = 0x1000000;

    public const uint PAGE_NOACCESS  = 0x01;
    public const uint PAGE_READONLY  = 0x02;
    public const uint PAGE_READWRITE = 0x04;
    public const uint PAGE_WRITECOPY = 0x08;
    public const uint PAGE_EXECUTE_READ      = 0x20;
    public const uint PAGE_EXECUTE_READWRITE = 0x40;
    public const uint PAGE_GUARD             = 0x100;

    [StructLayout(LayoutKind.Sequential)]
    public struct MEMORY_BASIC_INFORMATION
    {
        public IntPtr BaseAddress;
        public IntPtr AllocationBase;
        public uint   AllocationProtect;
        public uint   __padding;
        public IntPtr RegionSize;
        public uint   State;
        public uint   Protect;
        public uint   Type;
        public uint   __padding2;
    }

    [DllImport("kernel32.dll", SetLastError = true)]
    public static extern IntPtr OpenProcess(uint dwDesiredAccess, bool bInheritHandle, uint dwProcessId);

    [DllImport("kernel32.dll", SetLastError = true)]
    [return: MarshalAs(UnmanagedType.Bool)]
    public static extern bool CloseHandle(IntPtr hObject);

    [DllImport("kernel32.dll", SetLastError = true)]
    [return: MarshalAs(UnmanagedType.Bool)]
    public static extern bool ReadProcessMemory(
        IntPtr hProcess, IntPtr lpBaseAddress, byte[] lpBuffer, IntPtr nSize, out IntPtr lpNumberOfBytesRead);

    [DllImport("kernel32.dll", SetLastError = true)]
    [return: MarshalAs(UnmanagedType.Bool)]
    public static extern bool WriteProcessMemory(
        IntPtr hProcess, IntPtr lpBaseAddress, byte[] lpBuffer, IntPtr nSize, out IntPtr lpNumberOfBytesWritten);

    [DllImport("kernel32.dll", SetLastError = true)]
    public static extern IntPtr VirtualQueryEx(
        IntPtr hProcess, IntPtr lpAddress, out MEMORY_BASIC_INFORMATION lpBuffer, IntPtr dwLength);

    // --- Token / privilege APIs (for SeDebugPrivilege) ---

    public const uint TOKEN_ADJUST_PRIVILEGES = 0x0020;
    public const uint TOKEN_QUERY             = 0x0008;
    public const uint SE_PRIVILEGE_ENABLED    = 0x00000002;

    [StructLayout(LayoutKind.Sequential)]
    public struct LUID { public uint LowPart; public int HighPart; }

    [StructLayout(LayoutKind.Sequential)]
    public struct LUID_AND_ATTRIBUTES { public LUID Luid; public uint Attributes; }

    [StructLayout(LayoutKind.Sequential)]
    public struct TOKEN_PRIVILEGES_ONE
    {
        public uint PrivilegeCount;
        public LUID_AND_ATTRIBUTES Privilege;
    }

    [DllImport("kernel32.dll")]
    public static extern IntPtr GetCurrentProcess();

    [DllImport("advapi32.dll", SetLastError = true)]
    [return: MarshalAs(UnmanagedType.Bool)]
    public static extern bool OpenProcessToken(IntPtr ProcessHandle, uint DesiredAccess, out IntPtr TokenHandle);

    [DllImport("advapi32.dll", SetLastError = true, CharSet = CharSet.Unicode)]
    [return: MarshalAs(UnmanagedType.Bool)]
    public static extern bool LookupPrivilegeValue(string lpSystemName, string lpName, out LUID lpLuid);

    [DllImport("advapi32.dll", SetLastError = true)]
    [return: MarshalAs(UnmanagedType.Bool)]
    public static extern bool AdjustTokenPrivileges(
        IntPtr TokenHandle, [MarshalAs(UnmanagedType.Bool)] bool DisableAllPrivileges,
        ref TOKEN_PRIVILEGES_ONE NewState, uint BufferLength, IntPtr PreviousState, IntPtr ReturnLength);

    /// <summary>
    /// Try to enable SeDebugPrivilege on the current process token.
    /// Returns true if the privilege was successfully enabled, false otherwise (silently — caller decides).
    /// </summary>
    public static bool TryEnableSeDebugPrivilege()
    {
        if (!OpenProcessToken(GetCurrentProcess(), TOKEN_ADJUST_PRIVILEGES | TOKEN_QUERY, out var token))
            return false;
        try
        {
            if (!LookupPrivilegeValue(null, "SeDebugPrivilege", out var luid))
                return false;

            var tp = new TOKEN_PRIVILEGES_ONE
            {
                PrivilegeCount = 1,
                Privilege = new LUID_AND_ATTRIBUTES { Luid = luid, Attributes = SE_PRIVILEGE_ENABLED }
            };

            if (!AdjustTokenPrivileges(token, false, ref tp, (uint)Marshal.SizeOf<TOKEN_PRIVILEGES_ONE>(), IntPtr.Zero, IntPtr.Zero))
                return false;
            // AdjustTokenPrivileges returns success even if the privilege wasn't granted; check GetLastError.
            return Marshal.GetLastWin32Error() == 0; // ERROR_SUCCESS = 0; ERROR_NOT_ALL_ASSIGNED = 1300
        }
        finally { CloseHandle(token); }
    }

    public static bool IsReadable(uint protect)
    {
        if ((protect & PAGE_GUARD) != 0) return false;
        return (protect & (PAGE_READONLY | PAGE_READWRITE | PAGE_WRITECOPY |
                            PAGE_EXECUTE_READ | PAGE_EXECUTE_READWRITE)) != 0;
    }

    public static bool IsWritable(uint protect)
    {
        if ((protect & PAGE_GUARD) != 0) return false;
        return (protect & (PAGE_READWRITE | PAGE_WRITECOPY | PAGE_EXECUTE_READWRITE)) != 0;
    }
}
