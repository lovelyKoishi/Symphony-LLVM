; Symphony LLVM backend 0.1. Big endian, 32-bit values/pointers.
__sym_start:
    mov sp, 1
    lsl sp, sp, 16
    call __sym_fn_main_0
__sym_halt:
    jmp __sym_halt
__sym_trap:
    jmp __sym_trap

; function main, frame 488 bytes
__sym_fn_main_0:
    push r13
    mov r13, sp
    sub sp, sp, 488
__sym_block_1:
    mov r1, 0
    sub r12, r13, 8
    store_32 [r12], r1
    sub r12, r13, 8
    load_32 r1, [r12]
    sub r12, r13, 4
    store_32 [r12], r1
    jmp __sym_block_3
__sym_block_2:
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
    mov r2, 32768
    screen r1, r2
    mov r1, 0
    sub r12, r13, 24
    store_32 [r12], r1
    mov r1, 1024
    sub r12, r13, 32
    store_32 [r12], r1
    mov r1, 0
    sub r12, r13, 40
    store_32 [r12], r1
    mov r1, 1024
    sub r12, r13, 48
    store_32 [r12], r1
    mov r1, 1
    sub r12, r13, 56
    store_32 [r12], r1
    mov r1, 0
    sub r12, r13, 64
    store_32 [r12], r1
    sub r12, r13, 24
    load_32 r1, [r12]
    sub r12, r13, 20
    store_32 [r12], r1
    sub r12, r13, 32
    load_32 r1, [r12]
    sub r12, r13, 28
    store_32 [r12], r1
    sub r12, r13, 40
    load_32 r1, [r12]
    sub r12, r13, 36
    store_32 [r12], r1
    sub r12, r13, 48
    load_32 r1, [r12]
    sub r12, r13, 44
    store_32 [r12], r1
    sub r12, r13, 56
    load_32 r1, [r12]
    sub r12, r13, 52
    store_32 [r12], r1
    sub r12, r13, 64
    load_32 r1, [r12]
    sub r12, r13, 60
    store_32 [r12], r1
    jmp __sym_block_4
__sym_block_3:
    mov r1, 32768
    sub r12, r13, 4
    load_32 r2, [r12]
    mov r3, 3840
    mul r2, r2, r3
    add r1, r1, r2
    sub r12, r13, 12
    store_32 [r12], r1
    sub r12, r13, 12
    load_32 r1, [r12]
    mov r2, 200
    add r1, r1, r2
    mov r7, r1
    mov r1, r7
    mov r2, 40448
    mov r3, 12
    call __sym_fn_memcpy_29
    sub r12, r13, 12
    load_32 r1, [r12]
    mov r2, 392
    add r1, r1, r2
    mov r7, r1
    mov r1, r7
    mov r2, 40461
    mov r3, 21
    call __sym_fn_memcpy_29
    sub r12, r13, 4
    load_32 r1, [r12]
    mov r2, 1
    add r1, r1, r2
    sub r12, r13, 16
    store_32 [r12], r1
    sub r12, r13, 4
    load_32 r1, [r12]
    mov r2, 0
    cmp r1, r2
    je __sym_cmp_yes_38
    mov r1, 0
    jmp __sym_cmp_done_39
__sym_cmp_yes_38:
    mov r1, 1
__sym_cmp_done_39:
    and r1, r1, 1
    mov r7, r1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_40
    jmp __sym_block_2
__sym_edge_true_40:
    sub r12, r13, 16
    load_32 r1, [r12]
    sub r12, r13, 8
    store_32 [r12], r1
    sub r12, r13, 8
    load_32 r1, [r12]
    sub r12, r13, 4
    store_32 [r12], r1
    jmp __sym_block_3
__sym_block_4:
    mov r1, 40483
    mov r2, 32
    mov r3, 1760
    call __sym_fn_memset_33
    mov r1, 42243
    mov r2, 127
    mov r3, 1760
    call __sym_fn_memset_33
    sub r12, r13, 52
    load_32 r1, [r12]
    mov r2, 1
    xor r1, r1, r2
    mov r7, r1
    mov r1, 32768
    mov r2, r7
    mov r3, 3840
    mul r2, r2, r3
    add r1, r1, r2
    mov r8, r1
    mov r1, r8
    mov r2, 398
    add r1, r1, r2
    sub r12, r13, 68
    store_32 [r12], r1
    sub r12, r13, 60
    load_32 r1, [r12]
    and r1, r1, 255
    mov r7, r1
    mov r1, r7
    mov r2, 48
    or r1, r1, r2
    and r1, r1, 255
    sub r12, r13, 72
    store_32 [r12], r1
    mov r1, r8
    mov r2, 399
    add r1, r1, r2
    sub r12, r13, 76
    store_32 [r12], r1
    mov r1, r8
    mov r2, 406
    add r1, r1, r2
    sub r12, r13, 80
    store_32 [r12], r1
    mov r1, r8
    mov r2, 407
    add r1, r1, r2
    sub r12, r13, 84
    store_32 [r12], r1
    sub r12, r13, 28
    load_32 r1, [r12]
    mov r2, 15
    mul r1, r1, r2
    sub r12, r13, 88
    store_32 [r12], r1
    sub r12, r13, 20
    load_32 r1, [r12]
    mov r2, 15
    mul r1, r1, r2
    sub r12, r13, 92
    store_32 [r12], r1
    mov r1, 0
    sub r12, r13, 104
    store_32 [r12], r1
    mov r1, 0
    sub r12, r13, 112
    store_32 [r12], r1
    mov r1, 0
    sub r12, r13, 120
    store_32 [r12], r1
    mov r1, 0
    sub r12, r13, 128
    store_32 [r12], r1
    mov r1, 0
    sub r12, r13, 136
    store_32 [r12], r1
    mov r1, 1024
    sub r12, r13, 144
    store_32 [r12], r1
    mov r1, 0
    sub r12, r13, 152
    store_32 [r12], r1
    sub r12, r13, 104
    load_32 r1, [r12]
    sub r12, r13, 100
    store_32 [r12], r1
    sub r12, r13, 112
    load_32 r1, [r12]
    sub r12, r13, 108
    store_32 [r12], r1
    sub r12, r13, 120
    load_32 r1, [r12]
    sub r12, r13, 116
    store_32 [r12], r1
    sub r12, r13, 128
    load_32 r1, [r12]
    sub r12, r13, 124
    store_32 [r12], r1
    sub r12, r13, 136
    load_32 r1, [r12]
    sub r12, r13, 132
    store_32 [r12], r1
    sub r12, r13, 144
    load_32 r1, [r12]
    sub r12, r13, 140
    store_32 [r12], r1
    sub r12, r13, 152
    load_32 r1, [r12]
    sub r12, r13, 148
    store_32 [r12], r1
    jmp __sym_block_6
__sym_block_5:
    mov r1, 32768
    sub r12, r13, 52
    load_32 r2, [r12]
    mov r3, 3840
    mul r2, r2, r3
    add r1, r1, r2
    sub r12, r13, 96
    store_32 [r12], r1
    mov r1, 0
    sub r12, r13, 388
    store_32 [r12], r1
    sub r12, r13, 388
    load_32 r1, [r12]
    sub r12, r13, 384
    store_32 [r12], r1
    jmp __sym_block_13
__sym_block_6:
    mov r1, 48
    sub r12, r13, 68
    load_32 r2, [r12]
    store_8 [r2], r1
    sub r12, r13, 72
    load_32 r1, [r12]
    sub r12, r13, 76
    load_32 r2, [r12]
    store_8 [r2], r1
    sub r12, r13, 148
    load_32 r1, [r12]
    mov r7, r1
    mov r1, r7
    mov r2, 10
    div r1, r1, r2
    mov r8, r1
    mov r1, r8
    and r1, r1, 255
    mov r9, r1
    mov r1, r9
    mov r2, 48
    or r1, r1, r2
    and r1, r1, 255
    mov r10, r1
    mov r1, r10
    sub r12, r13, 80
    load_32 r2, [r12]
    store_8 [r2], r1
    mov r1, r8
    mov r2, 10
    mul r1, r1, r2
    mov r9, r1
    mov r1, r7
    mov r2, r9
    sub r1, r1, r2
    mov r8, r1
    mov r1, r8
    and r1, r1, 255
    mov r7, r1
    mov r1, r7
    mov r2, 48
    or r1, r1, r2
    and r1, r1, 255
    mov r8, r1
    mov r1, r8
    sub r12, r13, 84
    load_32 r2, [r12]
    store_8 [r2], r1
    sub r12, r13, 140
    load_32 r1, [r12]
    mov r2, 2048
    add r1, r1, r2
    sub r12, r13, 156
    store_32 [r12], r1
    sub r12, r13, 132
    load_32 r1, [r12]
    sub r12, r13, 36
    load_32 r2, [r12]
    mul r1, r1, r2
    mov r7, r1
    mov r1, r7
    mov r2, 10
    asr r1, r1, r2
    sub r12, r13, 160
    store_32 [r12], r1
    sub r12, r13, 132
    load_32 r1, [r12]
    sub r12, r13, 44
    load_32 r2, [r12]
    mul r1, r1, r2
    mov r7, r1
    mov r1, r7
    mov r2, 10
    asr r1, r1, r2
    sub r12, r13, 164
    store_32 [r12], r1
    mov r1, r7
    mov r2, 65535
    lsl r2, r2, 16
    or r2, r2, 64512
    and r1, r1, r2
    sub r12, r13, 168
    store_32 [r12], r1
    sub r12, r13, 168
    load_32 r1, [r12]
    mov r2, 80
    lsl r2, r2, 16
    add r1, r1, r2
    sub r12, r13, 172
    store_32 [r12], r1
    sub r12, r13, 140
    load_32 r1, [r12]
    sub r12, r13, 28
    load_32 r2, [r12]
    mul r1, r1, r2
    mov r7, r1
    mov r1, r7
    mov r2, 10
    asr r1, r1, r2
    sub r12, r13, 176
    store_32 [r12], r1
    sub r12, r13, 100
    load_32 r1, [r12]
    sub r12, r13, 200
    store_32 [r12], r1
    sub r12, r13, 108
    load_32 r1, [r12]
    sub r12, r13, 208
    store_32 [r12], r1
    sub r12, r13, 116
    load_32 r1, [r12]
    sub r12, r13, 216
    store_32 [r12], r1
    sub r12, r13, 124
    load_32 r1, [r12]
    sub r12, r13, 224
    store_32 [r12], r1
    mov r1, 0
    sub r12, r13, 232
    store_32 [r12], r1
    mov r1, 1024
    sub r12, r13, 240
    store_32 [r12], r1
    mov r1, 0
    sub r12, r13, 248
    store_32 [r12], r1
    sub r12, r13, 200
    load_32 r1, [r12]
    sub r12, r13, 196
    store_32 [r12], r1
    sub r12, r13, 208
    load_32 r1, [r12]
    sub r12, r13, 204
    store_32 [r12], r1
    sub r12, r13, 216
    load_32 r1, [r12]
    sub r12, r13, 212
    store_32 [r12], r1
    sub r12, r13, 224
    load_32 r1, [r12]
    sub r12, r13, 220
    store_32 [r12], r1
    sub r12, r13, 232
    load_32 r1, [r12]
    sub r12, r13, 228
    store_32 [r12], r1
    sub r12, r13, 240
    load_32 r1, [r12]
    sub r12, r13, 236
    store_32 [r12], r1
    sub r12, r13, 248
    load_32 r1, [r12]
    sub r12, r13, 244
    store_32 [r12], r1
    jmp __sym_block_8
__sym_block_7:
    sub r12, r13, 132
    load_32 r1, [r12]
    mov r2, 9
    mul r1, r1, r2
    mov r7, r1
    mov r1, r7
    mov r2, 7
    asr r1, r1, r2
    mov r8, r1
    sub r12, r13, 140
    load_32 r1, [r12]
    mov r2, r8
    sub r1, r1, r2
    mov r7, r1
    sub r12, r13, 140
    load_32 r1, [r12]
    mov r2, 9
    mul r1, r1, r2
    mov r8, r1
    mov r1, r8
    mov r2, 7
    asr r1, r1, r2
    mov r9, r1
    mov r1, r9
    sub r12, r13, 132
    load_32 r2, [r12]
    add r1, r1, r2
    mov r8, r1
    mov r1, r8
    mov r2, r8
    mul r1, r1, r2
    mov r9, r1
    mov r1, r7
    mov r2, r7
    mul r1, r1, r2
    mov r10, r1
    mov r1, r10
    mov r2, r9
    add r1, r1, r2
    sub r12, r13, 180
    store_32 [r12], r1
    mov r1, 48
    lsl r1, r1, 16
    sub r12, r13, 180
    load_32 r2, [r12]
    sub r1, r1, r2
    mov r9, r1
    mov r1, r9
    mov r2, 11
    asr r1, r1, r2
    mov r10, r1
    mov r1, r10
    mov r2, r7
    mul r1, r1, r2
    mov r9, r1
    mov r1, r9
    mov r2, 10
    asr r1, r1, r2
    sub r12, r13, 184
    store_32 [r12], r1
    mov r1, r10
    mov r2, r8
    mul r1, r1, r2
    mov r7, r1
    mov r1, r7
    mov r2, 10
    asr r1, r1, r2
    sub r12, r13, 188
    store_32 [r12], r1
    sub r12, r13, 148
    load_32 r1, [r12]
    mov r2, 1
    add r1, r1, r2
    sub r12, r13, 192
    store_32 [r12], r1
    sub r12, r13, 192
    load_32 r1, [r12]
    mov r2, 90
    cmp r1, r2
    je __sym_cmp_yes_41
    mov r1, 0
    jmp __sym_cmp_done_42
__sym_cmp_yes_41:
    mov r1, 1
__sym_cmp_done_42:
    and r1, r1, 1
    mov r7, r1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_43
    sub r12, r13, 356
    load_32 r1, [r12]
    sub r12, r13, 104
    store_32 [r12], r1
    sub r12, r13, 344
    load_32 r1, [r12]
    sub r12, r13, 112
    store_32 [r12], r1
    sub r12, r13, 340
    load_32 r1, [r12]
    sub r12, r13, 120
    store_32 [r12], r1
    sub r12, r13, 336
    load_32 r1, [r12]
    sub r12, r13, 128
    store_32 [r12], r1
    sub r12, r13, 188
    load_32 r1, [r12]
    sub r12, r13, 136
    store_32 [r12], r1
    sub r12, r13, 184
    load_32 r1, [r12]
    sub r12, r13, 144
    store_32 [r12], r1
    sub r12, r13, 192
    load_32 r1, [r12]
    sub r12, r13, 152
    store_32 [r12], r1
    sub r12, r13, 104
    load_32 r1, [r12]
    sub r12, r13, 100
    store_32 [r12], r1
    sub r12, r13, 112
    load_32 r1, [r12]
    sub r12, r13, 108
    store_32 [r12], r1
    sub r12, r13, 120
    load_32 r1, [r12]
    sub r12, r13, 116
    store_32 [r12], r1
    sub r12, r13, 128
    load_32 r1, [r12]
    sub r12, r13, 124
    store_32 [r12], r1
    sub r12, r13, 136
    load_32 r1, [r12]
    sub r12, r13, 132
    store_32 [r12], r1
    sub r12, r13, 144
    load_32 r1, [r12]
    sub r12, r13, 140
    store_32 [r12], r1
    sub r12, r13, 152
    load_32 r1, [r12]
    sub r12, r13, 148
    store_32 [r12], r1
    jmp __sym_block_6
__sym_edge_true_43:
    jmp __sym_block_5
__sym_block_8:
    sub r12, r13, 236
    load_32 r1, [r12]
    sub r12, r13, 156
    load_32 r2, [r12]
    mul r1, r1, r2
    mov r7, r1
    mov r1, r7
    mov r2, 10
    asr r1, r1, r2
    mov r8, r1
    sub r12, r13, 244
    load_32 r1, [r12]
    sub r12, r13, 156
    load_32 r2, [r12]
    mul r1, r1, r2
    mov r7, r1
    mov r1, r7
    mov r2, 10
    asr r1, r1, r2
    mov r9, r1
    mov r1, r9
    sub r12, r13, 44
    load_32 r2, [r12]
    mul r1, r1, r2
    mov r7, r1
    mov r1, r7
    mov r2, 10
    asr r1, r1, r2
    mov r10, r1
    sub r12, r13, 160
    load_32 r1, [r12]
    mov r2, r10
    sub r1, r1, r2
    mov r7, r1
    mov r1, r9
    sub r12, r13, 36
    load_32 r2, [r12]
    mul r1, r1, r2
    mov r10, r1
    mov r1, r10
    sub r12, r13, 172
    load_32 r2, [r12]
    add r1, r1, r2
    mov r9, r1
    sub r12, r13, 244
    load_32 r1, [r12]
    sub r12, r13, 140
    load_32 r2, [r12]
    mul r1, r1, r2
    sub r12, r13, 252
    store_32 [r12], r1
    sub r12, r13, 252
    load_32 r1, [r12]
    mov r2, 10
    asr r1, r1, r2
    sub r12, r13, 256
    store_32 [r12], r1
    mov r1, r8
    sub r12, r13, 20
    load_32 r2, [r12]
    mul r1, r1, r2
    sub r12, r13, 260
    store_32 [r12], r1
    mov r1, r7
    sub r12, r13, 28
    load_32 r2, [r12]
    mul r1, r1, r2
    sub r12, r13, 264
    store_32 [r12], r1
    sub r12, r13, 260
    load_32 r1, [r12]
    sub r12, r13, 264
    load_32 r2, [r12]
    sub r1, r1, r2
    sub r12, r13, 268
    store_32 [r12], r1
    sub r12, r13, 268
    load_32 r1, [r12]
    mov r2, 30
    mul r1, r1, r2
    sub r12, r13, 272
    store_32 [r12], r1
    sub r12, r13, 272
    load_32 r1, [r12]
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
    sub r12, r13, 276
    store_32 [r12], r1
    sub r12, r13, 276
    load_32 r1, [r12]
    mov r2, 40
    add r1, r1, r2
    sub r12, r13, 280
    store_32 [r12], r1
    mov r1, r7
    sub r12, r13, 92
    load_32 r2, [r12]
    mul r1, r1, r2
    sub r12, r13, 284
    store_32 [r12], r1
    mov r1, r8
    sub r12, r13, 88
    load_32 r2, [r12]
    mul r1, r1, r2
    mov r7, r1
    sub r12, r13, 284
    load_32 r1, [r12]
    mov r2, r7
    add r1, r1, r2
    mov r8, r1
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
    mov r1, r7
    mov r2, 12
    add r1, r1, r2
    mov r8, r1
    sub r12, r13, 256
    load_32 r1, [r12]
    sub r12, r13, 36
    load_32 r2, [r12]
    mul r1, r1, r2
    mov r9, r1
    sub r12, r13, 44
    load_32 r1, [r12]
    sub r12, r13, 256
    load_32 r2, [r12]
    mul r1, r1, r2
    sub r12, r13, 288
    store_32 [r12], r1
    mov r1, 0
    sub r12, r13, 288
    load_32 r2, [r12]
    sub r1, r1, r2
    sub r12, r13, 292
    store_32 [r12], r1
    sub r12, r13, 292
    load_32 r1, [r12]
    mov r2, 10
    asr r1, r1, r2
    sub r12, r13, 296
    store_32 [r12], r1
    sub r12, r13, 296
    load_32 r1, [r12]
    sub r12, r13, 160
    load_32 r2, [r12]
    add r1, r1, r2
    sub r12, r13, 300
    store_32 [r12], r1
    sub r12, r13, 300
    load_32 r1, [r12]
    sub r12, r13, 20
    load_32 r2, [r12]
    mul r1, r1, r2
    sub r12, r13, 304
    store_32 [r12], r1
    mov r1, r9
    sub r12, r13, 304
    load_32 r2, [r12]
    add r1, r1, r2
    sub r12, r13, 308
    store_32 [r12], r1
    sub r12, r13, 236
    load_32 r1, [r12]
    sub r12, r13, 176
    load_32 r2, [r12]
    mul r1, r1, r2
    mov r9, r1
    mov r1, r9
    sub r12, r13, 308
    load_32 r2, [r12]
    add r1, r1, r2
    sub r12, r13, 312
    store_32 [r12], r1
    mov r1, 0
    sub r12, r13, 312
    load_32 r2, [r12]
    sub r1, r1, r2
    mov r9, r1
    mov r1, r9
    mov r2, 10
    asr r1, r1, r2
    sub r12, r13, 316
    store_32 [r12], r1
    sub r12, r13, 316
    load_32 r1, [r12]
    sub r12, r13, 164
    load_32 r2, [r12]
    sub r1, r1, r2
    mov r9, r1
    mov r1, r9
    mov r2, 7
    asr r1, r1, r2
    sub r12, r13, 320
    store_32 [r12], r1
    mov r1, r8
    mov r2, 80
    mul r1, r1, r2
    mov r9, r1
    mov r1, r9
    sub r12, r13, 280
    load_32 r2, [r12]
    add r1, r1, r2
    sub r12, r13, 324
    store_32 [r12], r1
    mov r1, r10
    sub r12, r13, 168
    load_32 r2, [r12]
    add r1, r1, r2
    mov r9, r1
    mov r1, r9
    mov r2, 15
    lsr r1, r1, r2
    sub r12, r13, 328
    store_32 [r12], r1
    sub r12, r13, 328
    load_32 r1, [r12]
    and r1, r1, 255
    sub r12, r13, 332
    store_32 [r12], r1
    sub r12, r13, 228
    load_32 r1, [r12]
    sub r12, r13, 148
    load_32 r2, [r12]
    or r1, r1, r2
    mov r9, r1
    mov r1, r9
    mov r2, 0
    cmp r1, r2
    je __sym_cmp_yes_44
    mov r1, 0
    jmp __sym_cmp_done_45
__sym_cmp_yes_44:
    mov r1, 1
__sym_cmp_done_45:
    and r1, r1, 1
    mov r10, r1
    mov r1, r10
    cmp r1, 0
    jne __sym_select_yes_46
    sub r12, r13, 220
    load_32 r1, [r12]
    jmp __sym_select_done_47
__sym_select_yes_46:
    sub r12, r13, 320
    load_32 r1, [r12]
__sym_select_done_47:
    sub r12, r13, 336
    store_32 [r12], r1
    mov r1, r10
    cmp r1, 0
    jne __sym_select_yes_48
    sub r12, r13, 212
    load_32 r1, [r12]
    jmp __sym_select_done_49
__sym_select_yes_48:
    mov r1, r8
__sym_select_done_49:
    sub r12, r13, 340
    store_32 [r12], r1
    mov r1, r10
    cmp r1, 0
    jne __sym_select_yes_50
    sub r12, r13, 204
    load_32 r1, [r12]
    jmp __sym_select_done_51
__sym_select_yes_50:
    sub r12, r13, 280
    load_32 r1, [r12]
__sym_select_done_51:
    sub r12, r13, 344
    store_32 [r12], r1
    mov r1, r7
    mov r2, 11
    add r1, r1, r2
    mov r8, r1
    mov r1, r8
    mov r2, 21
    cmp r1, r2
    jb __sym_cmp_yes_52
    mov r1, 0
    jmp __sym_cmp_done_53
__sym_cmp_yes_52:
    mov r1, 1
__sym_cmp_done_53:
    and r1, r1, 1
    mov r7, r1
    sub r12, r13, 276
    load_32 r1, [r12]
    mov r2, 39
    add r1, r1, r2
    mov r8, r1
    mov r1, r8
    mov r2, 79
    cmp r1, r2
    jb __sym_cmp_yes_54
    mov r1, 0
    jmp __sym_cmp_done_55
__sym_cmp_yes_54:
    mov r1, 1
__sym_cmp_done_55:
    and r1, r1, 1
    mov r9, r1
    mov r1, r7
    cmp r1, 0
    jne __sym_select_yes_56
    mov r1, 0
    jmp __sym_select_done_57
__sym_select_yes_56:
    mov r1, r9
__sym_select_done_57:
    and r1, r1, 1
    mov r8, r1
    mov r1, r8
    cmp r1, 0
    jne __sym_edge_true_58
    sub r12, r13, 196
    load_32 r1, [r12]
    sub r12, r13, 360
    store_32 [r12], r1
    sub r12, r13, 360
    load_32 r1, [r12]
    sub r12, r13, 356
    store_32 [r12], r1
    jmp __sym_block_11
__sym_edge_true_58:
    jmp __sym_block_9
__sym_block_9:
    sub r12, r13, 328
    load_32 r1, [r12]
    mov r2, 24
    lsl r1, r1, r2
    mov r7, r1
    mov r1, r7
    mov r2, 24
    asr r1, r1, r2
    mov r8, r1
    mov r1, 42243
    sub r12, r13, 324
    load_32 r2, [r12]
    add r1, r1, r2
    sub r12, r13, 348
    store_32 [r12], r1
    sub r12, r13, 348
    load_32 r2, [r12]
    load_8 r1, [r2]
    and r1, r1, 255
    mov r7, r1
    mov r1, r7
    lsl r1, r1, 24
    asr r1, r1, 24
    mov r9, r1
    mov r1, r8
    mov r2, r9
    cmp r1, r2
    jl __sym_cmp_yes_59
    mov r1, 0
    jmp __sym_cmp_done_60
__sym_cmp_yes_59:
    mov r1, 1
__sym_cmp_done_60:
    and r1, r1, 1
    mov r7, r1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_61
    sub r12, r13, 196
    load_32 r1, [r12]
    sub r12, r13, 360
    store_32 [r12], r1
    sub r12, r13, 360
    load_32 r1, [r12]
    sub r12, r13, 356
    store_32 [r12], r1
    jmp __sym_block_11
__sym_edge_true_61:
    jmp __sym_block_10
__sym_block_10:
    sub r12, r13, 196
    load_32 r1, [r12]
    mov r2, 1
    add r1, r1, r2
    sub r12, r13, 352
    store_32 [r12], r1
    sub r12, r13, 332
    load_32 r1, [r12]
    sub r12, r13, 348
    load_32 r2, [r12]
    store_8 [r2], r1
    sub r12, r13, 320
    load_32 r1, [r12]
    mov r2, 0
    cmp r1, r2
    jge __sym_minmax_62
    mov r1, r2
__sym_minmax_62:
    mov r7, r1
    mov r1, 44003
    mov r2, r7
    add r1, r1, r2
    mov r8, r1
    mov r2, r8
    load_8 r1, [r2]
    and r1, r1, 255
    mov r7, r1
    mov r1, 40483
    sub r12, r13, 324
    load_32 r2, [r12]
    add r1, r1, r2
    mov r8, r1
    mov r1, r7
    mov r2, r8
    store_8 [r2], r1
    sub r12, r13, 352
    load_32 r1, [r12]
    sub r12, r13, 360
    store_32 [r12], r1
    sub r12, r13, 360
    load_32 r1, [r12]
    sub r12, r13, 356
    store_32 [r12], r1
    jmp __sym_block_11
__sym_block_11:
    sub r12, r13, 244
    load_32 r1, [r12]
    mov r2, 5
    mul r1, r1, r2
    mov r7, r1
    mov r1, r7
    mov r2, 8
    asr r1, r1, r2
    mov r8, r1
    sub r12, r13, 236
    load_32 r1, [r12]
    mov r2, r8
    sub r1, r1, r2
    mov r7, r1
    sub r12, r13, 236
    load_32 r1, [r12]
    mov r2, 5
    mul r1, r1, r2
    mov r8, r1
    mov r1, r8
    mov r2, 8
    asr r1, r1, r2
    mov r9, r1
    mov r1, r9
    sub r12, r13, 244
    load_32 r2, [r12]
    add r1, r1, r2
    mov r8, r1
    mov r1, r7
    mov r2, r7
    mul r1, r1, r2
    mov r9, r1
    mov r1, r8
    mov r2, r8
    mul r1, r1, r2
    mov r10, r1
    mov r1, r10
    mov r2, r9
    add r1, r1, r2
    sub r12, r13, 364
    store_32 [r12], r1
    mov r1, 48
    lsl r1, r1, 16
    sub r12, r13, 364
    load_32 r2, [r12]
    sub r1, r1, r2
    mov r9, r1
    mov r1, r9
    mov r2, 11
    asr r1, r1, r2
    mov r10, r1
    mov r1, r10
    mov r2, r7
    mul r1, r1, r2
    mov r9, r1
    mov r1, r9
    mov r2, 10
    asr r1, r1, r2
    sub r12, r13, 368
    store_32 [r12], r1
    mov r1, r10
    mov r2, r8
    mul r1, r1, r2
    mov r7, r1
    mov r1, r7
    mov r2, 10
    asr r1, r1, r2
    sub r12, r13, 372
    store_32 [r12], r1
    sub r12, r13, 228
    load_32 r1, [r12]
    mov r2, 1
    add r1, r1, r2
    sub r12, r13, 376
    store_32 [r12], r1
    sub r12, r13, 376
    load_32 r1, [r12]
    mov r2, 324
    cmp r1, r2
    je __sym_cmp_yes_63
    mov r1, 0
    jmp __sym_cmp_done_64
__sym_cmp_yes_63:
    mov r1, 1
__sym_cmp_done_64:
    and r1, r1, 1
    mov r7, r1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_65
    sub r12, r13, 356
    load_32 r1, [r12]
    sub r12, r13, 200
    store_32 [r12], r1
    sub r12, r13, 344
    load_32 r1, [r12]
    sub r12, r13, 208
    store_32 [r12], r1
    sub r12, r13, 340
    load_32 r1, [r12]
    sub r12, r13, 216
    store_32 [r12], r1
    sub r12, r13, 336
    load_32 r1, [r12]
    sub r12, r13, 224
    store_32 [r12], r1
    sub r12, r13, 376
    load_32 r1, [r12]
    sub r12, r13, 232
    store_32 [r12], r1
    sub r12, r13, 368
    load_32 r1, [r12]
    sub r12, r13, 240
    store_32 [r12], r1
    sub r12, r13, 372
    load_32 r1, [r12]
    sub r12, r13, 248
    store_32 [r12], r1
    sub r12, r13, 200
    load_32 r1, [r12]
    sub r12, r13, 196
    store_32 [r12], r1
    sub r12, r13, 208
    load_32 r1, [r12]
    sub r12, r13, 204
    store_32 [r12], r1
    sub r12, r13, 216
    load_32 r1, [r12]
    sub r12, r13, 212
    store_32 [r12], r1
    sub r12, r13, 224
    load_32 r1, [r12]
    sub r12, r13, 220
    store_32 [r12], r1
    sub r12, r13, 232
    load_32 r1, [r12]
    sub r12, r13, 228
    store_32 [r12], r1
    sub r12, r13, 240
    load_32 r1, [r12]
    sub r12, r13, 236
    store_32 [r12], r1
    sub r12, r13, 248
    load_32 r1, [r12]
    sub r12, r13, 244
    store_32 [r12], r1
    jmp __sym_block_8
__sym_edge_true_65:
    jmp __sym_block_7
__sym_block_12:
    mov r1, 32768
    sub r12, r13, 52
    load_32 r2, [r12]
    mov r3, 3840
    mul r2, r2, r3
    add r1, r1, r2
    sub r12, r13, 380
    store_32 [r12], r1
    sub r12, r13, 380
    load_32 r1, [r12]
    mov r2, 200
    add r1, r1, r2
    mov r7, r1
    mov r1, r7
    mov r2, 44016
    mov r3, 12
    call __sym_fn_memcpy_29
    mov r1, 0
    sub r12, r13, 436
    store_32 [r12], r1
    mov r1, 0
    sub r12, r13, 444
    store_32 [r12], r1
    mov r1, 0
    sub r12, r13, 452
    store_32 [r12], r1
    sub r12, r13, 436
    load_32 r1, [r12]
    sub r12, r13, 432
    store_32 [r12], r1
    sub r12, r13, 444
    load_32 r1, [r12]
    sub r12, r13, 440
    store_32 [r12], r1
    sub r12, r13, 452
    load_32 r1, [r12]
    sub r12, r13, 448
    store_32 [r12], r1
    jmp __sym_block_17
__sym_block_13:
    sub r12, r13, 384
    load_32 r1, [r12]
    mov r2, 96
    mul r1, r1, r2
    mov r7, r1
    sub r12, r13, 96
    load_32 r1, [r12]
    mov r2, r7
    add r1, r1, r2
    mov r8, r1
    mov r1, r8
    mov r2, 872
    add r1, r1, r2
    mov r7, r1
    sub r12, r13, 384
    load_32 r1, [r12]
    mov r2, 80
    mul r1, r1, r2
    mov r8, r1
    mov r1, 40483
    mov r2, r8
    add r1, r1, r2
    mov r9, r1
    mov r1, r7
    mov r2, r9
    mov r3, 80
    call __sym_fn_memcpy_29
    sub r12, r13, 384
    load_32 r1, [r12]
    mov r2, 1
    add r1, r1, r2
    sub r12, r13, 392
    store_32 [r12], r1
    sub r12, r13, 392
    load_32 r1, [r12]
    mov r2, 22
    cmp r1, r2
    je __sym_cmp_yes_66
    mov r1, 0
    jmp __sym_cmp_done_67
__sym_cmp_yes_66:
    mov r1, 1
__sym_cmp_done_67:
    and r1, r1, 1
    mov r7, r1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_68
    sub r12, r13, 392
    load_32 r1, [r12]
    sub r12, r13, 388
    store_32 [r12], r1
    sub r12, r13, 388
    load_32 r1, [r12]
    sub r12, r13, 384
    store_32 [r12], r1
    jmp __sym_block_13
__sym_edge_true_68:
    jmp __sym_block_12
__sym_block_14:
    sub r12, r13, 380
    load_32 r1, [r12]
    mov r2, 488
    add r1, r1, r2
    mov r7, r1
    mov r1, r7
    mov r2, 44029
    mov r3, 43
    call __sym_fn_memcpy_29
    sub r12, r13, 380
    load_32 r1, [r12]
    mov r2, 493
    add r1, r1, r2
    mov r7, r1
    mov r1, r7
    sub r12, r13, 356
    load_32 r2, [r12]
    call __sym_fn_diagnostic_hex_25
    sub r12, r13, 380
    load_32 r1, [r12]
    mov r2, 506
    add r1, r1, r2
    mov r7, r1
    mov r1, r7
    sub r12, r13, 464
    load_32 r2, [r12]
    call __sym_fn_diagnostic_hex_25
    sub r12, r13, 380
    load_32 r1, [r12]
    mov r2, 523
    add r1, r1, r2
    mov r7, r1
    mov r1, r7
    sub r12, r13, 472
    load_32 r2, [r12]
    call __sym_fn_diagnostic_hex_25
    sub r12, r13, 380
    load_32 r1, [r12]
    mov r2, 584
    add r1, r1, r2
    mov r7, r1
    mov r1, r7
    mov r2, 44073
    mov r3, 32
    call __sym_fn_memcpy_29
    sub r12, r13, 380
    load_32 r1, [r12]
    mov r2, 586
    add r1, r1, r2
    mov r7, r1
    mov r1, r7
    sub r12, r13, 344
    load_32 r2, [r12]
    call __sym_fn_diagnostic_hex_25
    sub r12, r13, 380
    load_32 r1, [r12]
    mov r2, 597
    add r1, r1, r2
    mov r7, r1
    mov r1, r7
    sub r12, r13, 340
    load_32 r2, [r12]
    call __sym_fn_diagnostic_hex_25
    sub r12, r13, 380
    load_32 r1, [r12]
    mov r2, 608
    add r1, r1, r2
    mov r7, r1
    mov r1, r7
    sub r12, r13, 336
    load_32 r2, [r12]
    call __sym_fn_diagnostic_hex_25
    sub r12, r13, 380
    load_32 r1, [r12]
    mov r2, 680
    add r1, r1, r2
    mov r7, r1
    mov r1, r7
    mov r2, 44106
    mov r3, 21
    call __sym_fn_memcpy_29
    sub r12, r13, 380
    load_32 r1, [r12]
    mov r7, r1
    mov r1, 1
    mov r2, r7
    screen r1, r2
    sub r12, r13, 52
    load_32 r1, [r12]
    mov r2, 1
    xor r1, r1, r2
    sub r12, r13, 396
    store_32 [r12], r1
    sub r12, r13, 60
    load_32 r1, [r12]
    mov r2, 1
    add r1, r1, r2
    sub r12, r13, 400
    store_32 [r12], r1
    sub r12, r13, 44
    load_32 r1, [r12]
    mov r2, 5
    mul r1, r1, r2
    mov r7, r1
    mov r1, r7
    mov r2, 7
    asr r1, r1, r2
    mov r8, r1
    sub r12, r13, 36
    load_32 r1, [r12]
    mov r2, r8
    sub r1, r1, r2
    mov r7, r1
    sub r12, r13, 36
    load_32 r1, [r12]
    mov r2, 5
    mul r1, r1, r2
    mov r8, r1
    mov r1, r8
    mov r2, 7
    asr r1, r1, r2
    mov r9, r1
    mov r1, r9
    sub r12, r13, 44
    load_32 r2, [r12]
    add r1, r1, r2
    mov r8, r1
    mov r1, r8
    mov r2, r8
    mul r1, r1, r2
    mov r9, r1
    mov r1, r7
    mov r2, r7
    mul r1, r1, r2
    mov r10, r1
    mov r1, r10
    mov r2, r9
    add r1, r1, r2
    sub r12, r13, 404
    store_32 [r12], r1
    mov r1, 48
    lsl r1, r1, 16
    sub r12, r13, 404
    load_32 r2, [r12]
    sub r1, r1, r2
    mov r9, r1
    mov r1, r9
    mov r2, 11
    asr r1, r1, r2
    mov r10, r1
    mov r1, r10
    mov r2, r7
    mul r1, r1, r2
    mov r9, r1
    mov r1, r9
    mov r2, 10
    asr r1, r1, r2
    sub r12, r13, 408
    store_32 [r12], r1
    mov r1, r10
    mov r2, r8
    mul r1, r1, r2
    mov r7, r1
    mov r1, r7
    mov r2, 10
    asr r1, r1, r2
    sub r12, r13, 412
    store_32 [r12], r1
    sub r12, r13, 28
    load_32 r1, [r12]
    mov r2, 5
    mul r1, r1, r2
    mov r7, r1
    mov r1, r7
    mov r2, 8
    asr r1, r1, r2
    mov r8, r1
    sub r12, r13, 20
    load_32 r1, [r12]
    mov r2, r8
    sub r1, r1, r2
    mov r7, r1
    sub r12, r13, 20
    load_32 r1, [r12]
    mov r2, 5
    mul r1, r1, r2
    mov r8, r1
    mov r1, r8
    mov r2, 8
    asr r1, r1, r2
    mov r9, r1
    mov r1, r9
    sub r12, r13, 28
    load_32 r2, [r12]
    add r1, r1, r2
    mov r8, r1
    mov r1, r8
    mov r2, r8
    mul r1, r1, r2
    mov r9, r1
    mov r1, r7
    mov r2, r7
    mul r1, r1, r2
    mov r10, r1
    mov r1, r10
    mov r2, r9
    add r1, r1, r2
    sub r12, r13, 416
    store_32 [r12], r1
    mov r1, 48
    lsl r1, r1, 16
    sub r12, r13, 416
    load_32 r2, [r12]
    sub r1, r1, r2
    mov r9, r1
    mov r1, r9
    mov r2, 11
    asr r1, r1, r2
    mov r10, r1
    mov r1, r10
    mov r2, r7
    mul r1, r1, r2
    mov r9, r1
    mov r1, r9
    mov r2, 10
    asr r1, r1, r2
    sub r12, r13, 420
    store_32 [r12], r1
    mov r1, r10
    mov r2, r8
    mul r1, r1, r2
    mov r7, r1
    mov r1, r7
    mov r2, 10
    asr r1, r1, r2
    sub r12, r13, 424
    store_32 [r12], r1
    sub r12, r13, 60
    load_32 r1, [r12]
    mov r2, 1
    cmp r1, r2
    je __sym_cmp_yes_69
    mov r1, 0
    jmp __sym_cmp_done_70
__sym_cmp_yes_69:
    mov r1, 1
__sym_cmp_done_70:
    and r1, r1, 1
    mov r7, r1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_71
    jmp __sym_block_15
__sym_edge_true_71:
    jmp __sym_block_24
__sym_block_15:
    keyboard r1
    sub r12, r13, 428
    store_32 [r12], r1
    sub r12, r13, 428
    load_32 r1, [r12]
    mov r2, 0
    cmp r1, r2
    je __sym_cmp_yes_72
    mov r1, 0
    jmp __sym_cmp_done_73
__sym_cmp_yes_72:
    mov r1, 1
__sym_cmp_done_73:
    and r1, r1, 1
    mov r7, r1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_74
    sub r12, r13, 428
    load_32 r1, [r12]
    sub r12, r13, 484
    store_32 [r12], r1
    sub r12, r13, 484
    load_32 r1, [r12]
    sub r12, r13, 480
    store_32 [r12], r1
    jmp __sym_block_20
__sym_edge_true_74:
    jmp __sym_block_16
__sym_block_16:
    sub r12, r13, 420
    load_32 r1, [r12]
    sub r12, r13, 24
    store_32 [r12], r1
    sub r12, r13, 424
    load_32 r1, [r12]
    sub r12, r13, 32
    store_32 [r12], r1
    sub r12, r13, 408
    load_32 r1, [r12]
    sub r12, r13, 40
    store_32 [r12], r1
    sub r12, r13, 412
    load_32 r1, [r12]
    sub r12, r13, 48
    store_32 [r12], r1
    sub r12, r13, 396
    load_32 r1, [r12]
    sub r12, r13, 56
    store_32 [r12], r1
    sub r12, r13, 400
    load_32 r1, [r12]
    sub r12, r13, 64
    store_32 [r12], r1
    sub r12, r13, 24
    load_32 r1, [r12]
    sub r12, r13, 20
    store_32 [r12], r1
    sub r12, r13, 32
    load_32 r1, [r12]
    sub r12, r13, 28
    store_32 [r12], r1
    sub r12, r13, 40
    load_32 r1, [r12]
    sub r12, r13, 36
    store_32 [r12], r1
    sub r12, r13, 48
    load_32 r1, [r12]
    sub r12, r13, 44
    store_32 [r12], r1
    sub r12, r13, 56
    load_32 r1, [r12]
    sub r12, r13, 52
    store_32 [r12], r1
    sub r12, r13, 64
    load_32 r1, [r12]
    sub r12, r13, 60
    store_32 [r12], r1
    jmp __sym_block_4
__sym_block_17:
    mov r1, 40483
    sub r12, r13, 432
    load_32 r2, [r12]
    add r1, r1, r2
    mov r7, r1
    mov r2, r7
    load_8 r1, [r2]
    and r1, r1, 255
    sub r12, r13, 456
    store_32 [r12], r1
    sub r12, r13, 456
    load_32 r1, [r12]
    mov r2, 32
    cmp r1, r2
    je __sym_switch_75
    mov r2, 0
    cmp r1, r2
    je __sym_switch_76
    jmp __sym_block_18
__sym_switch_75:
    sub r12, r13, 440
    load_32 r1, [r12]
    sub r12, r13, 468
    store_32 [r12], r1
    sub r12, r13, 468
    load_32 r1, [r12]
    sub r12, r13, 464
    store_32 [r12], r1
    jmp __sym_block_19
__sym_switch_76:
    sub r12, r13, 440
    load_32 r1, [r12]
    sub r12, r13, 468
    store_32 [r12], r1
    sub r12, r13, 468
    load_32 r1, [r12]
    sub r12, r13, 464
    store_32 [r12], r1
    jmp __sym_block_19
__sym_block_18:
    sub r12, r13, 440
    load_32 r1, [r12]
    mov r2, 1
    add r1, r1, r2
    sub r12, r13, 460
    store_32 [r12], r1
    sub r12, r13, 460
    load_32 r1, [r12]
    sub r12, r13, 468
    store_32 [r12], r1
    sub r12, r13, 468
    load_32 r1, [r12]
    sub r12, r13, 464
    store_32 [r12], r1
    jmp __sym_block_19
__sym_block_19:
    sub r12, r13, 432
    load_32 r1, [r12]
    mov r7, r1
    mov r1, r7
    mov r2, 80
    div r1, r1, r2
    mov r8, r1
    mov r1, r8
    mov r2, 96
    mul r1, r1, r2
    mov r9, r1
    mov r1, r8
    mov r2, 80
    mul r1, r1, r2
    mov r10, r1
    mov r1, r7
    mov r2, r10
    sub r1, r1, r2
    mov r8, r1
    sub r12, r13, 380
    load_32 r1, [r12]
    mov r2, r9
    add r1, r1, r2
    mov r7, r1
    mov r1, r7
    mov r2, 872
    add r1, r1, r2
    mov r9, r1
    mov r1, r9
    mov r2, r8
    add r1, r1, r2
    mov r7, r1
    mov r2, r7
    load_8 r1, [r2]
    and r1, r1, 255
    mov r8, r1
    mov r1, r8
    sub r12, r13, 456
    load_32 r2, [r12]
    cmp r1, r2
    jne __sym_cmp_yes_77
    mov r1, 0
    jmp __sym_cmp_done_78
__sym_cmp_yes_77:
    mov r1, 1
__sym_cmp_done_78:
    and r1, r1, 1
    mov r7, r1
    mov r1, r7
    mov r8, r1
    sub r12, r13, 448
    load_32 r1, [r12]
    mov r2, r8
    add r1, r1, r2
    sub r12, r13, 472
    store_32 [r12], r1
    sub r12, r13, 432
    load_32 r1, [r12]
    mov r2, 1
    add r1, r1, r2
    sub r12, r13, 476
    store_32 [r12], r1
    sub r12, r13, 476
    load_32 r1, [r12]
    mov r2, 1760
    cmp r1, r2
    je __sym_cmp_yes_79
    mov r1, 0
    jmp __sym_cmp_done_80
__sym_cmp_yes_79:
    mov r1, 1
__sym_cmp_done_80:
    and r1, r1, 1
    mov r7, r1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_81
    sub r12, r13, 476
    load_32 r1, [r12]
    sub r12, r13, 436
    store_32 [r12], r1
    sub r12, r13, 464
    load_32 r1, [r12]
    sub r12, r13, 444
    store_32 [r12], r1
    sub r12, r13, 472
    load_32 r1, [r12]
    sub r12, r13, 452
    store_32 [r12], r1
    sub r12, r13, 436
    load_32 r1, [r12]
    sub r12, r13, 432
    store_32 [r12], r1
    sub r12, r13, 444
    load_32 r1, [r12]
    sub r12, r13, 440
    store_32 [r12], r1
    sub r12, r13, 452
    load_32 r1, [r12]
    sub r12, r13, 448
    store_32 [r12], r1
    jmp __sym_block_17
__sym_edge_true_81:
    jmp __sym_block_14
__sym_block_20:
    sub r12, r13, 480
    load_32 r1, [r12]
    mov r2, 256
    and r1, r1, r2
    mov r7, r1
    mov r1, r7
    mov r2, 0
    cmp r1, r2
    je __sym_cmp_yes_82
    mov r1, 0
    jmp __sym_cmp_done_83
__sym_cmp_yes_82:
    mov r1, 1
__sym_cmp_done_83:
    and r1, r1, 1
    mov r8, r1
    mov r1, r8
    cmp r1, 0
    jne __sym_edge_true_84
    jmp __sym_block_21
__sym_edge_true_84:
    jmp __sym_block_22
__sym_block_21:
    sub r12, r13, 480
    load_32 r1, [r12]
    mov r2, 255
    and r1, r1, r2
    mov r7, r1
    sub r12, r13, 480
    load_32 r1, [r12]
    mov r2, 223
    and r1, r1, r2
    mov r8, r1
    mov r1, r8
    mov r2, 81
    cmp r1, r2
    je __sym_cmp_yes_85
    mov r1, 0
    jmp __sym_cmp_done_86
__sym_cmp_yes_85:
    mov r1, 1
__sym_cmp_done_86:
    and r1, r1, 1
    mov r9, r1
    mov r1, r7
    mov r2, 27
    cmp r1, r2
    je __sym_cmp_yes_87
    mov r1, 0
    jmp __sym_cmp_done_88
__sym_cmp_yes_87:
    mov r1, 1
__sym_cmp_done_88:
    and r1, r1, 1
    mov r8, r1
    mov r1, r9
    mov r2, r8
    or r1, r1, r2
    and r1, r1, 1
    mov r7, r1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_89
    jmp __sym_block_22
__sym_edge_true_89:
    jmp __sym_block_23
__sym_block_22:
    keyboard r1
    sub r12, r13, 488
    store_32 [r12], r1
    sub r12, r13, 488
    load_32 r1, [r12]
    mov r2, 0
    cmp r1, r2
    je __sym_cmp_yes_90
    mov r1, 0
    jmp __sym_cmp_done_91
__sym_cmp_yes_90:
    mov r1, 1
__sym_cmp_done_91:
    and r1, r1, 1
    mov r7, r1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_92
    sub r12, r13, 488
    load_32 r1, [r12]
    sub r12, r13, 484
    store_32 [r12], r1
    sub r12, r13, 484
    load_32 r1, [r12]
    sub r12, r13, 480
    store_32 [r12], r1
    jmp __sym_block_20
__sym_edge_true_92:
    jmp __sym_block_16
__sym_block_23:
    jmp __sym_block_24
__sym_block_24:
    mov r1, 0
    mov sp, r13
    pop r13
    ret

; function diagnostic_hex, frame 24 bytes
__sym_fn_diagnostic_hex_25:
    push r13
    mov r13, sp
    sub sp, sp, 24
    sub r12, r13, 4
    store_32 [r12], r1
    sub r12, r13, 8
    store_32 [r12], r2
__sym_block_26:
    mov r1, 0
    sub r12, r13, 16
    store_32 [r12], r1
    sub r12, r13, 16
    load_32 r1, [r12]
    sub r12, r13, 12
    store_32 [r12], r1
    jmp __sym_block_28
__sym_block_27:
    mov r1, 0
    mov sp, r13
    pop r13
    ret
__sym_block_28:
    sub r12, r13, 12
    load_32 r1, [r12]
    mov r2, 2
    lsl r1, r1, r2
    mov r7, r1
    mov r1, 28
    mov r2, r7
    sub r1, r1, r2
    mov r8, r1
    sub r12, r13, 8
    load_32 r1, [r12]
    mov r2, r8
    lsr r1, r1, r2
    mov r7, r1
    mov r1, r7
    mov r2, 15
    and r1, r1, r2
    mov r8, r1
    mov r1, r8
    mov r2, 10
    cmp r1, r2
    jb __sym_cmp_yes_93
    mov r1, 0
    jmp __sym_cmp_done_94
__sym_cmp_yes_93:
    mov r1, 1
__sym_cmp_done_94:
    and r1, r1, 1
    mov r7, r1
    mov r1, r8
    mov r2, 48
    or r1, r1, r2
    mov r9, r1
    mov r1, r8
    mov r2, 55
    add r1, r1, r2
    mov r10, r1
    mov r1, r7
    cmp r1, 0
    jne __sym_select_yes_95
    mov r1, r10
    jmp __sym_select_done_96
__sym_select_yes_95:
    mov r1, r9
__sym_select_done_96:
    mov r8, r1
    mov r1, r8
    and r1, r1, 255
    mov r7, r1
    sub r12, r13, 4
    load_32 r1, [r12]
    sub r12, r13, 12
    load_32 r2, [r12]
    add r1, r1, r2
    mov r8, r1
    mov r1, r7
    mov r2, r8
    store_8 [r2], r1
    sub r12, r13, 12
    load_32 r1, [r12]
    mov r2, 1
    add r1, r1, r2
    sub r12, r13, 20
    store_32 [r12], r1
    sub r12, r13, 20
    load_32 r1, [r12]
    mov r2, 8
    cmp r1, r2
    je __sym_cmp_yes_97
    mov r1, 0
    jmp __sym_cmp_done_98
__sym_cmp_yes_97:
    mov r1, 1
__sym_cmp_done_98:
    and r1, r1, 1
    mov r7, r1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_99
    sub r12, r13, 20
    load_32 r1, [r12]
    sub r12, r13, 16
    store_32 [r12], r1
    sub r12, r13, 16
    load_32 r1, [r12]
    sub r12, r13, 12
    store_32 [r12], r1
    jmp __sym_block_28
__sym_edge_true_99:
    jmp __sym_block_27

; function memcpy, frame 24 bytes
__sym_fn_memcpy_29:
    push r13
    mov r13, sp
    sub sp, sp, 24
    sub r12, r13, 4
    store_32 [r12], r1
    sub r12, r13, 8
    store_32 [r12], r2
    sub r12, r13, 12
    store_32 [r12], r3
__sym_block_30:
    sub r12, r13, 12
    load_32 r1, [r12]
    mov r2, 0
    cmp r1, r2
    je __sym_cmp_yes_100
    mov r1, 0
    jmp __sym_cmp_done_101
__sym_cmp_yes_100:
    mov r1, 1
__sym_cmp_done_101:
    and r1, r1, 1
    mov r7, r1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_102
    mov r1, 0
    sub r12, r13, 20
    store_32 [r12], r1
    sub r12, r13, 20
    load_32 r1, [r12]
    sub r12, r13, 16
    store_32 [r12], r1
    jmp __sym_block_32
__sym_edge_true_102:
    jmp __sym_block_31
__sym_block_31:
    sub r12, r13, 4
    load_32 r1, [r12]
    mov sp, r13
    pop r13
    ret
__sym_block_32:
    sub r12, r13, 8
    load_32 r1, [r12]
    sub r12, r13, 16
    load_32 r2, [r12]
    add r1, r1, r2
    mov r7, r1
    mov r2, r7
    load_8 r1, [r2]
    and r1, r1, 255
    mov r8, r1
    sub r12, r13, 4
    load_32 r1, [r12]
    sub r12, r13, 16
    load_32 r2, [r12]
    add r1, r1, r2
    mov r7, r1
    mov r1, r8
    mov r2, r7
    store_8 [r2], r1
    sub r12, r13, 16
    load_32 r1, [r12]
    mov r2, 1
    add r1, r1, r2
    sub r12, r13, 24
    store_32 [r12], r1
    sub r12, r13, 24
    load_32 r1, [r12]
    sub r12, r13, 12
    load_32 r2, [r12]
    cmp r1, r2
    je __sym_cmp_yes_103
    mov r1, 0
    jmp __sym_cmp_done_104
__sym_cmp_yes_103:
    mov r1, 1
__sym_cmp_done_104:
    and r1, r1, 1
    mov r7, r1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_105
    sub r12, r13, 24
    load_32 r1, [r12]
    sub r12, r13, 20
    store_32 [r12], r1
    sub r12, r13, 20
    load_32 r1, [r12]
    sub r12, r13, 16
    store_32 [r12], r1
    jmp __sym_block_32
__sym_edge_true_105:
    jmp __sym_block_31

; function memset, frame 32 bytes
__sym_fn_memset_33:
    push r13
    mov r13, sp
    sub sp, sp, 32
    sub r12, r13, 4
    store_32 [r12], r1
    sub r12, r13, 8
    store_32 [r12], r2
    sub r12, r13, 12
    store_32 [r12], r3
__sym_block_34:
    sub r12, r13, 12
    load_32 r1, [r12]
    mov r2, 0
    cmp r1, r2
    je __sym_cmp_yes_106
    mov r1, 0
    jmp __sym_cmp_done_107
__sym_cmp_yes_106:
    mov r1, 1
__sym_cmp_done_107:
    and r1, r1, 1
    mov r7, r1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_108
    jmp __sym_block_35
__sym_edge_true_108:
    jmp __sym_block_36
__sym_block_35:
    sub r12, r13, 8
    load_32 r1, [r12]
    and r1, r1, 255
    sub r12, r13, 16
    store_32 [r12], r1
    mov r1, 0
    sub r12, r13, 24
    store_32 [r12], r1
    sub r12, r13, 24
    load_32 r1, [r12]
    sub r12, r13, 20
    store_32 [r12], r1
    jmp __sym_block_37
__sym_block_36:
    sub r12, r13, 4
    load_32 r1, [r12]
    mov sp, r13
    pop r13
    ret
__sym_block_37:
    sub r12, r13, 4
    load_32 r1, [r12]
    sub r12, r13, 20
    load_32 r2, [r12]
    add r1, r1, r2
    mov r7, r1
    sub r12, r13, 16
    load_32 r1, [r12]
    mov r2, r7
    store_8 [r2], r1
    sub r12, r13, 20
    load_32 r1, [r12]
    mov r2, 1
    add r1, r1, r2
    sub r12, r13, 28
    store_32 [r12], r1
    sub r12, r13, 28
    load_32 r1, [r12]
    sub r12, r13, 12
    load_32 r2, [r12]
    cmp r1, r2
    je __sym_cmp_yes_109
    mov r1, 0
    jmp __sym_cmp_done_110
__sym_cmp_yes_109:
    mov r1, 1
__sym_cmp_done_110:
    and r1, r1, 1
    mov r7, r1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_111
    sub r12, r13, 28
    load_32 r1, [r12]
    sub r12, r13, 24
    store_32 [r12], r1
    sub r12, r13, 24
    load_32 r1, [r12]
    sub r12, r13, 20
    store_32 [r12], r1
    jmp __sym_block_37
__sym_edge_true_111:
    jmp __sym_block_36

; Global addresses (zero tail uses initially zeroed RAM).
; framebuffer = 32768
; .str = 40448
; .str.1 = 40461
; b = 40483
; z = 42243
; .str.2 = 44003
; .str.3 = 44016
; .str.4 = 44029
; .str.5 = 44073
; .str.6 = 44106
@32768
@40448
U8 82
U8 101
U8 110
U8 100
U8 101
U8 114
U8 105
U8 110
U8 103
U8 46
U8 46
U8 46
U8 0
U8 102
U8 114
U8 97
U8 109
U8 101
U8 32
U8 48
U8 48
U8 32
U8 114
U8 105
U8 110
U8 103
U8 32
U8 48
U8 48
U8 32
U8 47
U8 32
U8 57
U8 48
@44003
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
U8 0
U8 70
U8 114
U8 97
U8 109
U8 101
U8 32
U8 114
U8 101
U8 97
U8 100
U8 121
U8 46
U8 0
U8 104
U8 105
U8 116
U8 115
U8 61
U8 48
U8 48
U8 48
U8 48
U8 48
U8 48
U8 48
U8 48
U8 32
U8 105
U8 110
U8 107
U8 61
U8 48
U8 48
U8 48
U8 48
U8 48
U8 48
U8 48
U8 48
U8 32
U8 99
U8 111
U8 112
U8 121
U8 101
U8 114
U8 114
U8 61
U8 48
U8 48
U8 48
U8 48
U8 48
U8 48
U8 48
U8 48
U8 0
U8 120
U8 61
U8 48
U8 48
U8 48
U8 48
U8 48
U8 48
U8 48
U8 48
U8 32
U8 121
U8 61
U8 48
U8 48
U8 48
U8 48
U8 48
U8 48
U8 48
U8 48
U8 32
U8 78
U8 61
U8 48
U8 48
U8 48
U8 48
U8 48
U8 48
U8 48
U8 48
U8 0
U8 112
U8 97
U8 108
U8 101
U8 116
U8 116
U8 101
U8 58
U8 32
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
