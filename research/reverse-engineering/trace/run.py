"""
Frida harness: spawn FMKEDT26.exe, install hook.js, log every event to trace.log.

Usage:
    py run.py spawn       # spawns the bundled FMKEDT26.exe (default)
    py run.py attach      # attach to a running FMKEDT26.exe by name
    py run.py attach --pid 1234

Interactive flow:
    The script reads ENTER from stdin to inject named "MARK" events into the
    trace, separating phases (idle / connect / load_player / apply / etc).
    Press Ctrl+C when done.

Output:
    trace.log (JSONL) in this folder.
"""
import argparse, json, os, sys, time, threading
from pathlib import Path

import frida

DEFAULT_EXE = r"c:\Users\신민석\dev\fm26-rte\FMKEDT26-v3.0-win-x64-standalone\FMKEDT26.exe"
HOOK_JS = Path(__file__).parent / "hook.js"
LOG     = Path(__file__).parent / "trace.log"

PHASES = [
    ("startup",         "fmkedt26 starts; hooks already armed"),
    ("connect",         "After you click 'Connect' in fmkedt26 GUI"),
    ("load_player",     "After you type a UID and click 'Load Player'"),
    ("apply",           "After you change a value and click 'Apply Changes'"),
    ("done",            "End of capture — Ctrl+C right after this"),
]

def main():
    import ctypes
    import sys
    if not ctypes.windll.shell32.IsUserAnAdmin():
        print("[!] Administrator privileges required. Spawning an elevated terminal...")
        args_str = " ".join([f'"{arg}"' for arg in sys.argv])
        ctypes.windll.shell32.ShellExecuteW(None, "runas", sys.executable, args_str, None, 1)
        sys.exit(0)

    ap = argparse.ArgumentParser()
    ap.add_argument("mode", choices=["spawn", "attach"])
    ap.add_argument("--exe", default=DEFAULT_EXE)
    ap.add_argument("--name", default="FMKEDT26.exe")
    ap.add_argument("--pid", type=int, default=None)
    ap.add_argument("--out", default=str(LOG))
    args = ap.parse_args()

    out = open(args.out, "w", encoding="utf-8", buffering=1)
    print(f"[+] Logging to {args.out}")
    counts = {}
    interesting = ("OpenProcess", "NtOpenProcess", "WPM", "NtWPM", "VPE", "MARK", "ready", "hook_miss", "hook_err")

    def on_message(message, data):
        if message.get("type") == "send":
            payload = message["payload"]
            ev = payload.get("ev", "?")
            counts[ev] = counts.get(ev, 0) + 1
            payload["t"] = time.time()
            out.write(json.dumps(payload, ensure_ascii=False) + "\n")
            if ev in interesting:
                print(f"  >> {ev}: {payload}")
        elif message.get("type") == "error":
            print(f"  !! script error: {message}")

    if args.mode == "spawn":
        print(f"[+] Spawning {args.exe}")
        pid = frida.spawn(args.exe)
        session = frida.attach(pid)
    else:
        target = args.pid if args.pid is not None else args.name
        print(f"[+] Attaching to {target}")
        session = frida.attach(target)
        pid = None

    script = session.create_script(HOOK_JS.read_text(encoding="utf-8"))
    script.on("message", on_message)
    script.load()

    if args.mode == "spawn":
        frida.resume(pid)

    print()
    print("=" * 60)
    print("  HOOKS ARE LIVE.  Use the FMKEDT26 GUI as instructed below.")
    print("  After EACH step, come back here and press ENTER to mark the")
    print("  phase boundary in the log.  Ctrl+C when fully done.")
    print("=" * 60)
    print()

    def mark_loop():
        for label, hint in PHASES:
            try: input(f"  [press ENTER after: {label} — {hint}] ")
            except EOFError: return
            try: script.exports_sync.mark(label)
            except Exception as e:
                # Older frida API uses .exports
                try: script.exports.mark(label)
                except Exception as e2: print(f"  (mark RPC failed: {e2})")
            print(f"  >> marked: {label}")
        print("  All phases marked. Ctrl+C to stop and dump summary.")

    t = threading.Thread(target=mark_loop, daemon=True)
    t.start()

    try:
        while True:
            time.sleep(1)
    except KeyboardInterrupt:
        print("\n[+] Stopping. Event counts:")
        for k, v in sorted(counts.items(), key=lambda x: -x[1]):
            print(f"     {k:25s} {v}")
        try: session.detach()
        except Exception: pass
        out.close()

if __name__ == "__main__":
    main()
