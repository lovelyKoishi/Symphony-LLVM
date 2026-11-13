; Symphony LLVM backend 0.1. Big endian, 32-bit values/pointers.
__sym_start:
    mov sp, 256
    lsl sp, sp, 16
    call __sym_fn_main_0
__sym_halt:
    jmp __sym_halt
__sym_trap:
    jmp __sym_trap

; function main, frame 0 bytes
__sym_fn_main_0:
    push r13
    mov r13, sp
__sym_block_1:
    mov r1, 64
    mov r2, 8
    mov r3, 64
    mov r4, 48
    mov r5, 73
    call __sym_fn_gfx_line_4
    mov r1, 64
    mov r2, 48
    mov r3, 99
    mov r4, 68
    mov r5, 73
    call __sym_fn_gfx_line_4
    mov r1, 29
    mov r2, 68
    mov r3, 64
    mov r4, 48
    mov r5, 73
    call __sym_fn_gfx_line_4
    mov r1, 64
    mov r2, 8
    mov r3, 99
    mov r4, 28
    mov r5, 255
    call __sym_fn_gfx_line_4
    mov r1, 99
    mov r2, 28
    mov r3, 64
    mov r4, 48
    mov r5, 255
    call __sym_fn_gfx_line_4
    mov r1, 64
    mov r2, 48
    mov r3, 29
    mov r4, 28
    mov r5, 255
    call __sym_fn_gfx_line_4
    mov r1, 29
    mov r2, 28
    mov r3, 64
    mov r4, 8
    mov r5, 255
    call __sym_fn_gfx_line_4
    mov r1, 99
    mov r2, 68
    mov r3, 64
    mov r4, 88
    mov r5, 255
    call __sym_fn_gfx_line_4
    mov r1, 64
    mov r2, 88
    mov r3, 29
    mov r4, 68
    mov r5, 255
    call __sym_fn_gfx_line_4
    mov r1, 99
    mov r2, 28
    mov r3, 99
    mov r4, 68
    mov r5, 255
    call __sym_fn_gfx_line_4
    mov r1, 64
    mov r2, 48
    mov r3, 64
    mov r4, 88
    mov r5, 255
    call __sym_fn_gfx_line_4
    mov r1, 29
    mov r2, 28
    mov r3, 29
    mov r4, 68
    mov r5, 255
    call __sym_fn_gfx_line_4
    call __sym_fn_gfx_init_2
    mov r1, 0
    mov sp, r13
    pop r13
    ret

; function gfx_init, frame 0 bytes
__sym_fn_gfx_init_2:
    push r13
    mov r13, sp
__sym_block_3:
    mov r1, 0
    mov r2, 2
    screen r1, r2
    mov r1, 2
    mov r2, 31
    screen r1, r2
    mov r1, 1
    mov r2, 1
    lsl r2, r2, 16
    screen r1, r2
    mov r1, 0
    mov sp, r13
    pop r13
    ret

; function gfx_line, frame 232 bytes
__sym_fn_gfx_line_4:
    push r13
    mov r13, sp
    sub sp, sp, 232
    and r1, r1, 65535
    sub r12, r13, 4
    store_32 [r12], r1
    and r2, r2, 65535
    sub r12, r13, 8
    store_32 [r12], r2
    and r3, r3, 65535
    sub r12, r13, 12
    store_32 [r12], r3
    and r4, r4, 65535
    sub r12, r13, 16
    store_32 [r12], r4
    and r5, r5, 255
    sub r12, r13, 20
    store_32 [r12], r5
__sym_block_5:
    sub r12, r13, 4
    load_32 r1, [r12]
    lsl r1, r1, 16
    asr r1, r1, 16
    sub r12, r13, 24
    store_32 [r12], r1
    sub r12, r13, 8
    load_32 r1, [r12]
    lsl r1, r1, 16
    asr r1, r1, 16
    sub r12, r13, 28
    store_32 [r12], r1
    sub r12, r13, 12
    load_32 r1, [r12]
    lsl r1, r1, 16
    asr r1, r1, 16
    sub r12, r13, 32
    store_32 [r12], r1
    sub r12, r13, 16
    load_32 r1, [r12]
    lsl r1, r1, 16
    asr r1, r1, 16
    sub r12, r13, 36
    store_32 [r12], r1
    sub r12, r13, 36
    load_32 r1, [r12]
    sub r12, r13, 44
    store_32 [r12], r1
    sub r12, r13, 32
    load_32 r1, [r12]
    sub r12, r13, 52
    store_32 [r12], r1
    sub r12, r13, 28
    load_32 r1, [r12]
    sub r12, r13, 60
    store_32 [r12], r1
    sub r12, r13, 24
    load_32 r1, [r12]
    sub r12, r13, 68
    store_32 [r12], r1
    sub r12, r13, 44
    load_32 r1, [r12]
    sub r12, r13, 40
    store_32 [r12], r1
    sub r12, r13, 52
    load_32 r1, [r12]
    sub r12, r13, 48
    store_32 [r12], r1
    sub r12, r13, 60
    load_32 r1, [r12]
    sub r12, r13, 56
    store_32 [r12], r1
    sub r12, r13, 68
    load_32 r1, [r12]
    sub r12, r13, 64
    store_32 [r12], r1
    jmp __sym_block_6
__sym_block_6:
    sub r12, r13, 64
    load_32 r1, [r12]
    mov r2, 0
    cmp r1, r2
    jl __sym_cmp_yes_19
    mov r1, 0
    jmp __sym_cmp_done_20
__sym_cmp_yes_19:
    mov r1, 1
__sym_cmp_done_20:
    and r1, r1, 1
    mov r7, r1
    sub r12, r13, 64
    load_32 r1, [r12]
    mov r2, 127
    cmp r1, r2
    jg __sym_cmp_yes_21
    mov r1, 0
    jmp __sym_cmp_done_22
__sym_cmp_yes_21:
    mov r1, 1
__sym_cmp_done_22:
    and r1, r1, 1
    mov r8, r1
    mov r1, r8
    cmp r1, 0
    jne __sym_select_yes_23
    mov r1, 0
    jmp __sym_select_done_24
__sym_select_yes_23:
    mov r1, 2
__sym_select_done_24:
    mov r9, r1
    mov r1, r7
    cmp r1, 0
    jne __sym_select_yes_25
    mov r1, r9
    jmp __sym_select_done_26
__sym_select_yes_25:
    mov r1, 1
__sym_select_done_26:
    mov r8, r1
    sub r12, r13, 56
    load_32 r1, [r12]
    mov r2, 0
    cmp r1, r2
    jl __sym_cmp_yes_27
    mov r1, 0
    jmp __sym_cmp_done_28
__sym_cmp_yes_27:
    mov r1, 1
__sym_cmp_done_28:
    and r1, r1, 1
    mov r7, r1
    sub r12, r13, 56
    load_32 r1, [r12]
    mov r2, 95
    cmp r1, r2
    jg __sym_cmp_yes_29
    mov r1, 0
    jmp __sym_cmp_done_30
__sym_cmp_yes_29:
    mov r1, 1
__sym_cmp_done_30:
    and r1, r1, 1
    mov r9, r1
    mov r1, r9
    cmp r1, 0
    jne __sym_select_yes_31
    mov r1, 0
    jmp __sym_select_done_32
__sym_select_yes_31:
    mov r1, 8
__sym_select_done_32:
    mov r10, r1
    mov r1, r7
    cmp r1, 0
    jne __sym_select_yes_33
    mov r1, r10
    jmp __sym_select_done_34
__sym_select_yes_33:
    mov r1, 4
__sym_select_done_34:
    mov r9, r1
    mov r1, r8
    mov r2, r9
    or r1, r1, r2
    sub r12, r13, 72
    store_32 [r12], r1
    sub r12, r13, 48
    load_32 r1, [r12]
    mov r2, 0
    cmp r1, r2
    jl __sym_cmp_yes_35
    mov r1, 0
    jmp __sym_cmp_done_36
__sym_cmp_yes_35:
    mov r1, 1
__sym_cmp_done_36:
    and r1, r1, 1
    mov r7, r1
    sub r12, r13, 48
    load_32 r1, [r12]
    mov r2, 127
    cmp r1, r2
    jg __sym_cmp_yes_37
    mov r1, 0
    jmp __sym_cmp_done_38
__sym_cmp_yes_37:
    mov r1, 1
__sym_cmp_done_38:
    and r1, r1, 1
    mov r8, r1
    mov r1, r8
    cmp r1, 0
    jne __sym_select_yes_39
    mov r1, 0
    jmp __sym_select_done_40
__sym_select_yes_39:
    mov r1, 2
__sym_select_done_40:
    mov r9, r1
    mov r1, r7
    cmp r1, 0
    jne __sym_select_yes_41
    mov r1, r9
    jmp __sym_select_done_42
__sym_select_yes_41:
    mov r1, 1
__sym_select_done_42:
    mov r8, r1
    sub r12, r13, 40
    load_32 r1, [r12]
    mov r2, 0
    cmp r1, r2
    jl __sym_cmp_yes_43
    mov r1, 0
    jmp __sym_cmp_done_44
__sym_cmp_yes_43:
    mov r1, 1
__sym_cmp_done_44:
    and r1, r1, 1
    mov r7, r1
    sub r12, r13, 40
    load_32 r1, [r12]
    mov r2, 95
    cmp r1, r2
    jg __sym_cmp_yes_45
    mov r1, 0
    jmp __sym_cmp_done_46
__sym_cmp_yes_45:
    mov r1, 1
__sym_cmp_done_46:
    and r1, r1, 1
    mov r9, r1
    mov r1, r9
    cmp r1, 0
    jne __sym_select_yes_47
    mov r1, 0
    jmp __sym_select_done_48
__sym_select_yes_47:
    mov r1, 8
__sym_select_done_48:
    mov r10, r1
    mov r1, r7
    cmp r1, 0
    jne __sym_select_yes_49
    mov r1, r10
    jmp __sym_select_done_50
__sym_select_yes_49:
    mov r1, 4
__sym_select_done_50:
    mov r9, r1
    mov r1, r8
    mov r2, r9
    or r1, r1, r2
    sub r12, r13, 76
    store_32 [r12], r1
    sub r12, r13, 72
    load_32 r1, [r12]
    sub r12, r13, 76
    load_32 r2, [r12]
    or r1, r1, r2
    mov r7, r1
    mov r1, r7
    mov r2, 0
    cmp r1, r2
    je __sym_cmp_yes_51
    mov r1, 0
    jmp __sym_cmp_done_52
__sym_cmp_yes_51:
    mov r1, 1
__sym_cmp_done_52:
    and r1, r1, 1
    mov r8, r1
    mov r1, r8
    cmp r1, 0
    jne __sym_edge_true_53
    jmp __sym_block_7
__sym_edge_true_53:
    mov r1, 2
    sub r12, r13, 140
    store_32 [r12], r1
    sub r12, r13, 40
    load_32 r1, [r12]
    sub r12, r13, 148
    store_32 [r12], r1
    sub r12, r13, 48
    load_32 r1, [r12]
    sub r12, r13, 156
    store_32 [r12], r1
    sub r12, r13, 56
    load_32 r1, [r12]
    sub r12, r13, 164
    store_32 [r12], r1
    sub r12, r13, 64
    load_32 r1, [r12]
    sub r12, r13, 172
    store_32 [r12], r1
    sub r12, r13, 140
    load_32 r1, [r12]
    sub r12, r13, 136
    store_32 [r12], r1
    sub r12, r13, 148
    load_32 r1, [r12]
    sub r12, r13, 144
    store_32 [r12], r1
    sub r12, r13, 156
    load_32 r1, [r12]
    sub r12, r13, 152
    store_32 [r12], r1
    sub r12, r13, 164
    load_32 r1, [r12]
    sub r12, r13, 160
    store_32 [r12], r1
    sub r12, r13, 172
    load_32 r1, [r12]
    sub r12, r13, 168
    store_32 [r12], r1
    jmp __sym_block_12
__sym_block_7:
    sub r12, r13, 72
    load_32 r1, [r12]
    sub r12, r13, 76
    load_32 r2, [r12]
    and r1, r1, r2
    mov r7, r1
    mov r1, r7
    mov r2, 0
    cmp r1, r2
    je __sym_cmp_yes_54
    mov r1, 0
    jmp __sym_cmp_done_55
__sym_cmp_yes_54:
    mov r1, 1
__sym_cmp_done_55:
    and r1, r1, 1
    mov r8, r1
    mov r1, r8
    cmp r1, 0
    jne __sym_edge_true_56
    mov r1, 1
    sub r12, r13, 140
    store_32 [r12], r1
    sub r12, r13, 40
    load_32 r1, [r12]
    sub r12, r13, 148
    store_32 [r12], r1
    sub r12, r13, 48
    load_32 r1, [r12]
    sub r12, r13, 156
    store_32 [r12], r1
    sub r12, r13, 56
    load_32 r1, [r12]
    sub r12, r13, 164
    store_32 [r12], r1
    sub r12, r13, 64
    load_32 r1, [r12]
    sub r12, r13, 172
    store_32 [r12], r1
    sub r12, r13, 140
    load_32 r1, [r12]
    sub r12, r13, 136
    store_32 [r12], r1
    sub r12, r13, 148
    load_32 r1, [r12]
    sub r12, r13, 144
    store_32 [r12], r1
    sub r12, r13, 156
    load_32 r1, [r12]
    sub r12, r13, 152
    store_32 [r12], r1
    sub r12, r13, 164
    load_32 r1, [r12]
    sub r12, r13, 160
    store_32 [r12], r1
    sub r12, r13, 172
    load_32 r1, [r12]
    sub r12, r13, 168
    store_32 [r12], r1
    jmp __sym_block_12
__sym_edge_true_56:
    jmp __sym_block_8
__sym_block_8:
    sub r12, r13, 72
    load_32 r1, [r12]
    mov r2, 0
    cmp r1, r2
    je __sym_cmp_yes_57
    mov r1, 0
    jmp __sym_cmp_done_58
__sym_cmp_yes_57:
    mov r1, 1
__sym_cmp_done_58:
    and r1, r1, 1
    sub r12, r13, 80
    store_32 [r12], r1
    sub r12, r13, 80
    load_32 r1, [r12]
    cmp r1, 0
    jne __sym_select_yes_59
    sub r12, r13, 72
    load_32 r1, [r12]
    jmp __sym_select_done_60
__sym_select_yes_59:
    sub r12, r13, 76
    load_32 r1, [r12]
__sym_select_done_60:
    sub r12, r13, 84
    store_32 [r12], r1
    sub r12, r13, 84
    load_32 r1, [r12]
    mov r2, 4
    cmp r1, r2
    jb __sym_cmp_yes_61
    mov r1, 0
    jmp __sym_cmp_done_62
__sym_cmp_yes_61:
    mov r1, 1
__sym_cmp_done_62:
    and r1, r1, 1
    mov r7, r1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_63
    jmp __sym_block_9
__sym_edge_true_63:
    jmp __sym_block_10
__sym_block_9:
    sub r12, r13, 84
    load_32 r1, [r12]
    mov r2, 4
    and r1, r1, r2
    mov r7, r1
    mov r1, r7
    mov r2, 0
    cmp r1, r2
    je __sym_cmp_yes_64
    mov r1, 0
    jmp __sym_cmp_done_65
__sym_cmp_yes_64:
    mov r1, 1
__sym_cmp_done_65:
    and r1, r1, 1
    mov r8, r1
    mov r1, r8
    cmp r1, 0
    jne __sym_select_yes_66
    mov r1, 0
    jmp __sym_select_done_67
__sym_select_yes_66:
    mov r1, 95
__sym_select_done_67:
    sub r12, r13, 88
    store_32 [r12], r1
    sub r12, r13, 48
    load_32 r1, [r12]
    sub r12, r13, 64
    load_32 r2, [r12]
    sub r1, r1, r2
    mov r7, r1
    sub r12, r13, 88
    load_32 r1, [r12]
    sub r12, r13, 56
    load_32 r2, [r12]
    sub r1, r1, r2
    mov r8, r1
    sub r12, r13, 40
    load_32 r1, [r12]
    sub r12, r13, 56
    load_32 r2, [r12]
    sub r1, r1, r2
    mov r9, r1
    mov r1, r7
    mov r2, r8
    mov r3, r9
    call __sym_fn_offset_17
    mov r10, r1
    mov r1, r10
    sub r12, r13, 64
    load_32 r2, [r12]
    add r1, r1, r2
    sub r12, r13, 92
    store_32 [r12], r1
    sub r12, r13, 92
    load_32 r1, [r12]
    sub r12, r13, 108
    store_32 [r12], r1
    sub r12, r13, 88
    load_32 r1, [r12]
    sub r12, r13, 116
    store_32 [r12], r1
    sub r12, r13, 108
    load_32 r1, [r12]
    sub r12, r13, 104
    store_32 [r12], r1
    sub r12, r13, 116
    load_32 r1, [r12]
    sub r12, r13, 112
    store_32 [r12], r1
    jmp __sym_block_11
__sym_block_10:
    sub r12, r13, 84
    load_32 r1, [r12]
    mov r2, 1
    and r1, r1, r2
    mov r7, r1
    mov r1, r7
    mov r2, 0
    cmp r1, r2
    je __sym_cmp_yes_68
    mov r1, 0
    jmp __sym_cmp_done_69
__sym_cmp_yes_68:
    mov r1, 1
__sym_cmp_done_69:
    and r1, r1, 1
    mov r8, r1
    mov r1, r8
    cmp r1, 0
    jne __sym_select_yes_70
    mov r1, 0
    jmp __sym_select_done_71
__sym_select_yes_70:
    mov r1, 127
__sym_select_done_71:
    sub r12, r13, 96
    store_32 [r12], r1
    sub r12, r13, 40
    load_32 r1, [r12]
    sub r12, r13, 56
    load_32 r2, [r12]
    sub r1, r1, r2
    mov r7, r1
    sub r12, r13, 96
    load_32 r1, [r12]
    sub r12, r13, 64
    load_32 r2, [r12]
    sub r1, r1, r2
    mov r8, r1
    sub r12, r13, 48
    load_32 r1, [r12]
    sub r12, r13, 64
    load_32 r2, [r12]
    sub r1, r1, r2
    mov r9, r1
    mov r1, r7
    mov r2, r8
    mov r3, r9
    call __sym_fn_offset_17
    mov r10, r1
    mov r1, r10
    sub r12, r13, 56
    load_32 r2, [r12]
    add r1, r1, r2
    sub r12, r13, 100
    store_32 [r12], r1
    sub r12, r13, 96
    load_32 r1, [r12]
    sub r12, r13, 108
    store_32 [r12], r1
    sub r12, r13, 100
    load_32 r1, [r12]
    sub r12, r13, 116
    store_32 [r12], r1
    sub r12, r13, 108
    load_32 r1, [r12]
    sub r12, r13, 104
    store_32 [r12], r1
    sub r12, r13, 116
    load_32 r1, [r12]
    sub r12, r13, 112
    store_32 [r12], r1
    jmp __sym_block_11
__sym_block_11:
    sub r12, r13, 80
    load_32 r1, [r12]
    cmp r1, 0
    jne __sym_select_yes_72
    sub r12, r13, 40
    load_32 r1, [r12]
    jmp __sym_select_done_73
__sym_select_yes_72:
    sub r12, r13, 112
    load_32 r1, [r12]
__sym_select_done_73:
    sub r12, r13, 120
    store_32 [r12], r1
    sub r12, r13, 80
    load_32 r1, [r12]
    cmp r1, 0
    jne __sym_select_yes_74
    sub r12, r13, 48
    load_32 r1, [r12]
    jmp __sym_select_done_75
__sym_select_yes_74:
    sub r12, r13, 104
    load_32 r1, [r12]
__sym_select_done_75:
    sub r12, r13, 124
    store_32 [r12], r1
    sub r12, r13, 80
    load_32 r1, [r12]
    cmp r1, 0
    jne __sym_select_yes_76
    sub r12, r13, 112
    load_32 r1, [r12]
    jmp __sym_select_done_77
__sym_select_yes_76:
    sub r12, r13, 56
    load_32 r1, [r12]
__sym_select_done_77:
    sub r12, r13, 128
    store_32 [r12], r1
    sub r12, r13, 80
    load_32 r1, [r12]
    cmp r1, 0
    jne __sym_select_yes_78
    sub r12, r13, 104
    load_32 r1, [r12]
    jmp __sym_select_done_79
__sym_select_yes_78:
    sub r12, r13, 64
    load_32 r1, [r12]
__sym_select_done_79:
    sub r12, r13, 132
    store_32 [r12], r1
    mov r1, 0
    sub r12, r13, 140
    store_32 [r12], r1
    sub r12, r13, 120
    load_32 r1, [r12]
    sub r12, r13, 148
    store_32 [r12], r1
    sub r12, r13, 124
    load_32 r1, [r12]
    sub r12, r13, 156
    store_32 [r12], r1
    sub r12, r13, 128
    load_32 r1, [r12]
    sub r12, r13, 164
    store_32 [r12], r1
    sub r12, r13, 132
    load_32 r1, [r12]
    sub r12, r13, 172
    store_32 [r12], r1
    sub r12, r13, 140
    load_32 r1, [r12]
    sub r12, r13, 136
    store_32 [r12], r1
    sub r12, r13, 148
    load_32 r1, [r12]
    sub r12, r13, 144
    store_32 [r12], r1
    sub r12, r13, 156
    load_32 r1, [r12]
    sub r12, r13, 152
    store_32 [r12], r1
    sub r12, r13, 164
    load_32 r1, [r12]
    sub r12, r13, 160
    store_32 [r12], r1
    sub r12, r13, 172
    load_32 r1, [r12]
    sub r12, r13, 168
    store_32 [r12], r1
    jmp __sym_block_12
__sym_block_12:
    sub r12, r13, 136
    load_32 r1, [r12]
    mov r2, 0
    cmp r1, r2
    je __sym_switch_80
    mov r2, 2
    cmp r1, r2
    je __sym_switch_81
    jmp __sym_block_16
__sym_switch_80:
    sub r12, r13, 144
    load_32 r1, [r12]
    sub r12, r13, 44
    store_32 [r12], r1
    sub r12, r13, 152
    load_32 r1, [r12]
    sub r12, r13, 52
    store_32 [r12], r1
    sub r12, r13, 160
    load_32 r1, [r12]
    sub r12, r13, 60
    store_32 [r12], r1
    sub r12, r13, 168
    load_32 r1, [r12]
    sub r12, r13, 68
    store_32 [r12], r1
    sub r12, r13, 44
    load_32 r1, [r12]
    sub r12, r13, 40
    store_32 [r12], r1
    sub r12, r13, 52
    load_32 r1, [r12]
    sub r12, r13, 48
    store_32 [r12], r1
    sub r12, r13, 60
    load_32 r1, [r12]
    sub r12, r13, 56
    store_32 [r12], r1
    sub r12, r13, 68
    load_32 r1, [r12]
    sub r12, r13, 64
    store_32 [r12], r1
    jmp __sym_block_6
__sym_switch_81:
    jmp __sym_block_13
__sym_block_13:
    sub r12, r13, 152
    load_32 r1, [r12]
    sub r12, r13, 168
    load_32 r2, [r12]
    cmp r1, r2
    jg __sym_cmp_yes_82
    mov r1, 0
    jmp __sym_cmp_done_83
__sym_cmp_yes_82:
    mov r1, 1
__sym_cmp_done_83:
    and r1, r1, 1
    sub r12, r13, 176
    store_32 [r12], r1
    sub r12, r13, 152
    load_32 r1, [r12]
    sub r12, r13, 168
    load_32 r2, [r12]
    sub r1, r1, r2
    mov r7, r1
    mov r1, r7
    asr r2, r1, 31
    xor r1, r1, r2
    sub r1, r1, r2
    sub r12, r13, 180
    store_32 [r12], r1
    sub r12, r13, 144
    load_32 r1, [r12]
    sub r12, r13, 160
    load_32 r2, [r12]
    cmp r1, r2
    jg __sym_cmp_yes_84
    mov r1, 0
    jmp __sym_cmp_done_85
__sym_cmp_yes_84:
    mov r1, 1
__sym_cmp_done_85:
    and r1, r1, 1
    mov r7, r1
    sub r12, r13, 160
    load_32 r1, [r12]
    sub r12, r13, 144
    load_32 r2, [r12]
    sub r1, r1, r2
    mov r8, r1
    sub r12, r13, 144
    load_32 r1, [r12]
    sub r12, r13, 160
    load_32 r2, [r12]
    sub r1, r1, r2
    mov r9, r1
    mov r1, r7
    cmp r1, 0
    jne __sym_select_yes_86
    mov r1, 65535
    lsl r1, r1, 16
    or r1, r1, 65535
    jmp __sym_select_done_87
__sym_select_yes_86:
    mov r1, 1
__sym_select_done_87:
    sub r12, r13, 184
    store_32 [r12], r1
    mov r1, r7
    cmp r1, 0
    jne __sym_select_yes_88
    mov r1, r9
    jmp __sym_select_done_89
__sym_select_yes_88:
    mov r1, r8
__sym_select_done_89:
    sub r12, r13, 188
    store_32 [r12], r1
    sub r12, r13, 176
    load_32 r1, [r12]
    cmp r1, 0
    jne __sym_select_yes_90
    mov r1, 65535
    lsl r1, r1, 16
    or r1, r1, 65535
    jmp __sym_select_done_91
__sym_select_yes_90:
    mov r1, 1
__sym_select_done_91:
    sub r12, r13, 192
    store_32 [r12], r1
    sub r12, r13, 160
    load_32 r1, [r12]
    mov r2, 7
    lsl r1, r1, r2
    mov r7, r1
    mov r1, 1
    lsl r1, r1, 16
    mov r2, r7
    add r1, r1, r2
    mov r8, r1
    mov r1, r8
    sub r12, r13, 168
    load_32 r2, [r12]
    add r1, r1, r2
    mov r7, r1
    sub r12, r13, 20
    load_32 r1, [r12]
    mov r2, r7
    store_8 [r2], r1
    sub r12, r13, 168
    load_32 r1, [r12]
    sub r12, r13, 152
    load_32 r2, [r12]
    cmp r1, r2
    je __sym_cmp_yes_92
    mov r1, 0
    jmp __sym_cmp_done_93
__sym_cmp_yes_92:
    mov r1, 1
__sym_cmp_done_93:
    and r1, r1, 1
    mov r7, r1
    sub r12, r13, 160
    load_32 r1, [r12]
    sub r12, r13, 144
    load_32 r2, [r12]
    cmp r1, r2
    je __sym_cmp_yes_94
    mov r1, 0
    jmp __sym_cmp_done_95
__sym_cmp_yes_94:
    mov r1, 1
__sym_cmp_done_95:
    and r1, r1, 1
    mov r8, r1
    mov r1, r7
    cmp r1, 0
    jne __sym_select_yes_96
    mov r1, 0
    jmp __sym_select_done_97
__sym_select_yes_96:
    mov r1, r8
__sym_select_done_97:
    and r1, r1, 1
    mov r9, r1
    mov r1, r9
    cmp r1, 0
    jne __sym_edge_true_98
    jmp __sym_block_14
__sym_edge_true_98:
    jmp __sym_block_16
__sym_block_14:
    sub r12, r13, 180
    load_32 r1, [r12]
    sub r12, r13, 188
    load_32 r2, [r12]
    add r1, r1, r2
    sub r12, r13, 196
    store_32 [r12], r1
    sub r12, r13, 168
    load_32 r1, [r12]
    sub r12, r13, 204
    store_32 [r12], r1
    sub r12, r13, 196
    load_32 r1, [r12]
    sub r12, r13, 212
    store_32 [r12], r1
    sub r12, r13, 160
    load_32 r1, [r12]
    sub r12, r13, 220
    store_32 [r12], r1
    sub r12, r13, 204
    load_32 r1, [r12]
    sub r12, r13, 200
    store_32 [r12], r1
    sub r12, r13, 212
    load_32 r1, [r12]
    sub r12, r13, 208
    store_32 [r12], r1
    sub r12, r13, 220
    load_32 r1, [r12]
    sub r12, r13, 216
    store_32 [r12], r1
    jmp __sym_block_15
__sym_block_15:
    sub r12, r13, 208
    load_32 r1, [r12]
    mov r2, 1
    lsl r1, r1, r2
    mov r7, r1
    mov r1, r7
    sub r12, r13, 188
    load_32 r2, [r12]
    cmp r1, r2
    jl __sym_cmp_yes_99
    mov r1, 0
    jmp __sym_cmp_done_100
__sym_cmp_yes_99:
    mov r1, 1
__sym_cmp_done_100:
    and r1, r1, 1
    mov r8, r1
    mov r1, r8
    cmp r1, 0
    jne __sym_select_yes_101
    sub r12, r13, 188
    load_32 r1, [r12]
    jmp __sym_select_done_102
__sym_select_yes_101:
    mov r1, 0
__sym_select_done_102:
    mov r9, r1
    mov r1, r9
    sub r12, r13, 208
    load_32 r2, [r12]
    add r1, r1, r2
    mov r10, r1
    mov r1, r8
    cmp r1, 0
    jne __sym_select_yes_103
    sub r12, r13, 192
    load_32 r1, [r12]
    jmp __sym_select_done_104
__sym_select_yes_103:
    mov r1, 0
__sym_select_done_104:
    mov r9, r1
    mov r1, r9
    sub r12, r13, 200
    load_32 r2, [r12]
    add r1, r1, r2
    sub r12, r13, 224
    store_32 [r12], r1
    mov r1, r7
    sub r12, r13, 180
    load_32 r2, [r12]
    cmp r1, r2
    jg __sym_cmp_yes_105
    mov r1, 0
    jmp __sym_cmp_done_106
__sym_cmp_yes_105:
    mov r1, 1
__sym_cmp_done_106:
    and r1, r1, 1
    mov r8, r1
    mov r1, r8
    cmp r1, 0
    jne __sym_select_yes_107
    sub r12, r13, 184
    load_32 r1, [r12]
    jmp __sym_select_done_108
__sym_select_yes_107:
    mov r1, 0
__sym_select_done_108:
    mov r7, r1
    mov r1, r7
    sub r12, r13, 216
    load_32 r2, [r12]
    add r1, r1, r2
    sub r12, r13, 228
    store_32 [r12], r1
    mov r1, r8
    cmp r1, 0
    jne __sym_select_yes_109
    sub r12, r13, 180
    load_32 r1, [r12]
    jmp __sym_select_done_110
__sym_select_yes_109:
    mov r1, 0
__sym_select_done_110:
    mov r7, r1
    mov r1, r10
    mov r2, r7
    add r1, r1, r2
    sub r12, r13, 232
    store_32 [r12], r1
    sub r12, r13, 228
    load_32 r1, [r12]
    mov r2, 7
    lsl r1, r1, r2
    mov r7, r1
    mov r1, 1
    lsl r1, r1, 16
    mov r2, r7
    add r1, r1, r2
    mov r8, r1
    mov r1, r8
    sub r12, r13, 224
    load_32 r2, [r12]
    add r1, r1, r2
    mov r7, r1
    sub r12, r13, 20
    load_32 r1, [r12]
    mov r2, r7
    store_8 [r2], r1
    sub r12, r13, 224
    load_32 r1, [r12]
    sub r12, r13, 152
    load_32 r2, [r12]
    cmp r1, r2
    je __sym_cmp_yes_111
    mov r1, 0
    jmp __sym_cmp_done_112
__sym_cmp_yes_111:
    mov r1, 1
__sym_cmp_done_112:
    and r1, r1, 1
    mov r7, r1
    sub r12, r13, 228
    load_32 r1, [r12]
    sub r12, r13, 144
    load_32 r2, [r12]
    cmp r1, r2
    je __sym_cmp_yes_113
    mov r1, 0
    jmp __sym_cmp_done_114
__sym_cmp_yes_113:
    mov r1, 1
__sym_cmp_done_114:
    and r1, r1, 1
    mov r8, r1
    mov r1, r7
    cmp r1, 0
    jne __sym_select_yes_115
    mov r1, 0
    jmp __sym_select_done_116
__sym_select_yes_115:
    mov r1, r8
__sym_select_done_116:
    and r1, r1, 1
    mov r9, r1
    mov r1, r9
    cmp r1, 0
    jne __sym_edge_true_117
    sub r12, r13, 224
    load_32 r1, [r12]
    sub r12, r13, 204
    store_32 [r12], r1
    sub r12, r13, 232
    load_32 r1, [r12]
    sub r12, r13, 212
    store_32 [r12], r1
    sub r12, r13, 228
    load_32 r1, [r12]
    sub r12, r13, 220
    store_32 [r12], r1
    sub r12, r13, 204
    load_32 r1, [r12]
    sub r12, r13, 200
    store_32 [r12], r1
    sub r12, r13, 212
    load_32 r1, [r12]
    sub r12, r13, 208
    store_32 [r12], r1
    sub r12, r13, 220
    load_32 r1, [r12]
    sub r12, r13, 216
    store_32 [r12], r1
    jmp __sym_block_15
__sym_edge_true_117:
    jmp __sym_block_16
__sym_block_16:
    mov r1, 0
    mov sp, r13
    pop r13
    ret

; function offset, frame 24 bytes
__sym_fn_offset_17:
    push r13
    mov r13, sp
    sub sp, sp, 24
    sub r12, r13, 4
    store_32 [r12], r1
    sub r12, r13, 8
    store_32 [r12], r2
    sub r12, r13, 12
    store_32 [r12], r3
__sym_block_18:
    sub r12, r13, 4
    load_32 r1, [r12]
    asr r2, r1, 31
    xor r1, r1, r2
    sub r1, r1, r2
    sub r12, r13, 16
    store_32 [r12], r1
    sub r12, r13, 8
    load_32 r1, [r12]
    asr r2, r1, 31
    xor r1, r1, r2
    sub r1, r1, r2
    sub r12, r13, 20
    store_32 [r12], r1
    sub r12, r13, 12
    load_32 r1, [r12]
    asr r2, r1, 31
    xor r1, r1, r2
    sub r1, r1, r2
    mov r7, r1
    sub r12, r13, 20
    load_32 r1, [r12]
    sub r12, r13, 16
    load_32 r2, [r12]
    mul r1, r1, r2
    mov r8, r1
    mov r1, r8
    mov r2, r7
    div r1, r1, r2
    mov r9, r1
    sub r12, r13, 8
    load_32 r1, [r12]
    sub r12, r13, 4
    load_32 r2, [r12]
    xor r1, r1, r2
    mov r7, r1
    mov r1, r7
    sub r12, r13, 12
    load_32 r2, [r12]
    xor r1, r1, r2
    mov r8, r1
    mov r1, 0
    mov r2, r9
    sub r1, r1, r2
    mov r7, r1
    mov r1, r8
    mov r2, 0
    cmp r1, r2
    jl __sym_cmp_yes_118
    mov r1, 0
    jmp __sym_cmp_done_119
__sym_cmp_yes_118:
    mov r1, 1
__sym_cmp_done_119:
    and r1, r1, 1
    mov r10, r1
    mov r1, r10
    cmp r1, 0
    jne __sym_select_yes_120
    mov r1, r9
    jmp __sym_select_done_121
__sym_select_yes_120:
    mov r1, r7
__sym_select_done_121:
    mov r8, r1
    mov r1, r8
    mov sp, r13
    pop r13
    ret

; Global addresses (zero tail uses initially zeroed RAM).
; framebuffer = 65536
