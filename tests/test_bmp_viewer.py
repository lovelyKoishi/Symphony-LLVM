#!/usr/bin/env python3
"""Run one BMP reader against independently constructed BMP disk images."""
import argparse
from pathlib import Path
import struct
import subprocess
import sys
import tempfile
import unittest

ROOT=Path(__file__).resolve().parents[1]
sys.path.insert(0,str(ROOT/'tools'))
from symphony_machine import Machine,assemble

parser=argparse.ArgumentParser()
parser.add_argument('--backend',type=Path,default=ROOT/'build/llvm2symphony')
args,remaining=parser.parse_known_args()
sys.argv=[sys.argv[0]]+remaining
DISK_BYTES=16777216

def color(x,y):
    return ((x*53+y*17)&255,(x*11+y*73)&255,(x*29+y*31)&255)

def make_bmp(width,height,bits=24,top_down=False,dib=40,gap=0):
    stride=(width*(bits//8)+3)&~3
    offset=14+dib+gap
    size=offset+stride*height
    data=bytearray(size)
    struct.pack_into('<2sIHHI',data,0,b'BM',size,0,0,offset)
    struct.pack_into('<IiiHHIIiiII',data,14,dib,width,-height if top_down else height,
                     1,bits,0,0,0,0,0,0)
    for stored_y in range(height):
        y=stored_y if top_down else height-1-stored_y
        for x in range(width):
            r,g,b=color(x,y)
            index=offset+stored_y*stride+x*(bits//8)
            data[index:index+3]=bytes((b,g,r))
            if bits==32:data[index+3]=0xa7 # Reserved byte must not become alpha.
        end=offset+stored_y*stride+width*(bits//8)
        data[end:offset+(stored_y+1)*stride]=bytes([0xe9])*(stride-width*(bits//8))
    return data

def native_canvas(width,height):
    k=max((width+3)//4,(height+2)//3)
    sw,sh=k*4,k*3
    left,top=(sw-width)//2,(sh-height)//2
    result=bytearray(sw*sh*4)
    for y in range(height):
        for x in range(width):
            index=((y+top)*sw+x+left)*4
            result[index:index+4]=bytes((*color(x,y),0))
    return result,k-1

class BMPViewerTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        with tempfile.TemporaryDirectory() as directory:
            cls.program=cls.compile(Path(directory),0)

    @staticmethod
    def compile(tmp,offset):
        out=tmp/'bmp.asm'
        subprocess.run([sys.executable,str(ROOT/'tools/symphony-cc'),
                        str(ROOT/'examples/bmp_viewer.c'),'--tty','-O1',
                        f'-DBMP_DISK_OFFSET={offset}',
                        '--backend',str(args.backend.resolve()),'-o',str(out)],check=True)
        return assemble(out.read_text())

    def run_image(self,bmp,expected=None,resolution=None,offset=0,program=None):
        disk=bytearray(DISK_BYTES)
        disk[offset:offset+len(bmp)]=bmp
        machine=Machine(program or self.program,persistent=disk)
        base=0x400000
        length=len(expected) if expected is not None else 48
        machine.memory[base:base+length]=bytes([0xcc])*length
        machine.memory[base-1]=0xa5;machine.memory[base+length]=0x5a
        # Fail immediately if a parser path attempts to mutate the disk.
        original_write=machine.write
        def write(address,value,size,persistent=False):
            if persistent:raise AssertionError('BMP viewer wrote the disk')
            original_write(address,value,size,persistent)
        machine.write=write
        result=machine.run(16000000)
        self.assertEqual(result.reason,'breakpoint')
        self.assertEqual(machine.registers[14],0x1000000)
        self.assertEqual(machine.memory[base-1],0xa5)
        self.assertEqual(machine.memory[base+length],0x5a)
        if expected is None:
            self.assertEqual(result.exit_code,1)
            self.assertEqual(machine.screen[0],0)
            self.assertEqual(machine.memory[base:base+length],bytes([0xcc])*length)
        else:
            self.assertEqual(result.exit_code,0)
            self.assertEqual(machine.screen,{0:3,2:resolution,1:base})
            self.assertEqual(machine.memory[base:base+length],expected)
        return machine

    def test_both_depths_directions_and_all_row_padding_lengths(self):
        for bits in (24,32):
            for top_down in (False,True):
                for width in (1,2,3,4):
                    with self.subTest(bits=bits,top_down=top_down,width=width):
                        expected,resolution=native_canvas(width,2)
                        self.run_image(make_bmp(width,2,bits,top_down),expected,resolution)

    def test_extended_headers_pixel_gap_and_letterbox(self):
        for dib in (40,108,124):
            with self.subTest(dib=dib):
                expected,resolution=native_canvas(5,4)
                self.run_image(make_bmp(5,4,dib=dib,gap=7),expected,resolution)

    def test_unaligned_file_offset_and_last_disk_pixel(self):
        bmp=make_bmp(4,1)
        expected,resolution=native_canvas(4,1)
        with tempfile.TemporaryDirectory() as directory:
            tmp=Path(directory)
            for offset in (13,DISK_BYTES-len(bmp)):
                with self.subTest(offset=offset):
                    self.run_image(bmp,expected,resolution,offset,self.compile(tmp,offset))

    def test_invalid_headers_are_reported_without_rendering(self):
        # Each corrupt field starts from a valid independently built file.
        changes=[(0,'<H',0),(2,'<I',0),(2,'<I',DISK_BYTES+1),
                 (14,'<I',12),(14,'<I',0xffffffff),(10,'<I',53),
                 (10,'<I',0xffffffff),(18,'<I',0),(18,'<I',0xffffffff),
                 (22,'<I',0),(22,'<I',0x80000000),(26,'<H',2),
                 (28,'<H',8),(30,'<I',1),(2,'<I',54)]
        for offset,fmt,value in changes:
            with self.subTest(offset=offset,value=value):
                bmp=make_bmp(4,2)
                struct.pack_into(fmt,bmp,offset,value)
                m=self.run_image(bmp)
                self.assertIn(b'BMP viewer',bytes(m.memory[m.screen[1]:m.screen[1]+96]))

    def test_large_image_scales_to_maximum_screen(self):
        expected=bytearray(1024*768*4)
        # Nearest-neighbor floor sampling of a 1025x1 input to 1024x1.
        for x in range(1024):
            start=(383*1024+x)*4
            expected[start:start+4]=bytes((*color(x,0),0))
        self.run_image(make_bmp(1025,1),expected,255)

if __name__=='__main__':unittest.main()
