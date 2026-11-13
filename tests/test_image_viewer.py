#!/usr/bin/env python3
"""Verify raw conversion and actual disk-to-screen machine execution."""
import argparse
import json
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest
from PIL import Image

ROOT=Path(__file__).resolve().parents[1]
sys.path.insert(0,str(ROOT/'tools'))
from image_to_bin import convert
from symphony_machine import Machine,assemble

parser=argparse.ArgumentParser()
parser.add_argument('--backend',type=Path,default=ROOT/'build/llvm2symphony')
args,remaining=parser.parse_known_args()
sys.argv=[sys.argv[0]]+remaining

class ImageViewerTests(unittest.TestCase):
    def compile_viewer(self,tmp,resolution,offset=0):
        output=tmp/'viewer.asm'
        subprocess.run([sys.executable,str(ROOT/'tools/symphony-cc'),
                        str(ROOT/'examples/image_viewer.c'),'-O1',
                        f'-DIMAGE_RESOLUTION={resolution}',f'-DIMAGE_DISK_OFFSET={offset}',
                        '--backend',str(args.backend.resolve()),'-o',str(output)],check=True)
        return assemble(output.read_text())

    def execute(self,program,disk,expected,resolution):
        disk_before=bytes(disk)
        m=Machine(program,persistent=bytearray(disk))
        base=0x400000
        m.memory[base-1]=0xa5;m.memory[base+len(expected)]=0x5a
        result=m.run(500000)
        self.assertEqual(result.reason,'breakpoint')
        self.assertEqual(result.exit_code,0)
        self.assertEqual(m.screen,{0:3,2:resolution,1:base})
        self.assertEqual(m.memory[base:base+len(expected)],expected)
        self.assertEqual(m.memory[base-1],0xa5)
        self.assertEqual(m.memory[base+len(expected)],0x5a)
        self.assertEqual(m.persistent,disk_before,'viewer must not write the disk')
        self.assertEqual(m.registers[14],0x1000000)

    def test_distinct_pixels_preserve_rgb_and_top_to_bottom_order(self):
        raw=bytes(channel for i in range(12) for channel in (i*17,i*11,i*7,0))
        with tempfile.TemporaryDirectory() as directory:
            self.execute(self.compile_viewer(Path(directory),0),raw,raw,0)

    def test_nonzero_disk_offset_and_exact_end_of_disk(self):
        raw=bytes([255,0,0,0,0,255,0,0,0,0,255,0]*4)
        with tempfile.TemporaryDirectory() as directory:
            tmp=Path(directory)
            for offset in (64,16777216-len(raw)):
                with self.subTest(offset=offset):
                    self.execute(self.compile_viewer(tmp,0,offset),bytearray(offset)+raw,raw,0)

    def test_alpha_and_padding_byte(self):
        source=Image.new('RGBA',(4,3),(10,20,30,255))
        source.putpixel((0,0),(255,0,0,0));source.putpixel((1,0),(255,0,0,128))
        raw,_,info=convert(source)
        self.assertEqual((info['width'],info['height']),(4,3))
        self.assertEqual(raw[:12],bytes([0,0,0,0,128,0,0,0,10,20,30,0]))
        self.assertEqual(raw[3::4],bytes(12))

    def test_automatic_resolution_letterbox_and_large_downscale(self):
        raw,_,info=convert(Image.new('RGB',(5,4),(255,0,0)))
        self.assertEqual((info['width'],info['height'],info['resolution']),(8,6,1))
        self.assertEqual(info['draw_offset'],[1,1])
        self.assertEqual(raw[:32],bytes(32))
        self.assertEqual(raw[(8+1)*4:(8+2)*4],b'\xff\0\0\0')
        raw,_,info=convert(Image.new('RGB',(2000,1000),(0,255,0)))
        self.assertEqual((info['width'],info['height']),(1024,768))
        self.assertEqual(info['draw_size'],[1024,512])
        self.assertEqual(info['draw_offset'],[0,128])
        self.assertEqual(len(raw),3145728)

    def test_generator_and_matching_program_end_to_end(self):
        with tempfile.TemporaryDirectory() as directory:
            tmp=Path(directory);disk=tmp/'image.bin';asm=tmp/'image.asm'
            subprocess.run([sys.executable,str(ROOT/'tools/image_to_bin.py'),'--test-pattern',
                            '-o',str(disk),'--asm',str(asm),'--preview',str(tmp/'preview.png'),
                            '--backend',str(args.backend.resolve())],check=True,capture_output=True)
            info=json.loads(disk.with_suffix('.json').read_text())
            expected=bytearray()
            colors=((255,0,0,0),(0,255,0,0),(0,0,255,0),(255,255,255,0))
            for y in range(96):
                for x in range(128):expected.extend(colors[(y>=48)*2+(x>=64)])
            self.assertEqual(disk.read_bytes(),expected)
            self.assertEqual(info['resolution'],31)
            self.assertLess(len(asm.read_text().splitlines()),100)
            self.execute(assemble(asm.read_text()),disk.read_bytes(),expected,31)

    def test_generator_pads_disk_when_requested(self):
        with tempfile.TemporaryDirectory() as directory:
            tmp=Path(directory);disk=tmp/'image.bin'
            subprocess.run([sys.executable,str(ROOT/'tools/image_to_bin.py'),'--test-pattern',
                            '--resolution','0','--disk-offset','16','--pad-disk',
                            '-o',str(disk)],check=True,capture_output=True)
            self.assertEqual(disk.stat().st_size,16777216)
            with disk.open('rb') as stream:
                self.assertEqual(stream.read(16),bytes(16))
                stream.seek(-4,2);self.assertEqual(stream.read(4),bytes(4))

    def test_rejects_invalid_bounds_and_input_overwrite(self):
        with tempfile.TemporaryDirectory() as directory:
            tmp=Path(directory);output=tmp/'image.bin'
            base=[sys.executable,str(ROOT/'tools/image_to_bin.py'),'--test-pattern','-o',str(output)]
            for extra in (['--resolution','256'],['--disk-offset','1'],['--disk-offset','16777212']):
                with self.subTest(extra=extra):
                    result=subprocess.run(base+extra,capture_output=True)
                    self.assertNotEqual(result.returncode,0)
                    self.assertFalse(output.exists())
            source=tmp/'source.png';Image.new('RGB',(4,3)).save(source)
            original=source.read_bytes()
            result=subprocess.run([sys.executable,str(ROOT/'tools/image_to_bin.py'),str(source),
                                   '-o',str(source)],capture_output=True)
            self.assertNotEqual(result.returncode,0)
            self.assertEqual(source.read_bytes(),original)

if __name__=='__main__':unittest.main()
