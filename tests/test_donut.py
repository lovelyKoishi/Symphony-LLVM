#!/usr/bin/env python3
"""Compile a real upstream program and compare two target frames to its C core."""
import argparse
from pathlib import Path
import shutil
import subprocess
import sys
import tempfile
import time
import unittest

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT/'tools'))
from symphony_machine import assemble, Machine

parser=argparse.ArgumentParser()
parser.add_argument('--backend',type=Path,default=ROOT/'build/llvm2symphony')
parser.add_argument('--artifacts',type=Path)
parser.add_argument('--single-frame',action='store_true')
parser.add_argument('--low-memory',action='store_true')
parser.add_argument('--diagnostics',action='store_true')
parser.add_argument('--opt',choices=('0','1','2','3'),default='1')
parser.add_argument('--runtime-dir',type=Path,help='optional saved runtime source snapshot')
args,remaining=parser.parse_known_args()
sys.argv=[sys.argv[0]]+remaining
BACKEND=args.backend.resolve()


def frame(memory, address):
    return b''.join(memory[address+(row+9)*96+8:address+(row+9)*96+88] for row in range(22))


class DonutPortTests(unittest.TestCase):
    def test_target_frames_match_upstream(self):
        with tempfile.TemporaryDirectory() as tmp:
            tmp=Path(tmp);reference=tmp/'reference';asm=tmp/'donut.asm'
            native=subprocess.run(['cc','-std=c11','-O1','-fsanitize=undefined',
                                   '-fno-sanitize-recover=undefined',
                                   '-I',str(ROOT/'tests/fixtures/litex'),
                                   str(ROOT/'tests/donut_reference.c'),'-o',str(reference)],
                                  capture_output=True,text=True)
            self.assertEqual(native.returncode,0,native.stderr)
            count=1 if args.single_frame else 2
            references=[]
            for n in range(1,count+1):
                r=subprocess.run([str(reference),str(n)],capture_output=True)
                self.assertEqual(r.returncode,0,r.stderr.decode(errors='replace'))
                self.assertEqual(len(r.stdout),3520)
                references.append(r.stdout)
            if count==2:
                self.assertNotEqual(references[0][:1760],references[-1][:1760], 'rotation must change the next frame')
            command=[sys.executable,str(ROOT/'tools/symphony-cc'),
                     str(ROOT/'ports/donut.c'),'--libc','-O'+args.opt,f'-DDONUT_FRAMES={count}',
                     '--backend',str(BACKEND),'-o',str(asm)]
            if args.runtime_dir:
                command.remove('--libc')
                runtime_sources=[str(args.runtime_dir/'tty.c')]
                if (args.runtime_dir/'tty_ascii8.c').is_file():
                    runtime_sources.append(str(args.runtime_dir/'tty_ascii8.c'))
                runtime_sources.extend(str(args.runtime_dir/'libc'/name) for name in
                                       ('string.c','ctype.c','stdlib.c','num.c','stdio.c'))
                command[3:3]=runtime_sources
            if args.single_frame or args.diagnostics:
                command += ['-DDONUT_DIAGNOSTICS=1']
            if args.single_frame or args.low_memory:
                command += ['--data-base','0x8000','--stack-top','0x10000']
            compiled=subprocess.run(command,capture_output=True,text=True)
            self.assertEqual(compiled.returncode,0,compiled.stderr)
            text=asm.read_text();addresses={}
            for line in text.splitlines():
                if line.startswith('; ') and ' = ' in line:
                    key,value=line[2:].split(' = ')
                    addresses[key]=int(value)
            self.assertIn('framebuffer',addresses)
            m=Machine(assemble(text))
            if args.single_frame or args.low_memory:
                self.assertLessEqual(len(m.program.image),65536)
                # No address wrapping: an unexpected access above 64KiB raises.
                m.memory=m.memory[:65536]
            if args.single_frame or args.diagnostics:
                # Require a visible startup message before the expensive render.
                startup=m.run(5000)
                self.assertNotEqual(startup.reason,'breakpoint')
                base=addresses['framebuffer']
                self.assertEqual(m.screen[1],base)
                self.assertEqual(m.memory[base+2*96+8:base+2*96+20],b'Rendering...')
            start=time.monotonic()
            for chunk in range(100):
                result=m.run(500_000)
                if result.reason=='breakpoint':break
                if (chunk+1)%4==0:
                    print(f'donut: {m.steps:,} target instructions, {time.monotonic()-start:.1f}s',flush=True)
            else:self.fail(f'donut did not complete {count} frame(s) within 50M instructions')
            self.assertEqual(result.exit_code,0)
            self.assertEqual(m.screen[0],0)
            self.assertEqual(m.screen[2],0xffffff)
            base=addresses['framebuffer']
            last=base+3840 if args.single_frame or not args.diagnostics else base
            self.assertEqual(m.screen[1],last)
            if count==2:
                first=base+3840 if args.diagnostics else base
                self.assertEqual(frame(m.memory,first),references[0][:1760])
            else:
                self.assertEqual(base,0x8000)
                self.assertEqual(m.memory[base+3840+2*96+8:base+3840+2*96+20],b'Frame ready.')
            self.assertEqual(frame(m.memory,last),references[-1][:1760])
            if args.single_frame or args.diagnostics:
                for n, reference_bytes in enumerate(references):
                    page=base+(1 if args.single_frame else 1-n)*3840
                    stats=bytes(m.memory[page+5*96+8:page+5*96+51])
                    self.assertGreater(int(stats[5:13],16),0)
                    expected_ink=sum(c not in (0,32) for c in reference_bytes[:1760])
                    self.assertEqual(int(stats[18:26],16),expected_ink)
                    self.assertEqual(stats[35:43],b'00000000')
                    coordinates=bytes(m.memory[page+6*96+8:page+6*96+40])
                    print(f'frame {n}: {stats.decode()} | {coordinates.decode()}',flush=True)
            self.assertEqual(m.memory[addresses['z']:addresses['z']+1760],references[-1][1760:])
            self.assertEqual(m.registers[14],0x10000 if args.single_frame or args.low_memory else 0x1000000)
            print(f'donut: {count} frame(s) + depth buffer match upstream; {m.steps:,} instructions',flush=True)
            if args.artifacts:
                args.artifacts.mkdir(parents=True,exist_ok=True)
                if args.single_frame:
                    shutil.copyfile(asm,args.artifacts/'donut_static.asm')
                    (args.artifacts/'donut_static_frame.txt').write_bytes(frame(m.memory,base+3840))
                    (args.artifacts/'donut_static_framebuffer.bin').write_bytes(m.memory[base+3840:base+7680])
                    (args.artifacts/'donut_static_metrics.txt').write_text(f'instructions={m.steps}\nseconds={time.monotonic()-start:.3f}\n')
                else:
                    shutil.copyfile(asm,args.artifacts/'donut_test.asm')
                    for n in (0,1):
                        address=base+(1-n if args.diagnostics else n)*3840
                        (args.artifacts/f'donut_frame{n+1}.txt').write_bytes(frame(m.memory,address))
                    (args.artifacts/'donut_framebuffer.bin').write_bytes(m.memory[last:last+3840])
                    (args.artifacts/'donut_metrics.txt').write_text(f'instructions={m.steps}\nseconds={time.monotonic()-start:.3f}\n')

if __name__=='__main__':unittest.main()
