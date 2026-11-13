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
    mov r1, 8
    mov r2, 8
    mov r3, 112
    mov r4, 80
    mov r5, 255
    call __sym_fn_gfx_rect_23
    mov r1, 20
    mov r2, 20
    mov r3, 32
    mov r4, 24
    mov r5, 224
    call __sym_fn_gfx_rect_23
    mov r1, 76
    mov r2, 52
    mov r3, 32
    mov r4, 24
    mov r5, 31
    call __sym_fn_gfx_rect_23
    mov r1, 8
    mov r2, 8
    mov r3, 119
    mov r4, 87
    mov r5, 28
    call __sym_fn_gfx_line_8
    mov r1, 119
    mov r2, 8
    mov r3, 8
    mov r4, 87
    mov r5, 3
    call __sym_fn_gfx_line_8
    mov r1, 64
    mov r2, 48
    mov r3, 252
    call __sym_fn_gfx_pixel_4
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

; function gfx_pixel, frame 16 bytes
__sym_fn_gfx_pixel_4:
    push r13
    mov r13, sp
    sub sp, sp, 16
    and r1, r1, 65535
    sub r12, r13, 4
    store_32 [r12], r1
    and r2, r2, 65535
    sub r12, r13, 8
    store_32 [r12], r2
    and r3, r3, 255
    sub r12, r13, 12
    store_32 [r12], r3
__sym_block_5:
    sub r12, r13, 4
    load_32 r1, [r12]
    mov r2, 128
    cmp r1, r2
    jb __sym_cmp_yes_40
    mov r1, 0
    jmp __sym_cmp_done_41
__sym_cmp_yes_40:
    mov r1, 1
__sym_cmp_done_41:
    and r1, r1, 1
    mov r7, r1
    sub r12, r13, 8
    load_32 r1, [r12]
    mov r2, 96
    cmp r1, r2
    jb __sym_cmp_yes_42
    mov r1, 0
    jmp __sym_cmp_done_43
__sym_cmp_yes_42:
    mov r1, 1
__sym_cmp_done_43:
    and r1, r1, 1
    mov r8, r1
    mov r1, r7
    mov r2, r8
    and r1, r1, r2
    and r1, r1, 1
    mov r9, r1
    mov r1, r9
    cmp r1, 0
    jne __sym_edge_true_44
    jmp __sym_block_7
__sym_edge_true_44:
    jmp __sym_block_6
__sym_block_6:
    sub r12, r13, 8
    load_32 r1, [r12]
    mov r2, 7
    lsl r1, r1, r2
    and r1, r1, 65535
    mov r7, r1
    mov r1, r7
    sub r12, r13, 4
    load_32 r2, [r12]
    or r1, r1, r2
    and r1, r1, 65535
    mov r8, r1
    mov r1, r8
    mov r7, r1
    mov r1, 1
    lsl r1, r1, 16
    mov r2, r7
    add r1, r1, r2
    mov r8, r1
    sub r12, r13, 12
    load_32 r1, [r12]
    mov r2, r8
    store_8 [r2], r1
    jmp __sym_block_7
__sym_block_7:
    mov r1, 0
    mov sp, r13
    pop r13
    ret

; function gfx_line, frame 232 bytes
__sym_fn_gfx_line_8:
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
__sym_block_9:
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
    jmp __sym_block_10
__sym_block_10:
    sub r12, r13, 64
    load_32 r1, [r12]
    mov r2, 0
    cmp r1, r2
    jl __sym_cmp_yes_45
    mov r1, 0
    jmp __sym_cmp_done_46
__sym_cmp_yes_45:
    mov r1, 1
__sym_cmp_done_46:
    and r1, r1, 1
    mov r7, r1
    sub r12, r13, 64
    load_32 r1, [r12]
    mov r2, 127
    cmp r1, r2
    jg __sym_cmp_yes_47
    mov r1, 0
    jmp __sym_cmp_done_48
__sym_cmp_yes_47:
    mov r1, 1
__sym_cmp_done_48:
    and r1, r1, 1
    mov r8, r1
    mov r1, r8
    cmp r1, 0
    jne __sym_select_yes_49
    mov r1, 0
    jmp __sym_select_done_50
__sym_select_yes_49:
    mov r1, 2
__sym_select_done_50:
    mov r9, r1
    mov r1, r7
    cmp r1, 0
    jne __sym_select_yes_51
    mov r1, r9
    jmp __sym_select_done_52
__sym_select_yes_51:
    mov r1, 1
__sym_select_done_52:
    mov r8, r1
    sub r12, r13, 56
    load_32 r1, [r12]
    mov r2, 0
    cmp r1, r2
    jl __sym_cmp_yes_53
    mov r1, 0
    jmp __sym_cmp_done_54
__sym_cmp_yes_53:
    mov r1, 1
__sym_cmp_done_54:
    and r1, r1, 1
    mov r7, r1
    sub r12, r13, 56
    load_32 r1, [r12]
    mov r2, 95
    cmp r1, r2
    jg __sym_cmp_yes_55
    mov r1, 0
    jmp __sym_cmp_done_56
__sym_cmp_yes_55:
    mov r1, 1
__sym_cmp_done_56:
    and r1, r1, 1
    mov r9, r1
    mov r1, r9
    cmp r1, 0
    jne __sym_select_yes_57
    mov r1, 0
    jmp __sym_select_done_58
__sym_select_yes_57:
    mov r1, 8
__sym_select_done_58:
    mov r10, r1
    mov r1, r7
    cmp r1, 0
    jne __sym_select_yes_59
    mov r1, r10
    jmp __sym_select_done_60
__sym_select_yes_59:
    mov r1, 4
__sym_select_done_60:
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
    jl __sym_cmp_yes_61
    mov r1, 0
    jmp __sym_cmp_done_62
__sym_cmp_yes_61:
    mov r1, 1
__sym_cmp_done_62:
    and r1, r1, 1
    mov r7, r1
    sub r12, r13, 48
    load_32 r1, [r12]
    mov r2, 127
    cmp r1, r2
    jg __sym_cmp_yes_63
    mov r1, 0
    jmp __sym_cmp_done_64
__sym_cmp_yes_63:
    mov r1, 1
__sym_cmp_done_64:
    and r1, r1, 1
    mov r8, r1
    mov r1, r8
    cmp r1, 0
    jne __sym_select_yes_65
    mov r1, 0
    jmp __sym_select_done_66
__sym_select_yes_65:
    mov r1, 2
__sym_select_done_66:
    mov r9, r1
    mov r1, r7
    cmp r1, 0
    jne __sym_select_yes_67
    mov r1, r9
    jmp __sym_select_done_68
__sym_select_yes_67:
    mov r1, 1
__sym_select_done_68:
    mov r8, r1
    sub r12, r13, 40
    load_32 r1, [r12]
    mov r2, 0
    cmp r1, r2
    jl __sym_cmp_yes_69
    mov r1, 0
    jmp __sym_cmp_done_70
__sym_cmp_yes_69:
    mov r1, 1
__sym_cmp_done_70:
    and r1, r1, 1
    mov r7, r1
    sub r12, r13, 40
    load_32 r1, [r12]
    mov r2, 95
    cmp r1, r2
    jg __sym_cmp_yes_71
    mov r1, 0
    jmp __sym_cmp_done_72
__sym_cmp_yes_71:
    mov r1, 1
__sym_cmp_done_72:
    and r1, r1, 1
    mov r9, r1
    mov r1, r9
    cmp r1, 0
    jne __sym_select_yes_73
    mov r1, 0
    jmp __sym_select_done_74
__sym_select_yes_73:
    mov r1, 8
__sym_select_done_74:
    mov r10, r1
    mov r1, r7
    cmp r1, 0
    jne __sym_select_yes_75
    mov r1, r10
    jmp __sym_select_done_76
__sym_select_yes_75:
    mov r1, 4
__sym_select_done_76:
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
    je __sym_cmp_yes_77
    mov r1, 0
    jmp __sym_cmp_done_78
__sym_cmp_yes_77:
    mov r1, 1
__sym_cmp_done_78:
    and r1, r1, 1
    mov r8, r1
    mov r1, r8
    cmp r1, 0
    jne __sym_edge_true_79
    jmp __sym_block_11
__sym_edge_true_79:
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
    jmp __sym_block_16
__sym_block_11:
    sub r12, r13, 72
    load_32 r1, [r12]
    sub r12, r13, 76
    load_32 r2, [r12]
    and r1, r1, r2
    mov r7, r1
    mov r1, r7
    mov r2, 0
    cmp r1, r2
    je __sym_cmp_yes_80
    mov r1, 0
    jmp __sym_cmp_done_81
__sym_cmp_yes_80:
    mov r1, 1
__sym_cmp_done_81:
    and r1, r1, 1
    mov r8, r1
    mov r1, r8
    cmp r1, 0
    jne __sym_edge_true_82
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
    jmp __sym_block_16
__sym_edge_true_82:
    jmp __sym_block_12
__sym_block_12:
    sub r12, r13, 72
    load_32 r1, [r12]
    mov r2, 0
    cmp r1, r2
    je __sym_cmp_yes_83
    mov r1, 0
    jmp __sym_cmp_done_84
__sym_cmp_yes_83:
    mov r1, 1
__sym_cmp_done_84:
    and r1, r1, 1
    sub r12, r13, 80
    store_32 [r12], r1
    sub r12, r13, 80
    load_32 r1, [r12]
    cmp r1, 0
    jne __sym_select_yes_85
    sub r12, r13, 72
    load_32 r1, [r12]
    jmp __sym_select_done_86
__sym_select_yes_85:
    sub r12, r13, 76
    load_32 r1, [r12]
__sym_select_done_86:
    sub r12, r13, 84
    store_32 [r12], r1
    sub r12, r13, 84
    load_32 r1, [r12]
    mov r2, 4
    cmp r1, r2
    jb __sym_cmp_yes_87
    mov r1, 0
    jmp __sym_cmp_done_88
__sym_cmp_yes_87:
    mov r1, 1
__sym_cmp_done_88:
    and r1, r1, 1
    mov r7, r1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_89
    jmp __sym_block_13
__sym_edge_true_89:
    jmp __sym_block_14
__sym_block_13:
    sub r12, r13, 84
    load_32 r1, [r12]
    mov r2, 4
    and r1, r1, r2
    mov r7, r1
    mov r1, r7
    mov r2, 0
    cmp r1, r2
    je __sym_cmp_yes_90
    mov r1, 0
    jmp __sym_cmp_done_91
__sym_cmp_yes_90:
    mov r1, 1
__sym_cmp_done_91:
    and r1, r1, 1
    mov r8, r1
    mov r1, r8
    cmp r1, 0
    jne __sym_select_yes_92
    mov r1, 0
    jmp __sym_select_done_93
__sym_select_yes_92:
    mov r1, 95
__sym_select_done_93:
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
    call __sym_fn_offset_21
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
    jmp __sym_block_15
__sym_block_14:
    sub r12, r13, 84
    load_32 r1, [r12]
    mov r2, 1
    and r1, r1, r2
    mov r7, r1
    mov r1, r7
    mov r2, 0
    cmp r1, r2
    je __sym_cmp_yes_94
    mov r1, 0
    jmp __sym_cmp_done_95
__sym_cmp_yes_94:
    mov r1, 1
__sym_cmp_done_95:
    and r1, r1, 1
    mov r8, r1
    mov r1, r8
    cmp r1, 0
    jne __sym_select_yes_96
    mov r1, 0
    jmp __sym_select_done_97
__sym_select_yes_96:
    mov r1, 127
__sym_select_done_97:
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
    call __sym_fn_offset_21
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
    jmp __sym_block_15
__sym_block_15:
    sub r12, r13, 80
    load_32 r1, [r12]
    cmp r1, 0
    jne __sym_select_yes_98
    sub r12, r13, 40
    load_32 r1, [r12]
    jmp __sym_select_done_99
__sym_select_yes_98:
    sub r12, r13, 112
    load_32 r1, [r12]
__sym_select_done_99:
    sub r12, r13, 120
    store_32 [r12], r1
    sub r12, r13, 80
    load_32 r1, [r12]
    cmp r1, 0
    jne __sym_select_yes_100
    sub r12, r13, 48
    load_32 r1, [r12]
    jmp __sym_select_done_101
__sym_select_yes_100:
    sub r12, r13, 104
    load_32 r1, [r12]
__sym_select_done_101:
    sub r12, r13, 124
    store_32 [r12], r1
    sub r12, r13, 80
    load_32 r1, [r12]
    cmp r1, 0
    jne __sym_select_yes_102
    sub r12, r13, 112
    load_32 r1, [r12]
    jmp __sym_select_done_103
__sym_select_yes_102:
    sub r12, r13, 56
    load_32 r1, [r12]
__sym_select_done_103:
    sub r12, r13, 128
    store_32 [r12], r1
    sub r12, r13, 80
    load_32 r1, [r12]
    cmp r1, 0
    jne __sym_select_yes_104
    sub r12, r13, 104
    load_32 r1, [r12]
    jmp __sym_select_done_105
__sym_select_yes_104:
    sub r12, r13, 64
    load_32 r1, [r12]
__sym_select_done_105:
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
    jmp __sym_block_16
__sym_block_16:
    sub r12, r13, 136
    load_32 r1, [r12]
    mov r2, 0
    cmp r1, r2
    je __sym_switch_106
    mov r2, 2
    cmp r1, r2
    je __sym_switch_107
    jmp __sym_block_20
__sym_switch_106:
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
    jmp __sym_block_10
__sym_switch_107:
    jmp __sym_block_17
__sym_block_17:
    sub r12, r13, 152
    load_32 r1, [r12]
    sub r12, r13, 168
    load_32 r2, [r12]
    cmp r1, r2
    jg __sym_cmp_yes_108
    mov r1, 0
    jmp __sym_cmp_done_109
__sym_cmp_yes_108:
    mov r1, 1
__sym_cmp_done_109:
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
    jg __sym_cmp_yes_110
    mov r1, 0
    jmp __sym_cmp_done_111
__sym_cmp_yes_110:
    mov r1, 1
__sym_cmp_done_111:
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
    jne __sym_select_yes_112
    mov r1, 65535
    lsl r1, r1, 16
    or r1, r1, 65535
    jmp __sym_select_done_113
__sym_select_yes_112:
    mov r1, 1
__sym_select_done_113:
    sub r12, r13, 184
    store_32 [r12], r1
    mov r1, r7
    cmp r1, 0
    jne __sym_select_yes_114
    mov r1, r9
    jmp __sym_select_done_115
__sym_select_yes_114:
    mov r1, r8
__sym_select_done_115:
    sub r12, r13, 188
    store_32 [r12], r1
    sub r12, r13, 176
    load_32 r1, [r12]
    cmp r1, 0
    jne __sym_select_yes_116
    mov r1, 65535
    lsl r1, r1, 16
    or r1, r1, 65535
    jmp __sym_select_done_117
__sym_select_yes_116:
    mov r1, 1
__sym_select_done_117:
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
    je __sym_cmp_yes_118
    mov r1, 0
    jmp __sym_cmp_done_119
__sym_cmp_yes_118:
    mov r1, 1
__sym_cmp_done_119:
    and r1, r1, 1
    mov r7, r1
    sub r12, r13, 160
    load_32 r1, [r12]
    sub r12, r13, 144
    load_32 r2, [r12]
    cmp r1, r2
    je __sym_cmp_yes_120
    mov r1, 0
    jmp __sym_cmp_done_121
__sym_cmp_yes_120:
    mov r1, 1
__sym_cmp_done_121:
    and r1, r1, 1
    mov r8, r1
    mov r1, r7
    cmp r1, 0
    jne __sym_select_yes_122
    mov r1, 0
    jmp __sym_select_done_123
__sym_select_yes_122:
    mov r1, r8
__sym_select_done_123:
    and r1, r1, 1
    mov r9, r1
    mov r1, r9
    cmp r1, 0
    jne __sym_edge_true_124
    jmp __sym_block_18
__sym_edge_true_124:
    jmp __sym_block_20
__sym_block_18:
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
    jmp __sym_block_19
__sym_block_19:
    sub r12, r13, 208
    load_32 r1, [r12]
    mov r2, 1
    lsl r1, r1, r2
    mov r7, r1
    mov r1, r7
    sub r12, r13, 188
    load_32 r2, [r12]
    cmp r1, r2
    jl __sym_cmp_yes_125
    mov r1, 0
    jmp __sym_cmp_done_126
__sym_cmp_yes_125:
    mov r1, 1
__sym_cmp_done_126:
    and r1, r1, 1
    mov r8, r1
    mov r1, r8
    cmp r1, 0
    jne __sym_select_yes_127
    sub r12, r13, 188
    load_32 r1, [r12]
    jmp __sym_select_done_128
__sym_select_yes_127:
    mov r1, 0
__sym_select_done_128:
    mov r9, r1
    mov r1, r9
    sub r12, r13, 208
    load_32 r2, [r12]
    add r1, r1, r2
    mov r10, r1
    mov r1, r8
    cmp r1, 0
    jne __sym_select_yes_129
    sub r12, r13, 192
    load_32 r1, [r12]
    jmp __sym_select_done_130
__sym_select_yes_129:
    mov r1, 0
__sym_select_done_130:
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
    jg __sym_cmp_yes_131
    mov r1, 0
    jmp __sym_cmp_done_132
__sym_cmp_yes_131:
    mov r1, 1
__sym_cmp_done_132:
    and r1, r1, 1
    mov r8, r1
    mov r1, r8
    cmp r1, 0
    jne __sym_select_yes_133
    sub r12, r13, 184
    load_32 r1, [r12]
    jmp __sym_select_done_134
__sym_select_yes_133:
    mov r1, 0
__sym_select_done_134:
    mov r7, r1
    mov r1, r7
    sub r12, r13, 216
    load_32 r2, [r12]
    add r1, r1, r2
    sub r12, r13, 228
    store_32 [r12], r1
    mov r1, r8
    cmp r1, 0
    jne __sym_select_yes_135
    sub r12, r13, 180
    load_32 r1, [r12]
    jmp __sym_select_done_136
__sym_select_yes_135:
    mov r1, 0
__sym_select_done_136:
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
    je __sym_cmp_yes_137
    mov r1, 0
    jmp __sym_cmp_done_138
__sym_cmp_yes_137:
    mov r1, 1
__sym_cmp_done_138:
    and r1, r1, 1
    mov r7, r1
    sub r12, r13, 228
    load_32 r1, [r12]
    sub r12, r13, 144
    load_32 r2, [r12]
    cmp r1, r2
    je __sym_cmp_yes_139
    mov r1, 0
    jmp __sym_cmp_done_140
__sym_cmp_yes_139:
    mov r1, 1
__sym_cmp_done_140:
    and r1, r1, 1
    mov r8, r1
    mov r1, r7
    cmp r1, 0
    jne __sym_select_yes_141
    mov r1, 0
    jmp __sym_select_done_142
__sym_select_yes_141:
    mov r1, r8
__sym_select_done_142:
    and r1, r1, 1
    mov r9, r1
    mov r1, r9
    cmp r1, 0
    jne __sym_edge_true_143
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
    jmp __sym_block_19
__sym_edge_true_143:
    jmp __sym_block_20
__sym_block_20:
    mov r1, 0
    mov sp, r13
    pop r13
    ret

; function offset, frame 24 bytes
__sym_fn_offset_21:
    push r13
    mov r13, sp
    sub sp, sp, 24
    sub r12, r13, 4
    store_32 [r12], r1
    sub r12, r13, 8
    store_32 [r12], r2
    sub r12, r13, 12
    store_32 [r12], r3
__sym_block_22:
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
    jl __sym_cmp_yes_144
    mov r1, 0
    jmp __sym_cmp_done_145
__sym_cmp_yes_144:
    mov r1, 1
__sym_cmp_done_145:
    and r1, r1, 1
    mov r10, r1
    mov r1, r10
    cmp r1, 0
    jne __sym_select_yes_146
    mov r1, r9
    jmp __sym_select_done_147
__sym_select_yes_146:
    mov r1, r7
__sym_select_done_147:
    mov r8, r1
    mov r1, r8
    mov sp, r13
    pop r13
    ret

; function gfx_rect, frame 112 bytes
__sym_fn_gfx_rect_23:
    push r13
    mov r13, sp
    sub sp, sp, 112
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
__sym_block_24:
    sub r12, r13, 12
    load_32 r1, [r12]
    mov r2, 1
    lsl r1, r1, 16
    asr r1, r1, 16
    lsl r2, r2, 16
    asr r2, r2, 16
    cmp r1, r2
    jl __sym_cmp_yes_148
    mov r1, 0
    jmp __sym_cmp_done_149
__sym_cmp_yes_148:
    mov r1, 1
__sym_cmp_done_149:
    and r1, r1, 1
    mov r7, r1
    sub r12, r13, 16
    load_32 r1, [r12]
    mov r2, 1
    lsl r1, r1, 16
    asr r1, r1, 16
    lsl r2, r2, 16
    asr r2, r2, 16
    cmp r1, r2
    jl __sym_cmp_yes_150
    mov r1, 0
    jmp __sym_cmp_done_151
__sym_cmp_yes_150:
    mov r1, 1
__sym_cmp_done_151:
    and r1, r1, 1
    mov r8, r1
    mov r1, r7
    mov r2, r8
    or r1, r1, r2
    and r1, r1, 1
    mov r9, r1
    mov r1, r9
    cmp r1, 0
    jne __sym_edge_true_152
    jmp __sym_block_25
__sym_edge_true_152:
    jmp __sym_block_39
__sym_block_25:
    sub r12, r13, 16
    load_32 r1, [r12]
    mov r7, r1
    sub r12, r13, 12
    load_32 r1, [r12]
    mov r8, r1
    sub r12, r13, 4
    load_32 r1, [r12]
    lsl r1, r1, 16
    asr r1, r1, 16
    sub r12, r13, 24
    store_32 [r12], r1
    sub r12, r13, 24
    load_32 r1, [r12]
    mov r2, 65535
    lsl r2, r2, 16
    or r2, r2, 65535
    add r1, r1, r2
    mov r9, r1
    mov r1, r9
    mov r2, r8
    add r1, r1, r2
    sub r12, r13, 28
    store_32 [r12], r1
    sub r12, r13, 8
    load_32 r1, [r12]
    lsl r1, r1, 16
    asr r1, r1, 16
    sub r12, r13, 32
    store_32 [r12], r1
    sub r12, r13, 32
    load_32 r1, [r12]
    mov r2, 65535
    lsl r2, r2, 16
    or r2, r2, 65535
    add r1, r1, r2
    mov r8, r1
    mov r1, r8
    mov r2, r7
    add r1, r1, r2
    sub r12, r13, 36
    store_32 [r12], r1
    sub r12, r13, 24
    load_32 r1, [r12]
    mov r2, 0
    cmp r1, r2
    jge __sym_minmax_153
    mov r1, r2
__sym_minmax_153:
    sub r12, r13, 40
    store_32 [r12], r1
    sub r12, r13, 28
    load_32 r1, [r12]
    mov r2, 127
    cmp r1, r2
    jle __sym_minmax_154
    mov r1, r2
__sym_minmax_154:
    sub r12, r13, 44
    store_32 [r12], r1
    sub r12, r13, 32
    load_32 r1, [r12]
    mov r2, 0
    cmp r1, r2
    jge __sym_minmax_155
    mov r1, r2
__sym_minmax_155:
    sub r12, r13, 48
    store_32 [r12], r1
    sub r12, r13, 36
    load_32 r1, [r12]
    mov r2, 95
    cmp r1, r2
    jle __sym_minmax_156
    mov r1, r2
__sym_minmax_156:
    sub r12, r13, 52
    store_32 [r12], r1
    sub r12, r13, 40
    load_32 r1, [r12]
    sub r12, r13, 44
    load_32 r2, [r12]
    cmp r1, r2
    jg __sym_cmp_yes_157
    mov r1, 0
    jmp __sym_cmp_done_158
__sym_cmp_yes_157:
    mov r1, 1
__sym_cmp_done_158:
    and r1, r1, 1
    mov r7, r1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_159
    jmp __sym_block_26
__sym_edge_true_159:
    jmp __sym_block_27
__sym_block_26:
    sub r12, r13, 8
    load_32 r1, [r12]
    mov r2, 96
    cmp r1, r2
    jb __sym_cmp_yes_160
    mov r1, 0
    jmp __sym_cmp_done_161
__sym_cmp_yes_160:
    mov r1, 1
__sym_cmp_done_161:
    and r1, r1, 1
    sub r12, r13, 56
    store_32 [r12], r1
    sub r12, r13, 32
    load_32 r1, [r12]
    mov r2, 7
    lsl r1, r1, r2
    mov r7, r1
    mov r1, 1
    lsl r1, r1, 16
    mov r2, r7
    add r1, r1, r2
    sub r12, r13, 60
    store_32 [r12], r1
    sub r12, r13, 36
    load_32 r1, [r12]
    mov r2, 96
    cmp r1, r2
    jb __sym_cmp_yes_162
    mov r1, 0
    jmp __sym_cmp_done_163
__sym_cmp_yes_162:
    mov r1, 1
__sym_cmp_done_163:
    and r1, r1, 1
    sub r12, r13, 64
    store_32 [r12], r1
    sub r12, r13, 36
    load_32 r1, [r12]
    mov r2, 7
    lsl r1, r1, r2
    mov r7, r1
    mov r1, 1
    lsl r1, r1, 16
    mov r2, r7
    add r1, r1, r2
    sub r12, r13, 68
    store_32 [r12], r1
    sub r12, r13, 40
    load_32 r1, [r12]
    sub r12, r13, 92
    store_32 [r12], r1
    sub r12, r13, 92
    load_32 r1, [r12]
    sub r12, r13, 88
    store_32 [r12], r1
    jmp __sym_block_29
__sym_block_27:
    mov r1, 1
    lsl r1, r1, 16
    sub r12, r13, 24
    load_32 r2, [r12]
    add r1, r1, r2
    sub r12, r13, 72
    store_32 [r12], r1
    mov r1, 1
    lsl r1, r1, 16
    sub r12, r13, 28
    load_32 r2, [r12]
    add r1, r1, r2
    sub r12, r13, 76
    store_32 [r12], r1
    sub r12, r13, 48
    load_32 r1, [r12]
    sub r12, r13, 52
    load_32 r2, [r12]
    cmp r1, r2
    jg __sym_cmp_yes_164
    mov r1, 0
    jmp __sym_cmp_done_165
__sym_cmp_yes_164:
    mov r1, 1
__sym_cmp_done_165:
    and r1, r1, 1
    mov r7, r1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_166
    jmp __sym_block_28
__sym_edge_true_166:
    jmp __sym_block_39
__sym_block_28:
    sub r12, r13, 4
    load_32 r1, [r12]
    mov r2, 128
    cmp r1, r2
    jb __sym_cmp_yes_167
    mov r1, 0
    jmp __sym_cmp_done_168
__sym_cmp_yes_167:
    mov r1, 1
__sym_cmp_done_168:
    and r1, r1, 1
    sub r12, r13, 80
    store_32 [r12], r1
    sub r12, r13, 28
    load_32 r1, [r12]
    mov r2, 128
    cmp r1, r2
    jb __sym_cmp_yes_169
    mov r1, 0
    jmp __sym_cmp_done_170
__sym_cmp_yes_169:
    mov r1, 1
__sym_cmp_done_170:
    and r1, r1, 1
    sub r12, r13, 84
    store_32 [r12], r1
    sub r12, r13, 48
    load_32 r1, [r12]
    sub r12, r13, 104
    store_32 [r12], r1
    sub r12, r13, 104
    load_32 r1, [r12]
    sub r12, r13, 100
    store_32 [r12], r1
    jmp __sym_block_34
__sym_block_29:
    sub r12, r13, 56
    load_32 r1, [r12]
    cmp r1, 0
    jne __sym_edge_true_171
    jmp __sym_block_31
__sym_edge_true_171:
    jmp __sym_block_30
__sym_block_30:
    sub r12, r13, 60
    load_32 r1, [r12]
    sub r12, r13, 88
    load_32 r2, [r12]
    add r1, r1, r2
    mov r7, r1
    sub r12, r13, 20
    load_32 r1, [r12]
    mov r2, r7
    store_8 [r2], r1
    jmp __sym_block_31
__sym_block_31:
    sub r12, r13, 64
    load_32 r1, [r12]
    cmp r1, 0
    jne __sym_edge_true_172
    jmp __sym_block_33
__sym_edge_true_172:
    jmp __sym_block_32
__sym_block_32:
    sub r12, r13, 68
    load_32 r1, [r12]
    sub r12, r13, 88
    load_32 r2, [r12]
    add r1, r1, r2
    mov r7, r1
    sub r12, r13, 20
    load_32 r1, [r12]
    mov r2, r7
    store_8 [r2], r1
    jmp __sym_block_33
__sym_block_33:
    sub r12, r13, 88
    load_32 r1, [r12]
    mov r2, 1
    add r1, r1, r2
    sub r12, r13, 96
    store_32 [r12], r1
    sub r12, r13, 88
    load_32 r1, [r12]
    sub r12, r13, 44
    load_32 r2, [r12]
    cmp r1, r2
    jl __sym_cmp_yes_173
    mov r1, 0
    jmp __sym_cmp_done_174
__sym_cmp_yes_173:
    mov r1, 1
__sym_cmp_done_174:
    and r1, r1, 1
    mov r7, r1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_175
    jmp __sym_block_27
__sym_edge_true_175:
    sub r12, r13, 96
    load_32 r1, [r12]
    sub r12, r13, 92
    store_32 [r12], r1
    sub r12, r13, 92
    load_32 r1, [r12]
    sub r12, r13, 88
    store_32 [r12], r1
    jmp __sym_block_29
__sym_block_34:
    sub r12, r13, 80
    load_32 r1, [r12]
    cmp r1, 0
    jne __sym_edge_true_176
    jmp __sym_block_36
__sym_edge_true_176:
    jmp __sym_block_35
__sym_block_35:
    sub r12, r13, 100
    load_32 r1, [r12]
    mov r2, 7
    lsl r1, r1, r2
    mov r7, r1
    sub r12, r13, 72
    load_32 r1, [r12]
    mov r2, r7
    add r1, r1, r2
    mov r8, r1
    sub r12, r13, 20
    load_32 r1, [r12]
    mov r2, r8
    store_8 [r2], r1
    jmp __sym_block_36
__sym_block_36:
    sub r12, r13, 84
    load_32 r1, [r12]
    cmp r1, 0
    jne __sym_edge_true_177
    jmp __sym_block_38
__sym_edge_true_177:
    jmp __sym_block_37
__sym_block_37:
    sub r12, r13, 100
    load_32 r1, [r12]
    mov r2, 7
    lsl r1, r1, r2
    mov r7, r1
    sub r12, r13, 76
    load_32 r1, [r12]
    mov r2, r7
    add r1, r1, r2
    mov r8, r1
    sub r12, r13, 20
    load_32 r1, [r12]
    mov r2, r8
    store_8 [r2], r1
    jmp __sym_block_38
__sym_block_38:
    sub r12, r13, 100
    load_32 r1, [r12]
    mov r2, 1
    add r1, r1, r2
    sub r12, r13, 108
    store_32 [r12], r1
    sub r12, r13, 100
    load_32 r1, [r12]
    sub r12, r13, 52
    load_32 r2, [r12]
    cmp r1, r2
    jl __sym_cmp_yes_178
    mov r1, 0
    jmp __sym_cmp_done_179
__sym_cmp_yes_178:
    mov r1, 1
__sym_cmp_done_179:
    and r1, r1, 1
    mov r7, r1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_180
    jmp __sym_block_39
__sym_edge_true_180:
    sub r12, r13, 108
    load_32 r1, [r12]
    sub r12, r13, 104
    store_32 [r12], r1
    sub r12, r13, 104
    load_32 r1, [r12]
    sub r12, r13, 100
    store_32 [r12], r1
    jmp __sym_block_34
__sym_block_39:
    mov r1, 0
    mov sp, r13
    pop r13
    ret

; Global addresses (zero tail uses initially zeroed RAM).
; framebuffer = 65536
