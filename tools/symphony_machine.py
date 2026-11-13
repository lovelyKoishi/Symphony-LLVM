#!/usr/bin/env python3
"""Current Symphony ISA assembler and machine-word reference executor.

Supports current ISA definitions, labels, const, @, U<n> and ASCII strings.
Does not claim full game ISA-language/include compatibility or gate-level timing.
"""
from __future__ import annotations
import argparse
import ast
import json
from collections import deque
from dataclasses import dataclass
from pathlib import Path
import re
import sys

ROOT = Path(__file__).resolve().parents[1]
MASK = 0xffffffff
RAM_SIZE = 1 << 24

@dataclass
class Program:
    image: bytes
    symbols: dict[str, int]
    source_map: dict[int, tuple[int, str]]
    canonical: tuple[tuple[int, int], ...]

@dataclass
class Result:
    reason: str
    steps: int
    exit_code: int

@dataclass
class Form:
    regex: re.Pattern
    fields: list[tuple[str, str]]
    bits: str


def clean_lines(source):
    """Recognize comments outside quoted strings; preserve original line numbers."""
    block = False
    for number, line in enumerate(source.splitlines(), 1):
        out = []; quote = False; escape = False; i = 0
        while i < len(line):
            if block:
                if line.startswith('*/', i): block = False; i += 2
                else: i += 1
                continue
            c = line[i]
            if quote:
                out.append(c)
                if escape: escape = False
                elif c == '\\': escape = True
                elif c == '"': quote = False
                i += 1; continue
            if line.startswith('/*', i): block = True; out.append(' '); i += 2; continue
            if c == ';' or line.startswith('//', i): break
            out.append(c)
            if c == '"': quote = True
            i += 1
        text = ''.join(out).strip()
        if text: yield number, text
    if block: raise ValueError('unterminated block comment')


def read_isa(path):
    lines = Path(path).read_text().splitlines()
    section = ''; registers = {}; forms = []; canonical = []
    for i, line in enumerate(lines):
        line = line.strip()
        if line.startswith('['): section = line; continue
        if not line or line.startswith('#'): continue
        if section == '[fields]' and re.fullmatch(r'\w+ [01]+', line):
            key, bits = line.split(); registers[key] = int(bits, 2)
        if section != '[instructions]' or i + 1 >= len(lines): continue
        bits = ''.join(lines[i+1].split())
        if not re.fullmatch(r'[01a-z]+', bits) or len(bits) < 32: continue
        if len(bits) % 8: raise ValueError('ISA instruction is not byte-aligned')
        pattern = []; fields = []; end = 0
        for m in re.finditer(r'%([a-z]+)(?::U\d+)?\(([^)]+)\)', line):
            pattern.append(re.escape(line[end:m.start()]))
            pattern.append(r'([A-Za-z_][\w.]*|[-+]?(?:0[xX][\da-fA-F_]+|0[bB][01_]+|[\d_]+))')
            fields.append((m[1][0], m[2])); end = m.end()
        pattern.append(re.escape(line[end:]))
        regex = re.compile(''.join(pattern).replace(r'\ ', r'\s*'))
        forms.append(Form(regex, fields, bits))
        # Multimachine aliases need no additional CPU decode rules.
        if len(bits) == 32:
            mask = int(''.join('1' if c in '01' else '0' for c in bits), 2)
            value = int(''.join(c if c in '01' else '0' for c in bits), 2)
            canonical.append((mask, value))
    if not forms or registers.get('flags') != 15: raise ValueError('unsupported ISA definition')
    return registers, forms, tuple(set(canonical))


def number(text):
    text = text.replace('_', '')
    return int(text, 0) if text.lstrip('+-').lower().startswith(('0x', '0b')) else int(text, 10)


def assemble(source: str, isa_path=ROOT / 'isa/spec.isa') -> Program:
    registers, forms, canonical = read_isa(isa_path)
    aliases = {}; symbols = {}; instructions = []; pieces = []; source_map = {}; pc = 0
    def resolve_alias(value):
        seen = set()
        while value in aliases:
            if value in seen: raise ValueError('cyclic const: ' + value)
            seen.add(value); value = aliases[value]
        return value
    for line_number, line in clean_lines(source):
        try:
            if line.startswith('const '):
                m = re.fullmatch(r'const\s+(\w+)\s*=\s*(\S+)', line)
                if not m: raise ValueError('unsupported const syntax')
                if m[1] in aliases or m[1] in symbols or m[1] in registers: raise ValueError('duplicate/reserved symbol: '+m[1])
                aliases[m[1]] = m[2]; resolve_alias(m[1]); continue
            if line.endswith(':'):
                name = line[:-1]
                if not re.fullmatch(r'[A-Za-z_][\w.]*', name): raise ValueError('invalid label')
                if name in symbols or name in aliases or name in registers: raise ValueError('duplicate/reserved label: ' + name)
                symbols[name] = pc; continue
            if line.startswith('@'):
                address = number(line[1:].strip())
                if address < pc: raise ValueError('backward @ is unsupported')
                if address > RAM_SIZE: raise ValueError('image exceeds 16 MiB')
                pc = address; continue
            data = re.fullmatch(r'U(\d+)\s+(\S+)', line)
            if data:
                w = int(data[1]); value = number(resolve_alias(data[2]))
                if not w or w % 8 or w > RAM_SIZE*8: raise ValueError('invalid raw-data width')
                if value < 0 or value.bit_length() > w: raise ValueError('raw-data value out of range')
                blob = value.to_bytes(w//8, 'big'); pieces.append((pc, blob)); pc += len(blob)
            elif line.startswith('"'):
                text = ast.literal_eval(line)
                if not isinstance(text, str): raise ValueError('invalid string')
                blob = text.encode('ascii'); pieces.append((pc, blob)); pc += len(blob)
            else:
                selected = None
                for form in forms:
                    m = form.regex.fullmatch(line)
                    if not m: continue
                    values = {}; valid = True
                    for (char, kinds), value in zip(form.fields, m.groups()):
                        value = resolve_alias(value)
                        if value in registers:
                            if 'register' not in kinds: valid = False; break
                            v = registers[value]
                        else:
                            try: v = number(value)
                            except ValueError:
                                if 'label' not in kinds: valid = False; break
                                v = value
                            else:
                                if 'immediate' not in kinds: valid = False; break
                        values[char] = v
                    if valid: selected = (form, values); break
                if selected is None: raise ValueError('no matching current-ISA form: ' + line)
                form, values = selected
                instructions.append((pc, form, values, line_number, line))
                size = len(form.bits)//8
                for delta in range(0, size, 4): source_map[pc+delta] = (line_number, line)
                pc += size
            if pc > RAM_SIZE: raise ValueError('image exceeds 16 MiB')
        except (ValueError, SyntaxError) as exc:
            raise ValueError(f'assembly line {line_number}: {exc}') from exc
    image = bytearray(pc)
    for address, blob in pieces: image[address:address+len(blob)] = blob
    for address, form, values, lineno, line in instructions:
        fields = {}
        for char, value in values.items():
            if isinstance(value, str):
                if value not in symbols: raise ValueError(f'assembly line {lineno}: undefined label: {value}')
                value = symbols[value]
            w = form.bits.count(char)
            if value < 0 or value >= (1 << w): raise ValueError(f'assembly line {lineno}: {value} outside U{w}')
            fields[char] = iter(f'{value:0{w}b}')
        bits = ''.join(c if c in '01' else next(fields[c]) for c in form.bits)
        blob = int(bits, 2).to_bytes(len(bits)//8, 'big')
        image[address:address+len(blob)] = blob
    return Program(bytes(image), symbols, source_map, canonical)


def s32(value):
    return value if value < 0x80000000 else value - (1 << 32)

class Machine:
    def __init__(self, program: Program, *, keyboard=(), inputs=(), time_ns=0, persistent=None,
                 profile=False, stack_top=RAM_SIZE):
        self.program = program
        self.memory = bytearray(RAM_SIZE)
        self.memory[:len(program.image)] = program.image
        self.registers = [0]*16
        self.pc = 0; self.steps = 0
        self.keyboard = deque(keyboard); self.inputs = deque(inputs)
        self.time_ns = time_ns; self.saved_time = 0
        self.screen = {}; self.outputs = []; self.events = []
        self.stats = dict(loads=0, stores=0, load_bytes=0, store_bytes=0,
                          branches=0, taken_branches=0, max_stack_bytes=0) if profile else None
        self.stack_top = stack_top
        self.stack_started = False
        # Explicit test device capacity, NOT a claim about hardware SSD size.
        self.persistent = persistent if persistent is not None else bytearray(1 << 20)

    def read(self, address, size, persistent=False):
        if persistent:
            if address < 0 or address+size > len(self.persistent): raise ValueError('persistent address outside configured device')
            return int.from_bytes(self.persistent[address:address+size], 'big')
        result = 0
        for i in range(size): result = (result << 8) | self.memory[(address+i) & (RAM_SIZE-1)]
        return result

    def write(self, address, value, size, persistent=False):
        if persistent and (address < 0 or address+size > len(self.persistent)): raise ValueError('persistent address outside configured device')
        memory = self.persistent if persistent else self.memory
        for i in range(size):
            index = address+i if persistent else (address+i)&(RAM_SIZE-1)
            memory[index] = (value >> (8*(size-1-i))) & 255

    def step(self):
        old_pc = self.pc; w = self.read(old_pc, 4)
        if not any(w & mask == value for mask, value in self.program.canonical):
            raise ValueError(f'unsupported encoding 0x{w:08x}')
        mode = (w >> 29) & 3; op = (w >> 24) & 15; d = (w >> 20) & 15
        r = self.registers; a = r[(w >> 16) & 15]
        b = w & 65535 if w & (1 << 28) else r[(w >> 8) & 15]
        next_pc = (old_pc + 4) & MASK
        result = None
        if mode == 0:
            if op == 0: pass
            elif op == 1: result = self.inputs.popleft() if self.inputs else 0
            elif op == 2:
                self.outputs.append(b); self.events.append((self.steps, old_pc, 'out', b))
            elif op == 3: result = self.keyboard.popleft() if self.keyboard else 0
            elif op == 4:
                if not (0 <= a <= 4): raise ValueError('unverified screen setting index')
                if a == 0 and b > 3: raise ValueError('unverified screen mode')
                self.screen[a] = b; self.events.append((self.steps, old_pc, 'screen', a, b))
            elif op == 5:
                self.saved_time = (self.time_ns(self.steps) if callable(self.time_ns) else self.time_ns) & ((1 << 64)-1)
                result = self.saved_time & MASK
            elif op == 6: result = self.saved_time >> 32
            elif op == 7: result = old_pc
        elif mode == 1:
            if op == 0: result = ~(a & b)
            elif op == 1: result = a | b
            elif op == 2: result = a & b
            elif op == 3: result = ~(a | b)
            elif op == 4: result = a + b
            elif op == 5: result = a - b
            elif op == 6: result = a ^ b
            elif op in (7, 8, 9):
                if b >= 32: raise ValueError('unverified shift count >=32')
                result = a << b if op == 7 else a >> b if op == 8 else s32(a) >> b
            elif op == 10: result = int(a == b) | (int(a < b) << 1) | (int(s32(a) < s32(b)) << 2)
            elif op == 12: result = a * b
            elif op in (13, 14):
                if b == 0: raise ValueError('unverified division/remainder by zero')
                result = a // b if op == 13 else a % b
            else: raise ValueError('unsupported ALU opcode')
        elif mode == 2:
            taken = bool(op & (a & 7)) != bool(op & 8)
            if taken: next_pc = b
            if self.stats is not None:
                self.stats['branches'] += 1
                self.stats['taken_branches'] += int(taken)
        elif mode == 3:
            size = (1, 2, 4, 4)[op & 3]
            if self.stats is not None:
                self.stats['loads' if op < 4 else 'stores'] += 1
                self.stats['load_bytes' if op < 4 else 'store_bytes'] += size
            if op < 4: result = self.read(b, size, op == 3)
            else: self.write(b, a, size, op == 7)
        if result is not None and d: r[d] = result & MASK
        r[0] = 0; self.pc = next_pc; self.steps += 1
        if self.stats is not None:
            if r[14] == self.stack_top:
                self.stack_started = True
            if self.stack_started:
                self.stats['max_stack_bytes'] = max(self.stats['max_stack_bytes'],
                                                    self.stack_top-r[14])

    def run(self, max_steps=1_000_000, *, stop_labels=('__sym_halt',), breakpoints=()):
        stops = set(breakpoints) | {self.program.symbols[n] for n in stop_labels if n in self.program.symbols}
        trap = self.program.symbols.get('__sym_trap')
        for _ in range(max_steps):
            if self.pc == trap: raise ValueError('guest reached LLVM unreachable trap')
            if self.pc in stops: return Result('breakpoint', self.steps, self.registers[1])
            try: self.step()
            except ValueError as exc:
                location = self.program.source_map.get(self.pc)
                raise ValueError(f'PC=0x{self.pc:08x}, step={self.steps}, source={location}: {exc}') from exc
        return Result('step-limit', self.steps, self.registers[1])


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('source', type=Path)
    p.add_argument('--isa', type=Path, default=ROOT / 'isa/spec.isa')
    p.add_argument('--binary', type=Path, help='write big-endian assembled image')
    p.add_argument('--run', action='store_true')
    p.add_argument('--profile', action='store_true', help='report data accesses, branches and maximum stack depth')
    p.add_argument('--stack-top', type=lambda s: int(s,0), default=RAM_SIZE,
                   help='initial stack top used for profiling (default 0x1000000)')
    p.add_argument('--max-steps', type=int, default=1_000_000)
    p.add_argument('--input', default='', help='comma-separated integer input values')
    p.add_argument('--keys', default='', help='comma-separated raw keyboard events')
    args = p.parse_args()
    if args.profile and not args.run: p.error('--profile requires --run')
    program = assemble(args.source.read_text(), args.isa)
    if args.binary: args.binary.write_bytes(program.image)
    if args.run:
        values = lambda s: [number(v.strip()) for v in s.split(',') if v.strip()]
        machine = Machine(program, inputs=values(args.input), keyboard=values(args.keys),
                          profile=args.profile,stack_top=args.stack_top)
        result = machine.run(args.max_steps)
        print(f'{result.reason}: steps={result.steps}, r1={result.exit_code}, pc=0x{machine.pc:x}')
        print('out:', ' '.join(str(v) for v in machine.outputs))
        if args.profile: print('profile:',json.dumps(machine.stats,sort_keys=True))
        if result.reason == 'step-limit': return 2
    else: print(f'assembled {len(program.image)} bytes, {len(program.symbols)} labels')
    return 0

if __name__ == '__main__':
    try: sys.exit(main())
    except (ValueError, OSError) as exc:
        print(f'symphony-machine: {exc}', file=sys.stderr); sys.exit(1)
