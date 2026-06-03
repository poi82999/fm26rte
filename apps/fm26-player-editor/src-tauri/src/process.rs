use std::ffi::c_void;
use std::mem::{size_of, zeroed};
use std::ptr::{null, null_mut};

use windows_sys::Win32::Foundation::{CloseHandle, GetLastError, HANDLE, INVALID_HANDLE_VALUE};
use windows_sys::Win32::Security::{
    AdjustTokenPrivileges, LookupPrivilegeValueW, LUID_AND_ATTRIBUTES, SE_PRIVILEGE_ENABLED,
    TOKEN_ADJUST_PRIVILEGES, TOKEN_PRIVILEGES, TOKEN_QUERY,
};
use windows_sys::Win32::System::Diagnostics::Debug::{ReadProcessMemory, WriteProcessMemory};
use windows_sys::Win32::System::Diagnostics::ToolHelp::{
    CreateToolhelp32Snapshot, Process32FirstW, Process32NextW, PROCESSENTRY32W, TH32CS_SNAPPROCESS,
};
use windows_sys::Win32::System::Memory::{
    VirtualQueryEx, MEMORY_BASIC_INFORMATION, MEM_COMMIT, PAGE_EXECUTE_READ,
    PAGE_EXECUTE_READWRITE, PAGE_GUARD, PAGE_READONLY, PAGE_READWRITE, PAGE_WRITECOPY,
};
use windows_sys::Win32::System::Threading::{
    GetCurrentProcess, OpenProcess, OpenProcessToken, PROCESS_QUERY_INFORMATION,
    PROCESS_QUERY_LIMITED_INFORMATION, PROCESS_VM_OPERATION, PROCESS_VM_READ, PROCESS_VM_WRITE,
};

const PROCESS_RW: u32 =
    PROCESS_VM_READ | PROCESS_VM_WRITE | PROCESS_VM_OPERATION | PROCESS_QUERY_INFORMATION;

pub(super) struct Target {
    handle: HANDLE,
}

unsafe impl Send for Target {}

impl Drop for Target {
    fn drop(&mut self) {
        if !self.handle.is_null() {
            unsafe {
                CloseHandle(self.handle);
            }
        }
    }
}

impl Target {
    pub(super) fn read(&self, addr: usize, len: usize) -> Result<Vec<u8>, String> {
        let mut bytes = vec![0u8; len];
        let mut read = 0usize;
        let ok = unsafe {
            ReadProcessMemory(
                self.handle,
                addr as *const c_void,
                bytes.as_mut_ptr() as *mut c_void,
                len,
                &mut read,
            )
        };
        if ok == 0 || read != len {
            return Err(format!("ReadProcessMemory 실패: {}", unsafe {
                GetLastError()
            }));
        }
        Ok(bytes)
    }

    pub(super) fn write(&self, addr: usize, bytes: &[u8]) -> Result<(), String> {
        let mut written = 0usize;
        let ok = unsafe {
            WriteProcessMemory(
                self.handle,
                addr as *const c_void,
                bytes.as_ptr() as *const c_void,
                bytes.len(),
                &mut written,
            )
        };
        if ok == 0 || written != bytes.len() {
            return Err(format!("WriteProcessMemory 실패: {}", unsafe {
                GetLastError()
            }));
        }
        Ok(())
    }

    pub(super) fn read_u8(&self, addr: usize) -> Result<u8, String> {
        Ok(self.read(addr, 1)?[0])
    }

    pub(super) fn read_u16(&self, addr: usize) -> Result<u16, String> {
        let bytes = self.read(addr, 2)?;
        Ok(u16::from_le_bytes([bytes[0], bytes[1]]))
    }

    pub(super) fn read_i16(&self, addr: usize) -> Result<i16, String> {
        let bytes = self.read(addr, 2)?;
        Ok(i16::from_le_bytes([bytes[0], bytes[1]]))
    }

    pub(super) fn read_u32(&self, addr: usize) -> Result<u32, String> {
        let bytes = self.read(addr, 4)?;
        Ok(u32::from_le_bytes([bytes[0], bytes[1], bytes[2], bytes[3]]))
    }

    pub(super) fn read_i32(&self, addr: usize) -> Result<i32, String> {
        let bytes = self.read(addr, 4)?;
        Ok(i32::from_le_bytes([bytes[0], bytes[1], bytes[2], bytes[3]]))
    }

    pub(super) fn read_usize(&self, addr: usize) -> Result<usize, String> {
        let bytes = self.read(addr, 8)?;
        Ok(u64::from_le_bytes([
            bytes[0], bytes[1], bytes[2], bytes[3], bytes[4], bytes[5], bytes[6], bytes[7],
        ]) as usize)
    }
}

pub(super) struct MemoryRegion {
    pub(super) base: usize,
    pub(super) size: usize,
}

pub(super) fn readable_regions(target: &Target) -> Vec<MemoryRegion> {
    enumerate_regions(target)
        .into_iter()
        .filter(|region| region.State == MEM_COMMIT && is_readable(region.Protect))
        .map(|region| MemoryRegion {
            base: region.BaseAddress as usize,
            size: region.RegionSize,
        })
        .collect()
}

fn enumerate_regions(target: &Target) -> Vec<MEMORY_BASIC_INFORMATION> {
    let mut regions = Vec::new();
    let mut addr = 0usize;
    let cap = 0x7fff_ffff_ffffusize;

    while addr < cap {
        let mut mbi = unsafe { zeroed::<MEMORY_BASIC_INFORMATION>() };
        let got = unsafe {
            VirtualQueryEx(
                target.handle,
                addr as *const c_void,
                &mut mbi,
                size_of::<MEMORY_BASIC_INFORMATION>(),
            )
        };
        if got == 0 {
            break;
        }

        let base = mbi.BaseAddress as usize;
        let size = mbi.RegionSize;
        regions.push(mbi);

        let next = base.saturating_add(size);
        if next <= addr {
            break;
        }
        addr = next;
    }

    regions
}

fn is_readable(protect: u32) -> bool {
    (protect & PAGE_GUARD) == 0
        && (protect
            & (PAGE_READONLY
                | PAGE_READWRITE
                | PAGE_WRITECOPY
                | PAGE_EXECUTE_READ
                | PAGE_EXECUTE_READWRITE))
            != 0
}

pub(super) fn find_process_id(exe_name: &str) -> Option<u32> {
    let snapshot = unsafe { CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0) };
    if snapshot == INVALID_HANDLE_VALUE {
        return None;
    }

    let mut entry = unsafe { zeroed::<PROCESSENTRY32W>() };
    entry.dwSize = size_of::<PROCESSENTRY32W>() as u32;

    let mut found = None;
    let mut ok = unsafe { Process32FirstW(snapshot, &mut entry) };
    while ok != 0 {
        let name = wide_array_to_string(&entry.szExeFile);
        if name.eq_ignore_ascii_case(exe_name) {
            found = Some(entry.th32ProcessID);
            break;
        }
        ok = unsafe { Process32NextW(snapshot, &mut entry) };
    }

    unsafe {
        CloseHandle(snapshot);
    }
    found
}

pub(super) fn open_process_rw(pid: u32) -> Result<Target, String> {
    let attempts = [
        (PROCESS_RW, "PROCESS_RW (0x438)"),
        (
            PROCESS_VM_READ | PROCESS_QUERY_INFORMATION,
            "READ+QUERY (0x410)",
        ),
        (PROCESS_VM_READ, "VM_READ (0x10)"),
        (PROCESS_QUERY_LIMITED_INFORMATION, "QUERY_LIMITED (0x1000)"),
    ];

    let mut errors = Vec::new();
    for (flags, name) in attempts {
        let handle = unsafe { OpenProcess(flags, 0, pid) };
        if !handle.is_null() {
            if flags == PROCESS_RW {
                return Ok(Target { handle });
            }
            unsafe {
                CloseHandle(handle);
            }
        }
        errors.push(format!("{name}: Win32 {}", unsafe { GetLastError() }));
    }

    Err(format!(
        "fm.exe 프로세스는 보이지만 R/W 핸들을 열 수 없습니다.\n{}\n\n가장 흔한 해결책: 이 앱을 관리자 권한으로 실행하세요.",
        errors.join("\n")
    ))
}

pub(super) fn try_enable_se_debug_privilege() -> bool {
    let mut token: HANDLE = null_mut();
    let opened = unsafe {
        OpenProcessToken(
            GetCurrentProcess(),
            TOKEN_ADJUST_PRIVILEGES | TOKEN_QUERY,
            &mut token,
        )
    };
    if opened == 0 {
        return false;
    }

    let mut luid = unsafe { zeroed() };
    let name = wide_null("SeDebugPrivilege");
    let looked_up = unsafe { LookupPrivilegeValueW(null(), name.as_ptr(), &mut luid) };
    if looked_up == 0 {
        unsafe {
            CloseHandle(token);
        }
        return false;
    }

    let mut tp = TOKEN_PRIVILEGES {
        PrivilegeCount: 1,
        Privileges: [LUID_AND_ATTRIBUTES {
            Luid: luid,
            Attributes: SE_PRIVILEGE_ENABLED,
        }],
    };

    let adjusted = unsafe {
        AdjustTokenPrivileges(
            token,
            0,
            &mut tp,
            size_of::<TOKEN_PRIVILEGES>() as u32,
            null_mut(),
            null_mut(),
        )
    };
    let err = unsafe { GetLastError() };
    unsafe {
        CloseHandle(token);
    }
    adjusted != 0 && err == 0
}

fn wide_array_to_string(raw: &[u16]) -> String {
    let len = raw.iter().position(|ch| *ch == 0).unwrap_or(raw.len());
    String::from_utf16_lossy(&raw[..len])
}

fn wide_null(text: &str) -> Vec<u16> {
    text.encode_utf16().chain([0]).collect()
}

pub(super) fn executable_regions(target: &Target) -> Vec<MemoryRegion> {
    enumerate_regions(target)
        .into_iter()
        .filter(|region| {
            region.State == MEM_COMMIT
                && (region.Protect & (PAGE_EXECUTE_READ | PAGE_EXECUTE_READWRITE)) != 0
        })
        .map(|region| MemoryRegion {
            base: region.BaseAddress as usize,
            size: region.RegionSize,
        })
        .collect()
}

pub(super) fn aob_scan_executable(target: &Target, signature: &[Option<u8>]) -> Vec<usize> {
    let mut matches = Vec::new();
    for region in executable_regions(target) {
        let size = region.size;
        if size <= signature.len() || size > 256 * 1024 * 1024 {
            continue;
        }

        let Ok(bytes) = target.read(region.base, size) else {
            continue;
        };

        for i in 0..=bytes.len().saturating_sub(signature.len()) {
            let mut matched = true;
            for (j, &b) in signature.iter().enumerate() {
                if let Some(sb) = b {
                    if bytes[i + j] != sb {
                        matched = false;
                        break;
                    }
                }
            }
            if matched {
                matches.push(region.base + i);
            }
        }
    }
    matches
}
