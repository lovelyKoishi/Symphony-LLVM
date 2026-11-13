; Symphony LLVM backend 0.1. Big endian, 32-bit values/pointers.
__sym_start:
    mov sp, 256
    lsl sp, sp, 16
    call __sym_fn_main_0
__sym_halt:
    jmp __sym_halt
__sym_trap:
    jmp __sym_trap

; function main, frame 144 bytes
__sym_fn_main_0:
    push r13
    mov r13, sp
    sub sp, sp, 144
__sym_block_1:
    mov r1, 0
    mov r2, 0
    screen r1, r2
    mov r1, 1
    mov r2, 1
    lsl r2, r2, 16
    screen r1, r2
    mov r1, 2
    mov r2, 255
    lsl r2, r2, 16
    or r2, r2, 65535
    screen r1, r2
    mov r1, 3
    mov r2, 0
    screen r1, r2
    mov r1, 0
    sub r12, r13, 8
    store_32 [r12], r1
    sub r12, r13, 8
    load_32 r1, [r12]
    sub r12, r13, 4
    store_32 [r12], r1
    jmp __sym_block_2
__sym_block_2:
    jmp __sym_block_3
__sym_block_3:
    keyboard r1
    sub r12, r13, 12
    store_32 [r12], r1
    sub r12, r13, 12
    load_32 r1, [r12]
    mov r2, 256
    and r1, r1, r2
    sub r12, r13, 16
    store_32 [r12], r1
    sub r12, r13, 16
    load_32 r1, [r12]
    mov r2, 0
    cmp r1, r2
    je __sym_cmp_yes_16
    mov r1, 0
    jmp __sym_cmp_done_17
__sym_cmp_yes_16:
    mov r1, 1
__sym_cmp_done_17:
    and r1, r1, 1
    sub r12, r13, 20
    store_32 [r12], r1
    sub r12, r13, 20
    load_32 r1, [r12]
    cmp r1, 0
    jne __sym_edge_true_18
    jmp __sym_block_4
__sym_edge_true_18:
    jmp __sym_block_10
__sym_block_4:
    sub r12, r13, 12
    load_32 r1, [r12]
    and r1, r1, 255
    sub r12, r13, 24
    store_32 [r12], r1
    sub r12, r13, 24
    load_32 r1, [r12]
    mov r2, 13
    cmp r1, r2
    je __sym_switch_19
    mov r2, 10
    cmp r1, r2
    je __sym_switch_20
    jmp __sym_block_9
__sym_switch_19:
    jmp __sym_block_5
__sym_switch_20:
    jmp __sym_block_8
__sym_block_5:
    sub r12, r13, 4
    load_32 r1, [r12]
    mov r2, 0
    cmp r1, r2
    je __sym_cmp_yes_21
    mov r1, 0
    jmp __sym_cmp_done_22
__sym_cmp_yes_21:
    mov r1, 1
__sym_cmp_done_22:
    and r1, r1, 1
    sub r12, r13, 28
    store_32 [r12], r1
    sub r12, r13, 28
    load_32 r1, [r12]
    cmp r1, 0
    jne __sym_edge_true_23
    jmp __sym_block_7
__sym_edge_true_23:
    mov r1, 0
    sub r12, r13, 36
    store_32 [r12], r1
    sub r12, r13, 36
    load_32 r1, [r12]
    sub r12, r13, 32
    store_32 [r12], r1
    jmp __sym_block_6
__sym_block_6:
    sub r12, r13, 32
    load_32 r1, [r12]
    sub r12, r13, 8
    store_32 [r12], r1
    sub r12, r13, 8
    load_32 r1, [r12]
    sub r12, r13, 4
    store_32 [r12], r1
    jmp __sym_block_2
__sym_block_7:
    sub r12, r13, 4
    load_32 r1, [r12]
    mov r2, 65535
    lsl r2, r2, 16
    or r2, r2, 65535
    add r1, r1, r2
    sub r12, r13, 40
    store_32 [r12], r1
    mov r1, 1
    lsl r1, r1, 16
    sub r12, r13, 40
    load_32 r2, [r12]
    add r1, r1, r2
    sub r12, r13, 44
    store_32 [r12], r1
    mov r1, 0
    sub r12, r13, 44
    load_32 r2, [r12]
    store_8 [r2], r1
    sub r12, r13, 40
    load_32 r1, [r12]
    sub r12, r13, 36
    store_32 [r12], r1
    sub r12, r13, 36
    load_32 r1, [r12]
    sub r12, r13, 32
    store_32 [r12], r1
    jmp __sym_block_6
__sym_block_8:
    sub r12, r13, 4
    load_32 r1, [r12]
    mov r2, 96
    mod r1, r1, r2
    sub r12, r13, 48
    store_32 [r12], r1
    sub r12, r13, 4
    load_32 r1, [r12]
    mov r2, 96
    add r1, r1, r2
    sub r12, r13, 52
    store_32 [r12], r1
    sub r12, r13, 52
    load_32 r1, [r12]
    sub r12, r13, 48
    load_32 r2, [r12]
    sub r1, r1, r2
    sub r12, r13, 56
    store_32 [r12], r1
    sub r12, r13, 56
    load_32 r1, [r12]
    sub r12, r13, 88
    store_32 [r12], r1
    sub r12, r13, 88
    load_32 r1, [r12]
    sub r12, r13, 84
    store_32 [r12], r1
    jmp __sym_block_12
__sym_block_9:
    sub r12, r13, 12
    load_32 r1, [r12]
    mov r2, 255
    and r1, r1, r2
    sub r12, r13, 60
    store_32 [r12], r1
    sub r12, r13, 60
    load_32 r1, [r12]
    mov r2, 65535
    lsl r2, r2, 16
    or r2, r2, 65504
    add r1, r1, r2
    sub r12, r13, 64
    store_32 [r12], r1
    sub r12, r13, 64
    load_32 r1, [r12]
    mov r2, 95
    cmp r1, r2
    jb __sym_cmp_yes_24
    mov r1, 0
    jmp __sym_cmp_done_25
__sym_cmp_yes_24:
    mov r1, 1
__sym_cmp_done_25:
    and r1, r1, 1
    sub r12, r13, 68
    store_32 [r12], r1
    sub r12, r13, 68
    load_32 r1, [r12]
    cmp r1, 0
    jne __sym_edge_true_26
    jmp __sym_block_10
__sym_edge_true_26:
    jmp __sym_block_11
__sym_block_10:
    jmp __sym_block_3
__sym_block_11:
    sub r12, r13, 12
    load_32 r1, [r12]
    and r1, r1, 255
    sub r12, r13, 72
    store_32 [r12], r1
    sub r12, r13, 4
    load_32 r1, [r12]
    mov r2, 1
    add r1, r1, r2
    sub r12, r13, 76
    store_32 [r12], r1
    mov r1, 1
    lsl r1, r1, 16
    sub r12, r13, 4
    load_32 r2, [r12]
    add r1, r1, r2
    sub r12, r13, 80
    store_32 [r12], r1
    sub r12, r13, 72
    load_32 r1, [r12]
    sub r12, r13, 80
    load_32 r2, [r12]
    store_8 [r2], r1
    sub r12, r13, 76
    load_32 r1, [r12]
    sub r12, r13, 88
    store_32 [r12], r1
    sub r12, r13, 88
    load_32 r1, [r12]
    sub r12, r13, 84
    store_32 [r12], r1
    jmp __sym_block_12
__sym_block_12:
    sub r12, r13, 84
    load_32 r1, [r12]
    mov r2, 3839
    cmp r1, r2
    ja __sym_cmp_yes_27
    mov r1, 0
    jmp __sym_cmp_done_28
__sym_cmp_yes_27:
    mov r1, 1
__sym_cmp_done_28:
    and r1, r1, 1
    sub r12, r13, 92
    store_32 [r12], r1
    sub r12, r13, 92
    load_32 r1, [r12]
    cmp r1, 0
    jne __sym_edge_true_29
    sub r12, r13, 84
    load_32 r1, [r12]
    sub r12, r13, 36
    store_32 [r12], r1
    sub r12, r13, 36
    load_32 r1, [r12]
    sub r12, r13, 32
    store_32 [r12], r1
    jmp __sym_block_6
__sym_edge_true_29:
    mov r1, 0
    sub r12, r13, 100
    store_32 [r12], r1
    sub r12, r13, 100
    load_32 r1, [r12]
    sub r12, r13, 96
    store_32 [r12], r1
    jmp __sym_block_13
__sym_block_13:
    mov r1, 1
    lsl r1, r1, 16
    sub r12, r13, 96
    load_32 r2, [r12]
    add r1, r1, r2
    sub r12, r13, 104
    store_32 [r12], r1
    sub r12, r13, 104
    load_32 r1, [r12]
    mov r2, 96
    add r1, r1, r2
    sub r12, r13, 108
    store_32 [r12], r1
    sub r12, r13, 108
    load_32 r2, [r12]
    load_8 r1, [r2]
    and r1, r1, 255
    sub r12, r13, 112
    store_32 [r12], r1
    sub r12, r13, 112
    load_32 r1, [r12]
    sub r12, r13, 104
    load_32 r2, [r12]
    store_8 [r2], r1
    sub r12, r13, 96
    load_32 r1, [r12]
    mov r2, 1
    add r1, r1, r2
    sub r12, r13, 116
    store_32 [r12], r1
    sub r12, r13, 116
    load_32 r1, [r12]
    mov r2, 3744
    cmp r1, r2
    je __sym_cmp_yes_30
    mov r1, 0
    jmp __sym_cmp_done_31
__sym_cmp_yes_30:
    mov r1, 1
__sym_cmp_done_31:
    and r1, r1, 1
    sub r12, r13, 120
    store_32 [r12], r1
    sub r12, r13, 120
    load_32 r1, [r12]
    cmp r1, 0
    jne __sym_edge_true_32
    sub r12, r13, 116
    load_32 r1, [r12]
    sub r12, r13, 100
    store_32 [r12], r1
    sub r12, r13, 100
    load_32 r1, [r12]
    sub r12, r13, 96
    store_32 [r12], r1
    jmp __sym_block_13
__sym_edge_true_32:
    mov r1, 3744
    sub r12, r13, 132
    store_32 [r12], r1
    sub r12, r13, 132
    load_32 r1, [r12]
    sub r12, r13, 128
    store_32 [r12], r1
    jmp __sym_block_15
__sym_block_14:
    sub r12, r13, 84
    load_32 r1, [r12]
    mov r2, 65535
    lsl r2, r2, 16
    or r2, r2, 65440
    add r1, r1, r2
    sub r12, r13, 124
    store_32 [r12], r1
    sub r12, r13, 124
    load_32 r1, [r12]
    sub r12, r13, 36
    store_32 [r12], r1
    sub r12, r13, 36
    load_32 r1, [r12]
    sub r12, r13, 32
    store_32 [r12], r1
    jmp __sym_block_6
__sym_block_15:
    mov r1, 1
    lsl r1, r1, 16
    sub r12, r13, 128
    load_32 r2, [r12]
    add r1, r1, r2
    sub r12, r13, 136
    store_32 [r12], r1
    mov r1, 0
    sub r12, r13, 136
    load_32 r2, [r12]
    store_8 [r2], r1
    sub r12, r13, 128
    load_32 r1, [r12]
    mov r2, 1
    add r1, r1, r2
    sub r12, r13, 140
    store_32 [r12], r1
    sub r12, r13, 140
    load_32 r1, [r12]
    mov r2, 3840
    cmp r1, r2
    je __sym_cmp_yes_33
    mov r1, 0
    jmp __sym_cmp_done_34
__sym_cmp_yes_33:
    mov r1, 1
__sym_cmp_done_34:
    and r1, r1, 1
    sub r12, r13, 144
    store_32 [r12], r1
    sub r12, r13, 144
    load_32 r1, [r12]
    cmp r1, 0
    jne __sym_edge_true_35
    sub r12, r13, 140
    load_32 r1, [r12]
    sub r12, r13, 132
    store_32 [r12], r1
    sub r12, r13, 132
    load_32 r1, [r12]
    sub r12, r13, 128
    store_32 [r12], r1
    jmp __sym_block_15
__sym_edge_true_35:
    jmp __sym_block_14

; Global addresses (zero tail uses initially zeroed RAM).
; framebuffer = 65536
