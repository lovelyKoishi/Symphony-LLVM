; Symphony LLVM backend 0.1. Big endian, 32-bit values/pointers.
__sym_start:
    mov sp, 256
    lsl sp, sp, 16
    call __sym_fn_main_0
__sym_halt:
    jmp __sym_halt
__sym_trap:
    jmp __sym_trap

; function main, frame 72 bytes
__sym_fn_main_0:
    push r13
    mov r13, sp
    sub sp, sp, 72
__sym_block_1:
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 280
    load_32 r7, [r2]
    mov r2, 0
    cmp r7, r2
    je __sym_edge_true_131
    jmp __sym_block_2
__sym_edge_true_131:
    jmp __sym_block_3
__sym_block_2:
    mov r1, 0
    pload r1, [r1]
    mov r7, r1
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 284
    store_32 [r2], r7
    mov r1, 0
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 280
    store_32 [r2], r1
    jmp __sym_block_3
__sym_block_3:
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 284
    load_32 r8, [r2]
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 280
    load_32 r7, [r2]
    mov r2, 0
    cmp r7, r2
    je __sym_edge_true_132
    jmp __sym_block_4
__sym_edge_true_132:
    jmp __sym_block_5
__sym_block_4:
    mov r1, 0
    pload r1, [r1]
    mov r7, r1
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 284
    store_32 [r2], r7
    mov r1, 0
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 280
    store_32 [r2], r1
    jmp __sym_block_5
__sym_block_5:
    lsr r8, r8, 24
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 284
    load_32 r7, [r2]
    lsr r7, r7, 8
    and r7, r7, 65280
    or r7, r7, r8
    mov r2, 19778
    cmp r7, r2
    je __sym_edge_true_133
    jmp __sym_block_6
__sym_edge_true_133:
    jmp __sym_block_7
__sym_block_6:
    call __sym_fn_tty_init_56
    mov r1, 1
    lsl r1, r1, 16
    or r1, r1, 288
    call __sym_fn_tty_puts_102
    mov r1, 1
    lsl r1, r1, 16
    call __sym_fn_tty_puts_102
    mov r1, 10
    call __sym_fn_tty_putc_67
    mov r1, 0
    call __sym_fn_tty_set_cursor_visible_63
    mov r1, 1
    mov r7, r1
    jmp __sym_block_43
__sym_block_7:
    mov r1, 2
    call __sym_fn_le32_44
    sub r12, r13, 4
    store_32 [r12], r1
    sub r12, r13, 4
    load_32 r1, [r12]
    mov r2, 65279
    lsl r2, r2, 16
    or r2, r2, 65535
    add r7, r1, r2
    mov r2, 65280
    lsl r2, r2, 16
    or r2, r2, 53
    cmp r7, r2
    jb __sym_edge_true_134
    jmp __sym_block_9
__sym_edge_true_134:
    jmp __sym_block_8
__sym_block_8:
    call __sym_fn_tty_init_56
    mov r1, 1
    lsl r1, r1, 16
    or r1, r1, 288
    call __sym_fn_tty_puts_102
    mov r1, 1
    lsl r1, r1, 16
    or r1, r1, 30
    call __sym_fn_tty_puts_102
    mov r1, 10
    call __sym_fn_tty_putc_67
    mov r1, 0
    call __sym_fn_tty_set_cursor_visible_63
    mov r1, 1
    mov r7, r1
    jmp __sym_block_43
__sym_block_9:
    mov r1, 10
    call __sym_fn_le32_44
    sub r12, r13, 8
    store_32 [r12], r1
    mov r1, 14
    call __sym_fn_le32_44
    mov r8, r1
    mov r1, r8
    mov r2, 124
    cmp r1, r2
    je __sym_switch_135
    mov r2, 108
    cmp r1, r2
    je __sym_switch_136
    mov r2, 40
    cmp r1, r2
    je __sym_switch_137
    jmp __sym_block_11
__sym_switch_135:
    jmp __sym_block_10
__sym_switch_136:
    jmp __sym_block_10
__sym_switch_137:
    jmp __sym_block_10
__sym_block_10:
    sub r12, r13, 4
    load_32 r1, [r12]
    mov r2, 65535
    lsl r2, r2, 16
    or r2, r2, 65522
    add r7, r1, r2
    cmp r8, r7
    ja __sym_edge_true_138
    jmp __sym_block_12
__sym_edge_true_138:
    jmp __sym_block_11
__sym_block_11:
    call __sym_fn_tty_init_56
    mov r1, 1
    lsl r1, r1, 16
    or r1, r1, 288
    call __sym_fn_tty_puts_102
    mov r1, 1
    lsl r1, r1, 16
    or r1, r1, 67
    call __sym_fn_tty_puts_102
    mov r1, 10
    call __sym_fn_tty_putc_67
    mov r1, 0
    call __sym_fn_tty_set_cursor_visible_63
    mov r1, 1
    mov r7, r1
    jmp __sym_block_43
__sym_block_12:
    add r7, r8, 14
    sub r12, r13, 8
    load_32 r1, [r12]
    cmp r1, r7
    jb __sym_cmp_yes_139
    mov r1, 0
    jmp __sym_cmp_done_140
__sym_cmp_yes_139:
    mov r1, 1
__sym_cmp_done_140:
    and r1, r1, 1
    mov r8, r1
    sub r12, r13, 8
    load_32 r1, [r12]
    sub r12, r13, 4
    load_32 r2, [r12]
    cmp r1, r2
    ja __sym_cmp_yes_141
    mov r1, 0
    jmp __sym_cmp_done_142
__sym_cmp_yes_141:
    mov r1, 1
__sym_cmp_done_142:
    and r1, r1, 1
    mov r7, r1
    or r7, r7, r8
    and r7, r7, 1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_143
    jmp __sym_block_14
__sym_edge_true_143:
    jmp __sym_block_13
__sym_block_13:
    call __sym_fn_tty_init_56
    mov r1, 1
    lsl r1, r1, 16
    or r1, r1, 288
    call __sym_fn_tty_puts_102
    mov r1, 1
    lsl r1, r1, 16
    or r1, r1, 105
    call __sym_fn_tty_puts_102
    mov r1, 10
    call __sym_fn_tty_putc_67
    mov r1, 0
    call __sym_fn_tty_set_cursor_visible_63
    mov r1, 1
    mov r7, r1
    jmp __sym_block_43
__sym_block_14:
    mov r1, 18
    call __sym_fn_le32_44
    sub r12, r13, 12
    store_32 [r12], r1
    mov r1, 22
    call __sym_fn_le32_44
    sub r12, r13, 16
    store_32 [r12], r1
    sub r12, r13, 16
    load_32 r1, [r12]
    asr r2, r1, 31
    xor r1, r1, r2
    sub r1, r1, r2
    sub r12, r13, 20
    store_32 [r12], r1
    sub r12, r13, 12
    load_32 r1, [r12]
    mov r2, 65535
    lsl r2, r2, 16
    add r7, r1, r2
    mov r2, 65535
    lsl r2, r2, 16
    or r2, r2, 1
    cmp r7, r2
    jb __sym_cmp_yes_144
    mov r1, 0
    jmp __sym_cmp_done_145
__sym_cmp_yes_144:
    mov r1, 1
__sym_cmp_done_145:
    and r1, r1, 1
    mov r9, r1
    sub r12, r13, 16
    load_32 r1, [r12]
    mov r2, 0
    cmp r1, r2
    je __sym_cmp_yes_146
    mov r1, 0
    jmp __sym_cmp_done_147
__sym_cmp_yes_146:
    mov r1, 1
__sym_cmp_done_147:
    and r1, r1, 1
    mov r8, r1
    sub r12, r13, 20
    load_32 r1, [r12]
    mov r2, 65535
    cmp r1, r2
    ja __sym_cmp_yes_148
    mov r1, 0
    jmp __sym_cmp_done_149
__sym_cmp_yes_148:
    mov r1, 1
__sym_cmp_done_149:
    and r1, r1, 1
    mov r7, r1
    or r7, r8, r7
    and r7, r7, 1
    mov r1, r9
    cmp r1, 0
    jne __sym_select_yes_150
    mov r1, r7
    jmp __sym_select_done_151
__sym_select_yes_150:
    mov r1, 1
__sym_select_done_151:
    and r1, r1, 1
    mov r7, r1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_152
    jmp __sym_block_16
__sym_edge_true_152:
    jmp __sym_block_15
__sym_block_15:
    call __sym_fn_tty_init_56
    mov r1, 1
    lsl r1, r1, 16
    or r1, r1, 288
    call __sym_fn_tty_puts_102
    mov r1, 1
    lsl r1, r1, 16
    or r1, r1, 131
    call __sym_fn_tty_puts_102
    mov r1, 10
    call __sym_fn_tty_putc_67
    mov r1, 0
    call __sym_fn_tty_set_cursor_visible_63
    mov r1, 1
    mov r7, r1
    jmp __sym_block_43
__sym_block_16:
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 280
    load_32 r7, [r2]
    mov r2, 28
    cmp r7, r2
    je __sym_edge_true_153
    jmp __sym_block_17
__sym_edge_true_153:
    jmp __sym_block_18
__sym_block_17:
    mov r1, 28
    pload r1, [r1]
    mov r7, r1
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 284
    store_32 [r2], r7
    mov r1, 28
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 280
    store_32 [r2], r1
    jmp __sym_block_18
__sym_block_18:
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 284
    load_32 r8, [r2]
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 280
    load_32 r7, [r2]
    mov r2, 28
    cmp r7, r2
    je __sym_edge_true_154
    jmp __sym_block_19
__sym_edge_true_154:
    jmp __sym_block_20
__sym_block_19:
    mov r1, 28
    pload r1, [r1]
    mov r7, r1
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 284
    store_32 [r2], r7
    mov r1, 28
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 280
    store_32 [r2], r1
    jmp __sym_block_20
__sym_block_20:
    lsr r8, r8, 24
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 284
    load_32 r7, [r2]
    lsr r7, r7, 8
    and r7, r7, 65280
    or r9, r7, r8
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 280
    load_32 r7, [r2]
    mov r2, 24
    cmp r7, r2
    je __sym_edge_true_155
    jmp __sym_block_21
__sym_edge_true_155:
    jmp __sym_block_22
__sym_block_21:
    mov r1, 24
    pload r1, [r1]
    mov r7, r1
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 284
    store_32 [r2], r7
    mov r1, 24
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 280
    store_32 [r2], r1
    jmp __sym_block_22
__sym_block_22:
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 284
    load_32 r8, [r2]
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 280
    load_32 r7, [r2]
    mov r2, 24
    cmp r7, r2
    je __sym_edge_true_156
    jmp __sym_block_23
__sym_edge_true_156:
    jmp __sym_block_24
__sym_block_23:
    mov r1, 24
    pload r1, [r1]
    mov r7, r1
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 284
    store_32 [r2], r7
    mov r1, 24
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 280
    store_32 [r2], r1
    jmp __sym_block_24
__sym_block_24:
    lsr r7, r8, 8
    and r8, r7, 255
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 284
    load_32 r7, [r2]
    lsl r7, r7, 8
    and r7, r7, 65280
    or r7, r7, r8
    mov r2, 1
    cmp r7, r2
    je __sym_edge_true_157
    jmp __sym_block_27
__sym_edge_true_157:
    jmp __sym_block_25
__sym_block_25:
    mov r1, r9
    and r1, r1, 65535
    mov r7, r1
    mov r1, r7
    mov r2, 32
    cmp r1, r2
    je __sym_switch_158
    mov r2, 24
    cmp r1, r2
    je __sym_switch_159
    jmp __sym_block_27
__sym_switch_158:
    jmp __sym_block_26
__sym_switch_159:
    jmp __sym_block_26
__sym_block_26:
    sub r12, r13, 68
    store_32 [r12], r9
    mov r1, 30
    call __sym_fn_le32_44
    sub r12, r13, 68
    load_32 r9, [r12]
    mov r7, r1
    mov r2, 0
    cmp r7, r2
    je __sym_edge_true_160
    jmp __sym_block_27
__sym_edge_true_160:
    jmp __sym_block_28
__sym_block_27:
    call __sym_fn_tty_init_56
    mov r1, 1
    lsl r1, r1, 16
    or r1, r1, 288
    call __sym_fn_tty_puts_102
    mov r1, 1
    lsl r1, r1, 16
    or r1, r1, 180
    call __sym_fn_tty_puts_102
    mov r1, 10
    call __sym_fn_tty_putc_67
    mov r1, 0
    call __sym_fn_tty_set_cursor_visible_63
    mov r1, 1
    mov r7, r1
    jmp __sym_block_43
__sym_block_28:
    lsr r1, r9, 3
    sub r12, r13, 24
    store_32 [r12], r1
    sub r12, r13, 24
    load_32 r1, [r12]
    sub r12, r13, 12
    load_32 r2, [r12]
    mul r7, r1, r2
    add r7, r7, 3
    mov r2, 15
    lsl r2, r2, 16
    or r2, r2, 65532
    and r1, r7, r2
    sub r12, r13, 28
    store_32 [r12], r1
    sub r12, r13, 4
    load_32 r1, [r12]
    sub r12, r13, 8
    load_32 r2, [r12]
    sub r7, r1, r2
    sub r12, r13, 28
    load_32 r2, [r12]
    div r7, r7, r2
    sub r12, r13, 20
    load_32 r1, [r12]
    cmp r1, r7
    ja __sym_edge_true_161
    jmp __sym_block_30
__sym_edge_true_161:
    jmp __sym_block_29
__sym_block_29:
    mov r1, 1
    lsl r1, r1, 16
    or r1, r1, 230
    call __sym_fn_error_54
    mov r1, 1
    mov r7, r1
    jmp __sym_block_43
__sym_block_30:
    sub r12, r13, 12
    load_32 r1, [r12]
    mov r2, 1024
    cmp r1, r2
    ja __sym_cmp_yes_162
    mov r1, 0
    jmp __sym_cmp_done_163
__sym_cmp_yes_162:
    mov r1, 1
__sym_cmp_done_163:
    and r1, r1, 1
    mov r8, r1
    sub r12, r13, 20
    load_32 r1, [r12]
    mov r2, 768
    cmp r1, r2
    ja __sym_cmp_yes_164
    mov r1, 0
    jmp __sym_cmp_done_165
__sym_cmp_yes_164:
    mov r1, 1
__sym_cmp_done_165:
    and r1, r1, 1
    mov r7, r1
    mov r1, r8
    cmp r1, 0
    jne __sym_select_yes_166
    mov r1, r7
    jmp __sym_select_done_167
__sym_select_yes_166:
    mov r1, 1
__sym_select_done_167:
    and r1, r1, 1
    mov r7, r1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_168
    sub r12, r13, 20
    load_32 r1, [r12]
    sub r12, r13, 32
    store_32 [r12], r1
    sub r12, r13, 12
    load_32 r1, [r12]
    sub r12, r13, 36
    store_32 [r12], r1
    jmp __sym_block_34
__sym_edge_true_168:
    jmp __sym_block_31
__sym_block_31:
    sub r12, r13, 12
    load_32 r1, [r12]
    mul r7, r1, 768
    sub r12, r13, 20
    load_32 r1, [r12]
    lsl r8, r1, 10
    cmp r7, r8
    jb __sym_edge_true_169
    jmp __sym_block_32
__sym_edge_true_169:
    jmp __sym_block_33
__sym_block_32:
    sub r12, r13, 12
    load_32 r2, [r12]
    div r7, r8, r2
    sub r12, r13, 12
    load_32 r1, [r12]
    cmp r1, r8
    ja __sym_cmp_yes_170
    mov r1, 0
    jmp __sym_cmp_done_171
__sym_cmp_yes_170:
    mov r1, 1
__sym_cmp_done_171:
    and r1, r1, 1
    mov r8, r1
    mov r1, r8
    cmp r1, 0
    jne __sym_select_yes_172
    mov r1, r7
    jmp __sym_select_done_173
__sym_select_yes_172:
    mov r1, 1
__sym_select_done_173:
    mov r7, r1
    sub r12, r13, 32
    store_32 [r12], r7
    mov r1, 1024
    sub r12, r13, 36
    store_32 [r12], r1
    jmp __sym_block_34
__sym_block_33:
    sub r12, r13, 20
    load_32 r2, [r12]
    div r8, r7, r2
    sub r12, r13, 20
    load_32 r1, [r12]
    cmp r1, r7
    ja __sym_cmp_yes_174
    mov r1, 0
    jmp __sym_cmp_done_175
__sym_cmp_yes_174:
    mov r1, 1
__sym_cmp_done_175:
    and r1, r1, 1
    mov r7, r1
    mov r1, r7
    cmp r1, 0
    jne __sym_select_yes_176
    mov r1, r8
    jmp __sym_select_done_177
__sym_select_yes_176:
    mov r1, 1
__sym_select_done_177:
    mov r7, r1
    mov r1, 768
    sub r12, r13, 32
    store_32 [r12], r1
    sub r12, r13, 36
    store_32 [r12], r7
    jmp __sym_block_34
__sym_block_34:
    sub r12, r13, 36
    load_32 r1, [r12]
    add r7, r1, 3
    lsr r8, r7, 2
    sub r12, r13, 32
    load_32 r1, [r12]
    add r7, r1, 2
    div r7, r7, 3
    mov r1, r7
    mov r2, r8
    cmp r1, r2
    jae __sym_minmax_178
    mov r1, r2
__sym_minmax_178:
    mov r10, r1
    lsl r1, r10, 2
    sub r12, r13, 40
    store_32 [r12], r1
    mul r7, r10, 3
    sub r12, r13, 40
    load_32 r1, [r12]
    sub r12, r13, 36
    load_32 r2, [r12]
    sub r8, r1, r2
    lsr r11, r8, 1
    sub r12, r13, 32
    load_32 r2, [r12]
    sub r8, r7, r2
    lsr r1, r8, 1
    sub r12, r13, 44
    store_32 [r12], r1
    sub r12, r13, 40
    load_32 r1, [r12]
    mul r9, r1, r7
    mov r2, 0
    cmp r9, r2
    je __sym_edge_true_179
    mov r1, 0
    mov r8, r1
    jmp __sym_block_37
__sym_edge_true_179:
    jmp __sym_block_35
__sym_block_35:
    mov r1, 0
    mov r2, 3
    screen r1, r2
    mov r2, 65535
    lsl r2, r2, 16
    or r2, r2, 65535
    add r7, r10, r2
    mov r1, 2
    mov r2, r7
    screen r1, r2
    mov r1, 1
    mov r2, 64
    lsl r2, r2, 16
    screen r1, r2
    mov r1, 64
    lsl r1, r1, 16
    mov r2, r11
    lsl r2, r2, 2
    add r1, r1, r2
    sub r12, r13, 48
    store_32 [r12], r1
    sub r12, r13, 32
    load_32 r1, [r12]
    mov r2, 0
    cmp r1, r2
    je __sym_edge_true_180
    jmp __sym_block_36
__sym_edge_true_180:
    mov r1, 0
    mov r7, r1
    jmp __sym_block_43
__sym_block_36:
    sub r12, r13, 16
    load_32 r1, [r12]
    mov r2, 0
    cmp r1, r2
    jl __sym_cmp_yes_181
    mov r1, 0
    jmp __sym_cmp_done_182
__sym_cmp_yes_181:
    mov r1, 1
__sym_cmp_done_182:
    and r1, r1, 1
    sub r12, r13, 52
    store_32 [r12], r1
    sub r12, r13, 36
    load_32 r1, [r12]
    mov r2, 0
    cmp r1, r2
    je __sym_edge_true_183
    mov r1, 0
    sub r12, r13, 56
    store_32 [r12], r1
    jmp __sym_block_38
__sym_edge_true_183:
    mov r1, 0
    mov r7, r1
    jmp __sym_block_43
__sym_block_37:
    mov r1, 64
    lsl r1, r1, 16
    mov r2, r8
    lsl r2, r2, 2
    add r1, r1, r2
    mov r7, r1
    mov r1, 0
    store_32 [r7], r1
    add r8, r8, 1
    cmp r8, r9
    je __sym_edge_true_184
    jmp __sym_block_37
__sym_edge_true_184:
    jmp __sym_block_35
__sym_block_38:
    sub r12, r13, 56
    load_32 r1, [r12]
    sub r12, r13, 20
    load_32 r2, [r12]
    mul r7, r1, r2
    sub r12, r13, 32
    load_32 r2, [r12]
    div r8, r7, r2
    mov r2, 65535
    lsl r2, r2, 16
    or r2, r2, 65535
    xor r7, r8, r2
    sub r12, r13, 20
    load_32 r1, [r12]
    add r7, r1, r7
    sub r12, r13, 52
    load_32 r1, [r12]
    cmp r1, 0
    jne __sym_select_yes_185
    mov r1, r7
    jmp __sym_select_done_186
__sym_select_yes_185:
    mov r1, r8
__sym_select_done_186:
    mov r7, r1
    sub r12, r13, 28
    load_32 r2, [r12]
    mul r7, r7, r2
    sub r12, r13, 8
    load_32 r2, [r12]
    add r1, r7, r2
    sub r12, r13, 60
    store_32 [r12], r1
    sub r12, r13, 56
    load_32 r1, [r12]
    sub r12, r13, 44
    load_32 r2, [r12]
    add r7, r1, r2
    sub r12, r13, 40
    load_32 r2, [r12]
    mul r7, r7, r2
    sub r12, r13, 48
    load_32 r1, [r12]
    mov r2, r7
    lsl r2, r2, 2
    add r1, r1, r2
    sub r12, r13, 64
    store_32 [r12], r1
    mov r1, 0
    mov r11, r1
    jmp __sym_block_40
__sym_block_39:
    sub r12, r13, 56
    load_32 r1, [r12]
    add r7, r1, 1
    sub r12, r13, 32
    load_32 r2, [r12]
    cmp r7, r2
    je __sym_edge_true_187
    sub r12, r13, 56
    store_32 [r12], r7
    jmp __sym_block_38
__sym_edge_true_187:
    mov r1, 0
    mov r7, r1
    jmp __sym_block_43
__sym_block_40:
    sub r12, r13, 12
    load_32 r2, [r12]
    mul r7, r11, r2
    sub r12, r13, 36
    load_32 r2, [r12]
    div r7, r7, r2
    sub r12, r13, 24
    load_32 r2, [r12]
    mul r7, r7, r2
    sub r12, r13, 60
    load_32 r1, [r12]
    add r7, r1, r7
    and r10, r7, 3
    lsl r9, r10, 3
    mov r2, 65535
    lsl r2, r2, 16
    or r2, r2, 65532
    and r8, r7, r2
    mov r1, r8
    pload r1, [r1]
    mov r7, r1
    lsl r7, r7, r9
    mov r2, 1
    cmp r10, r2
    ja __sym_edge_true_188
    mov r9, r7
    jmp __sym_block_42
__sym_edge_true_188:
    jmp __sym_block_41
__sym_block_41:
    add r8, r8, 4
    mov r1, r8
    pload r1, [r1]
    mov r8, r1
    mov r1, 32
    sub r9, r1, r9
    lsr r8, r8, r9
    or r9, r8, r7
    jmp __sym_block_42
__sym_block_42:
    lsl r7, r9, 16
    mov r2, 65280
    lsl r2, r2, 16
    and r8, r7, r2
    mov r2, 255
    lsl r2, r2, 16
    and r7, r9, r2
    or r7, r8, r7
    lsr r8, r9, 16
    and r8, r8, 65280
    or r8, r7, r8
    sub r12, r13, 64
    load_32 r1, [r12]
    mov r2, r11
    lsl r2, r2, 2
    add r1, r1, r2
    mov r7, r1
    store_32 [r7], r8
    add r11, r11, 1
    sub r12, r13, 36
    load_32 r2, [r12]
    cmp r11, r2
    je __sym_edge_true_189
    jmp __sym_block_40
__sym_edge_true_189:
    jmp __sym_block_39
__sym_block_43:
    mov r1, r7
    mov sp, r13
    pop r13
    ret

; function le32, frame 24 bytes
__sym_fn_le32_44:
    push r13
    mov r13, sp
    sub sp, sp, 24
    mov r11, r1
__sym_block_45:
    and r8, r11, 28
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 280
    load_32 r7, [r2]
    cmp r8, r7
    je __sym_edge_true_190
    jmp __sym_block_46
__sym_edge_true_190:
    jmp __sym_block_47
__sym_block_46:
    mov r1, r8
    pload r1, [r1]
    mov r7, r1
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 284
    store_32 [r2], r7
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 280
    store_32 [r2], r8
    jmp __sym_block_47
__sym_block_47:
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 284
    load_32 r1, [r2]
    sub r12, r13, 4
    store_32 [r12], r1
    add r10, r11, 1
    and r8, r10, 60
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 280
    load_32 r7, [r2]
    cmp r8, r7
    je __sym_edge_true_191
    jmp __sym_block_48
__sym_edge_true_191:
    jmp __sym_block_49
__sym_block_48:
    mov r1, r8
    pload r1, [r1]
    mov r7, r1
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 284
    store_32 [r2], r7
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 280
    store_32 [r2], r8
    jmp __sym_block_49
__sym_block_49:
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 284
    load_32 r1, [r2]
    sub r12, r13, 8
    store_32 [r12], r1
    add r9, r11, 2
    and r8, r9, 60
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 280
    load_32 r7, [r2]
    cmp r8, r7
    je __sym_edge_true_192
    jmp __sym_block_50
__sym_edge_true_192:
    jmp __sym_block_51
__sym_block_50:
    mov r1, r8
    pload r1, [r1]
    mov r7, r1
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 284
    store_32 [r2], r7
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 280
    store_32 [r2], r8
    jmp __sym_block_51
__sym_block_51:
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 284
    load_32 r1, [r2]
    sub r12, r13, 12
    store_32 [r12], r1
    add r8, r11, 3
    and r7, r8, 60
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 280
    load_32 r1, [r2]
    sub r12, r13, 16
    store_32 [r12], r1
    sub r12, r13, 16
    load_32 r2, [r12]
    cmp r7, r2
    je __sym_edge_true_193
    jmp __sym_block_52
__sym_edge_true_193:
    jmp __sym_block_53
__sym_block_52:
    mov r1, r7
    pload r1, [r1]
    sub r12, r13, 20
    store_32 [r12], r1
    sub r12, r13, 20
    load_32 r1, [r12]
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 284
    store_32 [r2], r1
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 280
    store_32 [r2], r7
    jmp __sym_block_53
__sym_block_53:
    lsl r7, r11, 3
    and r7, r7, 24
    xor r7, r7, 24
    sub r12, r13, 4
    load_32 r1, [r12]
    lsr r7, r1, r7
    and r7, r7, 255
    lsl r10, r10, 3
    and r10, r10, 24
    xor r10, r10, 24
    sub r12, r13, 8
    load_32 r1, [r12]
    lsr r10, r1, r10
    lsl r10, r10, 8
    and r10, r10, 65280
    or r10, r10, r7
    lsl r7, r9, 3
    and r7, r7, 24
    xor r7, r7, 24
    sub r12, r13, 12
    load_32 r1, [r12]
    lsr r7, r1, r7
    lsl r7, r7, 16
    mov r2, 255
    lsl r2, r2, 16
    and r7, r7, r2
    or r9, r10, r7
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 284
    load_32 r10, [r2]
    lsl r7, r8, 3
    and r7, r7, 24
    xor r7, r7, 24
    lsr r7, r10, r7
    lsl r7, r7, 24
    or r7, r9, r7
    mov r1, r7
    mov sp, r13
    pop r13
    ret

; function error, frame 8 bytes
__sym_fn_error_54:
    push r13
    mov r13, sp
    sub sp, sp, 8
    sub r12, r13, 4
    store_32 [r12], r1
__sym_block_55:
    call __sym_fn_tty_init_56
    mov r1, 1
    lsl r1, r1, 16
    or r1, r1, 288
    call __sym_fn_tty_puts_102
    sub r12, r13, 4
    load_32 r1, [r12]
    call __sym_fn_tty_puts_102
    mov r1, 10
    call __sym_fn_tty_putc_67
    mov r1, 0
    call __sym_fn_tty_set_cursor_visible_63
    mov r1, 0
    mov sp, r13
    pop r13
    ret

; function tty_init, frame 0 bytes
__sym_fn_tty_init_56:
    push r13
    mov r13, sp
__sym_block_57:
    mov r1, 1
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 300
    store_8 [r2], r1
    mov r1, 0
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 304
    store_32 [r2], r1
    mov r1, 0
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 308
    store_32 [r2], r1
    mov r1, 0
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 312
    store_32 [r2], r1
    mov r1, 0
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 316
    store_32 [r2], r1
    mov r1, 0
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 320
    store_8 [r2], r1
    mov r1, 0
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 324
    store_32 [r2], r1
    mov r1, 0
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 328
    store_32 [r2], r1
    mov r1, 0
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 332
    store_32 [r2], r1
    mov r1, 0
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 336
    store_32 [r2], r1
    mov r1, 0
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 340
    store_32 [r2], r1
    call __sym_fn_tty_display_init_117
    call __sym_fn_reset_cursor_58
    mov r1, 0
    mov sp, r13
    pop r13
    ret

; function reset_cursor, frame 0 bytes
__sym_fn_reset_cursor_58:
    push r13
    mov r13, sp
__sym_block_59:
    mov r1, 1
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 344
    store_32 [r2], r1
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 340
    load_32 r7, [r2]
    mov r2, 0
    cmp r7, r2
    je __sym_edge_true_194
    jmp __sym_block_62
__sym_edge_true_194:
    jmp __sym_block_60
__sym_block_60:
    time_0 r1
    mov r7, r1
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 348
    store_32 [r2], r7
    time_1 r1
    mov r7, r1
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 352
    store_32 [r2], r7
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 340
    load_32 r7, [r2]
    mov r2, 0
    cmp r7, r2
    je __sym_edge_true_195
    jmp __sym_block_62
__sym_edge_true_195:
    jmp __sym_block_61
__sym_block_61:
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 308
    load_32 r7, [r2]
    mov r2, 0
    cmp r7, r2
    je __sym_cmp_yes_196
    mov r1, 0
    jmp __sym_cmp_done_197
__sym_cmp_yes_196:
    mov r1, 1
__sym_cmp_done_197:
    and r1, r1, 1
    mov r10, r1
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 304
    load_32 r9, [r2]
    add r8, r9, 1
    mov r2, 3839
    cmp r8, r2
    ja __sym_cmp_yes_198
    mov r1, 0
    jmp __sym_cmp_done_199
__sym_cmp_yes_198:
    mov r1, 1
__sym_cmp_done_199:
    and r1, r1, 1
    mov r7, r1
    or r7, r10, r7
    and r7, r7, 1
    mov r1, r7
    cmp r1, 0
    jne __sym_select_yes_200
    mov r1, r8
    jmp __sym_select_done_201
__sym_select_yes_200:
    mov r1, r9
__sym_select_done_201:
    mov r7, r1
    mov r1, r7
    mov r2, 1
    call __sym_fn_tty_display_cursor_111
    jmp __sym_block_62
__sym_block_62:
    mov r1, 0
    mov sp, r13
    pop r13
    ret

; function tty_set_cursor_visible, frame 8 bytes
__sym_fn_tty_set_cursor_visible_63:
    push r13
    mov r13, sp
    sub sp, sp, 8
    sub r12, r13, 4
    store_32 [r12], r1
__sym_block_64:
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 300
    load_8 r7, [r2]
    and r7, r7, 1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_202
    jmp __sym_block_65
__sym_edge_true_202:
    jmp __sym_block_66
__sym_block_65:
    call __sym_fn_tty_init_56
    jmp __sym_block_66
__sym_block_66:
    mov r1, 0
    mov r2, 0
    call __sym_fn_tty_display_cursor_111
    sub r12, r13, 4
    load_32 r1, [r12]
    mov r2, 0
    cmp r1, r2
    je __sym_cmp_yes_203
    mov r1, 0
    jmp __sym_cmp_done_204
__sym_cmp_yes_203:
    mov r1, 1
__sym_cmp_done_204:
    and r1, r1, 1
    mov r7, r1
    mov r1, r7
    mov r7, r1
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 340
    store_32 [r2], r7
    call __sym_fn_reset_cursor_58
    mov r1, 0
    mov sp, r13
    pop r13
    ret

; function tty_putc, frame 8 bytes
__sym_fn_tty_putc_67:
    push r13
    mov r13, sp
    sub sp, sp, 8
    sub r12, r13, 4
    store_32 [r12], r1
__sym_block_68:
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 300
    load_8 r7, [r2]
    and r7, r7, 1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_205
    jmp __sym_block_69
__sym_edge_true_205:
    jmp __sym_block_70
__sym_block_69:
    call __sym_fn_tty_init_56
    jmp __sym_block_70
__sym_block_70:
    mov r1, 0
    mov r2, 0
    call __sym_fn_tty_display_cursor_111
    sub r12, r13, 4
    load_32 r1, [r12]
    and r7, r1, 255
    mov r1, r7
    call __sym_fn_render_71
    call __sym_fn_reset_cursor_58
    mov r1, 0
    mov sp, r13
    pop r13
    ret

; function render, frame 8 bytes
__sym_fn_render_71:
    push r13
    mov r13, sp
    sub sp, sp, 8
    mov r9, r1
__sym_block_72:
    mov r1, r9
    mov r2, 10
    cmp r1, r2
    je __sym_switch_206
    mov r2, 13
    cmp r1, r2
    je __sym_switch_207
    mov r2, 8
    cmp r1, r2
    je __sym_switch_208
    mov r2, 9
    cmp r1, r2
    je __sym_switch_209
    jmp __sym_block_80
__sym_switch_206:
    jmp __sym_block_73
__sym_switch_207:
    jmp __sym_block_74
__sym_switch_208:
    jmp __sym_block_75
__sym_switch_209:
    jmp __sym_block_76
__sym_block_73:
    call __sym_fn_next_line_83
    mov r1, 0
    mov r7, r1
    jmp __sym_block_82
__sym_block_74:
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 304
    load_32 r8, [r2]
    mod r7, r8, 96
    sub r7, r8, r7
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 304
    store_32 [r2], r7
    mov r1, 0
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 308
    store_32 [r2], r1
    mov r1, 0
    mov r7, r1
    jmp __sym_block_82
__sym_block_75:
    call __sym_fn_erase_cell_88
    mov r1, 0
    mov r7, r1
    jmp __sym_block_82
__sym_block_76:
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 308
    load_32 r7, [r2]
    mov r2, 0
    cmp r7, r2
    je __sym_edge_true_210
    jmp __sym_block_77
__sym_edge_true_210:
    jmp __sym_block_78
__sym_block_77:
    call __sym_fn_next_line_83
    jmp __sym_block_78
__sym_block_78:
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 304
    load_32 r7, [r2]
    and r7, r7, 7
    mov r1, 8
    sub r1, r1, r7
    sub r12, r13, 4
    store_32 [r12], r1
    mov r1, 0
    sub r12, r13, 8
    store_32 [r12], r1
    jmp __sym_block_79
__sym_block_79:
    mov r1, 32
    call __sym_fn_print_cell_95
    sub r12, r13, 8
    load_32 r1, [r12]
    add r7, r1, 1
    sub r12, r13, 4
    load_32 r2, [r12]
    cmp r7, r2
    je __sym_edge_true_211
    sub r12, r13, 8
    store_32 [r12], r7
    jmp __sym_block_79
__sym_edge_true_211:
    sub r12, r13, 4
    load_32 r1, [r12]
    mov r7, r1
    jmp __sym_block_82
__sym_block_80:
    mov r2, 31
    cmp r9, r2
    ja __sym_cmp_yes_212
    mov r1, 0
    jmp __sym_cmp_done_213
__sym_cmp_yes_212:
    mov r1, 1
__sym_cmp_done_213:
    and r1, r1, 1
    mov r8, r1
    mov r2, 127
    cmp r9, r2
    jne __sym_cmp_yes_214
    mov r1, 0
    jmp __sym_cmp_done_215
__sym_cmp_yes_214:
    mov r1, 1
__sym_cmp_done_215:
    and r1, r1, 1
    mov r7, r1
    and r7, r8, r7
    and r7, r7, 1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_216
    mov r1, 0
    mov r7, r1
    jmp __sym_block_82
__sym_edge_true_216:
    jmp __sym_block_81
__sym_block_81:
    mov r1, r9
    call __sym_fn_print_cell_95
    mov r1, 1
    mov r7, r1
    jmp __sym_block_82
__sym_block_82:
    mov r1, r7
    mov sp, r13
    pop r13
    ret

; function next_line, frame 0 bytes
__sym_fn_next_line_83:
    push r13
    mov r13, sp
__sym_block_84:
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 304
    load_32 r8, [r2]
    mod r7, r8, 96
    sub r7, r8, r7
    add r7, r7, 96
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 304
    store_32 [r2], r7
    mov r1, 0
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 308
    store_32 [r2], r1
    mov r2, 3840
    cmp r7, r2
    jb __sym_edge_true_217
    jmp __sym_block_85
__sym_edge_true_217:
    jmp __sym_block_87
__sym_block_85:
    call __sym_fn_tty_display_scroll_126
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 304
    load_32 r7, [r2]
    mov r2, 65535
    lsl r2, r2, 16
    or r2, r2, 65440
    add r7, r7, r2
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 304
    store_32 [r2], r7
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 320
    load_8 r7, [r2]
    and r7, r7, 1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_218
    jmp __sym_block_87
__sym_edge_true_218:
    jmp __sym_block_86
__sym_block_86:
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 356
    load_32 r7, [r2]
    mov r1, r7
    mov r2, 96
    cmp r1, r2
    jae __sym_usub_sat_219
    mov r1, 0
    jmp __sym_usub_sat_done_220
__sym_usub_sat_219:
    sub r1, r1, r2
__sym_usub_sat_done_220:
    mov r7, r1
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 356
    store_32 [r2], r7
    jmp __sym_block_87
__sym_block_87:
    mov r1, 0
    mov sp, r13
    pop r13
    ret

; function erase_cell, frame 0 bytes
__sym_fn_erase_cell_88:
    push r13
    mov r13, sp
__sym_block_89:
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 308
    load_32 r7, [r2]
    mov r2, 0
    cmp r7, r2
    je __sym_edge_true_221
    jmp __sym_block_90
__sym_edge_true_221:
    jmp __sym_block_91
__sym_block_90:
    mov r1, 0
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 308
    store_32 [r2], r1
    jmp __sym_block_93
__sym_block_91:
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 304
    load_32 r7, [r2]
    mov r2, 0
    cmp r7, r2
    je __sym_edge_true_222
    jmp __sym_block_92
__sym_edge_true_222:
    jmp __sym_block_94
__sym_block_92:
    mov r2, 65535
    lsl r2, r2, 16
    or r2, r2, 65535
    add r7, r7, r2
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 304
    store_32 [r2], r7
    jmp __sym_block_93
__sym_block_93:
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 304
    load_32 r7, [r2]
    mov r1, r7
    mov r2, 0
    call __sym_fn_tty_display_put_124
    jmp __sym_block_94
__sym_block_94:
    mov r1, 0
    mov sp, r13
    pop r13
    ret

; function print_cell, frame 8 bytes
__sym_fn_print_cell_95:
    push r13
    mov r13, sp
    sub sp, sp, 8
    sub r12, r13, 4
    store_32 [r12], r1
__sym_block_96:
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 308
    load_32 r7, [r2]
    mov r2, 0
    cmp r7, r2
    je __sym_edge_true_223
    jmp __sym_block_97
__sym_edge_true_223:
    jmp __sym_block_98
__sym_block_97:
    call __sym_fn_next_line_83
    jmp __sym_block_98
__sym_block_98:
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 304
    load_32 r7, [r2]
    mov r1, r7
    sub r12, r13, 4
    load_32 r2, [r12]
    call __sym_fn_tty_display_put_124
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 304
    load_32 r8, [r2]
    mod r7, r8, 96
    mov r2, 95
    cmp r7, r2
    je __sym_edge_true_224
    jmp __sym_block_100
__sym_edge_true_224:
    jmp __sym_block_99
__sym_block_99:
    mov r1, 1
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 308
    store_32 [r2], r1
    jmp __sym_block_101
__sym_block_100:
    add r7, r8, 1
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 304
    store_32 [r2], r7
    jmp __sym_block_101
__sym_block_101:
    mov r1, 0
    mov sp, r13
    pop r13
    ret

; function tty_puts, frame 16 bytes
__sym_fn_tty_puts_102:
    push r13
    mov r13, sp
    sub sp, sp, 16
    sub r12, r13, 4
    store_32 [r12], r1
__sym_block_103:
    sub r12, r13, 4
    load_32 r1, [r12]
    mov r2, 0
    cmp r1, r2
    je __sym_edge_true_225
    jmp __sym_block_104
__sym_edge_true_225:
    mov r1, 0
    mov r7, r1
    jmp __sym_block_110
__sym_block_104:
    sub r12, r13, 4
    load_32 r2, [r12]
    load_8 r7, [r2]
    and r7, r7, 255
    mov r2, 0
    cmp r7, r2
    je __sym_edge_true_226
    jmp __sym_block_105
__sym_edge_true_226:
    mov r1, 0
    mov r7, r1
    jmp __sym_block_110
__sym_block_105:
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 300
    load_8 r7, [r2]
    and r7, r7, 1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_227
    jmp __sym_block_106
__sym_edge_true_227:
    jmp __sym_block_107
__sym_block_106:
    call __sym_fn_tty_init_56
    jmp __sym_block_107
__sym_block_107:
    mov r1, 0
    mov r2, 0
    call __sym_fn_tty_display_cursor_111
    sub r12, r13, 4
    load_32 r2, [r12]
    load_8 r7, [r2]
    and r7, r7, 255
    mov r2, 0
    cmp r7, r2
    je __sym_edge_true_228
    mov r1, 0
    sub r12, r13, 8
    store_32 [r12], r1
    jmp __sym_block_108
__sym_edge_true_228:
    mov r1, 0
    sub r12, r13, 12
    store_32 [r12], r1
    jmp __sym_block_109
__sym_block_108:
    mov r1, r7
    mov r7, r1
    mov r1, r7
    call __sym_fn_render_71
    sub r12, r13, 8
    load_32 r1, [r12]
    add r8, r1, 1
    sub r12, r13, 4
    load_32 r1, [r12]
    mov r2, r8
    add r1, r1, r2
    mov r7, r1
    load_8 r7, [r7]
    and r7, r7, 255
    mov r2, 0
    cmp r7, r2
    je __sym_edge_true_229
    sub r12, r13, 8
    store_32 [r12], r8
    jmp __sym_block_108
__sym_edge_true_229:
    sub r12, r13, 12
    store_32 [r12], r8
    jmp __sym_block_109
__sym_block_109:
    call __sym_fn_reset_cursor_58
    sub r12, r13, 12
    load_32 r1, [r12]
    mov r7, r1
    jmp __sym_block_110
__sym_block_110:
    mov r1, r7
    mov sp, r13
    pop r13
    ret

; function tty_display_cursor, frame 0 bytes
__sym_fn_tty_display_cursor_111:
    mov r10, r1
    mov r9, r2
__sym_block_112:
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 360
    load_8 r7, [r2]
    and r7, r7, 1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_230
    jmp __sym_block_114
__sym_edge_true_230:
    jmp __sym_block_113
__sym_block_113:
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 361
    load_8 r8, [r2]
    and r8, r8, 255
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 4204
    load_32 r7, [r2]
    mov r1, 1
    lsl r1, r1, 16
    or r1, r1, 362
    mov r2, r7
    add r1, r1, r2
    mov r7, r1
    store_8 [r7], r8
    mov r1, 0
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 360
    store_8 [r2], r1
    jmp __sym_block_114
__sym_block_114:
    mov r2, 0
    cmp r9, r2
    je __sym_edge_true_231
    jmp __sym_block_115
__sym_edge_true_231:
    jmp __sym_block_116
__sym_block_115:
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 4204
    store_32 [r2], r10
    mov r1, 1
    lsl r1, r1, 16
    or r1, r1, 362
    mov r2, r10
    add r1, r1, r2
    mov r8, r1
    load_8 r7, [r8]
    and r7, r7, 255
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 361
    store_8 [r2], r7
    mov r1, 95
    store_8 [r8], r1
    mov r1, 1
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 360
    store_8 [r2], r1
    jmp __sym_block_116
__sym_block_116:
    mov r1, 0
    ret

; function tty_display_init, frame 0 bytes
__sym_fn_tty_display_init_117:
__sym_block_118:
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 4208
    load_8 r7, [r2]
    and r7, r7, 1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_232
    jmp __sym_block_123
__sym_edge_true_232:
    jmp __sym_block_119
__sym_block_119:
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 360
    load_8 r7, [r2]
    and r7, r7, 1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_233
    jmp __sym_block_121
__sym_edge_true_233:
    jmp __sym_block_120
__sym_block_120:
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 361
    load_8 r8, [r2]
    and r8, r8, 255
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 4204
    load_32 r7, [r2]
    mov r1, 1
    lsl r1, r1, 16
    or r1, r1, 362
    mov r2, r7
    add r1, r1, r2
    mov r7, r1
    store_8 [r7], r8
    mov r1, 0
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 360
    store_8 [r2], r1
    jmp __sym_block_121
__sym_block_121:
    mov r1, 0
    mov r8, r1
    jmp __sym_block_122
__sym_block_122:
    mov r1, 1
    lsl r1, r1, 16
    or r1, r1, 362
    mov r2, r8
    add r1, r1, r2
    mov r7, r1
    mov r1, 0
    store_8 [r7], r1
    add r7, r8, 1
    mov r2, 3840
    cmp r7, r2
    je __sym_edge_true_234
    mov r8, r7
    jmp __sym_block_122
__sym_edge_true_234:
    jmp __sym_block_123
__sym_block_123:
    mov r1, 1
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 4208
    store_8 [r2], r1
    mov r1, 0
    mov r2, 0
    screen r1, r2
    mov r1, 1
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 362
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
    mov r1, 0
    ret

; function tty_display_put, frame 0 bytes
__sym_fn_tty_display_put_124:
    mov r9, r1
    mov r7, r2
__sym_block_125:
    mov r1, r7
    and r1, r1, 255
    mov r8, r1
    mov r1, 1
    lsl r1, r1, 16
    or r1, r1, 362
    mov r2, r9
    add r1, r1, r2
    mov r7, r1
    store_8 [r7], r8
    mov r1, 0
    ret

; function tty_display_scroll, frame 0 bytes
__sym_fn_tty_display_scroll_126:
__sym_block_127:
    mov r1, 0
    mov r9, r1
    jmp __sym_block_128
__sym_block_128:
    mov r1, 1
    lsl r1, r1, 16
    or r1, r1, 362
    mov r2, r9
    add r1, r1, r2
    mov r8, r1
    mov r1, r8
    mov r2, 96
    add r1, r1, r2
    mov r7, r1
    load_8 r7, [r7]
    and r7, r7, 255
    store_8 [r8], r7
    add r7, r9, 1
    mov r2, 3744
    cmp r7, r2
    je __sym_edge_true_235
    mov r9, r7
    jmp __sym_block_128
__sym_edge_true_235:
    mov r1, 3744
    mov r8, r1
    jmp __sym_block_130
__sym_block_129:
    mov r1, 0
    ret
__sym_block_130:
    mov r1, 1
    lsl r1, r1, 16
    or r1, r1, 362
    mov r2, r8
    add r1, r1, r2
    mov r7, r1
    mov r1, 0
    store_8 [r7], r1
    add r7, r8, 1
    mov r2, 3840
    cmp r7, r2
    je __sym_edge_true_236
    mov r8, r7
    jmp __sym_block_130
__sym_edge_true_236:
    jmp __sym_block_129

; Global addresses (zero tail uses initially zeroed RAM).
; .str = 65536
; .str.1 = 65566
; .str.2 = 65603
; .str.3 = 65641
; .str.4 = 65667
; .str.5 = 65716
; .str.6 = 65766
; cached_address = 65816
; cached_word = 65820
; .str.7 = 65824
; initialized = 65836
; cursor = 65840
; wrap_pending = 65844
; edit_length = 65848
; edit_position = 65852
; edit_active = 65856
; edit_cells = 65860
; ready_length = 65864
; read_offset = 65868
; shift_down = 65872
; cursor_disabled = 65876
; cursor_phase = 65880
; cursor_time_low = 65884
; cursor_time_high = 65888
; edit_start_cursor = 65892
; cursor_drawn = 65896
; cursor_saved = 65897
; framebuffer = 65898
; cursor_position = 69740
; initialized.15 = 69744
@65536
U8 78
U8 111
U8 116
U8 32
U8 97
U8 32
U8 66
U8 77
U8 80
U8 32
U8 102
U8 105
U8 108
U8 101
U8 32
U8 40
U8 101
U8 120
U8 112
U8 101
U8 99
U8 116
U8 101
U8 100
U8 32
U8 66
U8 77
U8 41
U8 46
U8 0
U8 73
U8 110
U8 118
U8 97
U8 108
U8 105
U8 100
U8 32
U8 66
U8 77
U8 80
U8 32
U8 102
U8 105
U8 108
U8 101
U8 32
U8 115
U8 105
U8 122
U8 101
U8 32
U8 111
U8 114
U8 32
U8 100
U8 105
U8 115
U8 107
U8 32
U8 114
U8 97
U8 110
U8 103
U8 101
U8 46
U8 0
U8 85
U8 110
U8 115
U8 117
U8 112
U8 112
U8 111
U8 114
U8 116
U8 101
U8 100
U8 32
U8 111
U8 114
U8 32
U8 105
U8 110
U8 99
U8 111
U8 109
U8 112
U8 108
U8 101
U8 116
U8 101
U8 32
U8 66
U8 77
U8 80
U8 32
U8 104
U8 101
U8 97
U8 100
U8 101
U8 114
U8 46
U8 0
U8 73
U8 110
U8 118
U8 97
U8 108
U8 105
U8 100
U8 32
U8 66
U8 77
U8 80
U8 32
U8 112
U8 105
U8 120
U8 101
U8 108
U8 32
U8 111
U8 102
U8 102
U8 115
U8 101
U8 116
U8 46
U8 0
U8 73
U8 110
U8 118
U8 97
U8 108
U8 105
U8 100
U8 32
U8 66
U8 77
U8 80
U8 32
U8 100
U8 105
U8 109
U8 101
U8 110
U8 115
U8 105
U8 111
U8 110
U8 115
U8 32
U8 40
U8 109
U8 97
U8 120
U8 105
U8 109
U8 117
U8 109
U8 32
U8 54
U8 53
U8 53
U8 51
U8 53
U8 32
U8 112
U8 101
U8 114
U8 32
U8 97
U8 120
U8 105
U8 115
U8 41
U8 46
U8 0
U8 79
U8 110
U8 108
U8 121
U8 32
U8 117
U8 110
U8 99
U8 111
U8 109
U8 112
U8 114
U8 101
U8 115
U8 115
U8 101
U8 100
U8 32
U8 50
U8 52
U8 47
U8 51
U8 50
U8 45
U8 98
U8 105
U8 116
U8 32
U8 82
U8 71
U8 66
U8 32
U8 66
U8 77
U8 80
U8 32
U8 105
U8 115
U8 32
U8 115
U8 117
U8 112
U8 112
U8 111
U8 114
U8 116
U8 101
U8 100
U8 46
U8 0
U8 66
U8 77
U8 80
U8 32
U8 112
U8 105
U8 120
U8 101
U8 108
U8 32
U8 100
U8 97
U8 116
U8 97
U8 32
U8 101
U8 120
U8 99
U8 101
U8 101
U8 100
U8 115
U8 32
U8 116
U8 104
U8 101
U8 32
U8 100
U8 101
U8 99
U8 108
U8 97
U8 114
U8 101
U8 100
U8 32
U8 102
U8 105
U8 108
U8 101
U8 32
U8 115
U8 105
U8 122
U8 101
U8 46
@65816
U8 255
U8 255
U8 255
U8 255
@65824
U8 66
U8 77
U8 80
U8 32
U8 118
U8 105
U8 101
U8 119
U8 101
U8 114
U8 10
