// Frida hook script for FMKEDT26.
// Captures every Win32 API call relevant to cross-process memory R/W,
// dumping arguments + small buffer previews back to the Python harness.

'use strict';

function hexBytes(ptr, size, max) {
    if (ptr.isNull() || size === 0) return '';
    var n = Math.min(size, max || 64);
    try {
        var bytes = ptr.readByteArray(n);
        if (!bytes) return '';
        var u8 = new Uint8Array(bytes);
        var s = '';
        for (var i = 0; i < u8.length; i++) {
            s += ('0' + u8[i].toString(16)).slice(-2);
        }
        return s + (size > n ? '...' : '');
    } catch (e) { return '<unread>'; }
}

function asString(ptr) {
    if (ptr.isNull()) return null;
    try { return ptr.readCString(); } catch (e) { return null; }
}

function callerRet() {
    // First entry of the backtrace = immediate caller's return address.
    try {
        var bt = Thread.backtrace(this.context, Backtracer.FUZZY);
        return bt && bt.length > 0 ? bt[0].toString() : '?';
    } catch (e) { return '?'; }
}

function moduleOf(addr) {
    try {
        var m = Process.findModuleByAddress(addr);
        return m ? (m.name + '+0x' + addr.sub(m.base).toString(16)) : addr.toString();
    } catch (e) { return addr.toString(); }
}

function hook(modName, fnName, onEnter, onLeave) {
    var addr = null;
    try {
        var mod = Process.findModuleByName(modName);
        if (mod) addr = mod.findExportByName(fnName);
    } catch (e) {}
    if (!addr) {
        try { addr = Module.findGlobalExportByName(fnName); } catch (e) {}
    }
    if (!addr) {
        send({ ev: 'hook_miss', module: modName, fn: fnName });
        return;
    }
    Interceptor.attach(addr, {
        onEnter: function(args) {
            this.fnName = fnName;
            try { onEnter && onEnter.call(this, args); }
            catch (e) { send({ ev: 'hook_err', fn: fnName, err: '' + e }); }
        },
        onLeave: function(retval) {
            try { onLeave && onLeave.call(this, retval); }
            catch (e) { send({ ev: 'hook_err', fn: fnName, err: '' + e }); }
        }
    });
    send({ ev: 'hook_ok', module: modName, fn: fnName, addr: addr.toString() });
}

// -------- kernel32 --------

hook('kernel32.dll', 'OpenProcess',
    function(args) {
        var access = args[0].toInt32() >>> 0;
        var inherit = args[1].toInt32();
        var pid = args[2].toInt32();
        this.openInfo = { access: access, pid: pid };
    },
    function(retval) {
        send({ ev: 'OpenProcess', pid: this.openInfo.pid, access: '0x' + this.openInfo.access.toString(16), handle: retval.toString(), caller: moduleOf(this.returnAddress) });
    }
);

/* 
hook('kernel32.dll', 'ReadProcessMemory',
    function(args) {
        this.h = args[0]; this.base = args[1]; this.buf = args[2]; this.size = args[3].toInt32(); this.brOut = args[4];
    },
    function(retval) {
        var br = (!this.brOut.isNull()) ? this.brOut.readU64().valueOf() : this.size;
        var preview = retval.toInt32() !== 0 ? hexBytes(this.buf, Math.min(br, 64)) : '';
        send({ ev: 'RPM', handle: this.h.toString(), addr: this.base.toString(), size: this.size, ok: retval.toInt32() !== 0, bytes: preview, caller: moduleOf(this.returnAddress) });
    }
);
*/

hook('kernel32.dll', 'WriteProcessMemory',
    function(args) {
        this.h = args[0]; this.base = args[1]; this.buf = args[2]; this.size = args[3].toInt32();
        this.preview = hexBytes(this.buf, this.size, 128);
    },
    function(retval) {
        send({ ev: 'WPM', handle: this.h.toString(), addr: this.base.toString(), size: this.size, ok: retval.toInt32() !== 0, bytes: this.preview, caller: moduleOf(this.returnAddress) });
    }
);

/*
hook('kernel32.dll', 'VirtualQueryEx',
    function(args) {
        this.h = args[0]; this.addr = args[1]; this.mbi = args[2];
    },
    function(retval) {
        if (retval.toInt32() === 0) return;
        try {
            var base = this.mbi.readPointer();
            var alloc = this.mbi.add(8).readPointer();
            var size = this.mbi.add(24).readPointer();
            var state = this.mbi.add(32).readU32();
            var protect = this.mbi.add(36).readU32();
            var type_ = this.mbi.add(40).readU32();
            send({ ev: 'VQE', handle: this.h.toString(), queried: this.addr.toString(), base: base.toString(), size: size.toString(), state: '0x' + state.toString(16), protect: '0x' + protect.toString(16), type: '0x' + type_.toString(16), caller: moduleOf(this.returnAddress) });
        } catch (e) {}
    }
);
*/

hook('kernel32.dll', 'VirtualProtectEx',
    function(args) {
        this.h = args[0]; this.addr = args[1]; this.size = args[2].toInt32(); this.newProt = args[3].toInt32() >>> 0;
    },
    function(retval) {
        send({ ev: 'VPE', handle: this.h.toString(), addr: this.addr.toString(), size: this.size, newProtect: '0x' + this.newProt.toString(16), ok: retval.toInt32() !== 0, caller: moduleOf(this.returnAddress) });
    }
);

/*
// Dedupe GetProcAddress: only log first time we see each (hMod, name) pair.
var _gpaSeen = {};
hook('kernel32.dll', 'GetProcAddress',
    function(args) {
        this.h = args[0];
        var n = args[1];
        var name = null;
        if (!n.isNull()) {
            var asInt = n.toInt32 ? n.toInt32() : 0;
            if (Math.abs(asInt) >= 0x10000) name = asString(n);
        }
        this.name = name;
    },
    function(retval) {
        if (!this.name) return;
        var key = this.h.toString() + ':' + this.name;
        if (_gpaSeen[key]) return;
        _gpaSeen[key] = 1;
        send({ ev: 'GPA', name: this.name, ret: retval.toString(), hMod: this.h.toString(), caller: moduleOf(this.returnAddress) });
    }
);
*/

// Allow the Python side to inject phase markers via RPC.
rpc.exports = {
    mark: function(label) {
        send({ ev: 'MARK', label: label });
    }
};

hook('kernel32.dll', 'LoadLibraryA',
    function(args) { this.lib = asString(args[0]); },
    function(retval) { send({ ev: 'LL', name: this.lib, ret: retval.toString() }); }
);
hook('kernel32.dll', 'LoadLibraryW',
    function(args) { try { this.lib = args[0].readUtf16String(); } catch (e) { this.lib = null; } },
    function(retval) { send({ ev: 'LL', name: this.lib, ret: retval.toString() }); }
);
hook('kernel32.dll', 'LoadLibraryExA',
    function(args) { this.lib = asString(args[0]); },
    function(retval) { send({ ev: 'LL', name: this.lib, ret: retval.toString() }); }
);
hook('kernel32.dll', 'LoadLibraryExW',
    function(args) { try { this.lib = args[0].readUtf16String(); } catch (e) { this.lib = null; } },
    function(retval) { send({ ev: 'LL', name: this.lib, ret: retval.toString() }); }
);

// -------- ntdll: the real underlying syscalls --------

// Skip self-process (handle == -1 = pseudo "current process") to cut noise.
// Cross-process Read/Write always uses a real handle from OpenProcess/NtOpenProcess.
function isSelfHandle(h) {
    var s = h.toString();
    return s === '0xffffffffffffffff' || s === '-1' || s === '0x0';
}

/*
hook('ntdll.dll', 'NtReadVirtualMemory',
    function(args) { this.h = args[0]; this.addr = args[1]; this.buf = args[2]; this.size = args[3].toInt32(); this.brOut = args[4]; this.skip = isSelfHandle(this.h); },
    function(retval) {
        if (this.skip) return;
        var ok = retval.toInt32() === 0;
        var preview = ok ? hexBytes(this.buf, Math.min(this.size, 64)) : '';
        send({ ev: 'NtRPM', handle: this.h.toString(), addr: this.addr.toString(), size: this.size, status: '0x' + (retval.toInt32() >>> 0).toString(16), bytes: preview, caller: moduleOf(this.returnAddress) });
    }
);
*/

hook('ntdll.dll', 'NtWriteVirtualMemory',
    function(args) { this.h = args[0]; this.addr = args[1]; this.buf = args[2]; this.size = args[3].toInt32();
                     this.skip = isSelfHandle(this.h);
                     this.preview = this.skip ? '' : hexBytes(this.buf, this.size, 128); },
    function(retval) {
        if (this.skip) return;
        send({ ev: 'NtWPM', handle: this.h.toString(), addr: this.addr.toString(), size: this.size, status: '0x' + (retval.toInt32() >>> 0).toString(16), bytes: this.preview, caller: moduleOf(this.returnAddress) });
    }
);

/*
hook('ntdll.dll', 'NtQueryVirtualMemory',
    function(args) { this.h = args[0]; this.addr = args[1]; this.cls = args[2].toInt32(); this.buf = args[3]; this.bufLen = args[4].toInt32(); this.skip = isSelfHandle(this.h); },
    function(retval) {
        if (this.skip) return;
        var ok = retval.toInt32() === 0;
        if (!ok) return;
        send({ ev: 'NtQVM', handle: this.h.toString(), addr: this.addr.toString(), class: this.cls, len: this.bufLen, caller: moduleOf(this.returnAddress) });
    }
);
*/

hook('ntdll.dll', 'NtOpenProcess',
    function(args) { this.outHandle = args[0]; this.access = args[1].toInt32() >>> 0; },
    function(retval) {
        var h = '?'; try { h = this.outHandle.readPointer().toString(); } catch (e) {}
        send({ ev: 'NtOpenProcess', access: '0x' + this.access.toString(16), handle: h, status: '0x' + (retval.toInt32() >>> 0).toString(16), caller: moduleOf(this.returnAddress) });
    }
);

// -------- toolhelp + psapi: process discovery --------

hook('kernel32.dll', 'CreateToolhelp32Snapshot',
    function(args) { this.flags = args[0].toInt32() >>> 0; this.pid = args[1].toInt32(); },
    function(retval) { send({ ev: 'TH32', flags: '0x' + this.flags.toString(16), pid: this.pid, ret: retval.toString(), caller: moduleOf(this.returnAddress) }); }
);
hook('kernel32.dll', 'Process32FirstW', null, function(rv) { send({ ev: 'P32F' }); });
hook('kernel32.dll', 'Process32NextW', null, function(rv) { send({ ev: 'P32N' }); });
hook('kernel32.dll', 'Module32FirstW', null, function(rv) { send({ ev: 'M32F' }); });
hook('kernel32.dll', 'Module32NextW', null, function(rv) { send({ ev: 'M32N' }); });

hook('psapi.dll', 'EnumProcesses', null, function(rv) { send({ ev: 'EnumProcesses' }); });
hook('psapi.dll', 'EnumProcessModules', null, function(rv) { send({ ev: 'EnumProcessModules' }); });
hook('psapi.dll', 'GetModuleBaseNameW', null, function(rv) { send({ ev: 'GetModuleBaseNameW' }); });
hook('psapi.dll', 'GetModuleInformation', null, function(rv) { send({ ev: 'GetModuleInformation' }); });

send({ ev: 'ready' });
