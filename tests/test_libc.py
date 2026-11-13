#!/usr/bin/env python3
"""Verify libc calls by running generated Symphony machine words."""
import argparse
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT/'tools'))
from symphony_machine import Machine,assemble

parser=argparse.ArgumentParser()
parser.add_argument('--backend',type=Path,default=ROOT/'build/llvm2symphony')
args,remaining=parser.parse_known_args()
sys.argv=[sys.argv[0]]+remaining
BACKEND=args.backend.resolve()
HEADERS='''#include <string.h>
#include <ctype.h>
#include <stdlib.h>
#include <stdio.h>
#include <errno.h>
#include <limits.h>
#include "symphony.h"
#include "symphony_num.h"
#define CHECK(x) do { if (!(x)) return __LINE__; } while (0)
'''

class LibcTests(unittest.TestCase):
    def run_c(self,body,*,prefix='',outputs=(),keys=(),opts=('0','1'),max_steps=4_000_000):
        result_machine=None
        for opt in opts:
            with self.subTest(opt=opt),tempfile.TemporaryDirectory() as tmp:
                source=Path(tmp)/'test.c';asm=Path(tmp)/'test.asm'
                source.write_text(HEADERS+prefix+'\nint main(void){\n'+body+'\nreturn 0; }\n')
                p=subprocess.run([sys.executable,str(ROOT/'tools/symphony-cc'),str(source),
                                  '--libc','-O'+opt,'-o',str(asm),'--backend',str(BACKEND)],capture_output=True,text=True)
                self.assertEqual(p.returncode,0,p.stderr)
                text=asm.read_text()
                m=Machine(assemble(text),keyboard=keys)
                result=m.run(max_steps)
                self.assertEqual(result.reason,'breakpoint')
                self.assertEqual(result.exit_code,0,'failed C source line '+str(result.exit_code)+'\n'+source.read_text())
                self.assertEqual(m.outputs,list(outputs))
                self.assertEqual(m.registers[14],0x1000000)
                result_machine=m
        return result_machine

    def test_memory_functions_overlap_and_unsigned_bytes(self):
        self.run_c('''unsigned char a[12],b[12];
CHECK(memset(a,0x180,12)==a);CHECK(a[0]==128 && a[11]==128);
CHECK(memcpy(b,a,12)==b);CHECK(memcmp(a,b,12)==0);
b[3]=127;CHECK(memcmp(a,b,12)>0);CHECK(memcmp(b,a,12)<0);
CHECK(memchr(b,0x17f,12)==b+3);CHECK(memchr(b,1,12)==NULL);
CHECK(memchr(b,128,0)==NULL);CHECK(memcmp(a,b,0)==0);
memcpy(a,"abcdefgh",9);CHECK(memmove(a+2,a,6)==a+2);
CHECK(memcmp(a,"ababcdef",8)==0);memmove(a,a+2,6);
CHECK(memcmp(a,"abcdef",6)==0);CHECK(memmove(a,a,6)==a);
CHECK(memset(a,9,0)==a);CHECK(a[0]=='a');''')

    def test_string_lengths_and_comparison(self):
        self.run_c('''const char bounded[3]={'a','b','c'};
CHECK(strlen("")==0 && strlen("hello")==5);
CHECK(strnlen(bounded,3)==3 && strnlen(bounded,0)==0);
CHECK(strnlen("hi",10)==2);CHECK(strcmp("a","b")<0);
CHECK(strcmp("ab","a")>0 && strcmp("same","same")==0);
CHECK(strncmp("abc","abd",2)==0 && strncmp("abc","abd",3)<0);
CHECK(strncmp("","anything",0)==0);
const char hi[2]={(char)0x80,0},lo[2]={(char)0x7f,0};
CHECK(strcmp(hi,lo)>0 && strncmp(hi,lo,1)>0);''')

    def test_word_memory_alignment_lengths_and_guards(self):
        self.run_c('''
unsigned char src[96] __attribute__((aligned(4)));
unsigned char dst[96] __attribute__((aligned(4)));
for(unsigned i=0;i<96;++i)src[i]=(unsigned char)(i*37+11);
for(unsigned so=0;so<4;++so)for(unsigned d=0;d<4;++d)
for(unsigned k=0;k<39;++k){
 unsigned n=k<36?k:63+k-36;
 for(unsigned i=0;i<96;++i)dst[i]=(unsigned char)(i^0xA5);
 CHECK(memcpy(dst+d,src+so,n)==dst+d);
 for(unsigned i=0;i<96;++i){
  CHECK(src[i]==(unsigned char)(i*37+11));
  unsigned expected=i>=d && i<d+n ? (unsigned char)((i-d+so)*37+11) : (unsigned char)(i^0xA5);
  CHECK(dst[i]==expected);
 }
}
for(unsigned d=0;d<4;++d)for(unsigned v=0;v<3;++v)
for(unsigned k=0;k<39;++k){
 unsigned n=k<36?k:63+k-36;
 int value=v==0?0:v==1?0x180:-1;
 for(unsigned i=0;i<96;++i)dst[i]=(unsigned char)(i^0xA5);
 CHECK(memset(dst+d,value,n)==dst+d);
 for(unsigned i=0;i<96;++i){
  unsigned expected=i>=d && i<d+n ? (unsigned char)value : (unsigned char)(i^0xA5);
  CHECK(dst[i]==expected);
 }
}
CHECK(memcpy(NULL,NULL,0)==NULL);
CHECK(memset(NULL,123,0)==NULL);
''',opts=('1','2'),max_steps=20_000_000)

    def test_copy_padding_and_concatenation(self):
        self.run_c('''char a[24],b[8];memset(a,'X',sizeof a);memset(b,'X',sizeof b);
CHECK(strcpy(a,"ab")==a && a[2]==0 && a[3]=='X');
CHECK(strcat(a,"cd")==a && strcmp(a,"abcd")==0);
CHECK(strncat(a,"EFG",2)==a && strcmp(a,"abcdEF")==0);
strncat(a,"z",0);CHECK(strcmp(a,"abcdEF")==0);
CHECK(strncpy(b,"a",5)==b);CHECK(b[0]=='a' && b[1]==0 && b[4]==0 && b[5]=='X');
strncpy(b,"abcdef",3);CHECK(memcmp(b,"abc",3)==0 && b[3]==0);
memset(b,'X',sizeof b);strncpy(b,"abcdef",3);CHECK(b[3]=='X');
strncpy(b,"",0);CHECK(b[0]=='a');''')

    def test_searches_and_spans(self):
        self.run_c('''const char *s="ababa";
CHECK(strchr(s,'a')==s && strrchr(s,'a')==s+4);
CHECK(strchr(s,0)==s+5 && strrchr(s,0)==s+5);
CHECK(strchr(s,'z')==NULL && strrchr(s,'z')==NULL);
CHECK(strstr(s,"aba")==s && strstr(s,"ba")==s+1);
CHECK(strstr(s,"")==s && strstr("","a")==NULL);
CHECK(strstr(s,"ababab")==NULL);
CHECK(strspn("aabbc","ab")==4 && strspn(s,"")==0);
CHECK(strcspn("abc!def","!?")==3 && strcspn(s,"")==5);
CHECK(strpbrk(s,"cz")==NULL && strpbrk(s,"b")==s+1);''')

    def test_tokenizers_state_and_delimiter_changes(self):
        self.run_c('''char text[]=" ,one,,two;three ";char *p;
p=strtok(text," ,");CHECK(p && strcmp(p,"one")==0);
p=strtok(NULL,",;");CHECK(p && strcmp(p,"two")==0);
p=strtok(NULL," ;");CHECK(p && strcmp(p,"three")==0);
CHECK(strtok(NULL," ;")==NULL && strtok(NULL," ;")==NULL);
char a[]="a:b",b[]="x/y",*sa=NULL,*sb=NULL;
CHECK(strcmp(strtok_r(a,":",&sa),"a")==0);
CHECK(strcmp(strtok_r(b,"/",&sb),"x")==0);
CHECK(strcmp(strtok_r(NULL,":",&sa),"b")==0);
CHECK(strcmp(strtok_r(NULL,"/",&sb),"y")==0);
CHECK(strtok_r(NULL,":",&sa)==NULL);
char whole[]="a b";CHECK(strtok(whole,"")==whole);CHECK(strtok(NULL,"")==NULL);''')

    def test_ascii_ctype_exhaustive_and_eof(self):
        self.run_c('''for(int c=0;c<256;++c){
int lower=c>='a' && c<='z',upper=c>='A' && c<='Z',digit=c>='0' && c<='9';
CHECK(!!islower(c)==lower);CHECK(!!isupper(c)==upper);CHECK(!!isalpha(c)==(lower||upper));
CHECK(!!isdigit(c)==digit && !!isalnum(c)==(lower||upper||digit));
CHECK(!!isblank(c)==(c==32||c==9));CHECK(!!isspace(c)==(c==32||(c>=9&&c<=13)));
CHECK(!!iscntrl(c)==(c<32||c==127));CHECK(!!isprint(c)==(c>=32&&c<=126));
CHECK(!!isgraph(c)==(c>=33&&c<=126));
CHECK(!!ispunct(c)==(c>=33&&c<=126&&!lower&&!upper&&!digit));
CHECK(!!isxdigit(c)==(digit||(c>='a'&&c<='f')||(c>='A'&&c<='F')));
CHECK(tolower(c)==(upper?c+32:c));CHECK(toupper(c)==(lower?c-32:c));
}
CHECK(!isalpha(EOF) && !isdigit(EOF) && !isspace(EOF) && !iscntrl(EOF));
CHECK(tolower(EOF)==EOF && toupper(EOF)==EOF);''')

    def test_strtol_valid_prefixes_and_endptr(self):
        cases=[('',0,0,0),('  +',0,0,0),('xyz',10,0,0),
               ('42tail',10,42,2),(' \t-123!',10,-123,6),
               ('0779',0,63,3),('0xFFz',0,255,4),('0X10',16,16,4),
               ('0x',0,0,1),('0xG',16,0,1),('0b11',0,0,1),
               ('z!',36,35,1),('-101',2,-5,4),('2147483647',10,2147483647,10),
               ('-2147483648',10,-2147483648,11)]
        lines=['char *end;long value;const char *s;']
        for text,base,value,end in cases:
            # All cases here use simple ASCII; repr-like JSON escaping is C compatible.
            import json
            lines += ['s='+json.dumps(text)+';errno=0;value=strtol(s,&end,'+str(base)+');',
                      'symphony_out((unsigned)value);symphony_out((unsigned)(end-s));symphony_out(errno);']
        expected=[n for _,_,v,e in cases for n in (v&0xffffffff,e,0)]
        self.run_c('\n'.join(lines),outputs=expected)

    def test_strtol_overflow_invalid_base_and_errno(self):
        self.run_c('''char *end;const char *s="214748364800000!";
errno=0;CHECK(strtol(s,&end,10)==LONG_MAX && errno==ERANGE && end==s+15);
s="-2147483649x";errno=0;CHECK(strtol(s,&end,10)==LONG_MIN && errno==ERANGE && end==s+11);
s="17";errno=ERANGE;CHECK(strtol(s,&end,10)==17 && errno==ERANGE);
errno=0;CHECK(strtol(s,&end,1)==0 && errno==EINVAL && end==s);
errno=0;CHECK(strtol(s,&end,37)==0 && errno==EINVAL && end==s);
CHECK(atoi(" -42tail")==-42 && atol("2147483647")==LONG_MAX);
CHECK(abs(-37)==37 && labs(-42L)==42 && abs(0)==0);''')

    def test_strtoul_unsigned_limits_negative_and_overflow(self):
        self.run_c('''char *end;const char *s="4294967295";
errno=0;CHECK(strtoul(s,&end,10)==ULONG_MAX && !errno && !*end);
s="-1";errno=0;CHECK(strtoul(s,&end,10)==ULONG_MAX && !errno && !*end);
s="-0xffffffff";errno=0;CHECK(strtoul(s,&end,0)==1 && !errno && !*end);
s="4294967296abc";errno=0;CHECK(strtoul(s,&end,10)==ULONG_MAX && errno==ERANGE && end==s+10);
s="-4294967296";errno=0;CHECK(strtoul(s,&end,10)==ULONG_MAX && errno==ERANGE && !*end);
s=" +no";errno=0;CHECK(strtoul(s,&end,0)==0 && end==s && !errno);''')

    def test_bounded_number_formatting_and_roundtrips(self):
        self.run_c('''char b[35];char *end;
CHECK(sym_i32toa(INT_MIN,b,sizeof b,10)==11 && strcmp(b,"-2147483648")==0);
CHECK(sym_u32toa(UINT_MAX,b,sizeof b,16)==8 && strcmp(b,"ffffffff")==0);
CHECK(sym_u32toa(0,b,sizeof b,2)==1 && strcmp(b,"0")==0);
CHECK(sym_i32toa(-31,b,sizeof b,16)==3 && strcmp(b,"-1f")==0);
for(unsigned base=2;base<=36;++base){
 CHECK(sym_u32toa(UINT_MAX,b,sizeof b,base)>0);
 CHECK(strtoul(b,&end,base)==UINT_MAX && !*end);
 CHECK(sym_i32toa(INT_MIN,b,sizeof b,base)>0);
 CHECK(strtol(b,&end,base)==INT_MIN && !*end);
}
char shortbuf[4]={'X','X','X','Z'};errno=0;
CHECK(sym_u32toa(123,shortbuf,3,10)==-1 && errno==ERANGE && shortbuf[0]==0 && shortbuf[3]=='Z');
errno=0;CHECK(sym_u32toa(9,shortbuf,4,1)==-1 && errno==EINVAL && shortbuf[0]==0);
shortbuf[0]='X';errno=0;CHECK(sym_u32toa(1,shortbuf,0,10)==-1 && errno==ERANGE && shortbuf[0]=='X');
errno=0;CHECK(sym_u32toa(1,NULL,0,10)==-1 && errno==EINVAL);''')

    def test_rand_and_bsearch(self):
        self.run_c('''int first[8];srand(123);for(unsigned i=0;i<8;++i)first[i]=rand();
srand(123);for(unsigned i=0;i<8;++i)CHECK(rand()==first[i] && first[i]>=0 && first[i]<=RAND_MAX);
int values[6]={-9,-3,0,4,7,12};int key=7;
int *p=bsearch(&key,values,6,sizeof(int),compare);CHECK(p==values+4 && *p==7);
key=5;CHECK(bsearch(&key,values,6,sizeof(int),compare)==NULL);
CHECK(bsearch(&key,values,0,sizeof(int),compare)==NULL);''',prefix='''static int compare(const void *a,const void *b){
int x=*(const int*)a,y=*(const int*)b;return (x>y)-(x<y);
}''')

    def test_unsigned_bsearch_comparator(self):
        self.run_c('''unsigned a[3]={0,0x80000000u,0xffffffffu},key=0xffffffffu;
unsigned *p=bsearch(&key,a,3,sizeof(unsigned),compare_unsigned);
CHECK(p==a+2 && *p==key);
key=0;CHECK(bsearch(&key,a,3,sizeof(unsigned),compare_unsigned)==a);''',prefix='''static int compare_unsigned(const void *a,const void *b){
unsigned x=*(const unsigned*)a,y=*(const unsigned*)b;return (x>y)-(x<y);
}''')

    def test_stdio_is_canonical_and_puts_appends_newline(self):
        m=self.run_c('''CHECK(putchar('>')=='>');CHECK(puts(" ready")>=0);
int a=getchar(),b=getchar(),c=getchar();
CHECK(a=='a' && b=='c' && c=='\\n');puts("done");''',keys=[0x161,0x162,0x10d,0x163,0x10a])
        base=m.screen[1]
        rows=[bytes(m.memory[base+i*96:base+(i+1)*96]).rstrip(b'\0') for i in range(4)]
        self.assertEqual(rows[:4],[b'> ready',b'ac',b'done',b'_'])

    def test_headers_are_target_correct_and_unused_runtime_is_removed(self):
        m=self.run_c('''CHECK(sizeof(int)==4 && sizeof(long)==4 && sizeof(void*)==4 && sizeof(size_t)==4);
CHECK(CHAR_BIT==8 && INT_MAX==2147483647 && UINT_MAX==4294967295u);
CHECK(LONG_MIN==(-2147483647L-1) && ULONG_MAX==4294967295ul);
CHECK(UCHAR_MAX==255 && USHRT_MAX==65535 && EOF==-1);''')
        self.assertEqual(m.screen,{})
        self.assertFalse(any('tty_' in label for label in m.program.symbols))

if __name__=='__main__':unittest.main()
