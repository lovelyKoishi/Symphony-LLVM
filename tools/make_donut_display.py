#!/usr/bin/env python3
"""Make a display-only ASM diagnostic from a validated 80x22 donut frame."""
import argparse
from pathlib import Path
from symphony_machine import assemble, Machine

p=argparse.ArgumentParser(description=__doc__)
p.add_argument('frame',type=Path)
p.add_argument('-o',required=True,type=Path)
a=p.parse_args()
raw=a.frame.read_bytes()
if len(raw)!=1760 or any(c!=0 and not 32<=c<127 for c in raw):
    p.error('expected 1760 bytes of ASCII frame data')
lines=['; Display-only diagnostic: a pre-rendered first frame, no donut math.',
       '; Snapshot from the validated Symphony executor. See donut.LICENSE.txt.',
       'screen zr, 0','or r1, zr, 1','screen r1, 32768',
       'or r1, zr, 2','or r2, zr, 65535','lsl r2, r2, 8','or r2, r2, 255',
       'screen r1, r2','or r1, zr, 3','screen r1, 0',
       'or r1, zr, 4','screen r1, 0','display_done:','jmp display_done',
       '@32968','"DISPLAY TEST: pre-rendered frame"',
       '@33160','"No calculation. This picture should appear immediately."']
for row in range(22):
    data=raw[row*80:(row+1)*80]
    text=''.join('\\0' if c==0 else '\\"' if c==34 else '\\\\' if c==92 else chr(c) for c in data)
    lines += ['@'+str(32768+(row+9)*96+8),'"'+text+'"']
source='\n'.join(lines)+'\n'
program=assemble(source)
assert len(program.image)<65536
m=Machine(program)
assert m.run(100,stop_labels=('display_done',)).reason=='breakpoint'
assert m.screen[1]==32768
assert b''.join(m.memory[32768+(row+9)*96+8:32768+(row+9)*96+88] for row in range(22))==raw
a.o.write_text(source)
print(f'Display diagnostic verified: {m.steps} instructions, framebuffer 0x8000')
