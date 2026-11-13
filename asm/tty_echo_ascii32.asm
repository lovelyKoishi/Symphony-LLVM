; Symphony LLVM backend 0.1. Big endian, 32-bit values/pointers.
__sym_start:
    mov sp, 256
    lsl sp, sp, 16
    call __sym_fn_main_0
__sym_halt:
    jmp __sym_halt
__sym_trap:
    jmp __sym_trap

; function main, frame 264 bytes
__sym_fn_main_0:
    push r13
    mov r13, sp
    sub sp, sp, 264
__sym_block_1:
    sub r1, r13, 260
    sub r12, r13, 4
    store_32 [r12], r1
    call __sym_fn_tty_init_3
    mov r1, 1
    lsl r1, r1, 16
    call __sym_fn_tty_puts_53
    mov r1, 1
    lsl r1, r1, 16
    or r1, r1, 24
    call __sym_fn_tty_puts_53
    jmp __sym_block_2
__sym_block_2:
    mov r1, 1
    lsl r1, r1, 16
    or r1, r1, 85
    call __sym_fn_tty_puts_53
    sub r12, r13, 4
    load_32 r1, [r12]
    mov r2, 256
    call __sym_fn_tty_readline_139
    sub r12, r13, 264
    store_32 [r12], r1
    mov r1, 1
    lsl r1, r1, 16
    or r1, r1, 88
    call __sym_fn_tty_puts_53
    sub r12, r13, 4
    load_32 r1, [r12]
    sub r12, r13, 264
    load_32 r2, [r12]
    call __sym_fn_tty_write_45
    mov r1, 10
    call __sym_fn_tty_putc_10
    jmp __sym_block_2

; function tty_init, frame 0 bytes
__sym_fn_tty_init_3:
    push r13
    mov r13, sp
__sym_block_4:
    mov r1, 1
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 100
    store_8 [r2], r1
    mov r1, 0
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 104
    store_32 [r2], r1
    mov r1, 0
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 108
    store_32 [r2], r1
    mov r1, 0
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 112
    store_32 [r2], r1
    mov r1, 0
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 116
    store_32 [r2], r1
    mov r1, 0
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 120
    store_8 [r2], r1
    mov r1, 0
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 124
    store_32 [r2], r1
    mov r1, 0
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 128
    store_32 [r2], r1
    mov r1, 0
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 132
    store_32 [r2], r1
    mov r1, 0
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 136
    store_32 [r2], r1
    mov r1, 0
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 140
    store_32 [r2], r1
    call __sym_fn_tty_display_init_155
    call __sym_fn_reset_cursor_5
    mov r1, 0
    mov sp, r13
    pop r13
    ret

; function reset_cursor, frame 0 bytes
__sym_fn_reset_cursor_5:
    push r13
    mov r13, sp
__sym_block_6:
    mov r1, 1
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 912
    store_32 [r2], r1
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 140
    load_32 r7, [r2]
    mov r2, 0
    cmp r7, r2
    je __sym_edge_true_168
    jmp __sym_block_9
__sym_edge_true_168:
    jmp __sym_block_7
__sym_block_7:
    time_0 r1
    mov r7, r1
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 916
    store_32 [r2], r7
    time_1 r1
    mov r7, r1
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 920
    store_32 [r2], r7
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 140
    load_32 r7, [r2]
    mov r2, 0
    cmp r7, r2
    je __sym_edge_true_169
    jmp __sym_block_9
__sym_edge_true_169:
    jmp __sym_block_8
__sym_block_8:
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 108
    load_32 r7, [r2]
    mov r2, 0
    cmp r7, r2
    je __sym_cmp_yes_170
    mov r1, 0
    jmp __sym_cmp_done_171
__sym_cmp_yes_170:
    mov r1, 1
__sym_cmp_done_171:
    and r1, r1, 1
    mov r10, r1
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 104
    load_32 r9, [r2]
    add r8, r9, 1
    mov r2, 3839
    cmp r8, r2
    ja __sym_cmp_yes_172
    mov r1, 0
    jmp __sym_cmp_done_173
__sym_cmp_yes_172:
    mov r1, 1
__sym_cmp_done_173:
    and r1, r1, 1
    mov r7, r1
    or r7, r10, r7
    and r7, r7, 1
    mov r1, r7
    cmp r1, 0
    jne __sym_select_yes_174
    mov r1, r8
    jmp __sym_select_done_175
__sym_select_yes_174:
    mov r1, r9
__sym_select_done_175:
    mov r7, r1
    mov r1, r7
    mov r2, 1
    call __sym_fn_tty_display_cursor_149
    jmp __sym_block_9
__sym_block_9:
    mov r1, 0
    mov sp, r13
    pop r13
    ret

; function tty_putc, frame 8 bytes
__sym_fn_tty_putc_10:
    push r13
    mov r13, sp
    sub sp, sp, 8
    sub r12, r13, 4
    store_32 [r12], r1
__sym_block_11:
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 100
    load_8 r7, [r2]
    and r7, r7, 1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_176
    jmp __sym_block_12
__sym_edge_true_176:
    jmp __sym_block_13
__sym_block_12:
    call __sym_fn_tty_init_3
    jmp __sym_block_13
__sym_block_13:
    mov r1, 0
    mov r2, 0
    call __sym_fn_tty_display_cursor_149
    sub r12, r13, 4
    load_32 r1, [r12]
    and r7, r1, 255
    mov r1, r7
    call __sym_fn_render_14
    call __sym_fn_reset_cursor_5
    mov r1, 0
    mov sp, r13
    pop r13
    ret

; function render, frame 8 bytes
__sym_fn_render_14:
    push r13
    mov r13, sp
    sub sp, sp, 8
    mov r9, r1
__sym_block_15:
    mov r1, r9
    mov r2, 10
    cmp r1, r2
    je __sym_switch_177
    mov r2, 13
    cmp r1, r2
    je __sym_switch_178
    mov r2, 8
    cmp r1, r2
    je __sym_switch_179
    mov r2, 9
    cmp r1, r2
    je __sym_switch_180
    jmp __sym_block_23
__sym_switch_177:
    jmp __sym_block_16
__sym_switch_178:
    jmp __sym_block_17
__sym_switch_179:
    jmp __sym_block_18
__sym_switch_180:
    jmp __sym_block_19
__sym_block_16:
    call __sym_fn_next_line_26
    mov r1, 0
    mov r7, r1
    jmp __sym_block_25
__sym_block_17:
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 104
    load_32 r8, [r2]
    mod r7, r8, 96
    sub r7, r8, r7
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 104
    store_32 [r2], r7
    mov r1, 0
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 108
    store_32 [r2], r1
    mov r1, 0
    mov r7, r1
    jmp __sym_block_25
__sym_block_18:
    call __sym_fn_erase_cell_31
    mov r1, 0
    mov r7, r1
    jmp __sym_block_25
__sym_block_19:
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 108
    load_32 r7, [r2]
    mov r2, 0
    cmp r7, r2
    je __sym_edge_true_181
    jmp __sym_block_20
__sym_edge_true_181:
    jmp __sym_block_21
__sym_block_20:
    call __sym_fn_next_line_26
    jmp __sym_block_21
__sym_block_21:
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 104
    load_32 r7, [r2]
    and r7, r7, 7
    mov r1, 8
    sub r1, r1, r7
    sub r12, r13, 4
    store_32 [r12], r1
    mov r1, 0
    sub r12, r13, 8
    store_32 [r12], r1
    jmp __sym_block_22
__sym_block_22:
    mov r1, 32
    call __sym_fn_print_cell_38
    sub r12, r13, 8
    load_32 r1, [r12]
    add r7, r1, 1
    sub r12, r13, 4
    load_32 r2, [r12]
    cmp r7, r2
    je __sym_edge_true_182
    sub r12, r13, 8
    store_32 [r12], r7
    jmp __sym_block_22
__sym_edge_true_182:
    sub r12, r13, 4
    load_32 r1, [r12]
    mov r7, r1
    jmp __sym_block_25
__sym_block_23:
    mov r2, 31
    cmp r9, r2
    ja __sym_cmp_yes_183
    mov r1, 0
    jmp __sym_cmp_done_184
__sym_cmp_yes_183:
    mov r1, 1
__sym_cmp_done_184:
    and r1, r1, 1
    mov r8, r1
    mov r2, 127
    cmp r9, r2
    jne __sym_cmp_yes_185
    mov r1, 0
    jmp __sym_cmp_done_186
__sym_cmp_yes_185:
    mov r1, 1
__sym_cmp_done_186:
    and r1, r1, 1
    mov r7, r1
    and r7, r8, r7
    and r7, r7, 1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_187
    mov r1, 0
    mov r7, r1
    jmp __sym_block_25
__sym_edge_true_187:
    jmp __sym_block_24
__sym_block_24:
    mov r1, r9
    call __sym_fn_print_cell_38
    mov r1, 1
    mov r7, r1
    jmp __sym_block_25
__sym_block_25:
    mov r1, r7
    mov sp, r13
    pop r13
    ret

; function next_line, frame 0 bytes
__sym_fn_next_line_26:
    push r13
    mov r13, sp
__sym_block_27:
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 104
    load_32 r8, [r2]
    mod r7, r8, 96
    sub r7, r8, r7
    add r7, r7, 96
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 104
    store_32 [r2], r7
    mov r1, 0
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 108
    store_32 [r2], r1
    mov r2, 3840
    cmp r7, r2
    jb __sym_edge_true_188
    jmp __sym_block_28
__sym_edge_true_188:
    jmp __sym_block_30
__sym_block_28:
    call __sym_fn_tty_display_scroll_163
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 104
    load_32 r7, [r2]
    mov r2, 65535
    lsl r2, r2, 16
    or r2, r2, 65440
    add r7, r7, r2
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 104
    store_32 [r2], r7
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 120
    load_8 r7, [r2]
    and r7, r7, 1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_189
    jmp __sym_block_30
__sym_edge_true_189:
    jmp __sym_block_29
__sym_block_29:
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 924
    load_32 r7, [r2]
    mov r1, r7
    mov r2, 96
    cmp r1, r2
    jae __sym_usub_sat_190
    mov r1, 0
    jmp __sym_usub_sat_done_191
__sym_usub_sat_190:
    sub r1, r1, r2
__sym_usub_sat_done_191:
    mov r7, r1
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 924
    store_32 [r2], r7
    jmp __sym_block_30
__sym_block_30:
    mov r1, 0
    mov sp, r13
    pop r13
    ret

; function erase_cell, frame 0 bytes
__sym_fn_erase_cell_31:
    push r13
    mov r13, sp
__sym_block_32:
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 108
    load_32 r7, [r2]
    mov r2, 0
    cmp r7, r2
    je __sym_edge_true_192
    jmp __sym_block_33
__sym_edge_true_192:
    jmp __sym_block_34
__sym_block_33:
    mov r1, 0
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 108
    store_32 [r2], r1
    jmp __sym_block_36
__sym_block_34:
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 104
    load_32 r7, [r2]
    mov r2, 0
    cmp r7, r2
    je __sym_edge_true_193
    jmp __sym_block_35
__sym_edge_true_193:
    jmp __sym_block_37
__sym_block_35:
    mov r2, 65535
    lsl r2, r2, 16
    or r2, r2, 65535
    add r7, r7, r2
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 104
    store_32 [r2], r7
    jmp __sym_block_36
__sym_block_36:
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 104
    load_32 r7, [r2]
    mov r1, r7
    mov r2, 0
    call __sym_fn_tty_display_put_161
    jmp __sym_block_37
__sym_block_37:
    mov r1, 0
    mov sp, r13
    pop r13
    ret

; function print_cell, frame 8 bytes
__sym_fn_print_cell_38:
    push r13
    mov r13, sp
    sub sp, sp, 8
    sub r12, r13, 4
    store_32 [r12], r1
__sym_block_39:
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 108
    load_32 r7, [r2]
    mov r2, 0
    cmp r7, r2
    je __sym_edge_true_194
    jmp __sym_block_40
__sym_edge_true_194:
    jmp __sym_block_41
__sym_block_40:
    call __sym_fn_next_line_26
    jmp __sym_block_41
__sym_block_41:
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 104
    load_32 r7, [r2]
    mov r1, r7
    sub r12, r13, 4
    load_32 r2, [r12]
    call __sym_fn_tty_display_put_161
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 104
    load_32 r8, [r2]
    mod r7, r8, 96
    mov r2, 95
    cmp r7, r2
    je __sym_edge_true_195
    jmp __sym_block_43
__sym_edge_true_195:
    jmp __sym_block_42
__sym_block_42:
    mov r1, 1
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 108
    store_32 [r2], r1
    jmp __sym_block_44
__sym_block_43:
    add r7, r8, 1
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 104
    store_32 [r2], r7
    jmp __sym_block_44
__sym_block_44:
    mov r1, 0
    mov sp, r13
    pop r13
    ret

; function tty_write, frame 16 bytes
__sym_fn_tty_write_45:
    push r13
    mov r13, sp
    sub sp, sp, 16
    sub r12, r13, 4
    store_32 [r12], r1
    sub r12, r13, 8
    store_32 [r12], r2
__sym_block_46:
    sub r12, r13, 4
    load_32 r1, [r12]
    mov r2, 0
    cmp r1, r2
    jne __sym_cmp_yes_196
    mov r1, 0
    jmp __sym_cmp_done_197
__sym_cmp_yes_196:
    mov r1, 1
__sym_cmp_done_197:
    and r1, r1, 1
    mov r8, r1
    sub r12, r13, 8
    load_32 r1, [r12]
    mov r2, 0
    cmp r1, r2
    jne __sym_cmp_yes_198
    mov r1, 0
    jmp __sym_cmp_done_199
__sym_cmp_yes_198:
    mov r1, 1
__sym_cmp_done_199:
    and r1, r1, 1
    mov r7, r1
    and r7, r8, r7
    and r7, r7, 1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_200
    mov r1, 0
    mov r7, r1
    jmp __sym_block_52
__sym_edge_true_200:
    jmp __sym_block_47
__sym_block_47:
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 100
    load_8 r7, [r2]
    and r7, r7, 1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_201
    jmp __sym_block_48
__sym_edge_true_201:
    jmp __sym_block_49
__sym_block_48:
    call __sym_fn_tty_init_3
    jmp __sym_block_49
__sym_block_49:
    mov r1, 0
    mov r2, 0
    call __sym_fn_tty_display_cursor_149
    mov r1, 0
    mov r8, r1
    jmp __sym_block_51
__sym_block_50:
    call __sym_fn_reset_cursor_5
    sub r12, r13, 8
    load_32 r1, [r12]
    mov r7, r1
    jmp __sym_block_52
__sym_block_51:
    sub r12, r13, 4
    load_32 r1, [r12]
    mov r2, r8
    add r1, r1, r2
    mov r7, r1
    load_8 r7, [r7]
    and r7, r7, 255
    mov r1, r7
    mov r7, r1
    sub r12, r13, 12
    store_32 [r12], r8
    mov r1, r7
    call __sym_fn_render_14
    sub r12, r13, 12
    load_32 r8, [r12]
    add r7, r8, 1
    sub r12, r13, 8
    load_32 r2, [r12]
    cmp r7, r2
    je __sym_edge_true_202
    mov r8, r7
    jmp __sym_block_51
__sym_edge_true_202:
    jmp __sym_block_50
__sym_block_52:
    mov r1, r7
    mov sp, r13
    pop r13
    ret

; function tty_puts, frame 16 bytes
__sym_fn_tty_puts_53:
    push r13
    mov r13, sp
    sub sp, sp, 16
    sub r12, r13, 4
    store_32 [r12], r1
__sym_block_54:
    sub r12, r13, 4
    load_32 r1, [r12]
    mov r2, 0
    cmp r1, r2
    je __sym_edge_true_203
    jmp __sym_block_55
__sym_edge_true_203:
    mov r1, 0
    mov r7, r1
    jmp __sym_block_61
__sym_block_55:
    sub r12, r13, 4
    load_32 r2, [r12]
    load_8 r7, [r2]
    and r7, r7, 255
    mov r2, 0
    cmp r7, r2
    je __sym_edge_true_204
    jmp __sym_block_56
__sym_edge_true_204:
    mov r1, 0
    mov r7, r1
    jmp __sym_block_61
__sym_block_56:
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 100
    load_8 r7, [r2]
    and r7, r7, 1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_205
    jmp __sym_block_57
__sym_edge_true_205:
    jmp __sym_block_58
__sym_block_57:
    call __sym_fn_tty_init_3
    jmp __sym_block_58
__sym_block_58:
    mov r1, 0
    mov r2, 0
    call __sym_fn_tty_display_cursor_149
    sub r12, r13, 4
    load_32 r2, [r12]
    load_8 r7, [r2]
    and r7, r7, 255
    mov r2, 0
    cmp r7, r2
    je __sym_edge_true_206
    mov r1, 0
    sub r12, r13, 8
    store_32 [r12], r1
    jmp __sym_block_59
__sym_edge_true_206:
    mov r1, 0
    sub r12, r13, 12
    store_32 [r12], r1
    jmp __sym_block_60
__sym_block_59:
    mov r1, r7
    mov r7, r1
    mov r1, r7
    call __sym_fn_render_14
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
    je __sym_edge_true_207
    sub r12, r13, 8
    store_32 [r12], r8
    jmp __sym_block_59
__sym_edge_true_207:
    sub r12, r13, 12
    store_32 [r12], r8
    jmp __sym_block_60
__sym_block_60:
    call __sym_fn_reset_cursor_5
    sub r12, r13, 12
    load_32 r1, [r12]
    mov r7, r1
    jmp __sym_block_61
__sym_block_61:
    mov r1, r7
    mov sp, r13
    pop r13
    ret

; function tty_poll, frame 16 bytes
__sym_fn_tty_poll_62:
    push r13
    mov r13, sp
    sub sp, sp, 16
__sym_block_63:
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 100
    load_8 r7, [r2]
    and r7, r7, 1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_208
    jmp __sym_block_64
__sym_edge_true_208:
    jmp __sym_block_65
__sym_block_64:
    call __sym_fn_tty_init_3
    jmp __sym_block_65
__sym_block_65:
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 128
    load_32 r7, [r2]
    mov r2, 0
    cmp r7, r2
    je __sym_edge_true_209
    jmp __sym_block_66
__sym_edge_true_209:
    jmp __sym_block_67
__sym_block_66:
    call __sym_fn_update_cursor_110
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 128
    load_32 r8, [r2]
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 132
    load_32 r7, [r2]
    sub r7, r8, r7
    jmp __sym_block_109
__sym_block_67:
    keyboard r1
    mov r8, r1
    and r9, r8, 255
    mov r2, 16
    cmp r9, r2
    je __sym_cmp_yes_210
    mov r1, 0
    jmp __sym_cmp_done_211
__sym_cmp_yes_210:
    mov r1, 1
__sym_cmp_done_211:
    and r1, r1, 1
    mov r10, r1
    and r7, r8, 256
    mov r1, r10
    cmp r1, 0
    jne __sym_edge_true_212
    jmp __sym_block_69
__sym_edge_true_212:
    jmp __sym_block_68
__sym_block_68:
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 136
    store_32 [r2], r7
    call __sym_fn_update_cursor_110
    mov r1, 0
    mov r7, r1
    jmp __sym_block_109
__sym_block_69:
    mov r2, 0
    cmp r7, r2
    je __sym_edge_true_213
    jmp __sym_block_71
__sym_edge_true_213:
    jmp __sym_block_70
__sym_block_70:
    call __sym_fn_update_cursor_110
    mov r1, 0
    mov r7, r1
    jmp __sym_block_109
__sym_block_71:
    sub r12, r13, 12
    store_32 [r12], r8
    sub r12, r13, 16
    store_32 [r12], r9
    mov r1, 0
    mov r2, 0
    call __sym_fn_tty_display_cursor_149
    sub r12, r13, 12
    load_32 r8, [r12]
    sub r12, r13, 16
    load_32 r9, [r12]
    mov r2, 4
    cmp r9, r2
    je __sym_cmp_yes_214
    mov r1, 0
    jmp __sym_cmp_done_215
__sym_cmp_yes_214:
    mov r1, 1
__sym_cmp_done_215:
    and r1, r1, 1
    mov r11, r1
    mov r2, 2
    cmp r9, r2
    je __sym_cmp_yes_216
    mov r1, 0
    jmp __sym_cmp_done_217
__sym_cmp_yes_216:
    mov r1, 1
__sym_cmp_done_217:
    and r1, r1, 1
    mov r10, r1
    mov r1, r8
    and r1, r1, 255
    mov r7, r1
    mov r1, r7
    mov r2, 4
    cmp r1, r2
    je __sym_switch_218
    mov r2, 2
    cmp r1, r2
    je __sym_switch_219
    mov r2, 13
    cmp r1, r2
    je __sym_switch_220
    mov r2, 10
    cmp r1, r2
    je __sym_switch_221
    mov r2, 9
    cmp r1, r2
    je __sym_switch_222
    jmp __sym_block_92
__sym_switch_218:
    jmp __sym_block_72
__sym_switch_219:
    jmp __sym_block_72
__sym_switch_220:
    jmp __sym_block_80
__sym_switch_221:
    jmp __sym_block_89
__sym_switch_222:
    jmp __sym_block_93
__sym_block_72:
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 120
    load_8 r7, [r2]
    and r7, r7, 1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_223
    jmp __sym_block_73
__sym_edge_true_223:
    jmp __sym_block_74
__sym_block_73:
    mov r1, 1
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 120
    store_8 [r2], r1
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 104
    load_32 r7, [r2]
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 924
    store_32 [r2], r7
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 108
    load_32 r7, [r2]
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 928
    store_32 [r2], r7
    mov r1, 0
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 124
    store_32 [r2], r1
    mov r1, 0
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 116
    store_32 [r2], r1
    jmp __sym_block_74
__sym_block_74:
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 116
    load_32 r8, [r2]
    mov r2, 0
    cmp r8, r2
    jne __sym_cmp_yes_224
    mov r1, 0
    jmp __sym_cmp_done_225
__sym_cmp_yes_224:
    mov r1, 1
__sym_cmp_done_225:
    and r1, r1, 1
    mov r7, r1
    mov r1, r11
    cmp r1, 0
    jne __sym_select_yes_226
    mov r1, 0
    jmp __sym_select_done_227
__sym_select_yes_226:
    mov r1, r7
__sym_select_done_227:
    and r1, r1, 1
    mov r7, r1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_228
    jmp __sym_block_76
__sym_edge_true_228:
    jmp __sym_block_75
__sym_block_75:
    mov r2, 65535
    lsl r2, r2, 16
    or r2, r2, 65535
    add r7, r8, r2
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 116
    store_32 [r2], r7
    jmp __sym_block_76
__sym_block_76:
    mov r1, r10
    cmp r1, 0
    jne __sym_edge_true_229
    jmp __sym_block_79
__sym_edge_true_229:
    jmp __sym_block_77
__sym_block_77:
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 116
    load_32 r8, [r2]
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 112
    load_32 r7, [r2]
    cmp r8, r7
    jb __sym_edge_true_230
    jmp __sym_block_79
__sym_edge_true_230:
    jmp __sym_block_78
__sym_block_78:
    add r7, r8, 1
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 116
    store_32 [r2], r7
    jmp __sym_block_79
__sym_block_79:
    call __sym_fn_position_edit_cursor_118
    jmp __sym_block_108
__sym_block_80:
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 116
    load_32 r9, [r2]
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 112
    load_32 r8, [r2]
    cmp r9, r8
    je __sym_cmp_yes_231
    mov r1, 0
    jmp __sym_cmp_done_232
__sym_cmp_yes_231:
    mov r1, 1
__sym_cmp_done_232:
    and r1, r1, 1
    mov r10, r1
    mov r2, 0
    cmp r8, r2
    jne __sym_cmp_yes_233
    mov r1, 0
    jmp __sym_cmp_done_234
__sym_cmp_yes_233:
    mov r1, 1
__sym_cmp_done_234:
    and r1, r1, 1
    mov r7, r1
    and r7, r10, r7
    and r7, r7, 1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_235
    jmp __sym_block_85
__sym_edge_true_235:
    jmp __sym_block_81
__sym_block_81:
    mov r2, 65535
    lsl r2, r2, 16
    or r2, r2, 65535
    add r8, r8, r2
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 112
    store_32 [r2], r8
    mov r2, 65535
    lsl r2, r2, 16
    or r2, r2, 65535
    add r7, r9, r2
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 116
    store_32 [r2], r7
    mov r1, 1
    lsl r1, r1, 16
    or r1, r1, 144
    mov r2, r8
    add r1, r1, r2
    mov r7, r1
    load_8 r7, [r7]
    and r7, r7, 255
    mov r1, r7
    mov r8, r1
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 124
    load_32 r7, [r2]
    sub r7, r7, r8
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 124
    store_32 [r2], r7
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 112
    load_32 r8, [r2]
    mov r1, 1
    lsl r1, r1, 16
    or r1, r1, 144
    mov r2, r8
    add r1, r1, r2
    mov r7, r1
    load_8 r7, [r7]
    and r7, r7, 255
    mov r2, 0
    cmp r7, r2
    je __sym_edge_true_236
    mov r1, 0
    sub r12, r13, 4
    store_32 [r12], r1
    jmp __sym_block_83
__sym_edge_true_236:
    jmp __sym_block_82
__sym_block_82:
    mov r1, 1
    lsl r1, r1, 16
    or r1, r1, 400
    mov r2, r8
    add r1, r1, r2
    mov r7, r1
    load_8 r7, [r7]
    and r7, r7, 255
    mov r2, 0
    cmp r7, r2
    jne __sym_cmp_yes_237
    mov r1, 0
    jmp __sym_cmp_done_238
__sym_cmp_yes_237:
    mov r1, 1
__sym_cmp_done_238:
    and r1, r1, 1
    mov r9, r1
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 104
    load_32 r8, [r2]
    mov r2, 0
    cmp r8, r2
    jne __sym_cmp_yes_239
    mov r1, 0
    jmp __sym_cmp_done_240
__sym_cmp_yes_239:
    mov r1, 1
__sym_cmp_done_240:
    and r1, r1, 1
    mov r7, r1
    mov r1, r9
    cmp r1, 0
    jne __sym_select_yes_241
    mov r1, 0
    jmp __sym_select_done_242
__sym_select_yes_241:
    mov r1, r7
__sym_select_done_242:
    and r1, r1, 1
    mov r7, r1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_243
    jmp __sym_block_108
__sym_edge_true_243:
    jmp __sym_block_84
__sym_block_83:
    call __sym_fn_erase_cell_31
    sub r12, r13, 4
    load_32 r1, [r12]
    add r9, r1, 1
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 112
    load_32 r8, [r2]
    mov r1, 1
    lsl r1, r1, 16
    or r1, r1, 144
    mov r2, r8
    add r1, r1, r2
    mov r7, r1
    load_8 r7, [r7]
    and r7, r7, 255
    mov r1, r7
    mov r7, r1
    cmp r9, r7
    jb __sym_edge_true_244
    jmp __sym_block_82
__sym_edge_true_244:
    sub r12, r13, 4
    store_32 [r12], r9
    jmp __sym_block_83
__sym_block_84:
    mov r2, 65535
    lsl r2, r2, 16
    or r2, r2, 65535
    add r7, r8, r2
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 104
    store_32 [r2], r7
    mov r1, 1
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 108
    store_32 [r2], r1
    jmp __sym_block_108
__sym_block_85:
    mov r2, 0
    cmp r9, r2
    je __sym_edge_true_245
    jmp __sym_block_86
__sym_edge_true_245:
    jmp __sym_block_108
__sym_block_86:
    mov r2, 65535
    lsl r2, r2, 16
    or r2, r2, 65535
    add r11, r9, r2
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 116
    store_32 [r2], r11
    mov r2, 65535
    lsl r2, r2, 16
    or r2, r2, 65535
    add r10, r8, r2
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 112
    store_32 [r2], r10
    cmp r11, r10
    jb __sym_edge_true_246
    jmp __sym_block_87
__sym_edge_true_246:
    jmp __sym_block_88
__sym_block_87:
    call __sym_fn_redraw_edit_124
    jmp __sym_block_108
__sym_block_88:
    add r9, r11, 1
    mov r1, 1
    lsl r1, r1, 16
    or r1, r1, 656
    mov r2, r9
    add r1, r1, r2
    mov r7, r1
    load_8 r8, [r7]
    and r8, r8, 255
    mov r1, 1
    lsl r1, r1, 16
    or r1, r1, 656
    mov r2, r11
    add r1, r1, r2
    mov r7, r1
    store_8 [r7], r8
    cmp r9, r10
    je __sym_edge_true_247
    mov r11, r9
    jmp __sym_block_88
__sym_edge_true_247:
    jmp __sym_block_87
__sym_block_89:
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 120
    load_8 r7, [r2]
    and r7, r7, 1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_248
    jmp __sym_block_90
__sym_edge_true_248:
    jmp __sym_block_91
__sym_block_90:
    mov r1, 1
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 120
    store_8 [r2], r1
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 104
    load_32 r7, [r2]
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 924
    store_32 [r2], r7
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 108
    load_32 r7, [r2]
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 928
    store_32 [r2], r7
    mov r1, 0
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 124
    store_32 [r2], r1
    mov r1, 0
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 116
    store_32 [r2], r1
    jmp __sym_block_91
__sym_block_91:
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 112
    load_32 r8, [r2]
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 116
    store_32 [r2], r8
    sub r12, r13, 12
    store_32 [r12], r8
    call __sym_fn_position_edit_cursor_118
    sub r12, r13, 12
    load_32 r8, [r12]
    mov r1, 1
    lsl r1, r1, 16
    or r1, r1, 656
    mov r2, r8
    add r1, r1, r2
    mov r7, r1
    mov r1, 10
    store_8 [r7], r1
    add r7, r8, 1
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 128
    store_32 [r2], r7
    mov r1, 0
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 132
    store_32 [r2], r1
    mov r1, 0
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 112
    store_32 [r2], r1
    mov r1, 0
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 116
    store_32 [r2], r1
    mov r1, 0
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 120
    store_8 [r2], r1
    mov r1, 0
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 124
    store_32 [r2], r1
    mov r1, 10
    call __sym_fn_render_14
    jmp __sym_block_108
__sym_block_92:
    mov r2, 65535
    lsl r2, r2, 16
    or r2, r2, 65504
    add r7, r9, r2
    mov r2, 95
    cmp r7, r2
    jb __sym_cmp_yes_249
    mov r1, 0
    jmp __sym_cmp_done_250
__sym_cmp_yes_249:
    mov r1, 1
__sym_cmp_done_250:
    and r1, r1, 1
    mov r10, r1
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 112
    load_32 r7, [r2]
    mov r2, 255
    cmp r7, r2
    jb __sym_cmp_yes_251
    mov r1, 0
    jmp __sym_cmp_done_252
__sym_cmp_yes_251:
    mov r1, 1
__sym_cmp_done_252:
    and r1, r1, 1
    mov r7, r1
    mov r1, r10
    cmp r1, 0
    jne __sym_select_yes_253
    mov r1, 0
    jmp __sym_select_done_254
__sym_select_yes_253:
    mov r1, r7
__sym_select_done_254:
    and r1, r1, 1
    mov r7, r1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_255
    jmp __sym_block_108
__sym_edge_true_255:
    jmp __sym_block_94
__sym_block_93:
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 112
    load_32 r7, [r2]
    mov r2, 255
    cmp r7, r2
    jb __sym_edge_true_256
    jmp __sym_block_108
__sym_edge_true_256:
    jmp __sym_block_94
__sym_block_94:
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 136
    load_32 r7, [r2]
    mov r2, 0
    cmp r7, r2
    je __sym_edge_true_257
    jmp __sym_block_95
__sym_edge_true_257:
    sub r12, r13, 8
    store_32 [r12], r9
    jmp __sym_block_101
__sym_block_95:
    mov r2, 65535
    lsl r2, r2, 16
    or r2, r2, 65439
    add r7, r9, r2
    mov r2, 26
    cmp r7, r2
    jb __sym_edge_true_258
    jmp __sym_block_96
__sym_edge_true_258:
    jmp __sym_block_97
__sym_block_96:
    mov r1, r8
    and r1, r1, 255
    mov r8, r1
    mov r1, 0
    mov r10, r1
    jmp __sym_block_98
__sym_block_97:
    mov r2, 65535
    lsl r2, r2, 16
    or r2, r2, 65504
    add r7, r9, r2
    sub r12, r13, 8
    store_32 [r12], r7
    jmp __sym_block_101
__sym_block_98:
    mov r1, 1
    lsl r1, r1, 16
    or r1, r1, 932
    mov r2, r10
    add r1, r1, r2
    mov r7, r1
    load_8 r7, [r7]
    and r7, r7, 255
    cmp r7, r8
    je __sym_edge_true_259
    jmp __sym_block_100
__sym_edge_true_259:
    jmp __sym_block_99
__sym_block_99:
    mov r1, 1
    lsl r1, r1, 16
    or r1, r1, 954
    mov r2, r10
    add r1, r1, r2
    mov r7, r1
    load_8 r7, [r7]
    and r7, r7, 255
    mov r1, r7
    mov r7, r1
    sub r12, r13, 8
    store_32 [r12], r7
    jmp __sym_block_101
__sym_block_100:
    add r7, r10, 1
    mov r2, 21
    cmp r7, r2
    je __sym_edge_true_260
    mov r10, r7
    jmp __sym_block_98
__sym_edge_true_260:
    sub r12, r13, 8
    store_32 [r12], r9
    jmp __sym_block_101
__sym_block_101:
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 120
    load_8 r7, [r2]
    and r7, r7, 1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_261
    jmp __sym_block_102
__sym_edge_true_261:
    jmp __sym_block_103
__sym_block_102:
    mov r1, 1
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 120
    store_8 [r2], r1
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 104
    load_32 r7, [r2]
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 924
    store_32 [r2], r7
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 108
    load_32 r7, [r2]
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 928
    store_32 [r2], r7
    mov r1, 0
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 124
    store_32 [r2], r1
    mov r1, 0
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 116
    store_32 [r2], r1
    jmp __sym_block_103
__sym_block_103:
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 116
    load_32 r11, [r2]
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 112
    load_32 r10, [r2]
    cmp r11, r10
    je __sym_edge_true_262
    jmp __sym_block_104
__sym_edge_true_262:
    jmp __sym_block_105
__sym_block_104:
    cmp r10, r11
    ja __sym_edge_true_263
    jmp __sym_block_106
__sym_edge_true_263:
    mov r9, r10
    jmp __sym_block_107
__sym_block_105:
    sub r12, r13, 8
    load_32 r1, [r12]
    and r1, r1, 255
    mov r8, r1
    mov r1, 1
    lsl r1, r1, 16
    or r1, r1, 656
    mov r2, r10
    add r1, r1, r2
    mov r7, r1
    store_8 [r7], r8
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 108
    load_32 r7, [r2]
    mov r1, r7
    and r1, r1, 255
    mov r8, r1
    mov r1, 1
    lsl r1, r1, 16
    or r1, r1, 400
    mov r2, r10
    add r1, r1, r2
    mov r7, r1
    store_8 [r7], r8
    sub r12, r13, 8
    load_32 r1, [r12]
    call __sym_fn_render_14
    mov r10, r1
    mov r1, r10
    and r1, r1, 255
    mov r9, r1
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 112
    load_32 r8, [r2]
    mov r1, 1
    lsl r1, r1, 16
    or r1, r1, 144
    mov r2, r8
    add r1, r1, r2
    mov r7, r1
    store_8 [r7], r9
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 124
    load_32 r7, [r2]
    add r7, r7, r10
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 124
    store_32 [r2], r7
    add r7, r8, 1
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 112
    store_32 [r2], r7
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 116
    load_32 r7, [r2]
    add r7, r7, 1
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 116
    store_32 [r2], r7
    jmp __sym_block_108
__sym_block_106:
    sub r12, r13, 8
    load_32 r1, [r12]
    and r1, r1, 255
    mov r8, r1
    add r7, r11, 1
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 116
    store_32 [r2], r7
    mov r1, 1
    lsl r1, r1, 16
    or r1, r1, 656
    mov r2, r11
    add r1, r1, r2
    mov r7, r1
    store_8 [r7], r8
    add r7, r10, 1
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 112
    store_32 [r2], r7
    call __sym_fn_redraw_edit_124
    jmp __sym_block_108
__sym_block_107:
    mov r1, 1
    lsl r1, r1, 16
    or r1, r1, 656
    mov r2, r9
    add r1, r1, r2
    mov r8, r1
    mov r1, r8
    mov r2, 65535
    lsl r2, r2, 16
    or r2, r2, 65535
    add r1, r1, r2
    mov r7, r1
    load_8 r7, [r7]
    and r7, r7, 255
    store_8 [r8], r7
    mov r2, 65535
    lsl r2, r2, 16
    or r2, r2, 65535
    add r9, r9, r2
    cmp r9, r11
    ja __sym_edge_true_264
    jmp __sym_block_106
__sym_edge_true_264:
    jmp __sym_block_107
__sym_block_108:
    call __sym_fn_reset_cursor_5
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 128
    load_32 r8, [r2]
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 132
    load_32 r7, [r2]
    sub r7, r8, r7
    jmp __sym_block_109
__sym_block_109:
    mov r1, r7
    mov sp, r13
    pop r13
    ret

; function update_cursor, frame 0 bytes
__sym_fn_update_cursor_110:
    push r13
    mov r13, sp
__sym_block_111:
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 140
    load_32 r7, [r2]
    mov r2, 0
    cmp r7, r2
    je __sym_edge_true_265
    jmp __sym_block_117
__sym_edge_true_265:
    jmp __sym_block_112
__sym_block_112:
    time_0 r1
    mov r10, r1
    time_1 r1
    mov r9, r1
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 916
    load_32 r7, [r2]
    sub r11, r10, r7
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 920
    load_32 r8, [r2]
    sub r8, r9, r8
    cmp r10, r7
    jb __sym_cmp_yes_266
    mov r1, 0
    jmp __sym_cmp_done_267
__sym_cmp_yes_266:
    mov r1, 1
__sym_cmp_done_267:
    and r1, r1, 1
    mov r7, r1
    mov r1, r7
    mov r7, r1
    cmp r8, r7
    jne __sym_cmp_yes_268
    mov r1, 0
    jmp __sym_cmp_done_269
__sym_cmp_yes_268:
    mov r1, 1
__sym_cmp_done_269:
    and r1, r1, 1
    mov r8, r1
    mov r2, 7629
    lsl r2, r2, 16
    or r2, r2, 25855
    cmp r11, r2
    ja __sym_cmp_yes_270
    mov r1, 0
    jmp __sym_cmp_done_271
__sym_cmp_yes_270:
    mov r1, 1
__sym_cmp_done_271:
    and r1, r1, 1
    mov r7, r1
    mov r1, r8
    cmp r1, 0
    jne __sym_select_yes_272
    mov r1, r7
    jmp __sym_select_done_273
__sym_select_yes_272:
    mov r1, 1
__sym_select_done_273:
    and r1, r1, 1
    mov r7, r1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_274
    jmp __sym_block_117
__sym_edge_true_274:
    jmp __sym_block_113
__sym_block_113:
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 916
    store_32 [r2], r10
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 920
    store_32 [r2], r9
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 912
    load_32 r8, [r2]
    xor r7, r8, 1
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 912
    store_32 [r2], r7
    mov r2, 1
    cmp r8, r2
    je __sym_edge_true_275
    jmp __sym_block_114
__sym_edge_true_275:
    jmp __sym_block_116
__sym_block_114:
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 140
    load_32 r7, [r2]
    mov r2, 0
    cmp r7, r2
    je __sym_edge_true_276
    jmp __sym_block_117
__sym_edge_true_276:
    jmp __sym_block_115
__sym_block_115:
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 108
    load_32 r7, [r2]
    mov r2, 0
    cmp r7, r2
    je __sym_cmp_yes_277
    mov r1, 0
    jmp __sym_cmp_done_278
__sym_cmp_yes_277:
    mov r1, 1
__sym_cmp_done_278:
    and r1, r1, 1
    mov r10, r1
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 104
    load_32 r9, [r2]
    add r8, r9, 1
    mov r2, 3839
    cmp r8, r2
    ja __sym_cmp_yes_279
    mov r1, 0
    jmp __sym_cmp_done_280
__sym_cmp_yes_279:
    mov r1, 1
__sym_cmp_done_280:
    and r1, r1, 1
    mov r7, r1
    or r7, r10, r7
    and r7, r7, 1
    mov r1, r7
    cmp r1, 0
    jne __sym_select_yes_281
    mov r1, r8
    jmp __sym_select_done_282
__sym_select_yes_281:
    mov r1, r9
__sym_select_done_282:
    mov r7, r1
    mov r1, r7
    mov r2, 1
    call __sym_fn_tty_display_cursor_149
    jmp __sym_block_117
__sym_block_116:
    mov r1, 0
    mov r2, 0
    call __sym_fn_tty_display_cursor_149
    jmp __sym_block_117
__sym_block_117:
    mov r1, 0
    mov sp, r13
    pop r13
    ret

; function position_edit_cursor, frame 0 bytes
__sym_fn_position_edit_cursor_118:
__sym_block_119:
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 924
    load_32 r8, [r2]
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 104
    store_32 [r2], r8
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 928
    load_32 r7, [r2]
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 108
    store_32 [r2], r7
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 116
    load_32 r9, [r2]
    mov r2, 0
    cmp r9, r2
    je __sym_edge_true_283
    jmp __sym_block_120
__sym_edge_true_283:
    jmp __sym_block_123
__sym_block_120:
    add r8, r7, r8
    mov r1, 0
    mov r10, r1
    jmp __sym_block_122
__sym_block_121:
    mod r7, r8, 96
    mov r2, 0
    cmp r7, r2
    je __sym_cmp_yes_284
    mov r1, 0
    jmp __sym_cmp_done_285
__sym_cmp_yes_284:
    mov r1, 1
__sym_cmp_done_285:
    and r1, r1, 1
    mov r7, r1
    mov r1, r7
    mov r7, r1
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 108
    store_32 [r2], r7
    sub r7, r8, r7
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 104
    store_32 [r2], r7
    jmp __sym_block_123
__sym_block_122:
    mov r1, 1
    lsl r1, r1, 16
    or r1, r1, 144
    mov r2, r10
    add r1, r1, r2
    mov r7, r1
    load_8 r7, [r7]
    and r7, r7, 255
    mov r1, r7
    mov r7, r1
    add r8, r8, r7
    add r7, r10, 1
    cmp r7, r9
    je __sym_edge_true_286
    mov r10, r7
    jmp __sym_block_122
__sym_edge_true_286:
    jmp __sym_block_121
__sym_block_123:
    mov r1, 0
    ret

; function redraw_edit, frame 16 bytes
__sym_fn_redraw_edit_124:
    push r13
    mov r13, sp
    sub sp, sp, 16
__sym_block_125:
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 924
    load_32 r8, [r2]
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 928
    load_32 r7, [r2]
    add r1, r7, r8
    sub r12, r13, 4
    store_32 [r12], r1
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 124
    load_32 r7, [r2]
    mov r2, 0
    cmp r7, r2
    je __sym_edge_true_287
    mov r1, 0
    mov r8, r1
    jmp __sym_block_127
__sym_edge_true_287:
    jmp __sym_block_126
__sym_block_126:
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 924
    load_32 r7, [r2]
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 104
    store_32 [r2], r7
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 928
    load_32 r7, [r2]
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 108
    store_32 [r2], r7
    mov r1, 0
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 124
    store_32 [r2], r1
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 112
    load_32 r7, [r2]
    mov r2, 0
    cmp r7, r2
    je __sym_edge_true_288
    mov r1, 0
    mov r9, r1
    jmp __sym_block_129
__sym_edge_true_288:
    jmp __sym_block_128
__sym_block_127:
    sub r12, r13, 4
    load_32 r1, [r12]
    add r7, r1, r8
    sub r12, r13, 8
    store_32 [r12], r8
    mov r1, r7
    mov r2, 0
    call __sym_fn_tty_display_put_161
    sub r12, r13, 8
    load_32 r8, [r12]
    add r8, r8, 1
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 124
    load_32 r7, [r2]
    cmp r8, r7
    jb __sym_edge_true_289
    jmp __sym_block_126
__sym_edge_true_289:
    jmp __sym_block_127
__sym_block_128:
    call __sym_fn_position_edit_cursor_118
    mov r1, 0
    mov sp, r13
    pop r13
    ret
__sym_block_129:
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 108
    load_32 r7, [r2]
    mov r1, r7
    and r1, r1, 255
    mov r8, r1
    mov r1, 1
    lsl r1, r1, 16
    or r1, r1, 400
    mov r2, r9
    add r1, r1, r2
    mov r7, r1
    store_8 [r7], r8
    mov r1, 1
    lsl r1, r1, 16
    or r1, r1, 656
    mov r2, r9
    add r1, r1, r2
    mov r7, r1
    load_8 r7, [r7]
    and r7, r7, 255
    mov r1, r7
    mov r7, r1
    sub r12, r13, 12
    store_32 [r12], r9
    mov r1, r7
    call __sym_fn_render_14
    sub r12, r13, 12
    load_32 r9, [r12]
    mov r10, r1
    mov r1, r10
    and r1, r1, 255
    mov r8, r1
    mov r1, 1
    lsl r1, r1, 16
    or r1, r1, 144
    mov r2, r9
    add r1, r1, r2
    mov r7, r1
    store_8 [r7], r8
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 124
    load_32 r7, [r2]
    add r7, r7, r10
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 124
    store_32 [r2], r7
    add r8, r9, 1
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 112
    load_32 r7, [r2]
    cmp r8, r7
    jb __sym_edge_true_290
    jmp __sym_block_128
__sym_edge_true_290:
    mov r9, r8
    jmp __sym_block_129

; function tty_read, frame 16 bytes
__sym_fn_tty_read_130:
    push r13
    mov r13, sp
    sub sp, sp, 16
    sub r12, r13, 4
    store_32 [r12], r1
    sub r12, r13, 8
    store_32 [r12], r2
__sym_block_131:
    sub r12, r13, 4
    load_32 r1, [r12]
    mov r2, 0
    cmp r1, r2
    jne __sym_cmp_yes_291
    mov r1, 0
    jmp __sym_cmp_done_292
__sym_cmp_yes_291:
    mov r1, 1
__sym_cmp_done_292:
    and r1, r1, 1
    mov r8, r1
    sub r12, r13, 8
    load_32 r1, [r12]
    mov r2, 0
    cmp r1, r2
    jne __sym_cmp_yes_293
    mov r1, 0
    jmp __sym_cmp_done_294
__sym_cmp_yes_293:
    mov r1, 1
__sym_cmp_done_294:
    and r1, r1, 1
    mov r7, r1
    and r7, r8, r7
    and r7, r7, 1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_295
    mov r1, 0
    mov r11, r1
    jmp __sym_block_138
__sym_edge_true_295:
    jmp __sym_block_132
__sym_block_132:
    call __sym_fn_tty_poll_62
    mov r7, r1
    mov r2, 0
    cmp r7, r2
    je __sym_edge_true_296
    jmp __sym_block_133
__sym_edge_true_296:
    jmp __sym_block_132
__sym_block_133:
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 128
    load_32 r1, [r2]
    sub r12, r13, 12
    store_32 [r12], r1
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 132
    load_32 r8, [r2]
    sub r12, r13, 12
    load_32 r1, [r12]
    sub r7, r1, r8
    sub r12, r13, 8
    load_32 r1, [r12]
    mov r2, r7
    cmp r1, r2
    jbe __sym_minmax_297
    mov r1, r2
__sym_minmax_297:
    mov r11, r1
    sub r12, r13, 12
    load_32 r1, [r12]
    cmp r1, r8
    je __sym_edge_true_298
    mov r1, 0
    mov r10, r1
    mov r7, r8
    jmp __sym_block_136
__sym_edge_true_298:
    jmp __sym_block_135
__sym_block_134:
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 132
    store_32 [r2], r9
    jmp __sym_block_135
__sym_block_135:
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 132
    load_32 r7, [r2]
    sub r12, r13, 12
    load_32 r2, [r12]
    cmp r7, r2
    je __sym_edge_true_299
    jmp __sym_block_138
__sym_edge_true_299:
    jmp __sym_block_137
__sym_block_136:
    add r9, r7, 1
    mov r1, 1
    lsl r1, r1, 16
    or r1, r1, 656
    mov r2, r7
    add r1, r1, r2
    mov r7, r1
    load_8 r8, [r7]
    and r8, r8, 255
    sub r12, r13, 4
    load_32 r1, [r12]
    mov r2, r10
    add r1, r1, r2
    mov r7, r1
    store_8 [r7], r8
    add r10, r10, 1
    cmp r10, r11
    je __sym_edge_true_300
    mov r7, r9
    jmp __sym_block_136
__sym_edge_true_300:
    jmp __sym_block_134
__sym_block_137:
    mov r1, 0
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 132
    store_32 [r2], r1
    mov r1, 0
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 128
    store_32 [r2], r1
    jmp __sym_block_138
__sym_block_138:
    mov r1, r11
    mov sp, r13
    pop r13
    ret

; function tty_readline, frame 24 bytes
__sym_fn_tty_readline_139:
    push r13
    mov r13, sp
    sub sp, sp, 24
    sub r12, r13, 4
    store_32 [r12], r1
    sub r12, r13, 8
    store_32 [r12], r2
__sym_block_140:
    sub r1, r13, 9
    mov r10, r1
    sub r12, r13, 4
    load_32 r1, [r12]
    mov r2, 0
    cmp r1, r2
    jne __sym_cmp_yes_301
    mov r1, 0
    jmp __sym_cmp_done_302
__sym_cmp_yes_301:
    mov r1, 1
__sym_cmp_done_302:
    and r1, r1, 1
    mov r8, r1
    sub r12, r13, 8
    load_32 r1, [r12]
    mov r2, 0
    cmp r1, r2
    jne __sym_cmp_yes_303
    mov r1, 0
    jmp __sym_cmp_done_304
__sym_cmp_yes_303:
    mov r1, 1
__sym_cmp_done_304:
    and r1, r1, 1
    mov r7, r1
    and r7, r8, r7
    and r7, r7, 1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_305
    mov r1, 0
    mov r7, r1
    jmp __sym_block_148
__sym_edge_true_305:
    jmp __sym_block_141
__sym_block_141:
    sub r12, r13, 8
    load_32 r1, [r12]
    mov r2, 65535
    lsl r2, r2, 16
    or r2, r2, 65535
    add r1, r1, r2
    sub r12, r13, 16
    store_32 [r12], r1
    mov r1, 0
    mov r11, r1
    jmp __sym_block_142
__sym_block_142:
    sub r12, r13, 20
    store_32 [r12], r10
    sub r12, r13, 24
    store_32 [r12], r11
    mov r1, r10
    mov r2, 1
    call __sym_fn_tty_read_130
    sub r12, r13, 20
    load_32 r10, [r12]
    sub r12, r13, 24
    load_32 r11, [r12]
    load_8 r8, [r10]
    and r8, r8, 255
    mov r2, 10
    cmp r8, r2
    je __sym_cmp_yes_306
    mov r1, 0
    jmp __sym_cmp_done_307
__sym_cmp_yes_306:
    mov r1, 1
__sym_cmp_done_307:
    and r1, r1, 1
    mov r9, r1
    mov r1, r9
    cmp r1, 0
    jne __sym_edge_true_308
    jmp __sym_block_143
__sym_edge_true_308:
    mov r8, r11
    jmp __sym_block_146
__sym_block_143:
    sub r12, r13, 16
    load_32 r2, [r12]
    cmp r11, r2
    jb __sym_edge_true_309
    jmp __sym_block_145
__sym_edge_true_309:
    jmp __sym_block_144
__sym_block_144:
    sub r12, r13, 4
    load_32 r1, [r12]
    mov r2, r11
    add r1, r1, r2
    mov r7, r1
    store_8 [r7], r8
    jmp __sym_block_145
__sym_block_145:
    add r8, r11, 1
    jmp __sym_block_146
__sym_block_146:
    mov r1, r9
    cmp r1, 0
    jne __sym_edge_true_310
    mov r11, r8
    jmp __sym_block_142
__sym_edge_true_310:
    jmp __sym_block_147
__sym_block_147:
    sub r12, r13, 8
    load_32 r1, [r12]
    mov r2, 65535
    lsl r2, r2, 16
    or r2, r2, 65535
    add r7, r1, r2
    mov r1, r8
    mov r2, r7
    cmp r1, r2
    jbe __sym_minmax_311
    mov r1, r2
__sym_minmax_311:
    mov r7, r1
    sub r12, r13, 4
    load_32 r1, [r12]
    mov r2, r7
    add r1, r1, r2
    mov r7, r1
    mov r1, 0
    store_8 [r7], r1
    mov r7, r8
    jmp __sym_block_148
__sym_block_148:
    mov r1, r7
    mov sp, r13
    pop r13
    ret

; function tty_display_cursor, frame 0 bytes
__sym_fn_tty_display_cursor_149:
    mov r10, r1
    mov r9, r2
__sym_block_150:
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 976
    load_8 r7, [r2]
    and r7, r7, 1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_312
    jmp __sym_block_152
__sym_edge_true_312:
    jmp __sym_block_151
__sym_block_151:
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 980
    load_32 r8, [r2]
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 16344
    load_32 r7, [r2]
    mov r1, 1
    lsl r1, r1, 16
    or r1, r1, 984
    mov r2, r7
    lsl r2, r2, 2
    add r1, r1, r2
    mov r7, r1
    store_32 [r7], r8
    mov r1, 0
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 976
    store_8 [r2], r1
    jmp __sym_block_152
__sym_block_152:
    mov r2, 0
    cmp r9, r2
    je __sym_edge_true_313
    jmp __sym_block_153
__sym_edge_true_313:
    jmp __sym_block_154
__sym_block_153:
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 16344
    store_32 [r2], r10
    mov r1, 1
    lsl r1, r1, 16
    or r1, r1, 984
    mov r2, r10
    lsl r2, r2, 2
    add r1, r1, r2
    mov r9, r1
    load_32 r10, [r9]
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 980
    store_32 [r2], r10
    mov r2, 65280
    lsl r2, r2, 16
    or r2, r2, 255
    and r8, r10, r2
    lsl r7, r10, 8
    mov r2, 255
    lsl r2, r2, 16
    and r7, r7, r2
    or r8, r7, r8
    lsr r7, r10, 8
    and r7, r7, 65280
    or r7, r8, r7
    store_32 [r9], r7
    mov r1, 1
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 976
    store_8 [r2], r1
    jmp __sym_block_154
__sym_block_154:
    mov r1, 0
    ret

; function tty_display_init, frame 0 bytes
__sym_fn_tty_display_init_155:
__sym_block_156:
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 976
    load_8 r7, [r2]
    and r7, r7, 1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_314
    jmp __sym_block_158
__sym_edge_true_314:
    jmp __sym_block_157
__sym_block_157:
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 980
    load_32 r8, [r2]
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 16344
    load_32 r7, [r2]
    mov r1, 1
    lsl r1, r1, 16
    or r1, r1, 984
    mov r2, r7
    lsl r2, r2, 2
    add r1, r1, r2
    mov r7, r1
    store_32 [r7], r8
    mov r1, 0
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 976
    store_8 [r2], r1
    jmp __sym_block_158
__sym_block_158:
    mov r1, 0
    mov r8, r1
    jmp __sym_block_159
__sym_block_159:
    mov r1, 1
    lsl r1, r1, 16
    or r1, r1, 984
    mov r2, r8
    lsl r2, r2, 2
    add r1, r1, r2
    mov r7, r1
    mov r1, 255
    lsl r1, r1, 16
    store_32 [r7], r1
    add r7, r8, 1
    mov r2, 3840
    cmp r7, r2
    je __sym_edge_true_315
    mov r8, r7
    jmp __sym_block_159
__sym_edge_true_315:
    jmp __sym_block_160
__sym_block_160:
    mov r1, 0
    mov r2, 1
    screen r1, r2
    mov r1, 1
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 984
    screen r1, r2
    mov r1, 0
    ret

; function tty_display_put, frame 0 bytes
__sym_fn_tty_display_put_161:
    mov r9, r1
    mov r7, r2
__sym_block_162:
    lsl r7, r7, 24
    mov r2, 255
    lsl r2, r2, 16
    or r8, r7, r2
    mov r1, 1
    lsl r1, r1, 16
    or r1, r1, 984
    mov r2, r9
    lsl r2, r2, 2
    add r1, r1, r2
    mov r7, r1
    store_32 [r7], r8
    mov r1, 0
    ret

; function tty_display_scroll, frame 0 bytes
__sym_fn_tty_display_scroll_163:
__sym_block_164:
    mov r1, 0
    mov r9, r1
    jmp __sym_block_165
__sym_block_165:
    mov r1, 1
    lsl r1, r1, 16
    or r1, r1, 984
    mov r2, r9
    lsl r2, r2, 2
    add r1, r1, r2
    mov r8, r1
    mov r1, r8
    mov r2, 384
    add r1, r1, r2
    mov r7, r1
    load_32 r7, [r7]
    store_32 [r8], r7
    add r7, r9, 1
    mov r2, 3744
    cmp r7, r2
    je __sym_edge_true_316
    mov r9, r7
    jmp __sym_block_165
__sym_edge_true_316:
    mov r1, 3744
    mov r8, r1
    jmp __sym_block_167
__sym_block_166:
    mov r1, 0
    ret
__sym_block_167:
    mov r1, 1
    lsl r1, r1, 16
    or r1, r1, 984
    mov r2, r8
    lsl r2, r2, 2
    add r1, r1, r2
    mov r7, r1
    mov r1, 255
    lsl r1, r1, 16
    store_32 [r7], r1
    add r7, r8, 1
    mov r2, 3840
    cmp r7, r2
    je __sym_edge_true_317
    mov r8, r7
    jmp __sym_block_167
__sym_edge_true_317:
    jmp __sym_block_166

; Global addresses (zero tail uses initially zeroed RAM).
; .str = 65536
; .str.1 = 65560
; .str.2 = 65621
; .str.3 = 65624
; initialized = 65636
; cursor = 65640
; wrap_pending = 65644
; edit_length = 65648
; edit_position = 65652
; edit_active = 65656
; edit_cells = 65660
; ready_length = 65664
; read_offset = 65668
; shift_down = 65672
; cursor_disabled = 65676
; echo_width = 65680
; echo_pending = 65936
; line = 66192
; cursor_phase = 66448
; cursor_time_low = 66452
; cursor_time_high = 66456
; edit_start_cursor = 66460
; edit_start_pending = 66464
; shifted.plain = 66468
; shifted.upper = 66490
; cursor_drawn = 66512
; cursor_saved = 66516
; framebuffer = 66520
; cursor_position = 81880
@65536
U8 83
U8 121
U8 109
U8 112
U8 104
U8 111
U8 110
U8 121
U8 32
U8 99
U8 97
U8 110
U8 111
U8 110
U8 105
U8 99
U8 97
U8 108
U8 32
U8 84
U8 84
U8 89
U8 10
U8 0
U8 76
U8 101
U8 102
U8 116
U8 47
U8 82
U8 105
U8 103
U8 104
U8 116
U8 32
U8 109
U8 111
U8 118
U8 101
U8 59
U8 32
U8 116
U8 121
U8 112
U8 101
U8 32
U8 116
U8 111
U8 32
U8 105
U8 110
U8 115
U8 101
U8 114
U8 116
U8 59
U8 32
U8 66
U8 83
U8 32
U8 100
U8 101
U8 108
U8 101
U8 116
U8 101
U8 115
U8 59
U8 32
U8 69
U8 110
U8 116
U8 101
U8 114
U8 32
U8 115
U8 117
U8 98
U8 109
U8 105
U8 116
U8 115
U8 46
U8 10
U8 0
U8 62
U8 32
U8 0
U8 89
U8 111
U8 117
U8 32
U8 116
U8 121
U8 112
U8 101
U8 100
U8 58
U8 32
@66468
U8 96
U8 49
U8 50
U8 51
U8 52
U8 53
U8 54
U8 55
U8 56
U8 57
U8 48
U8 45
U8 61
U8 91
U8 93
U8 92
U8 59
U8 39
U8 44
U8 46
U8 47
U8 0
U8 126
U8 33
U8 64
U8 35
U8 36
U8 37
U8 94
U8 38
U8 42
U8 40
U8 41
U8 95
U8 43
U8 123
U8 125
U8 124
U8 58
U8 34
U8 60
U8 62
U8 63
