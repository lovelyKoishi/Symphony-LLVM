#!/usr/bin/env python3
"""Exercise the 2D library through compiled Symphony machine words."""
import argparse
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT/'tools'))
from symphony_machine import assemble, Machine

parser = argparse.ArgumentParser()
parser.add_argument('--backend', type=Path, default=ROOT/'build/llvm2symphony')
args, remaining = parser.parse_known_args()
sys.argv = [sys.argv[0]] + remaining
BACKEND = args.backend.resolve()


class GFXTests(unittest.TestCase):
    def compile(self, body, opt='1', tty=False):
        with tempfile.TemporaryDirectory() as tmp:
            source = Path(tmp)/'test.c'; asm = Path(tmp)/'test.asm'
            source.write_text('#include "gfx.h"\n#include "symphony.h"\n#include "tty.h"\n'
                              'int main(void) { gfx_init();\n'+body+'\nreturn 0; }\n')
            command = [sys.executable,str(ROOT/'tools/symphony-cc'),str(source),
                       '--gfx','-O'+opt,'-o',str(asm),'--backend',str(BACKEND)]
            if tty: command.append('--tty')
            p = subprocess.run(command,capture_output=True,text=True)
            self.assertEqual(p.returncode,0,p.stderr)
            return assemble(asm.read_text())

    def execute(self, program, inputs=(), guard=True):
        m = Machine(program,inputs=[n & 0xffffffff for n in inputs])
        for _ in range(10000):
            if 1 in m.screen: break
            m.step()
        else: self.fail('gfx_init did not attach the framebuffer')
        base = m.screen[1]
        if guard:
            m.memory[base-1]=0xa5
            m.memory[base+128*96]=0x5a
        result=m.run(2_000_000)
        self.assertEqual((result.reason,result.exit_code),('breakpoint',0))
        self.assertEqual((m.screen[0],m.screen[2]),(2,31))
        self.assertEqual(m.registers[14],0x1000000)
        if guard:
            self.assertEqual(m.memory[base-1],0xa5)
            self.assertEqual(m.memory[base+128*96],0x5a)
        return m,bytes(m.memory[m.screen[1]:m.screen[1]+128*96])

    def assert_pixels(self, frame, expected):
        actual={(i%128,i//128):v for i,v in enumerate(frame) if v}
        self.assertEqual(actual,expected)

    def test_init_pixel_bounds_and_reinit_does_not_clear(self):
        program=self.compile('''gfx_pixel(0,0,GFX_RED);gfx_pixel(127,95,GFX_CYAN);
gfx_pixel(64,48,GFX_WHITE);gfx_pixel(-1,0,255);gfx_pixel(128,0,255);
gfx_pixel(0,-1,255);gfx_pixel(0,96,255);gfx_pixel(-32768,32767,255);gfx_init();''')
        _,frame=self.execute(program)
        self.assert_pixels(frame,{(0,0):224,(127,95):31,(64,48):255})

    def test_clear_and_o0_link(self):
        program=self.compile('gfx_pixel(1,1,255);gfx_clear(GFX_BLUE);gfx_pixel(64,48,255);',opt='0')
        _,frame=self.execute(program)
        expected=bytearray([3])*(128*96);expected[48*128+64]=255
        self.assertEqual(frame,expected)

    def test_all_eight_line_octants(self):
        program=self.compile('''int x0=(int)symphony_in(),y0=(int)symphony_in();
int x1=(int)symphony_in(),y1=(int)symphony_in();gfx_line(x0,y0,x1,y1,255);''')
        offsets=[(0,0),(1,1),(2,1),(3,2),(4,2),(5,3),(6,3)]
        for steep in (False,True):
            for sx in (-1,1):
                for sy in (-1,1):
                    with self.subTest(steep=steep,sx=sx,sy=sy):
                        points=[(64+sx*(y if steep else x),48+sy*(x if steep else y)) for x,y in offsets]
                        _,frame=self.execute(program,[64,48,*points[-1]])
                        self.assert_pixels(frame,{p:255 for p in points})

    def test_line_clipping_extremes_and_rejection(self):
        program=self.compile('''int x0=(int)symphony_in(),y0=(int)symphony_in();
int x1=(int)symphony_in(),y1=(int)symphony_in();gfx_line(x0,y0,x1,y1,255);''')
        cases=[
            ((-32768,48,32767,48),{(x,48):255 for x in range(128)}),
            ((64,-32768,64,32767),{(64,y):255 for y in range(96)}),
            ((-32768,-32768,32767,32767),{(x,x):255 for x in range(96)}),
            ((32767,32767,-32768,-32768),{(x,x):255 for x in range(96)}),
            ((-10,5,5,-10),{}),
            ((200,-1000,200,3000),{}),
            ((-10,-1,200,-1),{}),
            ((33,44,33,44),{(33,44):255}),
        ]
        for coordinates,expected in cases:
            with self.subTest(coordinates=coordinates):
                _,frame=self.execute(program,coordinates)
                self.assert_pixels(frame,expected)

    def test_rectangle_outline_and_degenerate_sizes(self):
        _,frame=self.execute(self.compile('''gfx_rect(10,10,5,4,GFX_RED);
gfx_rect(40,10,1,3,GFX_RED);gfx_rect(50,10,3,1,GFX_RED);
gfx_rect(60,10,1,1,GFX_RED);gfx_rect(0,0,0,5,255);gfx_rect(0,0,5,-1,255);'''))
        points={(x,y) for x in range(10,15) for y in range(10,14) if x in (10,14) or y in (10,13)}
        points|={(40,y) for y in range(10,13)}|{(x,10) for x in range(50,53)}|{(60,10)}
        self.assert_pixels(frame,{p:224 for p in points})

    def test_rectangle_clipping_does_not_invent_edges(self):
        _,frame=self.execute(self.compile('''gfx_rect(-2,-2,5,5,255);
gfx_rect(-1,-1,130,98,255);gfx_rect(32760,32760,32767,32767,255);'''))
        self.assert_pixels(frame,{p:255 for p in ((2,0),(2,1),(2,2),(0,2),(1,2))})
        _,frame=self.execute(self.compile('gfx_rect(0,0,128,96,255);'))
        self.assert_pixels(frame,{(x,y):255 for x in range(128) for y in range(96) if x in (0,127) or y in (0,95)})

    def test_gfx_and_tty_link_with_distinct_framebuffers(self):
        m,frame=self.execute(self.compile('''tty_puts("A");gfx_pixel(1,1,255);gfx_init();''',tty=True),guard=False)
        buffers=[e[4] for e in m.events if e[2]=='screen' and e[3]==1]
        self.assertEqual(len(buffers),3)
        self.assertEqual(buffers[0],buffers[2])
        self.assertNotEqual(buffers[0],buffers[1])
        self.assertEqual(m.memory[buffers[1]],65)
        self.assert_pixels(frame,{(1,1):255})


if __name__=='__main__':unittest.main()
