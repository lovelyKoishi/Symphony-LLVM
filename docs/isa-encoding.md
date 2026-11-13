# 当前 ISA 完整编码表

由 `isa/spec.isa` 逐项提取；行号对应该快照。位串从左到右是高位到低位，默认大端。寄存器和立即数形式分别保留，不能用同一条汇编的字数推算长度。

| 行号 | 汇编定义 | 字节数 | 编码位串 |
| --- | --- | --- | --- |
| 26 | `nop` | 4 | `00000000 00000000 00000000 00000000` |
| 30 | `in %a(register)` | 4 | `00000001 aaaa0000 00000000 00000000` |
| 34 | `out %b(register)` | 4 | `00000010 00000000 0000bbbb 00000000` |
| 38 | `out %a:U16(immediate)` | 4 | `00010010 00000000 aaaaaaaa aaaaaaaa` |
| 42 | `keyboard %a(register)` | 4 | `00000011 aaaa0000 00000000 00000000` |
| 46 | `screen %a(register), %b(register)` | 4 | `00000100 0000aaaa 0000bbbb 00000000` |
| 50 | `screen %a(register), %b:U16(immediate)` | 4 | `00010100 0000aaaa bbbbbbbb bbbbbbbb` |
| 54 | `time_0 %a(register)` | 4 | `00000101 aaaa0000 00000000 00000000` |
| 58 | `time_1 %a(register)` | 4 | `00000110 aaaa0000 00000000 00000000` |
| 62 | `counter %a(register)` | 4 | `00000111 aaaa0000 00000000 00000000` |
| 68 | `nand %a(register), %b(register), %c(register)` | 4 | `00100000 aaaabbbb 0000cccc 00000000` |
| 72 | `or %a(register), %b(register), %c(register)` | 4 | `00100001 aaaabbbb 0000cccc 00000000` |
| 76 | `and %a(register), %b(register), %c(register)` | 4 | `00100010 aaaabbbb 0000cccc 00000000` |
| 80 | `nor %a(register), %b(register), %c(register)` | 4 | `00100011 aaaabbbb 0000cccc 00000000` |
| 84 | `add %a(register), %b(register), %c(register)` | 4 | `00100100 aaaabbbb 0000cccc 00000000` |
| 88 | `sub %a(register), %b(register), %c(register)` | 4 | `00100101 aaaabbbb 0000cccc 00000000` |
| 92 | `xor %a(register), %b(register), %c(register)` | 4 | `00100110 aaaabbbb 0000cccc 00000000` |
| 96 | `lsl %a(register), %b(register), %c(register)` | 4 | `00100111 aaaabbbb 0000cccc 00000000` |
| 100 | `lsr %a(register), %b(register), %c(register)` | 4 | `00101000 aaaabbbb 0000cccc 00000000` |
| 104 | `asr %a(register), %b(register), %c(register)` | 4 | `00101001 aaaabbbb 0000cccc 00000000` |
| 108 | `cmp %a(register), %b(register)` | 4 | `00101010 1111aaaa 0000bbbb 00000000` |
| 113 | `nand %a(register), %b(register), %c:U16(immediate \| label)` | 4 | `00110000 aaaabbbb cccccccc cccccccc` |
| 117 | `or %a(register), %b(register), %c:U16(immediate \| label)` | 4 | `00110001 aaaabbbb cccccccc cccccccc` |
| 121 | `nor %a(register), %b(register), %c:U16(immediate \| label)` | 4 | `00110011 aaaabbbb cccccccc cccccccc` |
| 125 | `and %a(register), %b(register), %c:U16(immediate \| label)` | 4 | `00110010 aaaabbbb cccccccc cccccccc` |
| 129 | `add %a(register), %b(register), %c:U16(immediate \| label)` | 4 | `00110100 aaaabbbb cccccccc cccccccc` |
| 133 | `sub %a(register), %b(register), %c:U16(immediate \| label)` | 4 | `00110101 aaaabbbb cccccccc cccccccc` |
| 137 | `xor %a(register), %b(register), %c:U16(immediate \| label)` | 4 | `00110110 aaaabbbb cccccccc cccccccc` |
| 141 | `lsl %a(register), %b(register), %c:U16(immediate \| label)` | 4 | `00110111 aaaabbbb cccccccc cccccccc` |
| 145 | `lsr %a(register), %b(register), %c:U16(immediate \| label)` | 4 | `00111000 aaaabbbb cccccccc cccccccc` |
| 149 | `asr %a(register), %b(register), %c:U16(immediate \| label)` | 4 | `00111001 aaaabbbb cccccccc cccccccc` |
| 153 | `cmp %a(register), %b:U16(immediate)` | 4 | `00111010 1111aaaa bbbbbbbb bbbbbbbb` |
| 158 | `jmp %a(register)` | 4 | `01001000 00001111 0000aaaa 00000000` |
| 163 | `jmp %a:U16(immediate \| label)` | 4 | `01011000 00001111 aaaaaaaa aaaaaaaa` |
| 167 | `je %a:U16(immediate \| label)` | 4 | `01010001 00001111 aaaaaaaa aaaaaaaa` |
| 171 | `jne %a:U16(immediate \| label)` | 4 | `01011001 00001111 aaaaaaaa aaaaaaaa` |
| 176 | `jb %a:U16(immediate \| label)` | 4 | `01010010 00001111 aaaaaaaa aaaaaaaa` |
| 180 | `jae %a:U16(immediate \| label)` | 4 | `01011010 00001111 aaaaaaaa aaaaaaaa` |
| 184 | `jbe %a:U16(immediate \| label)` | 4 | `01010011 00001111 aaaaaaaa aaaaaaaa` |
| 188 | `ja %a:U16(immediate \| label)` | 4 | `01011011 00001111 aaaaaaaa aaaaaaaa` |
| 193 | `jl %a:U16(immediate \| label)` | 4 | `01010100 00001111 aaaaaaaa aaaaaaaa` |
| 197 | `jge %a:U16(immediate \| label)` | 4 | `01011100 00001111 aaaaaaaa aaaaaaaa` |
| 201 | `jle %a:U16(immediate \| label)` | 4 | `01010101 00001111 aaaaaaaa aaaaaaaa` |
| 205 | `jg %a:U16(immediate \| label)` | 4 | `01011101 00001111 aaaaaaaa aaaaaaaa` |
| 211 | `load_8 %dest(register), [%adr(register)]` | 4 | `01100000 dddd0000 0000aaaa 00000000` |
| 215 | `load_8 %dest(register), [%adr:U16(immediate)]` | 4 | `01110000 dddd0000 aaaaaaaa aaaaaaaa` |
| 219 | `load_16 %dest(register), [%adr(register)]` | 4 | `01100001 dddd0000 0000aaaa 00000000` |
| 223 | `load_16 %dest(register), [%adr:U16(immediate)]` | 4 | `01110001 dddd0000 aaaaaaaa aaaaaaaa` |
| 227 | `load_32 %dest(register), [%adr(register)]` | 4 | `01100010 dddd0000 0000aaaa 00000000` |
| 231 | `load_32 %dest(register), [%adr:U16(immediate)]` | 4 | `01110010 dddd0000 aaaaaaaa aaaaaaaa` |
| 235 | `pload %dest(register), [%adr(register)]` | 4 | `01100011 dddd0000 0000aaaa 00000000` |
| 239 | `pload %dest(register), [%adr:U16(immediate)]` | 4 | `01110011 dddd0000 aaaaaaaa aaaaaaaa` |
| 243 | `store_8 [%adr(register)], %value(register)` | 4 | `01100100 0000vvvv 0000aaaa 00000000` |
| 247 | `store_8 [%adr:U16(immediate)], %value(register)` | 4 | `01110100 0000vvvv aaaaaaaa aaaaaaaa` |
| 251 | `store_16 [%adr(register)], %value(register)` | 4 | `01100101 0000vvvv 0000aaaa 00000000` |
| 255 | `store_16 [%adr:U16(immediate)], %value(register)` | 4 | `01110101 0000vvvv aaaaaaaa aaaaaaaa` |
| 259 | `store_32 [%adr(register)], %value(register)` | 4 | `01100110 0000vvvv 0000aaaa 00000000` |
| 263 | `store_32 [%adr:U16(immediate)], %value(register)` | 4 | `01110110 0000vvvv aaaaaaaa aaaaaaaa` |
| 267 | `pstore [%adr(register)], %value(register)` | 4 | `01100111 0000vvvv 0000aaaa 00000000` |
| 271 | `pstore [%adr:U16(immediate)], %value(register)` | 4 | `01110111 0000vvvv aaaaaaaa aaaaaaaa` |
| 275 | `mul %a(register), %b(register), %c(register)` | 4 | `00101100 aaaabbbb 0000cccc 00000000` |
| 278 | `mul %a(register), %b(register), %c:U16(immediate \| label)` | 4 | `00111100 aaaabbbb cccccccc cccccccc` |
| 281 | `div %a(register), %b(register), %c(register)` | 4 | `00101101 aaaabbbb 0000cccc 00000000` |
| 284 | `div %a(register), %b(register), %c:U16(immediate \| label)` | 4 | `00111101 aaaabbbb cccccccc cccccccc` |
| 287 | `mod %a(register), %b(register), %c(register)` | 4 | `00101110 aaaabbbb 0000cccc 00000000` |
| 290 | `mod %a(register), %b(register), %c:U16(immediate \| label)` | 4 | `00111110 aaaabbbb cccccccc cccccccc` |
| 294 | `mov %a(register), %b(register)` | 4 | `00100001 aaaa0000 0000bbbb 00000000` |
| 298 | `mov %a(register), %b:U16(immediate \| label)` | 4 | `00110001 aaaa0000 bbbbbbbb bbbbbbbb` |
| 302 | `neg %a(register), %b(register)` | 4 | `00100101 aaaa0000 0000bbbb 00000000` |
| 306 | `neg %a(register), %b:U16(immediate \| label)` | 4 | `00110101 aaaa0000 bbbbbbbb bbbbbbbb` |
| 310 | `not %a(register), %b(register)` | 4 | `00100011 aaaa0000 0000bbbb 00000000` |
| 314 | `not %a(register), %b:U16(immediate \| label)` | 4 | `00110011 aaaa0000 bbbbbbbb bbbbbbbb` |
| 319 | `push %a(register)` | 8 | `00110101 11101110 00000000 00000100   01100110 0000aaaa 00001110 00000000` |
| 323 | `pop %a(register)` | 8 | `01100010 aaaa0000 00001110 00000000   00110100 11101110 00000000 00000100` |
| 327 | `call %a(label)` | 20 | `00000111 11110000 00000000 00000000   00110100 11111111 00000000 00010100   00110101 11101110 00000000 00000100   01100110 00001111 00001110 00000000   01011000 00001111 aaaaaaaa aaaaaaaa` |
| 331 | `ret` | 12 | `01100010 11110000 00001110 00000000   00110100 11101110 00000000 00000100   01001000 00001111 00001111 00000000` |
