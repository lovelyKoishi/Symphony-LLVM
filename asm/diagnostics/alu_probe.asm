; Actual hardware test. No C backend, stack, calls, or tested ALU ops in hex formatting.
screen zr, 0
mov r1, 1
screen r1, 32768
mov r1, 2
mov r2, 65535
lsl r2, r2, 8
or r2, r2, 255
screen r1, r2
mov r1, 3
screen r1, 0
mov r1, 4
screen r1, 0
mov r1, 7
mov r2, 9
add r3, r1, r2
mov r1, r3
mov r10, 33117
mov r12, result_0
jmp print_hex
result_0:
mov r1, 7
mov r2, 9
add r1, r1, r2
mov r1, r1
mov r10, 33213
mov r12, result_1
jmp print_hex
result_1:
mov r1, 7
mov r2, 9
add r2, r1, r2
mov r1, r2
mov r10, 33309
mov r12, result_2
jmp print_hex
result_2:
mov r1, 7
mov r2, 9
mul r3, r1, r2
mov r1, r3
mov r10, 33405
mov r12, result_3
jmp print_hex
result_3:
mov r1, 7
mov r2, 9
mul r1, r1, r2
mov r1, r1
mov r10, 33501
mov r12, result_4
jmp print_hex
result_4:
mov r1, 7
mov r2, 9
mul r2, r1, r2
mov r1, r2
mov r10, 33597
mov r12, result_5
jmp print_hex
result_5:
mov r1, 1024
mov r2, 3072
mul r3, r1, r2
mov r1, r3
mov r10, 33693
mov r12, result_6
jmp print_hex
result_6:
mov r1, 1024
mov r2, 3072
mul r1, r1, r2
mov r1, r1
mov r10, 33789
mov r12, result_7
jmp print_hex
result_7:
mov r1, 1024
mov r2, 3072
mul r2, r1, r2
mov r1, r2
mov r10, 33885
mov r12, result_8
jmp print_hex
result_8:
mov r1, 65535
lsl r1, r1, 16
or r1, r1, 65535
mov r2, 1024
mul r3, r1, r2
mov r1, r3
mov r10, 33981
mov r12, result_9
jmp print_hex
result_9:
mov r1, 65535
lsl r1, r1, 16
or r1, r1, 65535
mov r2, 1024
mul r1, r1, r2
mov r1, r1
mov r10, 34077
mov r12, result_10
jmp print_hex
result_10:
mov r1, 65535
lsl r1, r1, 16
or r1, r1, 65535
mov r2, 1024
mul r2, r1, r2
mov r1, r2
mov r10, 34173
mov r12, result_11
jmp print_hex
result_11:
mov r1, 20
mov r2, 3
div r3, r1, r2
mov r1, r3
mov r10, 34269
mov r12, result_12
jmp print_hex
result_12:
mov r1, 20
mov r2, 3
div r1, r1, r2
mov r1, r1
mov r10, 34365
mov r12, result_13
jmp print_hex
result_13:
mov r1, 20
mov r2, 3
div r2, r1, r2
mov r1, r2
mov r10, 34461
mov r12, result_14
jmp print_hex
result_14:
mov r1, 720
lsl r1, r1, 16
or r1, r1, 0
mov r2, 80
lsl r2, r2, 16
or r2, r2, 0
div r3, r1, r2
mov r1, r3
mov r10, 34557
mov r12, result_15
jmp print_hex
result_15:
mov r1, 720
lsl r1, r1, 16
or r1, r1, 0
mov r2, 80
lsl r2, r2, 16
or r2, r2, 0
div r1, r1, r2
mov r1, r1
mov r10, 34653
mov r12, result_16
jmp print_hex
result_16:
mov r1, 720
lsl r1, r1, 16
or r1, r1, 0
mov r2, 80
lsl r2, r2, 16
or r2, r2, 0
div r2, r1, r2
mov r1, r2
mov r10, 34749
mov r12, result_17
jmp print_hex
result_17:
mov r1, 1760
mov r2, 80
mod r3, r1, r2
mov r1, r3
mov r10, 34845
mov r12, result_18
jmp print_hex
result_18:
mov r1, 1760
mov r2, 80
mod r1, r1, r2
mov r1, r1
mov r10, 34941
mov r12, result_19
jmp print_hex
result_19:
mov r1, 1760
mov r2, 80
mod r2, r1, r2
mov r1, r2
mov r10, 35037
mov r12, result_20
jmp print_hex
result_20:
probe_done:
jmp probe_done
print_hex:
mov r2, 28
hex_loop:
lsr r3, r1, r2
and r3, r3, 15
add r3, r3, 48
cmp r3, 58
jb hex_digit
add r3, r3, 7
hex_digit:
store_8 [r10], r3
add r10, r10, 1
cmp r2, 0
je hex_return
sub r2, r2, 4
jmp hex_loop
hex_return:
jmp r12
@32768
"ALU PROBE: compare GOT with EXPECT (all hexadecimal)"
@32960
"OP    A        B        DEST    EXPECT                       GOT"
@33056
"add   00000007 00000009 r3     00000010"
@33152
"add   00000007 00000009 r1     00000010"
@33248
"add   00000007 00000009 r2     00000010"
@33344
"mul   00000007 00000009 r3     0000003F"
@33440
"mul   00000007 00000009 r1     0000003F"
@33536
"mul   00000007 00000009 r2     0000003F"
@33632
"mul   00000400 00000C00 r3     00300000"
@33728
"mul   00000400 00000C00 r1     00300000"
@33824
"mul   00000400 00000C00 r2     00300000"
@33920
"mul   FFFFFFFF 00000400 r3     FFFFFC00"
@34016
"mul   FFFFFFFF 00000400 r1     FFFFFC00"
@34112
"mul   FFFFFFFF 00000400 r2     FFFFFC00"
@34208
"div   00000014 00000003 r3     00000006"
@34304
"div   00000014 00000003 r1     00000006"
@34400
"div   00000014 00000003 r2     00000006"
@34496
"div   02D00000 00500000 r3     00000009"
@34592
"div   02D00000 00500000 r1     00000009"
@34688
"div   02D00000 00500000 r2     00000009"
@34784
"mod   000006E0 00000050 r3     00000000"
@34880
"mod   000006E0 00000050 r1     00000000"
@34976
"mod   000006E0 00000050 r2     00000000"
