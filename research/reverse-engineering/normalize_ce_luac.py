from __future__ import annotations

import argparse
from pathlib import Path


STD_LUA53_TAIL = bytes.fromhex(
    "19 93 0d 0a 1a 0a 04 08 04 08 08 78 56 00 00 00 00 00 00 00 00 00 00 00 28 77 40"
)


class CeChunkNormalizer:
    def __init__(self, data: bytes):
        if data[:5] != b"\x1bLuaS":
            raise ValueError("not a Lua 5.3 chunk")

        self.custom = data[5] == 1 and data[14:41] == STD_LUA53_TAIL
        if self.custom:
            self.seed = int.from_bytes(data[6:14], "little")
            self.data = data
            self.pos = 41
            self.out = bytearray(data[:5] + b"\x00" + data[14:41])
        else:
            self.seed = 0
            self.data = data
            self.pos = 33
            self.out = bytearray(data[:33])

    def mask(self, index: int) -> int:
        if not self.custom:
            return 0
        if index % 8 == 0:
            return 0xCE
        return (self.seed >> (index % 14)) & 0xFF

    def read_raw(self, size: int) -> bytes:
        block = self.data[self.pos : self.pos + size]
        if len(block) != size:
            raise EOFError("truncated chunk")
        self.pos += size
        return block

    def read_block(self, size: int) -> bytes:
        block = bytearray(self.read_raw(size))
        if self.custom:
            for i in range(size):
                block[i] ^= self.mask(i)
        self.out.extend(block)
        return bytes(block)

    def read_byte(self) -> int:
        return self.read_block(1)[0]

    def read_int(self) -> int:
        return int.from_bytes(self.read_block(4), "little", signed=True)

    def read_size_t(self) -> int:
        return int.from_bytes(self.read_block(8), "little", signed=False)

    def read_number(self) -> bytes:
        return self.read_block(8)

    def read_integer(self) -> bytes:
        return self.read_block(8)

    def read_string(self) -> None:
        size = self.read_byte()
        if size == 0xFF:
            size = self.read_size_t()
        if size:
            self.read_block(size - 1)

    def read_code(self) -> None:
        n = self.read_int()
        block = bytearray(self.read_raw(n * 4))
        if self.custom:
            for i in range(len(block)):
                block[i] ^= self.mask(i)
            for i in range(n):
                block[i * 4] = (block[i * 4] - (i % 4)) & 0xFF
        self.out.extend(block)

    def read_constants(self) -> None:
        n = self.read_int()
        for _ in range(n):
            t = self.read_byte()
            if t == 0:  # nil
                pass
            elif t == 1:  # boolean
                self.read_byte()
            elif t == 3:  # float
                self.read_number()
            elif t == 19:  # integer
                self.read_integer()
            elif t in (4, 20):  # short/long string
                self.read_string()
            else:
                raise ValueError(f"unknown constant type {t} at input offset {self.pos - 1}")

    def read_upvalues(self) -> None:
        n = self.read_int()
        for _ in range(n):
            self.read_byte()
            self.read_byte()

    def read_protos(self) -> None:
        n = self.read_int()
        for _ in range(n):
            self.read_function()

    def read_debug(self) -> None:
        n = self.read_int()
        self.read_block(n * 4)
        n = self.read_int()
        for _ in range(n):
            self.read_string()
            self.read_int()
            self.read_int()
        n = self.read_int()
        for _ in range(n):
            self.read_string()

    def read_function(self) -> None:
        self.read_string()
        self.read_int()
        self.read_int()
        self.read_byte()
        self.read_byte()
        self.read_byte()
        self.read_code()
        self.read_constants()
        self.read_upvalues()
        self.read_protos()
        self.read_debug()

    def normalize(self) -> bytes:
        self.read_byte()  # root upvalue count
        self.read_function()
        if self.pos != len(self.data):
            raise ValueError(f"trailing data: {len(self.data) - self.pos} bytes")
        return bytes(self.out)


def normalize_file(path: Path, out_path: Path) -> None:
    normalizer = CeChunkNormalizer(path.read_bytes())
    out_path.parent.mkdir(parents=True, exist_ok=True)
    out_path.write_bytes(normalizer.normalize())


def main() -> int:
    parser = argparse.ArgumentParser(description="Normalize tdg6661/Cheat Engine custom Lua 5.3 chunks.")
    parser.add_argument("inputs", nargs="+", type=Path)
    parser.add_argument("-o", "--out", type=Path, required=True)
    args = parser.parse_args()

    args.out.mkdir(parents=True, exist_ok=True)
    for path in args.inputs:
        out_path = args.out / path.name
        normalize_file(path, out_path)
        print(f"{path} -> {out_path}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
