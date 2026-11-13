#!/usr/bin/env python3
"""Drive the actual shell with keyboard events on both TTY display backends."""
import argparse
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT/'tools'))
from symphony_machine import Machine, assemble

parser = argparse.ArgumentParser()
parser.add_argument('--backend',type=Path,default=ROOT/'build/llvm2symphony')
args,remaining = parser.parse_known_args()
sys.argv = [sys.argv[0]]+remaining

def down(text):
    return [0x100|ord(ch) for ch in text]

class ShellTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.programs = {}
        with tempfile.TemporaryDirectory() as tmp:
            for mode in ('ascii8','ascii32'):
                output=Path(tmp)/(mode+'.asm')
                subprocess.run([sys.executable,str(ROOT/'tools/symphony-cc'),
                                str(ROOT/'examples/shell.c'),'--libc','--tty-display',mode,
                                '-O1','--data-base','0x8000','--stack-top','0x10000',
                                '--backend',str(args.backend.resolve()),'-o',str(output)],check=True)
                cls.programs[mode]=assemble(output.read_text())

    def run_shell(self,events,*,exits=True):
        for mode,program in self.programs.items():
            with self.subTest(mode=mode):
                m=Machine(program,keyboard=events)
                # Both programs are built to stay entirely in low 64 KiB RAM.
                m.memory=m.memory[:65536]
                result=m.run(3_000_000 if exits else 150_000)
                self.assertEqual(result.reason,'breakpoint' if exits else 'step-limit')
                self.assertFalse(m.keyboard)
                stride=4 if mode=='ascii32' else 1
                self.assertEqual(m.screen[0],1 if stride==4 else 0)
                base=m.screen[1]
                text=bytes(m.memory[base:base+3840*stride:stride])
                rows=[text[i:i+96].rstrip(b'\0') for i in range(0,3840,96)]
                if exits:
                    self.assertEqual(result.exit_code,0)
                    self.assertEqual(m.registers[14],65536)
                    if stride==4:
                        self.assertTrue(all(m.memory[base+4*i+1:base+4*i+4]==b'\xff\0\0' for i in range(3840)))
                yield mode,m,rows

    def test_help_echo_unknown_about_and_exit(self):
        for _,_,rows in self.run_shell(down('help\necho hello world\nmissing\nabout\nexit\n')):
            self.assertIn(b'help       Show commands',rows)
            self.assertIn(b'hello world',rows)
            self.assertIn(b'Unknown command: missing',rows)
            self.assertIn(b'Symphony - 96x40 character terminal',rows)
            self.assertIn(b'Bye.',rows)

    def test_editing_empty_lines_whitespace_and_argument_errors(self):
        events=down('\n \t\n  echo\talpha  beta\necho ab')+[0x10d]+down('c\nexit extra\nexit\n')
        for _,_,rows in self.run_shell(events):
            self.assertIn(b'alpha  beta',rows)
            self.assertIn(b'ac',rows)
            self.assertIn(b'Usage: exit',rows)
            self.assertIn(b'Bye.',rows)

    def test_clear_resets_screen_then_accepts_commands(self):
        for _,_,rows in self.run_shell(down('echo old\nclear\necho new\nexit\n')):
            self.assertEqual(rows[:4],[b'sym> echo new',b'new',b'sym> exit',b'Bye.'])
            self.assertTrue(all(row==b'' for row in rows[4:]))

    def test_long_line_wrap_and_scroll(self):
        message='x'*240
        for _,_,rows in self.run_shell(down('echo '+message+'\n'+'echo OK\n'*22+'exit\n')):
            self.assertIn(b'OK',rows)
            self.assertIn(b'Bye.',rows)
            self.assertFalse(any(b'Unknown command' in row for row in rows))

    def test_waits_at_prompt_with_visible_cursor(self):
        for mode,m,rows in self.run_shell([],exits=False):
            self.assertEqual(rows[0],b'Symphony shell')
            self.assertEqual(rows[2],b'sym> '+(b'_' if mode=='ascii8' else b''))
            if mode=='ascii32':
                address=m.screen[1]+(2*96+5)*4
                self.assertEqual(m.memory[address:address+4],b'\0\0\xff\0')

    def test_edits_command_and_argument_with_arrow_keys(self):
        events=down('hepl')+[0x104,0x10d,0x102]+down('p\necho hllo')
        events += [0x104]*3+down('e\nexit\n')
        for _,_,rows in self.run_shell(events):
            self.assertIn(b'help       Show commands',rows)
            self.assertIn(b'hello',rows)
            self.assertIn(b'Bye.',rows)

    def test_idle_prompt_blinks_and_arrow_resets_visibility(self):
        for mode,program in self.programs.items():
            with self.subTest(mode=mode):
                now=[0]
                m=Machine(program,time_ns=lambda _:now[0])
                m.run(150000)
                stride=4 if mode=='ascii32' else 1
                address=m.screen[1]+(2*96+5)*stride
                shown=b'\0\0\xff\0' if stride==4 else b'_'
                hidden=b'\0\xff\0\0' if stride==4 else b'\0'
                self.assertEqual(m.memory[address:address+stride],shown)
                now[0]=500000000;m.run(4000)
                self.assertEqual(m.memory[address:address+stride],hidden)
                m.keyboard.append(0x104);m.run(4000)
                self.assertEqual(m.memory[address:address+stride],shown)

if __name__=='__main__':unittest.main()
