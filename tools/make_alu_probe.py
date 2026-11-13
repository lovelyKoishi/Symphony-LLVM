#!/usr/bin/env python3
"""Generate a stack-free hardware ALU probe; hex output uses only base ISA."""
import argparse
from pathlib import Path
from symphony_machine import Machine, assemble

p = argparse.ArgumentParser(description=__doc__)
p.add_argument('-o', type=Path, required=True)
args = p.parse_args()
cases = []
for op, a, b in [('add', 7, 9), ('mul', 7, 9), ('mul', 1024, 3072),
                 ('mul', 0xffffffff, 1024), ('div', 20, 3),
                 ('div', 47185920, 5242880), ('mod', 1760, 80)]:
    for dest in ('r3', 'r1', 'r2'):
        value = {'add': lambda: a+b, 'mul': lambda: a*b,
                 'div': lambda: a//b, 'mod': lambda: a%b}[op]() & 0xffffffff
        cases.append((op, a, b, dest, value))
lines = ['; Actual hardware test. No C backend, stack, calls, or tested ALU ops in hex formatting.',
         'screen zr, 0', 'mov r1, 1', 'screen r1, 32768',
         'mov r1, 2', 'mov r2, 65535', 'lsl r2, r2, 8', 'or r2, r2, 255',
         'screen r1, r2', 'mov r1, 3', 'screen r1, 0', 'mov r1, 4', 'screen r1, 0']
def constant(reg, value):
    if value <= 65535:
        lines.append(f'mov {reg}, {value}')
    else:
        lines.extend([f'mov {reg}, {value>>16}', f'lsl {reg}, {reg}, 16',
                      f'or {reg}, {reg}, {value&65535}'])
for n, (op, a, b, dest, expected) in enumerate(cases):
    constant('r1', a)
    constant('r2', b)
    lines.extend([f'{op} {dest}, r1, r2', f'mov r1, {dest}',
                  f'mov r10, {32768+(n+3)*96+61}', f'mov r12, result_{n}',
                  'jmp print_hex', f'result_{n}:'])
lines.extend(['probe_done:', 'jmp probe_done', 'print_hex:', 'mov r2, 28',
              'hex_loop:', 'lsr r3, r1, r2', 'and r3, r3, 15', 'add r3, r3, 48',
              'cmp r3, 58', 'jb hex_digit', 'add r3, r3, 7', 'hex_digit:',
              'store_8 [r10], r3', 'add r10, r10, 1', 'cmp r2, 0',
              'je hex_return', 'sub r2, r2, 4', 'jmp hex_loop', 'hex_return:', 'jmp r12',
              '@32768', '"ALU PROBE: compare GOT with EXPECT (all hexadecimal)"',
              '@32960', '"OP    A        B        DEST    EXPECT                       GOT"'])
for n, (op, a, b, dest, expected) in enumerate(cases):
    caption = f'{op:5} {a:08X} {b:08X} {dest:6} {expected:08X}'
    lines.extend([f'@{32768+(n+3)*96}', '"'+caption+'"'])
source = '\n'.join(lines)+'\n'
m = Machine(assemble(source))
assert m.run(100_000, stop_labels=('probe_done',)).reason == 'breakpoint'
for n, (_, _, _, _, expected) in enumerate(cases):
    start = 32768+(n+3)*96+61
    assert m.memory[start:start+8] == f'{expected:08X}'.encode()
args.o.write_text(source)
print(f'Validated {len(cases)} rows, {m.steps} instructions; no multiply/divide/modulo in output routine.')
