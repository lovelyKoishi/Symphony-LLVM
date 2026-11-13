; Symphony LLVM backend 0.1. Big endian, 32-bit values/pointers.
__sym_start:
    mov sp, 1
    lsl sp, sp, 16
    call __sym_fn_main_0
__sym_halt:
    jmp __sym_halt
__sym_trap:
    jmp __sym_trap

; function main, frame 120 bytes
__sym_fn_main_0:
    push r13
    mov r13, sp
    sub sp, sp, 120
__sym_block_1:
    mov r1, 32968
    mov r2, 40448
    mov r3, 22
    call __sym_fn_memcpy_11
    mov r1, 33160
    mov r2, 40471
    mov r3, 12
    call __sym_fn_memcpy_11
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
    mov r1, 1
    mov r2, 32768
    screen r1, r2
    mov r1, 40484
    mov r2, 32
    mov r3, 1760
    call __sym_fn_memset_15
    mov r1, 42244
    mov r2, 127
    mov r3, 1760
    call __sym_fn_memset_15
    mov r1, 0
    sub r12, r13, 8
    store_32 [r12], r1
    mov r1, 1024
    sub r12, r13, 16
    store_32 [r12], r1
    mov r1, 0
    sub r12, r13, 24
    store_32 [r12], r1
    sub r12, r13, 8
    load_32 r1, [r12]
    sub r12, r13, 4
    store_32 [r12], r1
    sub r12, r13, 16
    load_32 r1, [r12]
    sub r12, r13, 12
    store_32 [r12], r1
    sub r12, r13, 24
    load_32 r1, [r12]
    sub r12, r13, 20
    store_32 [r12], r1
    jmp __sym_block_3
__sym_block_2:
    mov r1, 56
    mov r2, 33165
    store_8 [r2], r1
    mov r1, 57
    mov r2, 33166
    store_8 [r2], r1
    mov r1, 0
    sub r12, r13, 116
    store_32 [r12], r1
    sub r12, r13, 116
    load_32 r1, [r12]
    sub r12, r13, 112
    store_32 [r12], r1
    jmp __sym_block_10
__sym_block_3:
    sub r12, r13, 12
    load_32 r1, [r12]
    mov r2, 2048
    add r1, r1, r2
    sub r12, r13, 28
    store_32 [r12], r1
    sub r12, r13, 4
    load_32 r1, [r12]
    mov r2, 10
    lsl r1, r1, r2
    mov r7, r1
    mov r1, r7
    mov r2, 80
    lsl r2, r2, 16
    add r1, r1, r2
    sub r12, r13, 32
    store_32 [r12], r1
    sub r12, r13, 4
    load_32 r1, [r12]
    mov r2, 5
    lsr r1, r1, r2
    mov r7, r1
    mov r1, r7
    and r1, r1, 255
    sub r12, r13, 36
    store_32 [r12], r1
    mov r1, r7
    mov r2, 24
    lsl r1, r1, r2
    mov r8, r1
    mov r1, r8
    mov r2, 24
    asr r1, r1, r2
    sub r12, r13, 40
    store_32 [r12], r1
    mov r1, 0
    sub r12, r13, 64
    store_32 [r12], r1
    mov r1, 1024
    sub r12, r13, 72
    store_32 [r12], r1
    mov r1, 0
    sub r12, r13, 80
    store_32 [r12], r1
    sub r12, r13, 64
    load_32 r1, [r12]
    sub r12, r13, 60
    store_32 [r12], r1
    sub r12, r13, 72
    load_32 r1, [r12]
    sub r12, r13, 68
    store_32 [r12], r1
    sub r12, r13, 80
    load_32 r1, [r12]
    sub r12, r13, 76
    store_32 [r12], r1
    jmp __sym_block_5
__sym_block_4:
    sub r12, r13, 4
    load_32 r1, [r12]
    mov r2, 9
    mul r1, r1, r2
    mov r7, r1
    mov r1, r7
    mov r2, 7
    asr r1, r1, r2
    mov r8, r1
    sub r12, r13, 12
    load_32 r1, [r12]
    mov r2, r8
    sub r1, r1, r2
    mov r7, r1
    sub r12, r13, 12
    load_32 r1, [r12]
    mov r2, 9
    mul r1, r1, r2
    mov r8, r1
    mov r1, r8
    mov r2, 7
    asr r1, r1, r2
    mov r9, r1
    mov r1, r9
    sub r12, r13, 4
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
    sub r12, r13, 44
    store_32 [r12], r1
    mov r1, 48
    lsl r1, r1, 16
    sub r12, r13, 44
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
    sub r12, r13, 48
    store_32 [r12], r1
    mov r1, r10
    mov r2, r8
    mul r1, r1, r2
    mov r7, r1
    mov r1, r7
    mov r2, 10
    asr r1, r1, r2
    sub r12, r13, 52
    store_32 [r12], r1
    sub r12, r13, 20
    load_32 r1, [r12]
    mov r2, 1
    add r1, r1, r2
    sub r12, r13, 56
    store_32 [r12], r1
    sub r12, r13, 56
    load_32 r1, [r12]
    mov r2, 90
    cmp r1, r2
    je __sym_cmp_yes_20
    mov r1, 0
    jmp __sym_cmp_done_21
__sym_cmp_yes_20:
    mov r1, 1
__sym_cmp_done_21:
    and r1, r1, 1
    mov r7, r1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_22
    sub r12, r13, 52
    load_32 r1, [r12]
    sub r12, r13, 8
    store_32 [r12], r1
    sub r12, r13, 48
    load_32 r1, [r12]
    sub r12, r13, 16
    store_32 [r12], r1
    sub r12, r13, 56
    load_32 r1, [r12]
    sub r12, r13, 24
    store_32 [r12], r1
    sub r12, r13, 8
    load_32 r1, [r12]
    sub r12, r13, 4
    store_32 [r12], r1
    sub r12, r13, 16
    load_32 r1, [r12]
    sub r12, r13, 12
    store_32 [r12], r1
    sub r12, r13, 24
    load_32 r1, [r12]
    sub r12, r13, 20
    store_32 [r12], r1
    jmp __sym_block_3
__sym_edge_true_22:
    jmp __sym_block_2
__sym_block_5:
    sub r12, r13, 68
    load_32 r1, [r12]
    sub r12, r13, 28
    load_32 r2, [r12]
    mul r1, r1, r2
    mov r7, r1
    sub r12, r13, 60
    load_32 r1, [r12]
    sub r12, r13, 28
    load_32 r2, [r12]
    mul r1, r1, r2
    mov r8, r1
    mov r1, r8
    mov r2, 65535
    lsl r2, r2, 16
    or r2, r2, 64512
    and r1, r1, r2
    mov r9, r1
    mov r1, r9
    mov r2, 30
    mul r1, r1, r2
    mov r8, r1
    mov r1, r8
    sub r12, r13, 32
    load_32 r2, [r12]
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
    mov r9, r1
    mov r1, r7
    mov r2, 65535
    lsl r2, r2, 16
    or r2, r2, 64512
    and r1, r1, r2
    mov r8, r1
    mov r1, r8
    mov r2, 15
    mul r1, r1, r2
    mov r7, r1
    mov r1, r7
    sub r12, r13, 32
    load_32 r2, [r12]
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
    mov r8, r1
    sub r12, r13, 12
    load_32 r1, [r12]
    sub r12, r13, 68
    load_32 r2, [r12]
    mul r1, r1, r2
    mov r7, r1
    mov r1, 0
    mov r2, r7
    sub r1, r1, r2
    mov r10, r1
    mov r1, r10
    mov r2, 10
    asr r1, r1, r2
    mov r7, r1
    mov r1, r7
    sub r12, r13, 4
    load_32 r2, [r12]
    sub r1, r1, r2
    mov r10, r1
    mov r1, r10
    mov r2, 7
    asr r1, r1, r2
    sub r12, r13, 84
    store_32 [r12], r1
    mov r1, r8
    mov r2, 80
    mul r1, r1, r2
    mov r7, r1
    mov r1, r9
    mov r2, 1000
    add r1, r1, r2
    mov r10, r1
    mov r1, r10
    mov r2, r7
    add r1, r1, r2
    sub r12, r13, 88
    store_32 [r12], r1
    mov r1, r8
    mov r2, 11
    add r1, r1, r2
    mov r7, r1
    mov r1, r7
    mov r2, 21
    cmp r1, r2
    jb __sym_cmp_yes_23
    mov r1, 0
    jmp __sym_cmp_done_24
__sym_cmp_yes_23:
    mov r1, 1
__sym_cmp_done_24:
    and r1, r1, 1
    mov r8, r1
    mov r1, r9
    mov r2, 39
    add r1, r1, r2
    mov r7, r1
    mov r1, r7
    mov r2, 79
    cmp r1, r2
    jb __sym_cmp_yes_25
    mov r1, 0
    jmp __sym_cmp_done_26
__sym_cmp_yes_25:
    mov r1, 1
__sym_cmp_done_26:
    and r1, r1, 1
    mov r9, r1
    mov r1, r8
    cmp r1, 0
    jne __sym_select_yes_27
    mov r1, 0
    jmp __sym_select_done_28
__sym_select_yes_27:
    mov r1, r9
__sym_select_done_28:
    and r1, r1, 1
    mov r7, r1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_29
    jmp __sym_block_8
__sym_edge_true_29:
    jmp __sym_block_6
__sym_block_6:
    mov r1, 42244
    sub r12, r13, 88
    load_32 r2, [r12]
    add r1, r1, r2
    sub r12, r13, 92
    store_32 [r12], r1
    sub r12, r13, 92
    load_32 r2, [r12]
    load_8 r1, [r2]
    and r1, r1, 255
    mov r7, r1
    mov r1, r7
    lsl r1, r1, 24
    asr r1, r1, 24
    mov r8, r1
    sub r12, r13, 40
    load_32 r1, [r12]
    mov r2, r8
    cmp r1, r2
    jl __sym_cmp_yes_30
    mov r1, 0
    jmp __sym_cmp_done_31
__sym_cmp_yes_30:
    mov r1, 1
__sym_cmp_done_31:
    and r1, r1, 1
    mov r7, r1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_32
    jmp __sym_block_8
__sym_edge_true_32:
    jmp __sym_block_7
__sym_block_7:
    sub r12, r13, 36
    load_32 r1, [r12]
    sub r12, r13, 92
    load_32 r2, [r12]
    store_8 [r2], r1
    sub r12, r13, 84
    load_32 r1, [r12]
    mov r2, 0
    cmp r1, r2
    jge __sym_minmax_33
    mov r1, r2
__sym_minmax_33:
    mov r7, r1
    mov r1, 44004
    mov r2, r7
    add r1, r1, r2
    mov r8, r1
    mov r2, r8
    load_8 r1, [r2]
    and r1, r1, 255
    mov r7, r1
    mov r1, 40484
    sub r12, r13, 88
    load_32 r2, [r12]
    add r1, r1, r2
    mov r8, r1
    mov r1, r7
    mov r2, r8
    store_8 [r2], r1
    jmp __sym_block_8
__sym_block_8:
    sub r12, r13, 60
    load_32 r1, [r12]
    mov r2, 5
    mul r1, r1, r2
    mov r7, r1
    mov r1, r7
    mov r2, 8
    asr r1, r1, r2
    mov r8, r1
    sub r12, r13, 68
    load_32 r1, [r12]
    mov r2, r8
    sub r1, r1, r2
    mov r7, r1
    sub r12, r13, 68
    load_32 r1, [r12]
    mov r2, 5
    mul r1, r1, r2
    mov r8, r1
    mov r1, r8
    mov r2, 8
    asr r1, r1, r2
    mov r9, r1
    mov r1, r9
    sub r12, r13, 60
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
    sub r12, r13, 96
    store_32 [r12], r1
    mov r1, 48
    lsl r1, r1, 16
    sub r12, r13, 96
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
    sub r12, r13, 100
    store_32 [r12], r1
    mov r1, r10
    mov r2, r8
    mul r1, r1, r2
    mov r7, r1
    mov r1, r7
    mov r2, 10
    asr r1, r1, r2
    sub r12, r13, 104
    store_32 [r12], r1
    sub r12, r13, 76
    load_32 r1, [r12]
    mov r2, 1
    add r1, r1, r2
    sub r12, r13, 108
    store_32 [r12], r1
    sub r12, r13, 108
    load_32 r1, [r12]
    mov r2, 324
    cmp r1, r2
    je __sym_cmp_yes_34
    mov r1, 0
    jmp __sym_cmp_done_35
__sym_cmp_yes_34:
    mov r1, 1
__sym_cmp_done_35:
    and r1, r1, 1
    mov r7, r1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_36
    sub r12, r13, 104
    load_32 r1, [r12]
    sub r12, r13, 64
    store_32 [r12], r1
    sub r12, r13, 100
    load_32 r1, [r12]
    sub r12, r13, 72
    store_32 [r12], r1
    sub r12, r13, 108
    load_32 r1, [r12]
    sub r12, r13, 80
    store_32 [r12], r1
    sub r12, r13, 64
    load_32 r1, [r12]
    sub r12, r13, 60
    store_32 [r12], r1
    sub r12, r13, 72
    load_32 r1, [r12]
    sub r12, r13, 68
    store_32 [r12], r1
    sub r12, r13, 80
    load_32 r1, [r12]
    sub r12, r13, 76
    store_32 [r12], r1
    jmp __sym_block_5
__sym_edge_true_36:
    jmp __sym_block_4
__sym_block_9:
    mov r1, 36808
    mov r2, 44017
    mov r3, 14
    call __sym_fn_memcpy_11
    mov r1, 1
    mov r2, 36608
    screen r1, r2
    mov r1, 0
    mov sp, r13
    pop r13
    ret
__sym_block_10:
    sub r12, r13, 112
    load_32 r1, [r12]
    mov r2, 96
    mul r1, r1, r2
    mov r7, r1
    mov r1, 36608
    mov r2, r7
    add r1, r1, r2
    mov r8, r1
    mov r1, r8
    mov r2, 872
    add r1, r1, r2
    mov r7, r1
    sub r12, r13, 112
    load_32 r1, [r12]
    mov r2, 80
    mul r1, r1, r2
    mov r8, r1
    mov r1, 40484
    mov r2, r8
    add r1, r1, r2
    mov r9, r1
    mov r1, r7
    mov r2, r9
    mov r3, 80
    call __sym_fn_memcpy_11
    sub r12, r13, 112
    load_32 r1, [r12]
    mov r2, 1
    add r1, r1, r2
    sub r12, r13, 120
    store_32 [r12], r1
    sub r12, r13, 120
    load_32 r1, [r12]
    mov r2, 22
    cmp r1, r2
    je __sym_cmp_yes_37
    mov r1, 0
    jmp __sym_cmp_done_38
__sym_cmp_yes_37:
    mov r1, 1
__sym_cmp_done_38:
    and r1, r1, 1
    mov r7, r1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_39
    sub r12, r13, 120
    load_32 r1, [r12]
    sub r12, r13, 116
    store_32 [r12], r1
    sub r12, r13, 116
    load_32 r1, [r12]
    sub r12, r13, 112
    store_32 [r12], r1
    jmp __sym_block_10
__sym_edge_true_39:
    jmp __sym_block_9

; function memcpy, frame 24 bytes
__sym_fn_memcpy_11:
    push r13
    mov r13, sp
    sub sp, sp, 24
    sub r12, r13, 4
    store_32 [r12], r1
    sub r12, r13, 8
    store_32 [r12], r2
    sub r12, r13, 12
    store_32 [r12], r3
__sym_block_12:
    sub r12, r13, 12
    load_32 r1, [r12]
    mov r2, 0
    cmp r1, r2
    je __sym_cmp_yes_40
    mov r1, 0
    jmp __sym_cmp_done_41
__sym_cmp_yes_40:
    mov r1, 1
__sym_cmp_done_41:
    and r1, r1, 1
    mov r7, r1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_42
    mov r1, 0
    sub r12, r13, 20
    store_32 [r12], r1
    sub r12, r13, 20
    load_32 r1, [r12]
    sub r12, r13, 16
    store_32 [r12], r1
    jmp __sym_block_14
__sym_edge_true_42:
    jmp __sym_block_13
__sym_block_13:
    sub r12, r13, 4
    load_32 r1, [r12]
    mov sp, r13
    pop r13
    ret
__sym_block_14:
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
    je __sym_cmp_yes_43
    mov r1, 0
    jmp __sym_cmp_done_44
__sym_cmp_yes_43:
    mov r1, 1
__sym_cmp_done_44:
    and r1, r1, 1
    mov r7, r1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_45
    sub r12, r13, 24
    load_32 r1, [r12]
    sub r12, r13, 20
    store_32 [r12], r1
    sub r12, r13, 20
    load_32 r1, [r12]
    sub r12, r13, 16
    store_32 [r12], r1
    jmp __sym_block_14
__sym_edge_true_45:
    jmp __sym_block_13

; function memset, frame 32 bytes
__sym_fn_memset_15:
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
    je __sym_cmp_yes_46
    mov r1, 0
    jmp __sym_cmp_done_47
__sym_cmp_yes_46:
    mov r1, 1
__sym_cmp_done_47:
    and r1, r1, 1
    mov r7, r1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_48
    jmp __sym_block_17
__sym_edge_true_48:
    jmp __sym_block_18
__sym_block_17:
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
    jmp __sym_block_19
__sym_block_18:
    sub r12, r13, 4
    load_32 r1, [r12]
    mov sp, r13
    pop r13
    ret
__sym_block_19:
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
    je __sym_cmp_yes_49
    mov r1, 0
    jmp __sym_cmp_done_50
__sym_cmp_yes_49:
    mov r1, 1
__sym_cmp_done_50:
    and r1, r1, 1
    mov r7, r1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_51
    sub r12, r13, 28
    load_32 r1, [r12]
    sub r12, r13, 24
    store_32 [r12], r1
    sub r12, r13, 24
    load_32 r1, [r12]
    sub r12, r13, 20
    store_32 [r12], r1
    jmp __sym_block_19
__sym_edge_true_51:
    jmp __sym_block_18

; Global addresses (zero tail uses initially zeroed RAM).
; framebuffer = 32768
; .str = 40448
; .str.1 = 40471
; b = 40484
; z = 42244
; .str.2 = 44004
; .str.3 = 44017
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
U8 32
U8 111
U8 110
U8 101
U8 32
U8 102
U8 114
U8 97
U8 109
U8 101
U8 46
U8 46
U8 46
U8 0
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
@44004
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
U8 49
U8 32
U8 114
U8 101
U8 97
U8 100
U8 121
U8 46
