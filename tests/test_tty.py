#!/usr/bin/env python3
"""Canonical TTY tests run compiled C through actual Symphony machine words."""
import argparse
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / 'tools'))
from symphony_machine import Machine, assemble

parser = argparse.ArgumentParser()
parser.add_argument('--backend', type=Path, default=ROOT/'build/llvm2symphony')
parser.add_argument('--display',choices=('ascii8','ascii32'),default='ascii8')
args, remaining = parser.parse_known_args()
sys.argv = [sys.argv[0]] + remaining
BACKEND = args.backend.resolve()
DISPLAY = args.display
STRIDE = 4 if DISPLAY == 'ascii32' else 1


def down(text):
    return [0x100 | ord(c) for c in text]


class TTYTests(unittest.TestCase):
    def compile(self, body, opt='1', hide_cursor=False, libc=False):
        with tempfile.TemporaryDirectory() as tmp:
            source = Path(tmp)/'test.c'
            asm = Path(tmp)/'test.asm'
            if hide_cursor:
                # Text-only regression snapshots explicitly hide the overlay
                # through the public API. Cursor tests inspect the visible grid.
                body = '#define main test_body\n'+body+'\n#undef main\nint main(void){int r=test_body();tty_set_cursor_visible(0);return r;}\n'
            source.write_text('#include "symphony.h"\n#include "tty.h"\n' + body)
            command = [sys.executable, str(ROOT/'tools/symphony-cc'),
                                str(source), '--tty-display', DISPLAY, '-O'+opt, '-o', str(asm),
                                '--backend', str(BACKEND)]
            if libc: command.append('--libc')
            p = subprocess.run(command, capture_output=True, text=True)
            self.assertEqual(p.returncode, 0, p.stderr)
            return assemble(asm.read_text())

    def text(self,m):
        return bytes(m.memory[m.screen[1]:m.screen[1]+3840*STRIDE:STRIDE])

    def cell(self,m,position):
        address=m.screen[1]+position*STRIDE
        return bytes(m.memory[address:address+STRIDE])

    def run_c(self, body, keys=(), outputs=(), opt='1', hide_cursor=True):
        m = Machine(self.compile(body, opt, hide_cursor), keyboard=keys)
        result = m.run(3_000_000)
        self.assertEqual(result.reason, 'breakpoint')
        self.assertEqual(result.exit_code, 0)
        self.assertEqual(m.outputs, list(outputs))
        self.assertEqual(m.registers[14], 0x1000000)
        self.assertEqual(m.screen[0],1 if STRIDE==4 else 0)
        return m, self.text(m)

    def assert_cursor(self,m,position,under=0):
        self.assertEqual(self.cell(m,position),bytes([under,0,255,0]) if STRIDE==4 else b'_')

    def test_cursor_initial_position_and_character_restoration(self):
        m,_=self.run_c('int main(void){tty_init();return 0;}',hide_cursor=False)
        self.assert_cursor(m,0)
        m,_=self.run_c('int main(void){tty_puts("AB\\r");return 0;}',hide_cursor=False)
        self.assert_cursor(m,0,ord('A'))
        self.assertEqual(self.cell(m,1),b'B\xff\0\0' if STRIDE==4 else b'B')
        m,text=self.run_c('''int main(void){tty_puts("AB\\r");
tty_set_cursor_visible(1);tty_set_cursor_visible(1);
tty_set_cursor_visible(0);tty_set_cursor_visible(0);return 0;}''',hide_cursor=False)
        self.assertEqual(text[:3],b'AB\0')
        if STRIDE==4:self.assertEqual(self.cell(m,0),b'A\xff\0\0')

    def test_cursor_during_canonical_edit_and_committed_input(self):
        m=Machine(self.compile('int main(void){char b[8];tty_readline(b,sizeof b);return 0;}'),keyboard=down('ab')+[0x10d])
        self.assertEqual(m.run(80000).reason,'step-limit')
        self.assertEqual(self.text(m)[:1],b'a')
        self.assert_cursor(m,1)
        m.keyboard.append(0x10a)
        self.assertEqual(m.run(80000).reason,'breakpoint')
        self.assert_cursor(m,96)

    def test_cursor_deferred_wrap_bottom_and_no_scroll_artifacts(self):
        m,_=self.run_c("int main(void){for(unsigned i=0;i<96;++i)tty_putc('x');return 0;}",hide_cursor=False)
        self.assertEqual(self.text(m)[:96],b'x'*96)
        self.assert_cursor(m,96)
        m,_=self.run_c("int main(void){for(unsigned i=0;i<3840;++i)tty_putc('x');return 0;}",hide_cursor=False)
        self.assert_cursor(m,3839,ord('x'))
        self.assertEqual(self.text(m)[:3839],b'x'*3839)
        m,text=self.run_c("int main(void){for(unsigned i=0;i<3840;++i)tty_putc('x');tty_puts(\"\\nY\");return 0;}",hide_cursor=False)
        self.assertEqual(text[:3745],b'x'*3744+b'Y')
        self.assert_cursor(m,3745)
        if STRIDE==4:
            raw=bytes(m.memory[m.screen[1]:m.screen[1]+3840*4])
            self.assertEqual(sum(raw[i+2]==255 for i in range(0,len(raw),4)),1)
        else:self.assertEqual(text.count(b'_'),1)

    def test_cursor_clear_and_reinit(self):
        program=self.compile('''int main(void){tty_init();
while(!symphony_in()){} tty_puts("old\\r");tty_clear();tty_puts("new");
tty_set_cursor_visible(0);tty_init();return 0;}''')
        m=Machine(program)
        m.run(80000)
        m.inputs.append(1)
        self.assertEqual(m.run(500000).reason,'breakpoint')
        self.assert_cursor(m,0)
        self.assertEqual(self.text(m)[1:],bytes(3839))

    def test_stdio_selects_same_backend(self):
        m=Machine(self.compile('''#include <stdio.h>
int main(void){puts("ready");putchar('>');
int a=getchar(),b=getchar();return a=='a' && b=='\\n'?0:1;}''',libc=True),keyboard=down('a\n'))
        self.assertEqual(m.run(200000).reason,'breakpoint')
        self.assertEqual(m.registers[1],0)
        self.assertEqual(m.screen[0],1 if STRIDE==4 else 0)
        self.assertEqual(self.text(m)[:5],b'ready')
        self.assertEqual(self.text(m)[96:98],b'>a')
        self.assert_cursor(m,192)

    def test_left_right_insert_and_backspace_in_middle(self):
        events=down('abc')+[0x104,0x004,0x104]+down('X')+[0x102,0x002,0x10d,0x10a]
        _,text=self.run_c('''int main(void){char b[8];tty_puts("> ");
symphony_out(tty_readline(b,sizeof b));
for(unsigned i=0;i<4;++i)symphony_out((unsigned char)b[i]);return 0;}''',
                         events,[3,ord('a'),ord('X'),ord('c'),0])
        self.assertEqual(text[:6],b'> aXc\0')

    def test_arrows_clamp_and_enter_commits_whole_line(self):
        events=[0x104,0x104,0x102]+down('abc')+[0x102,0x102,0x104,0x104,0x10a]
        _,text=self.run_c('''int main(void){char b[8];tty_puts("prompt> ");
symphony_out(tty_readline(b,sizeof b));for(unsigned i=0;i<3;++i)symphony_out(b[i]);
tty_puts("done");return 0;}''',events,[3,97,98,99])
        self.assertEqual(text[:11],b'prompt> abc')
        self.assertEqual(text[96:100],b'done')

    def test_middle_tab_reflows_and_deletes_as_one_character(self):
        events=down('a\tb')+[0x104,0x104]+down('X')+[0x10d,0x102,0x10d,0x10a]
        _,text=self.run_c('''int main(void){char b[8];tty_puts("p ");
symphony_out(tty_readline(b,sizeof b));symphony_out(b[0]);symphony_out(b[1]);return 0;}''',
                         events,[2,97,98])
        self.assertEqual(text[:10],b'p ab'+bytes(6))

    def test_middle_edit_across_bottom_wrap_and_scroll(self):
        events=down('ab')+[0x104]+down('X')+[0x104,0x10d,0x10a]
        _,text=self.run_c('''int main(void){char b[8];
for(unsigned row=0;row<39;++row)tty_putc('\\n');
for(unsigned i=0;i<95;++i)tty_putc('p');
symphony_out(tty_readline(b,sizeof b));symphony_out(b[0]);symphony_out(b[1]);
tty_puts("done");return 0;}''',events,[2,ord('X'),ord('b')])
        self.assertEqual(text[37*96:38*96],b'p'*95+b'X')
        self.assertEqual(text[38*96:38*96+3],b'b\0\0')
        self.assertEqual(text[39*96:39*96+4],b'done')

    def test_full_input_limit_allows_middle_delete_then_insert(self):
        events=down('a'*255)+[0x104]*128+down('!')+[0x10d]+down('Z')+[0x102]*300+[0x10a]
        _,text=self.run_c('''int main(void){char b[256];
symphony_out(tty_readline(b,sizeof b));symphony_out(b[125]);symphony_out(b[126]);
symphony_out(b[127]);symphony_out(b[254]);return 0;}''',events,[255,97,90,97,97])
        self.assertEqual(text[:255],b'a'*126+b'Z'+b'a'*128)

    def test_cursor_blinks_with_clock_wrap_and_typing_resets_phase(self):
        now=[(7<<32)|0xf0000000]
        program=self.compile('''int main(void){tty_puts("AB\\r");for(;;){
unsigned action=symphony_in();if(action==1)tty_set_cursor_visible(0);
if(action==2)tty_set_cursor_visible(1);tty_poll();}}''')
        m=Machine(program,time_ns=lambda _:now[0])
        m.run(100000)
        self.assert_cursor(m,0,ord('A'))
        now[0]+=499999999;m.run(2000)
        self.assert_cursor(m,0,ord('A'))
        now[0]+=1;m.run(2000)
        self.assertEqual(self.text(m)[:2],b'AB')
        if STRIDE==4:self.assertEqual(self.cell(m,0),b'A\xff\0\0')
        now[0]+=500000000;m.run(2000)
        self.assert_cursor(m,0,ord('A'))
        now[0]+=500000000;m.run(2000)
        m.keyboard.extend(down('X'));m.run(5000)
        self.assertEqual(self.text(m)[:1],b'X')
        self.assert_cursor(m,1,ord('B'))
        m.inputs.append(1);m.run(3000)
        now[0]+=5000000000;m.run(3000)
        self.assertEqual(self.text(m)[:2],b'XB')
        m.inputs.append(2);m.run(3000)
        self.assert_cursor(m,1,ord('B'))

    def test_blink_services_committed_input_without_consuming_more_keys(self):
        now=[0]
        m=Machine(self.compile('int main(void){for(;;)tty_poll();}'),
                  keyboard=[0x10a],time_ns=lambda _:now[0])
        m.run(100000)
        self.assert_cursor(m,96)
        m.keyboard.extend(down('z'))
        now[0]=500000000;m.run(3000)
        self.assertEqual(self.text(m)[96:97],b'\0')
        self.assertEqual(len(m.keyboard),1)
        now[0]=1000000000;m.run(3000)
        self.assert_cursor(m,96)

    def test_canonical_buffering_partial_reads_and_backpressure(self):
        self.run_c('''int main(void) {
 tty_init();tty_puts("> ");char b[8];
 for(unsigned i=0;i<3;++i)tty_poll();
 symphony_out(tty_available());
 symphony_out(tty_read(b,1));symphony_out(b[0]);symphony_out(tty_available());
 tty_poll();tty_poll();
 symphony_out(tty_read(b,8));symphony_out(b[0]);symphony_out(b[1]);
 symphony_out(tty_available());
 symphony_out(tty_readline(b,sizeof b));symphony_out(b[0]);return 0;
}''', down('ab')+[0x10d]+down('c\nz\n'),
                   [0,1,ord('a'),2,2,ord('c'),10,0,1,ord('z')])

    def test_read_blocks_until_enter(self):
        program = self.compile('''int main(void){char b[8];
unsigned n=tty_read(b,sizeof b);symphony_out(n);symphony_out(b[0]);
symphony_out(b[1]);symphony_out(b[2]);return 0;}''')
        m = Machine(program, keyboard=down('ab'))
        self.assertEqual(m.run(100000).reason, 'step-limit')
        self.assertEqual(m.outputs, [])
        self.assertEqual(self.text(m)[:2], b'ab')
        m.keyboard.append(0x10a)
        self.assertEqual(m.run(30000).reason, 'breakpoint')
        self.assertEqual(m.outputs, [3,97,98,10])

    def test_prompt_protection_empty_line_and_release_events(self):
        _, frame = self.run_c('''int main(void){char b[8];tty_puts("prompt> ");
symphony_out(tty_readline(b,sizeof b));symphony_out(b[0]);
tty_puts("ok");return 0;}''', [0x10d,0x10d,0x00d,0x00a,0x10a], [0,0])
        self.assertEqual(frame[:8], b'prompt> ')
        self.assertEqual(frame[96:99], b'ok\0')

    def test_output_controls_and_exact_width_newline(self):
        _, frame = self.run_c('''int main(void){tty_init();
for(unsigned i=0;i<96;++i)tty_putc('x');
tty_puts("\\r\\nY\\nZ\\rQ");return 0;}''')
        self.assertEqual(frame[:96], b'x'*96)
        self.assertEqual(frame[96:99], b'Y\0\0')
        self.assertEqual(frame[192:195], b'Q\0\0')
        _, frame = self.run_c('''int main(void){tty_init();
tty_puts("A\\tB\\bC");tty_write("\\nD\\nE",4);return 0;}''')
        self.assertEqual(frame[:10], b'A'+b' '*7+b'C\0')
        self.assertEqual(frame[96:98], b'D\0')
        self.assertEqual(frame[192:194], b'E\0')

    def test_backspace_restores_pending_wrap_even_after_scroll(self):
        for rows in (0,39):
            with self.subTest(rows=rows):
                _, frame = self.run_c('''int main(void){char b[8];tty_init();
for(unsigned i=0;i<'''+str(rows)+''';++i)tty_putc('\\n');
for(unsigned i=0;i<95;++i)tty_putc('p');
symphony_out(tty_readline(b,sizeof b));symphony_out(b[0]);
tty_puts("RESULT");return 0;}''', down('ab')+[0x10d,0x10a], [1,97])
                row = 0 if rows==0 else 38
                self.assertEqual(frame[row*96:(row+1)*96], b'p'*95+b'a')
                self.assertEqual(frame[(row+1)*96:(row+1)*96+7], b'RESULT\0')

    def test_tab_echo_and_erase_at_wrap_boundary(self):
        _, frame = self.run_c('''int main(void){char b[8];tty_puts("p ");
symphony_out(tty_readline(b,sizeof b));symphony_out(b[0]);
symphony_out(b[1]);return 0;}''', down('\tb\n'), [2,9,98])
        self.assertEqual(frame[:10], b'p '+b' '*6+b'b\0')
        _, frame = self.run_c('''int main(void){char b[8];
for(unsigned i=0;i<96;++i)tty_putc('p');
symphony_out(tty_readline(b,sizeof b));tty_puts("OK");return 0;
}''', [0x109,0x10d,0x10a], [0])
        self.assertEqual(frame[:96], b'p'*96)
        self.assertEqual(frame[96:99], b'OK\0')

    def test_input_limit_and_readline_truncation(self):
        _, frame = self.run_c('''int main(void){char b[5];
symphony_out(tty_readline(b,sizeof b));symphony_out(b[0]);symphony_out(b[4]);
symphony_out(tty_readline(b,sizeof b));symphony_out(b[0]);return 0;
}''', down('a'*255+'b')+[0x10d]+down('c\nz\n'), [255,97,0,1,122])
        self.assertEqual(frame[:255], b'a'*254+b'c')
        self.assertEqual(frame[288:290], b'z\0')

    def test_shift_state_and_release(self):
        self.run_c('''int main(void){char b[8];
symphony_out(tty_readline(b,sizeof b));
for(unsigned i=0;i<3;++i)symphony_out((unsigned char)b[i]);return 0;
}''', [0x110,0x161,0x131,0x010,0x162,0x10a], [3,65,33,98])

    def test_scrolling_and_deferred_bottom_wrap(self):
        _, frame = self.run_c('''int main(void){
for(unsigned i=0;i<3840;++i)tty_putc('x');return 0;}''')
        self.assertEqual(frame, b'x'*3840)
        _, frame = self.run_c('''int main(void){
for(unsigned i=0;i<3840;++i)tty_putc('x');
tty_puts("\\nY");return 0;}''')
        self.assertEqual(frame, b'x'*3744+b'Y'+bytes(95))

    def test_zero_size_read_and_o0_link(self):
        self.run_c('''int main(void){char b[8];
symphony_out(tty_read(b,0));symphony_out(tty_readline(b,0));
symphony_out(tty_readline(b,sizeof b));symphony_out(b[0]);return 0;
}''', down('a\n'), [0,0,1,97], opt='0')

    def test_clear_reinit_and_multiple_translation_units(self):
        self.run_c('''int main(void){tty_puts("old");tty_init();tty_puts("A");
tty_clear();tty_puts("B");return 0;}''')
        with tempfile.TemporaryDirectory() as tmp:
            main=Path(tmp)/'main.c';helper=Path(tmp)/'helper.c';asm=Path(tmp)/'test.asm'
            main.write_text('#include "tty.h"\nint answer(void);\nint main(void){tty_putc(answer());return 0;}')
            helper.write_text('int answer(void){return 65;}')
            p=subprocess.run([sys.executable,str(ROOT/'tools/symphony-cc'),str(main),str(helper),
                              '--tty-display',DISPLAY,'-O1','-o',str(asm),'--backend',str(BACKEND)],capture_output=True,text=True)
            self.assertEqual(p.returncode,0,p.stderr)
            m=Machine(assemble(asm.read_text()))
            self.assertEqual(m.run().reason,'breakpoint')
            self.assertEqual(m.memory[m.screen[1]],65)

if __name__=='__main__':unittest.main()
