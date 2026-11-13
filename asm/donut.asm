; Symphony LLVM backend 0.1. Big endian, 32-bit values/pointers.
__sym_start:
    mov sp, 1
    lsl sp, sp, 16
    call __sym_fn_main_0
__sym_halt:
    jmp __sym_halt
__sym_trap:
    jmp __sym_trap

; function main, frame 248 bytes
__sym_fn_main_0:
    push r13
    mov r13, sp
    sub sp, sp, 248
__sym_block_1:
    mov r1, 0
    mov r2, 0
    screen r1, r2
    mov r1, 2
    mov r2, 255
    lsl r2, r2, 16
    or r2, r2, 65535
    screen r1, r2
    mov r1, 3
    mov r2, 0
    screen r1, r2
    mov r1, 4
    mov r2, 0
    screen r1, r2
    mov r1, 1
    mov r2, 36608
    screen r1, r2
    mov r1, 0
    sub r12, r13, 4
    store_32 [r12], r1
    mov r1, 1024
    sub r12, r13, 12
    store_32 [r12], r1
    mov r1, 0
    sub r12, r13, 20
    store_32 [r12], r1
    mov r1, 1024
    sub r12, r13, 28
    store_32 [r12], r1
    mov r1, 0
    sub r12, r13, 36
    store_32 [r12], r1
    jmp __sym_block_2
__sym_block_2:
    mov r1, 40448
    mov r2, 32
    mov r3, 1760
    call __sym_fn_memset_19
    mov r1, 42208
    mov r2, 127
    mov r3, 1760
    call __sym_fn_memset_19
    sub r12, r13, 12
    load_32 r1, [r12]
    mul r1, r1, 15
    sub r12, r13, 44
    store_32 [r12], r1
    sub r12, r13, 4
    load_32 r1, [r12]
    mul r1, r1, 15
    sub r12, r13, 48
    store_32 [r12], r1
    mov r1, 0
    sub r12, r13, 84
    store_32 [r12], r1
    mov r1, 1024
    sub r12, r13, 92
    store_32 [r12], r1
    mov r1, 0
    sub r12, r13, 100
    store_32 [r12], r1
    jmp __sym_block_5
__sym_block_3:
    mov r1, 32768
    sub r12, r13, 36
    load_32 r2, [r12]
    mul r2, r2, 3840
    add r1, r1, r2
    sub r12, r13, 52
    store_32 [r12], r1
    sub r12, r13, 52
    load_32 r1, [r12]
    mov r2, 872
    add r1, r1, r2
    mov r7, r1
    mov r1, r7
    mov r2, 40448
    mov r3, 80
    call __sym_fn_memcpy_15
    sub r12, r13, 52
    load_32 r1, [r12]
    mov r2, 968
    add r1, r1, r2
    mov r7, r1
    mov r1, r7
    mov r2, 40528
    mov r3, 80
    call __sym_fn_memcpy_15
    sub r12, r13, 52
    load_32 r1, [r12]
    mov r2, 1064
    add r1, r1, r2
    mov r7, r1
    mov r1, r7
    mov r2, 40608
    mov r3, 80
    call __sym_fn_memcpy_15
    sub r12, r13, 52
    load_32 r1, [r12]
    mov r2, 1160
    add r1, r1, r2
    mov r7, r1
    mov r1, r7
    mov r2, 40688
    mov r3, 80
    call __sym_fn_memcpy_15
    sub r12, r13, 52
    load_32 r1, [r12]
    mov r2, 1256
    add r1, r1, r2
    mov r7, r1
    mov r1, r7
    mov r2, 40768
    mov r3, 80
    call __sym_fn_memcpy_15
    sub r12, r13, 52
    load_32 r1, [r12]
    mov r2, 1352
    add r1, r1, r2
    mov r7, r1
    mov r1, r7
    mov r2, 40848
    mov r3, 80
    call __sym_fn_memcpy_15
    sub r12, r13, 52
    load_32 r1, [r12]
    mov r2, 1448
    add r1, r1, r2
    mov r7, r1
    mov r1, r7
    mov r2, 40928
    mov r3, 80
    call __sym_fn_memcpy_15
    sub r12, r13, 52
    load_32 r1, [r12]
    mov r2, 1544
    add r1, r1, r2
    mov r7, r1
    mov r1, r7
    mov r2, 41008
    mov r3, 80
    call __sym_fn_memcpy_15
    sub r12, r13, 52
    load_32 r1, [r12]
    mov r2, 1640
    add r1, r1, r2
    mov r7, r1
    mov r1, r7
    mov r2, 41088
    mov r3, 80
    call __sym_fn_memcpy_15
    sub r12, r13, 52
    load_32 r1, [r12]
    mov r2, 1736
    add r1, r1, r2
    mov r7, r1
    mov r1, r7
    mov r2, 41168
    mov r3, 80
    call __sym_fn_memcpy_15
    sub r12, r13, 52
    load_32 r1, [r12]
    mov r2, 1832
    add r1, r1, r2
    mov r7, r1
    mov r1, r7
    mov r2, 41248
    mov r3, 80
    call __sym_fn_memcpy_15
    sub r12, r13, 52
    load_32 r1, [r12]
    mov r2, 1928
    add r1, r1, r2
    mov r7, r1
    mov r1, r7
    mov r2, 41328
    mov r3, 80
    call __sym_fn_memcpy_15
    sub r12, r13, 52
    load_32 r1, [r12]
    mov r2, 2024
    add r1, r1, r2
    mov r7, r1
    mov r1, r7
    mov r2, 41408
    mov r3, 80
    call __sym_fn_memcpy_15
    sub r12, r13, 52
    load_32 r1, [r12]
    mov r2, 2120
    add r1, r1, r2
    mov r7, r1
    mov r1, r7
    mov r2, 41488
    mov r3, 80
    call __sym_fn_memcpy_15
    sub r12, r13, 52
    load_32 r1, [r12]
    mov r2, 2216
    add r1, r1, r2
    mov r7, r1
    mov r1, r7
    mov r2, 41568
    mov r3, 80
    call __sym_fn_memcpy_15
    sub r12, r13, 52
    load_32 r1, [r12]
    mov r2, 2312
    add r1, r1, r2
    mov r7, r1
    mov r1, r7
    mov r2, 41648
    mov r3, 80
    call __sym_fn_memcpy_15
    sub r12, r13, 52
    load_32 r1, [r12]
    mov r2, 2408
    add r1, r1, r2
    mov r7, r1
    mov r1, r7
    mov r2, 41728
    mov r3, 80
    call __sym_fn_memcpy_15
    sub r12, r13, 52
    load_32 r1, [r12]
    mov r2, 2504
    add r1, r1, r2
    mov r7, r1
    mov r1, r7
    mov r2, 41808
    mov r3, 80
    call __sym_fn_memcpy_15
    sub r12, r13, 52
    load_32 r1, [r12]
    mov r2, 2600
    add r1, r1, r2
    mov r7, r1
    mov r1, r7
    mov r2, 41888
    mov r3, 80
    call __sym_fn_memcpy_15
    sub r12, r13, 52
    load_32 r1, [r12]
    mov r2, 2696
    add r1, r1, r2
    mov r7, r1
    mov r1, r7
    mov r2, 41968
    mov r3, 80
    call __sym_fn_memcpy_15
    sub r12, r13, 52
    load_32 r1, [r12]
    mov r2, 2792
    add r1, r1, r2
    mov r7, r1
    mov r1, r7
    mov r2, 42048
    mov r3, 80
    call __sym_fn_memcpy_15
    sub r12, r13, 52
    load_32 r1, [r12]
    mov r2, 2888
    add r1, r1, r2
    mov r7, r1
    mov r1, r7
    mov r2, 42128
    mov r3, 80
    call __sym_fn_memcpy_15
    sub r12, r13, 52
    load_32 r1, [r12]
    mov r7, r1
    mov r1, 1
    mov r2, r7
    screen r1, r2
    sub r12, r13, 36
    load_32 r1, [r12]
    xor r1, r1, 1
    sub r12, r13, 56
    store_32 [r12], r1
    sub r12, r13, 28
    load_32 r1, [r12]
    mul r7, r1, 5
    asr r8, r7, 7
    sub r12, r13, 20
    load_32 r1, [r12]
    sub r7, r1, r8
    sub r12, r13, 20
    load_32 r1, [r12]
    mul r8, r1, 5
    asr r9, r8, 7
    sub r12, r13, 28
    load_32 r2, [r12]
    add r8, r9, r2
    mul r9, r8, r8
    mul r10, r7, r7
    add r11, r10, r9
    mov r1, 48
    lsl r1, r1, 16
    sub r9, r1, r11
    asr r10, r9, 11
    mul r9, r10, r7
    asr r1, r9, 10
    sub r12, r13, 60
    store_32 [r12], r1
    mul r7, r10, r8
    asr r1, r7, 10
    sub r12, r13, 64
    store_32 [r12], r1
    sub r12, r13, 12
    load_32 r1, [r12]
    mul r7, r1, 5
    asr r8, r7, 8
    sub r12, r13, 4
    load_32 r1, [r12]
    sub r7, r1, r8
    sub r12, r13, 4
    load_32 r1, [r12]
    mul r8, r1, 5
    asr r9, r8, 8
    sub r12, r13, 12
    load_32 r2, [r12]
    add r8, r9, r2
    mul r9, r8, r8
    mul r10, r7, r7
    add r11, r10, r9
    mov r1, 48
    lsl r1, r1, 16
    sub r9, r1, r11
    asr r10, r9, 11
    mul r9, r10, r7
    asr r1, r9, 10
    sub r12, r13, 68
    store_32 [r12], r1
    mul r7, r10, r8
    asr r1, r7, 10
    sub r12, r13, 72
    store_32 [r12], r1
    keyboard r1
    sub r12, r13, 76
    store_32 [r12], r1
    sub r12, r13, 76
    load_32 r1, [r12]
    mov r2, 0
    cmp r1, r2
    je __sym_edge_true_24
    sub r12, r13, 76
    load_32 r1, [r12]
    sub r12, r13, 228
    store_32 [r12], r1
    jmp __sym_block_11
__sym_edge_true_24:
    jmp __sym_block_4
__sym_block_4:
    sub r12, r13, 68
    load_32 r1, [r12]
    sub r12, r13, 4
    store_32 [r12], r1
    sub r12, r13, 72
    load_32 r1, [r12]
    sub r12, r13, 12
    store_32 [r12], r1
    sub r12, r13, 60
    load_32 r1, [r12]
    sub r12, r13, 20
    store_32 [r12], r1
    sub r12, r13, 64
    load_32 r1, [r12]
    sub r12, r13, 28
    store_32 [r12], r1
    sub r12, r13, 56
    load_32 r1, [r12]
    sub r12, r13, 36
    store_32 [r12], r1
    jmp __sym_block_2
__sym_block_5:
    sub r12, r13, 92
    load_32 r1, [r12]
    add r1, r1, 2048
    sub r12, r13, 108
    store_32 [r12], r1
    sub r12, r13, 84
    load_32 r1, [r12]
    sub r12, r13, 20
    load_32 r2, [r12]
    mul r7, r1, r2
    asr r1, r7, 10
    sub r12, r13, 112
    store_32 [r12], r1
    sub r12, r13, 84
    load_32 r1, [r12]
    sub r12, r13, 28
    load_32 r2, [r12]
    mul r7, r1, r2
    asr r1, r7, 10
    sub r12, r13, 116
    store_32 [r12], r1
    mov r2, 65535
    lsl r2, r2, 16
    or r2, r2, 64512
    and r1, r7, r2
    sub r12, r13, 120
    store_32 [r12], r1
    sub r12, r13, 120
    load_32 r1, [r12]
    mov r2, 80
    lsl r2, r2, 16
    add r1, r1, r2
    sub r12, r13, 124
    store_32 [r12], r1
    sub r12, r13, 92
    load_32 r1, [r12]
    sub r12, r13, 12
    load_32 r2, [r12]
    mul r7, r1, r2
    asr r1, r7, 10
    sub r12, r13, 128
    store_32 [r12], r1
    mov r1, 0
    sub r12, r13, 148
    store_32 [r12], r1
    mov r1, 1024
    sub r12, r13, 156
    store_32 [r12], r1
    mov r1, 0
    sub r12, r13, 164
    store_32 [r12], r1
    jmp __sym_block_7
__sym_block_6:
    sub r12, r13, 84
    load_32 r1, [r12]
    mul r7, r1, 9
    asr r8, r7, 7
    sub r12, r13, 92
    load_32 r1, [r12]
    sub r7, r1, r8
    sub r12, r13, 92
    load_32 r1, [r12]
    mul r8, r1, 9
    asr r9, r8, 7
    sub r12, r13, 84
    load_32 r2, [r12]
    add r8, r9, r2
    mul r9, r8, r8
    mul r10, r7, r7
    add r11, r10, r9
    mov r1, 48
    lsl r1, r1, 16
    sub r9, r1, r11
    asr r10, r9, 11
    mul r9, r10, r7
    asr r1, r9, 10
    sub r12, r13, 132
    store_32 [r12], r1
    mul r7, r10, r8
    asr r1, r7, 10
    sub r12, r13, 136
    store_32 [r12], r1
    sub r12, r13, 100
    load_32 r1, [r12]
    add r1, r1, 1
    sub r12, r13, 140
    store_32 [r12], r1
    sub r12, r13, 140
    load_32 r1, [r12]
    mov r2, 90
    cmp r1, r2
    je __sym_edge_true_25
    sub r12, r13, 136
    load_32 r1, [r12]
    sub r12, r13, 84
    store_32 [r12], r1
    sub r12, r13, 132
    load_32 r1, [r12]
    sub r12, r13, 92
    store_32 [r12], r1
    sub r12, r13, 140
    load_32 r1, [r12]
    sub r12, r13, 100
    store_32 [r12], r1
    jmp __sym_block_5
__sym_edge_true_25:
    jmp __sym_block_3
__sym_block_7:
    sub r12, r13, 156
    load_32 r1, [r12]
    sub r12, r13, 108
    load_32 r2, [r12]
    mul r7, r1, r2
    asr r8, r7, 10
    sub r12, r13, 148
    load_32 r1, [r12]
    sub r12, r13, 108
    load_32 r2, [r12]
    mul r7, r1, r2
    asr r9, r7, 10
    sub r12, r13, 28
    load_32 r2, [r12]
    mul r7, r9, r2
    asr r10, r7, 10
    sub r12, r13, 112
    load_32 r1, [r12]
    sub r7, r1, r10
    sub r12, r13, 20
    load_32 r2, [r12]
    mul r10, r9, r2
    sub r12, r13, 124
    load_32 r2, [r12]
    add r9, r10, r2
    sub r12, r13, 148
    load_32 r1, [r12]
    sub r12, r13, 92
    load_32 r2, [r12]
    mul r11, r1, r2
    asr r1, r11, 10
    sub r12, r13, 172
    store_32 [r12], r1
    sub r12, r13, 4
    load_32 r2, [r12]
    mul r11, r8, r2
    sub r12, r13, 12
    load_32 r2, [r12]
    mul r1, r7, r2
    sub r12, r13, 176
    store_32 [r12], r1
    sub r12, r13, 176
    load_32 r2, [r12]
    sub r1, r11, r2
    sub r12, r13, 180
    store_32 [r12], r1
    sub r12, r13, 180
    load_32 r1, [r12]
    mul r11, r1, 30
    mov r1, r11
    mov r2, r9
    asr r3, r1, 31
    asr r4, r2, 31
    xor r1, r1, r3
    sub r1, r1, r3
    xor r2, r2, r4
    sub r2, r2, r4
    div r1, r1, r2
    xor r3, r3, r4
    xor r1, r1, r3
    sub r1, r1, r3
    sub r12, r13, 184
    store_32 [r12], r1
    sub r12, r13, 48
    load_32 r2, [r12]
    mul r11, r7, r2
    sub r12, r13, 44
    load_32 r2, [r12]
    mul r7, r8, r2
    add r8, r11, r7
    mov r1, r8
    mov r2, r9
    asr r3, r1, 31
    asr r4, r2, 31
    xor r1, r1, r3
    sub r1, r1, r3
    xor r2, r2, r4
    sub r2, r2, r4
    div r1, r1, r2
    xor r3, r3, r4
    xor r1, r1, r3
    sub r1, r1, r3
    mov r7, r1
    sub r12, r13, 172
    load_32 r1, [r12]
    sub r12, r13, 20
    load_32 r2, [r12]
    mul r8, r1, r2
    sub r12, r13, 28
    load_32 r1, [r12]
    sub r12, r13, 172
    load_32 r2, [r12]
    mul r9, r1, r2
    mov r1, 0
    sub r11, r1, r9
    asr r9, r11, 10
    sub r12, r13, 112
    load_32 r2, [r12]
    add r11, r9, r2
    sub r12, r13, 4
    load_32 r2, [r12]
    mul r9, r11, r2
    add r11, r8, r9
    sub r12, r13, 156
    load_32 r1, [r12]
    sub r12, r13, 128
    load_32 r2, [r12]
    mul r8, r1, r2
    add r9, r8, r11
    mov r1, 0
    sub r8, r1, r9
    asr r9, r8, 10
    sub r12, r13, 116
    load_32 r2, [r12]
    sub r8, r9, r2
    asr r1, r8, 7
    sub r12, r13, 188
    store_32 [r12], r1
    mul r8, r7, 80
    sub r12, r13, 184
    load_32 r1, [r12]
    add r9, r1, 1000
    add r1, r9, r8
    sub r12, r13, 192
    store_32 [r12], r1
    sub r12, r13, 120
    load_32 r2, [r12]
    add r8, r10, r2
    lsr r1, r8, 15
    sub r12, r13, 196
    store_32 [r12], r1
    sub r12, r13, 196
    load_32 r1, [r12]
    and r1, r1, 255
    sub r12, r13, 200
    store_32 [r12], r1
    add r8, r7, 11
    mov r2, 21
    cmp r8, r2
    jb __sym_cmp_yes_26
    mov r1, 0
    jmp __sym_cmp_done_27
__sym_cmp_yes_26:
    mov r1, 1
__sym_cmp_done_27:
    and r1, r1, 1
    mov r7, r1
    sub r12, r13, 184
    load_32 r1, [r12]
    add r8, r1, 39
    mov r2, 79
    cmp r8, r2
    jb __sym_cmp_yes_28
    mov r1, 0
    jmp __sym_cmp_done_29
__sym_cmp_yes_28:
    mov r1, 1
__sym_cmp_done_29:
    and r1, r1, 1
    mov r9, r1
    mov r1, r7
    cmp r1, 0
    jne __sym_select_yes_30
    mov r1, 0
    jmp __sym_select_done_31
__sym_select_yes_30:
    mov r1, r9
__sym_select_done_31:
    and r1, r1, 1
    mov r8, r1
    mov r1, r8
    cmp r1, 0
    jne __sym_edge_true_32
    jmp __sym_block_10
__sym_edge_true_32:
    jmp __sym_block_8
__sym_block_8:
    sub r12, r13, 196
    load_32 r1, [r12]
    lsl r7, r1, 24
    asr r8, r7, 24
    mov r1, 42208
    sub r12, r13, 192
    load_32 r2, [r12]
    add r1, r1, r2
    sub r12, r13, 204
    store_32 [r12], r1
    sub r12, r13, 204
    load_32 r2, [r12]
    load_8 r7, [r2]
    and r7, r7, 255
    mov r1, r7
    lsl r1, r1, 24
    asr r1, r1, 24
    mov r9, r1
    cmp r8, r9
    jl __sym_edge_true_33
    jmp __sym_block_10
__sym_edge_true_33:
    jmp __sym_block_9
__sym_block_9:
    sub r12, r13, 200
    load_32 r1, [r12]
    sub r12, r13, 204
    load_32 r2, [r12]
    store_8 [r2], r1
    sub r12, r13, 188
    load_32 r1, [r12]
    mov r2, 0
    cmp r1, r2
    jge __sym_minmax_34
    mov r1, r2
__sym_minmax_34:
    mov r7, r1
    mov r1, 43968
    mov r2, r7
    add r1, r1, r2
    mov r8, r1
    load_8 r7, [r8]
    and r7, r7, 255
    mov r1, 40448
    sub r12, r13, 192
    load_32 r2, [r12]
    add r1, r1, r2
    mov r8, r1
    store_8 [r8], r7
    jmp __sym_block_10
__sym_block_10:
    sub r12, r13, 148
    load_32 r1, [r12]
    mul r7, r1, 5
    asr r8, r7, 8
    sub r12, r13, 156
    load_32 r1, [r12]
    sub r7, r1, r8
    sub r12, r13, 156
    load_32 r1, [r12]
    mul r8, r1, 5
    asr r9, r8, 8
    sub r12, r13, 148
    load_32 r2, [r12]
    add r8, r9, r2
    mul r9, r8, r8
    mul r10, r7, r7
    add r11, r10, r9
    mov r1, 48
    lsl r1, r1, 16
    sub r9, r1, r11
    asr r10, r9, 11
    mul r9, r10, r7
    asr r1, r9, 10
    sub r12, r13, 212
    store_32 [r12], r1
    mul r7, r10, r8
    asr r1, r7, 10
    sub r12, r13, 216
    store_32 [r12], r1
    sub r12, r13, 164
    load_32 r1, [r12]
    add r1, r1, 1
    sub r12, r13, 220
    store_32 [r12], r1
    sub r12, r13, 220
    load_32 r1, [r12]
    mov r2, 324
    cmp r1, r2
    je __sym_edge_true_35
    sub r12, r13, 216
    load_32 r1, [r12]
    sub r12, r13, 148
    store_32 [r12], r1
    sub r12, r13, 212
    load_32 r1, [r12]
    sub r12, r13, 156
    store_32 [r12], r1
    sub r12, r13, 220
    load_32 r1, [r12]
    sub r12, r13, 164
    store_32 [r12], r1
    jmp __sym_block_7
__sym_edge_true_35:
    jmp __sym_block_6
__sym_block_11:
    sub r12, r13, 228
    load_32 r1, [r12]
    and r7, r1, 256
    mov r2, 0
    cmp r7, r2
    je __sym_edge_true_36
    jmp __sym_block_12
__sym_edge_true_36:
    jmp __sym_block_13
__sym_block_12:
    sub r12, r13, 228
    load_32 r1, [r12]
    and r7, r1, 255
    sub r12, r13, 228
    load_32 r1, [r12]
    and r8, r1, 223
    mov r2, 81
    cmp r8, r2
    je __sym_cmp_yes_37
    mov r1, 0
    jmp __sym_cmp_done_38
__sym_cmp_yes_37:
    mov r1, 1
__sym_cmp_done_38:
    and r1, r1, 1
    mov r9, r1
    mov r2, 27
    cmp r7, r2
    je __sym_cmp_yes_39
    mov r1, 0
    jmp __sym_cmp_done_40
__sym_cmp_yes_39:
    mov r1, 1
__sym_cmp_done_40:
    and r1, r1, 1
    mov r8, r1
    or r7, r9, r8
    and r7, r7, 1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_41
    jmp __sym_block_13
__sym_edge_true_41:
    jmp __sym_block_14
__sym_block_13:
    keyboard r1
    sub r12, r13, 240
    store_32 [r12], r1
    sub r12, r13, 240
    load_32 r1, [r12]
    mov r2, 0
    cmp r1, r2
    je __sym_edge_true_42
    sub r12, r13, 240
    load_32 r1, [r12]
    sub r12, r13, 228
    store_32 [r12], r1
    jmp __sym_block_11
__sym_edge_true_42:
    jmp __sym_block_4
__sym_block_14:
    mov r1, 0
    mov sp, r13
    pop r13
    ret

; function memcpy, frame 32 bytes
__sym_fn_memcpy_15:
    push r13
    mov r13, sp
    sub sp, sp, 32
    sub r12, r13, 4
    store_32 [r12], r1
    sub r12, r13, 8
    store_32 [r12], r2
    sub r12, r13, 12
    store_32 [r12], r3
__sym_block_16:
    sub r12, r13, 12
    load_32 r1, [r12]
    mov r2, 0
    cmp r1, r2
    je __sym_edge_true_43
    mov r1, 0
    sub r12, r13, 20
    store_32 [r12], r1
    jmp __sym_block_18
__sym_edge_true_43:
    jmp __sym_block_17
__sym_block_17:
    sub r12, r13, 4
    load_32 r1, [r12]
    mov sp, r13
    pop r13
    ret
__sym_block_18:
    sub r12, r13, 8
    load_32 r1, [r12]
    sub r12, r13, 20
    load_32 r2, [r12]
    add r1, r1, r2
    mov r7, r1
    load_8 r8, [r7]
    and r8, r8, 255
    sub r12, r13, 4
    load_32 r1, [r12]
    sub r12, r13, 20
    load_32 r2, [r12]
    add r1, r1, r2
    mov r7, r1
    store_8 [r7], r8
    sub r12, r13, 20
    load_32 r1, [r12]
    add r1, r1, 1
    sub r12, r13, 28
    store_32 [r12], r1
    sub r12, r13, 28
    load_32 r1, [r12]
    sub r12, r13, 12
    load_32 r2, [r12]
    cmp r1, r2
    je __sym_edge_true_44
    sub r12, r13, 28
    load_32 r1, [r12]
    sub r12, r13, 20
    store_32 [r12], r1
    jmp __sym_block_18
__sym_edge_true_44:
    jmp __sym_block_17

; function memset, frame 40 bytes
__sym_fn_memset_19:
    push r13
    mov r13, sp
    sub sp, sp, 40
    sub r12, r13, 4
    store_32 [r12], r1
    sub r12, r13, 8
    store_32 [r12], r2
    sub r12, r13, 12
    store_32 [r12], r3
__sym_block_20:
    sub r12, r13, 12
    load_32 r1, [r12]
    mov r2, 0
    cmp r1, r2
    je __sym_edge_true_45
    jmp __sym_block_21
__sym_edge_true_45:
    jmp __sym_block_22
__sym_block_21:
    sub r12, r13, 8
    load_32 r1, [r12]
    and r1, r1, 255
    sub r12, r13, 20
    store_32 [r12], r1
    mov r1, 0
    sub r12, r13, 24
    store_32 [r12], r1
    jmp __sym_block_23
__sym_block_22:
    sub r12, r13, 4
    load_32 r1, [r12]
    mov sp, r13
    pop r13
    ret
__sym_block_23:
    sub r12, r13, 4
    load_32 r1, [r12]
    sub r12, r13, 24
    load_32 r2, [r12]
    add r1, r1, r2
    mov r7, r1
    sub r12, r13, 20
    load_32 r1, [r12]
    store_8 [r7], r1
    sub r12, r13, 24
    load_32 r1, [r12]
    add r1, r1, 1
    sub r12, r13, 32
    store_32 [r12], r1
    sub r12, r13, 32
    load_32 r1, [r12]
    sub r12, r13, 12
    load_32 r2, [r12]
    cmp r1, r2
    je __sym_edge_true_46
    sub r12, r13, 32
    load_32 r1, [r12]
    sub r12, r13, 24
    store_32 [r12], r1
    jmp __sym_block_23
__sym_edge_true_46:
    jmp __sym_block_22

; Global addresses (zero tail uses initially zeroed RAM).
; framebuffer = 32768
; b = 40448
; z = 42208
; .str = 43968
@32768
@43968
U8 46
U8 44
U8 45
U8 126
U8 58
U8 59
U8 61
U8 33
U8 42
U8 35
U8 36
U8 64
