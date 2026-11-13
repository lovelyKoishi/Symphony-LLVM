; Symphony LLVM backend 0.1. Big endian, 32-bit values/pointers.
__sym_start:
    mov sp, 1
    lsl sp, sp, 16
    call __sym_fn_main_0
__sym_halt:
    jmp __sym_halt
__sym_trap:
    jmp __sym_trap

; function main, frame 272 bytes
__sym_fn_main_0:
    push r13
    mov r13, sp
    sub sp, sp, 272
__sym_block_1:
    sub r1, r13, 260
    sub r12, r13, 4
    store_32 [r12], r1
    call __sym_fn_tty_init_38
    mov r1, 32768
    call __sym_fn_puts_211
    mov r1, 32783
    call __sym_fn_puts_211
    jmp __sym_block_2
__sym_block_2:
    mov r1, 32835
    call __sym_fn_tty_puts_84
    sub r12, r13, 4
    load_32 r1, [r12]
    mov r2, 256
    call __sym_fn_tty_readline_170
    sub r12, r13, 4
    load_32 r1, [r12]
    mov r8, r1
    jmp __sym_block_3
__sym_block_3:
    load_8 r7, [r8]
    and r7, r7, 255
    mov r1, r7
    mov r2, 32
    cmp r1, r2
    je __sym_switch_213
    mov r2, 9
    cmp r1, r2
    je __sym_switch_214
    mov r2, 0
    cmp r1, r2
    je __sym_switch_215
    mov r10, r8
    jmp __sym_block_5
__sym_switch_213:
    jmp __sym_block_4
__sym_switch_214:
    jmp __sym_block_4
__sym_switch_215:
    mov r1, 3
    mov r7, r1
    jmp __sym_block_30
__sym_block_4:
    mov r1, r8
    mov r2, 1
    add r1, r1, r2
    mov r8, r1
    jmp __sym_block_3
__sym_block_5:
    load_8 r7, [r10]
    and r7, r7, 255
    mov r1, r7
    mov r2, 0
    cmp r1, r2
    je __sym_switch_216
    mov r2, 9
    cmp r1, r2
    je __sym_switch_217
    mov r2, 32
    cmp r1, r2
    je __sym_switch_218
    jmp __sym_block_6
__sym_switch_216:
    mov r9, r10
    jmp __sym_block_8
__sym_switch_217:
    jmp __sym_block_7
__sym_switch_218:
    jmp __sym_block_7
__sym_block_6:
    mov r1, r10
    mov r2, 1
    add r1, r1, r2
    mov r7, r1
    mov r10, r7
    jmp __sym_block_5
__sym_block_7:
    mov r1, r10
    mov r2, 1
    add r1, r1, r2
    mov r9, r1
    mov r1, 0
    store_8 [r10], r1
    jmp __sym_block_8
__sym_block_8:
    jmp __sym_block_9
__sym_block_9:
    load_8 r7, [r9]
    and r7, r7, 255
    mov r1, r7
    mov r2, 32
    cmp r1, r2
    je __sym_switch_219
    mov r2, 9
    cmp r1, r2
    je __sym_switch_220
    jmp __sym_block_11
__sym_switch_219:
    jmp __sym_block_10
__sym_switch_220:
    jmp __sym_block_10
__sym_block_10:
    mov r1, r9
    mov r2, 1
    add r1, r1, r2
    mov r9, r1
    jmp __sym_block_9
__sym_block_11:
    sub r12, r13, 264
    store_32 [r12], r8
    sub r12, r13, 268
    store_32 [r12], r9
    mov r1, r8
    mov r2, 32841
    call __sym_fn_strcmp_205
    sub r12, r13, 264
    load_32 r8, [r12]
    sub r12, r13, 268
    load_32 r9, [r12]
    mov r7, r1
    mov r2, 0
    cmp r7, r2
    je __sym_edge_true_221
    jmp __sym_block_13
__sym_edge_true_221:
    jmp __sym_block_12
__sym_block_12:
    mov r1, r9
    call __sym_fn_puts_211
    mov r1, 0
    mov r7, r1
    jmp __sym_block_30
__sym_block_13:
    sub r12, r13, 264
    store_32 [r12], r8
    sub r12, r13, 268
    store_32 [r12], r9
    mov r1, r8
    mov r2, 32846
    call __sym_fn_strcmp_205
    sub r12, r13, 264
    load_32 r8, [r12]
    sub r12, r13, 268
    load_32 r9, [r12]
    mov r7, r1
    mov r2, 0
    cmp r7, r2
    je __sym_edge_true_222
    jmp __sym_block_17
__sym_edge_true_222:
    jmp __sym_block_14
__sym_block_14:
    load_8 r7, [r9]
    and r7, r7, 255
    mov r2, 0
    cmp r7, r2
    je __sym_edge_true_223
    jmp __sym_block_15
__sym_edge_true_223:
    jmp __sym_block_16
__sym_block_15:
    sub r12, r13, 264
    store_32 [r12], r8
    mov r1, 32976
    call __sym_fn_tty_puts_84
    sub r12, r13, 264
    load_32 r8, [r12]
    mov r1, r8
    call __sym_fn_puts_211
    mov r1, 0
    mov r7, r1
    jmp __sym_block_30
__sym_block_16:
    mov r1, 32984
    call __sym_fn_puts_211
    mov r1, 33009
    call __sym_fn_puts_211
    mov r1, 33031
    call __sym_fn_puts_211
    mov r1, 33059
    call __sym_fn_puts_211
    mov r1, 33094
    call __sym_fn_puts_211
    mov r1, 0
    mov r7, r1
    jmp __sym_block_30
__sym_block_17:
    sub r12, r13, 264
    store_32 [r12], r8
    sub r12, r13, 268
    store_32 [r12], r9
    mov r1, r8
    mov r2, 32851
    call __sym_fn_strcmp_205
    sub r12, r13, 264
    load_32 r8, [r12]
    sub r12, r13, 268
    load_32 r9, [r12]
    mov r7, r1
    mov r2, 0
    cmp r7, r2
    je __sym_edge_true_224
    jmp __sym_block_21
__sym_edge_true_224:
    jmp __sym_block_18
__sym_block_18:
    load_8 r7, [r9]
    and r7, r7, 255
    mov r2, 0
    cmp r7, r2
    je __sym_edge_true_225
    jmp __sym_block_19
__sym_edge_true_225:
    jmp __sym_block_20
__sym_block_19:
    sub r12, r13, 264
    store_32 [r12], r8
    mov r1, 32976
    call __sym_fn_tty_puts_84
    sub r12, r13, 264
    load_32 r8, [r12]
    mov r1, r8
    call __sym_fn_puts_211
    mov r1, 0
    mov r7, r1
    jmp __sym_block_30
__sym_block_20:
    call __sym_fn_tty_clear_33
    mov r1, 0
    mov r7, r1
    jmp __sym_block_30
__sym_block_21:
    sub r12, r13, 264
    store_32 [r12], r8
    sub r12, r13, 268
    store_32 [r12], r9
    mov r1, r8
    mov r2, 32857
    call __sym_fn_strcmp_205
    sub r12, r13, 264
    load_32 r8, [r12]
    sub r12, r13, 268
    load_32 r9, [r12]
    mov r7, r1
    mov r2, 0
    cmp r7, r2
    je __sym_edge_true_226
    jmp __sym_block_25
__sym_edge_true_226:
    jmp __sym_block_22
__sym_block_22:
    load_8 r7, [r9]
    and r7, r7, 255
    mov r2, 0
    cmp r7, r2
    je __sym_edge_true_227
    jmp __sym_block_23
__sym_edge_true_227:
    jmp __sym_block_24
__sym_block_23:
    sub r12, r13, 264
    store_32 [r12], r8
    mov r1, 32976
    call __sym_fn_tty_puts_84
    sub r12, r13, 264
    load_32 r8, [r12]
    mov r1, r8
    call __sym_fn_puts_211
    mov r1, 0
    mov r7, r1
    jmp __sym_block_30
__sym_block_24:
    mov r1, 32863
    call __sym_fn_puts_211
    mov r1, 32899
    call __sym_fn_puts_211
    mov r1, 0
    mov r7, r1
    jmp __sym_block_30
__sym_block_25:
    sub r12, r13, 264
    store_32 [r12], r8
    sub r12, r13, 268
    store_32 [r12], r9
    mov r1, r8
    mov r2, 32948
    call __sym_fn_strcmp_205
    sub r12, r13, 264
    load_32 r8, [r12]
    sub r12, r13, 268
    load_32 r9, [r12]
    mov r7, r1
    mov r2, 0
    cmp r7, r2
    je __sym_edge_true_228
    jmp __sym_block_29
__sym_edge_true_228:
    jmp __sym_block_26
__sym_block_26:
    load_8 r7, [r9]
    and r7, r7, 255
    mov r2, 0
    cmp r7, r2
    je __sym_edge_true_229
    jmp __sym_block_27
__sym_edge_true_229:
    jmp __sym_block_28
__sym_block_27:
    sub r12, r13, 264
    store_32 [r12], r8
    mov r1, 32976
    call __sym_fn_tty_puts_84
    sub r12, r13, 264
    load_32 r8, [r12]
    mov r1, r8
    call __sym_fn_puts_211
    mov r1, 0
    mov r7, r1
    jmp __sym_block_30
__sym_block_28:
    mov r1, 32953
    call __sym_fn_puts_211
    mov r1, 0
    call __sym_fn_tty_set_cursor_visible_45
    mov r1, 1
    mov r7, r1
    jmp __sym_block_30
__sym_block_29:
    sub r12, r13, 264
    store_32 [r12], r8
    mov r1, 32958
    call __sym_fn_tty_puts_84
    sub r12, r13, 264
    load_32 r8, [r12]
    mov r1, r8
    call __sym_fn_puts_211
    mov r1, 0
    mov r7, r1
    jmp __sym_block_30
__sym_block_30:
    mov r1, r7
    mov r2, 0
    cmp r1, r2
    je __sym_switch_230
    mov r2, 3
    cmp r1, r2
    je __sym_switch_231
    jmp __sym_block_32
__sym_switch_230:
    jmp __sym_block_31
__sym_switch_231:
    jmp __sym_block_31
__sym_block_31:
    jmp __sym_block_2
__sym_block_32:
    mov r1, 0
    mov sp, r13
    pop r13
    ret

; function tty_clear, frame 0 bytes
__sym_fn_tty_clear_33:
    push r13
    mov r13, sp
__sym_block_34:
    mov r2, 33124
    load_8 r7, [r2]
    and r7, r7, 1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_232
    jmp __sym_block_35
__sym_edge_true_232:
    jmp __sym_block_36
__sym_block_35:
    call __sym_fn_tty_init_38
    jmp __sym_block_37
__sym_block_36:
    mov r1, 0
    mov r2, 0
    call __sym_fn_tty_display_cursor_180
    call __sym_fn_tty_display_clear_186
    mov r1, 0
    mov r2, 33128
    store_32 [r2], r1
    mov r1, 0
    mov r2, 33132
    store_32 [r2], r1
    mov r1, 0
    mov r2, 33136
    store_32 [r2], r1
    mov r1, 0
    mov r2, 33140
    store_32 [r2], r1
    mov r1, 0
    mov r2, 33144
    store_8 [r2], r1
    mov r1, 0
    mov r2, 33148
    store_32 [r2], r1
    call __sym_fn_reset_cursor_40
    jmp __sym_block_37
__sym_block_37:
    mov r1, 0
    mov sp, r13
    pop r13
    ret

; function tty_init, frame 0 bytes
__sym_fn_tty_init_38:
    push r13
    mov r13, sp
__sym_block_39:
    mov r1, 1
    mov r2, 33124
    store_8 [r2], r1
    mov r1, 0
    mov r2, 33128
    store_32 [r2], r1
    mov r1, 0
    mov r2, 33132
    store_32 [r2], r1
    mov r1, 0
    mov r2, 33136
    store_32 [r2], r1
    mov r1, 0
    mov r2, 33140
    store_32 [r2], r1
    mov r1, 0
    mov r2, 33144
    store_8 [r2], r1
    mov r1, 0
    mov r2, 33148
    store_32 [r2], r1
    mov r1, 0
    mov r2, 33152
    store_32 [r2], r1
    mov r1, 0
    mov r2, 33156
    store_32 [r2], r1
    mov r1, 0
    mov r2, 33160
    store_32 [r2], r1
    mov r1, 0
    mov r2, 33164
    store_32 [r2], r1
    call __sym_fn_tty_display_init_192
    call __sym_fn_reset_cursor_40
    mov r1, 0
    mov sp, r13
    pop r13
    ret

; function reset_cursor, frame 0 bytes
__sym_fn_reset_cursor_40:
    push r13
    mov r13, sp
__sym_block_41:
    mov r1, 1
    mov r2, 33936
    store_32 [r2], r1
    mov r2, 33164
    load_32 r7, [r2]
    mov r2, 0
    cmp r7, r2
    je __sym_edge_true_233
    jmp __sym_block_44
__sym_edge_true_233:
    jmp __sym_block_42
__sym_block_42:
    time_0 r1
    mov r7, r1
    mov r2, 33940
    store_32 [r2], r7
    time_1 r1
    mov r7, r1
    mov r2, 33944
    store_32 [r2], r7
    mov r2, 33164
    load_32 r7, [r2]
    mov r2, 0
    cmp r7, r2
    je __sym_edge_true_234
    jmp __sym_block_44
__sym_edge_true_234:
    jmp __sym_block_43
__sym_block_43:
    mov r2, 33132
    load_32 r7, [r2]
    mov r2, 0
    cmp r7, r2
    je __sym_cmp_yes_235
    mov r1, 0
    jmp __sym_cmp_done_236
__sym_cmp_yes_235:
    mov r1, 1
__sym_cmp_done_236:
    and r1, r1, 1
    mov r10, r1
    mov r2, 33128
    load_32 r9, [r2]
    add r8, r9, 1
    mov r2, 3839
    cmp r8, r2
    ja __sym_cmp_yes_237
    mov r1, 0
    jmp __sym_cmp_done_238
__sym_cmp_yes_237:
    mov r1, 1
__sym_cmp_done_238:
    and r1, r1, 1
    mov r7, r1
    or r7, r10, r7
    and r7, r7, 1
    mov r1, r7
    cmp r1, 0
    jne __sym_select_yes_239
    mov r1, r8
    jmp __sym_select_done_240
__sym_select_yes_239:
    mov r1, r9
__sym_select_done_240:
    mov r7, r1
    mov r1, r7
    mov r2, 1
    call __sym_fn_tty_display_cursor_180
    jmp __sym_block_44
__sym_block_44:
    mov r1, 0
    mov sp, r13
    pop r13
    ret

; function tty_set_cursor_visible, frame 8 bytes
__sym_fn_tty_set_cursor_visible_45:
    push r13
    mov r13, sp
    sub sp, sp, 8
    sub r12, r13, 4
    store_32 [r12], r1
__sym_block_46:
    mov r2, 33124
    load_8 r7, [r2]
    and r7, r7, 1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_241
    jmp __sym_block_47
__sym_edge_true_241:
    jmp __sym_block_48
__sym_block_47:
    call __sym_fn_tty_init_38
    jmp __sym_block_48
__sym_block_48:
    mov r1, 0
    mov r2, 0
    call __sym_fn_tty_display_cursor_180
    sub r12, r13, 4
    load_32 r1, [r12]
    mov r2, 0
    cmp r1, r2
    je __sym_cmp_yes_242
    mov r1, 0
    jmp __sym_cmp_done_243
__sym_cmp_yes_242:
    mov r1, 1
__sym_cmp_done_243:
    and r1, r1, 1
    mov r7, r1
    mov r1, r7
    mov r7, r1
    mov r2, 33164
    store_32 [r2], r7
    call __sym_fn_reset_cursor_40
    mov r1, 0
    mov sp, r13
    pop r13
    ret

; function tty_putc, frame 8 bytes
__sym_fn_tty_putc_49:
    push r13
    mov r13, sp
    sub sp, sp, 8
    sub r12, r13, 4
    store_32 [r12], r1
__sym_block_50:
    mov r2, 33124
    load_8 r7, [r2]
    and r7, r7, 1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_244
    jmp __sym_block_51
__sym_edge_true_244:
    jmp __sym_block_52
__sym_block_51:
    call __sym_fn_tty_init_38
    jmp __sym_block_52
__sym_block_52:
    mov r1, 0
    mov r2, 0
    call __sym_fn_tty_display_cursor_180
    sub r12, r13, 4
    load_32 r1, [r12]
    and r7, r1, 255
    mov r1, r7
    call __sym_fn_render_53
    call __sym_fn_reset_cursor_40
    mov r1, 0
    mov sp, r13
    pop r13
    ret

; function render, frame 8 bytes
__sym_fn_render_53:
    push r13
    mov r13, sp
    sub sp, sp, 8
    mov r9, r1
__sym_block_54:
    mov r1, r9
    mov r2, 10
    cmp r1, r2
    je __sym_switch_245
    mov r2, 13
    cmp r1, r2
    je __sym_switch_246
    mov r2, 8
    cmp r1, r2
    je __sym_switch_247
    mov r2, 9
    cmp r1, r2
    je __sym_switch_248
    jmp __sym_block_62
__sym_switch_245:
    jmp __sym_block_55
__sym_switch_246:
    jmp __sym_block_56
__sym_switch_247:
    jmp __sym_block_57
__sym_switch_248:
    jmp __sym_block_58
__sym_block_55:
    call __sym_fn_next_line_65
    mov r1, 0
    mov r7, r1
    jmp __sym_block_64
__sym_block_56:
    mov r2, 33128
    load_32 r8, [r2]
    mod r7, r8, 96
    sub r7, r8, r7
    mov r2, 33128
    store_32 [r2], r7
    mov r1, 0
    mov r2, 33132
    store_32 [r2], r1
    mov r1, 0
    mov r7, r1
    jmp __sym_block_64
__sym_block_57:
    call __sym_fn_erase_cell_70
    mov r1, 0
    mov r7, r1
    jmp __sym_block_64
__sym_block_58:
    mov r2, 33132
    load_32 r7, [r2]
    mov r2, 0
    cmp r7, r2
    je __sym_edge_true_249
    jmp __sym_block_59
__sym_edge_true_249:
    jmp __sym_block_60
__sym_block_59:
    call __sym_fn_next_line_65
    jmp __sym_block_60
__sym_block_60:
    mov r2, 33128
    load_32 r7, [r2]
    and r7, r7, 7
    mov r1, 8
    sub r1, r1, r7
    sub r12, r13, 4
    store_32 [r12], r1
    mov r1, 0
    sub r12, r13, 8
    store_32 [r12], r1
    jmp __sym_block_61
__sym_block_61:
    mov r1, 32
    call __sym_fn_print_cell_77
    sub r12, r13, 8
    load_32 r1, [r12]
    add r7, r1, 1
    sub r12, r13, 4
    load_32 r2, [r12]
    cmp r7, r2
    je __sym_edge_true_250
    sub r12, r13, 8
    store_32 [r12], r7
    jmp __sym_block_61
__sym_edge_true_250:
    sub r12, r13, 4
    load_32 r1, [r12]
    mov r7, r1
    jmp __sym_block_64
__sym_block_62:
    mov r2, 31
    cmp r9, r2
    ja __sym_cmp_yes_251
    mov r1, 0
    jmp __sym_cmp_done_252
__sym_cmp_yes_251:
    mov r1, 1
__sym_cmp_done_252:
    and r1, r1, 1
    mov r8, r1
    mov r2, 127
    cmp r9, r2
    jne __sym_cmp_yes_253
    mov r1, 0
    jmp __sym_cmp_done_254
__sym_cmp_yes_253:
    mov r1, 1
__sym_cmp_done_254:
    and r1, r1, 1
    mov r7, r1
    and r7, r8, r7
    and r7, r7, 1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_255
    mov r1, 0
    mov r7, r1
    jmp __sym_block_64
__sym_edge_true_255:
    jmp __sym_block_63
__sym_block_63:
    mov r1, r9
    call __sym_fn_print_cell_77
    mov r1, 1
    mov r7, r1
    jmp __sym_block_64
__sym_block_64:
    mov r1, r7
    mov sp, r13
    pop r13
    ret

; function next_line, frame 0 bytes
__sym_fn_next_line_65:
    push r13
    mov r13, sp
__sym_block_66:
    mov r2, 33128
    load_32 r8, [r2]
    mod r7, r8, 96
    sub r7, r8, r7
    add r7, r7, 96
    mov r2, 33128
    store_32 [r2], r7
    mov r1, 0
    mov r2, 33132
    store_32 [r2], r1
    mov r2, 3840
    cmp r7, r2
    jb __sym_edge_true_256
    jmp __sym_block_67
__sym_edge_true_256:
    jmp __sym_block_69
__sym_block_67:
    call __sym_fn_tty_display_scroll_200
    mov r2, 33128
    load_32 r7, [r2]
    mov r2, 65535
    lsl r2, r2, 16
    or r2, r2, 65440
    add r7, r7, r2
    mov r2, 33128
    store_32 [r2], r7
    mov r2, 33144
    load_8 r7, [r2]
    and r7, r7, 1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_257
    jmp __sym_block_69
__sym_edge_true_257:
    jmp __sym_block_68
__sym_block_68:
    mov r2, 33948
    load_32 r7, [r2]
    mov r1, r7
    mov r2, 96
    cmp r1, r2
    jae __sym_usub_sat_258
    mov r1, 0
    jmp __sym_usub_sat_done_259
__sym_usub_sat_258:
    sub r1, r1, r2
__sym_usub_sat_done_259:
    mov r7, r1
    mov r2, 33948
    store_32 [r2], r7
    jmp __sym_block_69
__sym_block_69:
    mov r1, 0
    mov sp, r13
    pop r13
    ret

; function erase_cell, frame 0 bytes
__sym_fn_erase_cell_70:
    push r13
    mov r13, sp
__sym_block_71:
    mov r2, 33132
    load_32 r7, [r2]
    mov r2, 0
    cmp r7, r2
    je __sym_edge_true_260
    jmp __sym_block_72
__sym_edge_true_260:
    jmp __sym_block_73
__sym_block_72:
    mov r1, 0
    mov r2, 33132
    store_32 [r2], r1
    jmp __sym_block_75
__sym_block_73:
    mov r2, 33128
    load_32 r7, [r2]
    mov r2, 0
    cmp r7, r2
    je __sym_edge_true_261
    jmp __sym_block_74
__sym_edge_true_261:
    jmp __sym_block_76
__sym_block_74:
    mov r2, 65535
    lsl r2, r2, 16
    or r2, r2, 65535
    add r7, r7, r2
    mov r2, 33128
    store_32 [r2], r7
    jmp __sym_block_75
__sym_block_75:
    mov r2, 33128
    load_32 r7, [r2]
    mov r1, r7
    mov r2, 0
    call __sym_fn_tty_display_put_198
    jmp __sym_block_76
__sym_block_76:
    mov r1, 0
    mov sp, r13
    pop r13
    ret

; function print_cell, frame 8 bytes
__sym_fn_print_cell_77:
    push r13
    mov r13, sp
    sub sp, sp, 8
    sub r12, r13, 4
    store_32 [r12], r1
__sym_block_78:
    mov r2, 33132
    load_32 r7, [r2]
    mov r2, 0
    cmp r7, r2
    je __sym_edge_true_262
    jmp __sym_block_79
__sym_edge_true_262:
    jmp __sym_block_80
__sym_block_79:
    call __sym_fn_next_line_65
    jmp __sym_block_80
__sym_block_80:
    mov r2, 33128
    load_32 r7, [r2]
    mov r1, r7
    sub r12, r13, 4
    load_32 r2, [r12]
    call __sym_fn_tty_display_put_198
    mov r2, 33128
    load_32 r8, [r2]
    mod r7, r8, 96
    mov r2, 95
    cmp r7, r2
    je __sym_edge_true_263
    jmp __sym_block_82
__sym_edge_true_263:
    jmp __sym_block_81
__sym_block_81:
    mov r1, 1
    mov r2, 33132
    store_32 [r2], r1
    jmp __sym_block_83
__sym_block_82:
    add r7, r8, 1
    mov r2, 33128
    store_32 [r2], r7
    jmp __sym_block_83
__sym_block_83:
    mov r1, 0
    mov sp, r13
    pop r13
    ret

; function tty_puts, frame 16 bytes
__sym_fn_tty_puts_84:
    push r13
    mov r13, sp
    sub sp, sp, 16
    sub r12, r13, 4
    store_32 [r12], r1
__sym_block_85:
    sub r12, r13, 4
    load_32 r1, [r12]
    mov r2, 0
    cmp r1, r2
    je __sym_edge_true_264
    jmp __sym_block_86
__sym_edge_true_264:
    mov r1, 0
    mov r7, r1
    jmp __sym_block_92
__sym_block_86:
    sub r12, r13, 4
    load_32 r2, [r12]
    load_8 r7, [r2]
    and r7, r7, 255
    mov r2, 0
    cmp r7, r2
    je __sym_edge_true_265
    jmp __sym_block_87
__sym_edge_true_265:
    mov r1, 0
    mov r7, r1
    jmp __sym_block_92
__sym_block_87:
    mov r2, 33124
    load_8 r7, [r2]
    and r7, r7, 1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_266
    jmp __sym_block_88
__sym_edge_true_266:
    jmp __sym_block_89
__sym_block_88:
    call __sym_fn_tty_init_38
    jmp __sym_block_89
__sym_block_89:
    mov r1, 0
    mov r2, 0
    call __sym_fn_tty_display_cursor_180
    sub r12, r13, 4
    load_32 r2, [r12]
    load_8 r7, [r2]
    and r7, r7, 255
    mov r2, 0
    cmp r7, r2
    je __sym_edge_true_267
    mov r1, 0
    sub r12, r13, 8
    store_32 [r12], r1
    jmp __sym_block_90
__sym_edge_true_267:
    mov r1, 0
    sub r12, r13, 12
    store_32 [r12], r1
    jmp __sym_block_91
__sym_block_90:
    mov r1, r7
    mov r7, r1
    mov r1, r7
    call __sym_fn_render_53
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
    je __sym_edge_true_268
    sub r12, r13, 8
    store_32 [r12], r8
    jmp __sym_block_90
__sym_edge_true_268:
    sub r12, r13, 12
    store_32 [r12], r8
    jmp __sym_block_91
__sym_block_91:
    call __sym_fn_reset_cursor_40
    sub r12, r13, 12
    load_32 r1, [r12]
    mov r7, r1
    jmp __sym_block_92
__sym_block_92:
    mov r1, r7
    mov sp, r13
    pop r13
    ret

; function tty_poll, frame 16 bytes
__sym_fn_tty_poll_93:
    push r13
    mov r13, sp
    sub sp, sp, 16
__sym_block_94:
    mov r2, 33124
    load_8 r7, [r2]
    and r7, r7, 1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_269
    jmp __sym_block_95
__sym_edge_true_269:
    jmp __sym_block_96
__sym_block_95:
    call __sym_fn_tty_init_38
    jmp __sym_block_96
__sym_block_96:
    mov r2, 33152
    load_32 r7, [r2]
    mov r2, 0
    cmp r7, r2
    je __sym_edge_true_270
    jmp __sym_block_97
__sym_edge_true_270:
    jmp __sym_block_98
__sym_block_97:
    call __sym_fn_update_cursor_141
    mov r2, 33152
    load_32 r8, [r2]
    mov r2, 33156
    load_32 r7, [r2]
    sub r7, r8, r7
    jmp __sym_block_140
__sym_block_98:
    keyboard r1
    mov r8, r1
    and r9, r8, 255
    mov r2, 16
    cmp r9, r2
    je __sym_cmp_yes_271
    mov r1, 0
    jmp __sym_cmp_done_272
__sym_cmp_yes_271:
    mov r1, 1
__sym_cmp_done_272:
    and r1, r1, 1
    mov r10, r1
    and r7, r8, 256
    mov r1, r10
    cmp r1, 0
    jne __sym_edge_true_273
    jmp __sym_block_100
__sym_edge_true_273:
    jmp __sym_block_99
__sym_block_99:
    mov r2, 33160
    store_32 [r2], r7
    call __sym_fn_update_cursor_141
    mov r1, 0
    mov r7, r1
    jmp __sym_block_140
__sym_block_100:
    mov r2, 0
    cmp r7, r2
    je __sym_edge_true_274
    jmp __sym_block_102
__sym_edge_true_274:
    jmp __sym_block_101
__sym_block_101:
    call __sym_fn_update_cursor_141
    mov r1, 0
    mov r7, r1
    jmp __sym_block_140
__sym_block_102:
    sub r12, r13, 12
    store_32 [r12], r8
    sub r12, r13, 16
    store_32 [r12], r9
    mov r1, 0
    mov r2, 0
    call __sym_fn_tty_display_cursor_180
    sub r12, r13, 12
    load_32 r8, [r12]
    sub r12, r13, 16
    load_32 r9, [r12]
    mov r2, 4
    cmp r9, r2
    je __sym_cmp_yes_275
    mov r1, 0
    jmp __sym_cmp_done_276
__sym_cmp_yes_275:
    mov r1, 1
__sym_cmp_done_276:
    and r1, r1, 1
    mov r11, r1
    mov r2, 2
    cmp r9, r2
    je __sym_cmp_yes_277
    mov r1, 0
    jmp __sym_cmp_done_278
__sym_cmp_yes_277:
    mov r1, 1
__sym_cmp_done_278:
    and r1, r1, 1
    mov r10, r1
    mov r1, r8
    and r1, r1, 255
    mov r7, r1
    mov r1, r7
    mov r2, 4
    cmp r1, r2
    je __sym_switch_279
    mov r2, 2
    cmp r1, r2
    je __sym_switch_280
    mov r2, 13
    cmp r1, r2
    je __sym_switch_281
    mov r2, 10
    cmp r1, r2
    je __sym_switch_282
    mov r2, 9
    cmp r1, r2
    je __sym_switch_283
    jmp __sym_block_123
__sym_switch_279:
    jmp __sym_block_103
__sym_switch_280:
    jmp __sym_block_103
__sym_switch_281:
    jmp __sym_block_111
__sym_switch_282:
    jmp __sym_block_120
__sym_switch_283:
    jmp __sym_block_124
__sym_block_103:
    mov r2, 33144
    load_8 r7, [r2]
    and r7, r7, 1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_284
    jmp __sym_block_104
__sym_edge_true_284:
    jmp __sym_block_105
__sym_block_104:
    mov r1, 1
    mov r2, 33144
    store_8 [r2], r1
    mov r2, 33128
    load_32 r7, [r2]
    mov r2, 33948
    store_32 [r2], r7
    mov r2, 33132
    load_32 r7, [r2]
    mov r2, 33952
    store_32 [r2], r7
    mov r1, 0
    mov r2, 33148
    store_32 [r2], r1
    mov r1, 0
    mov r2, 33140
    store_32 [r2], r1
    jmp __sym_block_105
__sym_block_105:
    mov r2, 33140
    load_32 r8, [r2]
    mov r2, 0
    cmp r8, r2
    jne __sym_cmp_yes_285
    mov r1, 0
    jmp __sym_cmp_done_286
__sym_cmp_yes_285:
    mov r1, 1
__sym_cmp_done_286:
    and r1, r1, 1
    mov r7, r1
    mov r1, r11
    cmp r1, 0
    jne __sym_select_yes_287
    mov r1, 0
    jmp __sym_select_done_288
__sym_select_yes_287:
    mov r1, r7
__sym_select_done_288:
    and r1, r1, 1
    mov r7, r1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_289
    jmp __sym_block_107
__sym_edge_true_289:
    jmp __sym_block_106
__sym_block_106:
    mov r2, 65535
    lsl r2, r2, 16
    or r2, r2, 65535
    add r7, r8, r2
    mov r2, 33140
    store_32 [r2], r7
    jmp __sym_block_107
__sym_block_107:
    mov r1, r10
    cmp r1, 0
    jne __sym_edge_true_290
    jmp __sym_block_110
__sym_edge_true_290:
    jmp __sym_block_108
__sym_block_108:
    mov r2, 33140
    load_32 r8, [r2]
    mov r2, 33136
    load_32 r7, [r2]
    cmp r8, r7
    jb __sym_edge_true_291
    jmp __sym_block_110
__sym_edge_true_291:
    jmp __sym_block_109
__sym_block_109:
    add r7, r8, 1
    mov r2, 33140
    store_32 [r2], r7
    jmp __sym_block_110
__sym_block_110:
    call __sym_fn_position_edit_cursor_149
    jmp __sym_block_139
__sym_block_111:
    mov r2, 33140
    load_32 r9, [r2]
    mov r2, 33136
    load_32 r8, [r2]
    cmp r9, r8
    je __sym_cmp_yes_292
    mov r1, 0
    jmp __sym_cmp_done_293
__sym_cmp_yes_292:
    mov r1, 1
__sym_cmp_done_293:
    and r1, r1, 1
    mov r10, r1
    mov r2, 0
    cmp r8, r2
    jne __sym_cmp_yes_294
    mov r1, 0
    jmp __sym_cmp_done_295
__sym_cmp_yes_294:
    mov r1, 1
__sym_cmp_done_295:
    and r1, r1, 1
    mov r7, r1
    and r7, r10, r7
    and r7, r7, 1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_296
    jmp __sym_block_116
__sym_edge_true_296:
    jmp __sym_block_112
__sym_block_112:
    mov r2, 65535
    lsl r2, r2, 16
    or r2, r2, 65535
    add r8, r8, r2
    mov r2, 33136
    store_32 [r2], r8
    mov r2, 65535
    lsl r2, r2, 16
    or r2, r2, 65535
    add r7, r9, r2
    mov r2, 33140
    store_32 [r2], r7
    mov r1, 33168
    mov r2, r8
    add r1, r1, r2
    mov r7, r1
    load_8 r7, [r7]
    and r7, r7, 255
    mov r1, r7
    mov r8, r1
    mov r2, 33148
    load_32 r7, [r2]
    sub r7, r7, r8
    mov r2, 33148
    store_32 [r2], r7
    mov r2, 33136
    load_32 r8, [r2]
    mov r1, 33168
    mov r2, r8
    add r1, r1, r2
    mov r7, r1
    load_8 r7, [r7]
    and r7, r7, 255
    mov r2, 0
    cmp r7, r2
    je __sym_edge_true_297
    mov r1, 0
    sub r12, r13, 4
    store_32 [r12], r1
    jmp __sym_block_114
__sym_edge_true_297:
    jmp __sym_block_113
__sym_block_113:
    mov r1, 33424
    mov r2, r8
    add r1, r1, r2
    mov r7, r1
    load_8 r7, [r7]
    and r7, r7, 255
    mov r2, 0
    cmp r7, r2
    jne __sym_cmp_yes_298
    mov r1, 0
    jmp __sym_cmp_done_299
__sym_cmp_yes_298:
    mov r1, 1
__sym_cmp_done_299:
    and r1, r1, 1
    mov r9, r1
    mov r2, 33128
    load_32 r8, [r2]
    mov r2, 0
    cmp r8, r2
    jne __sym_cmp_yes_300
    mov r1, 0
    jmp __sym_cmp_done_301
__sym_cmp_yes_300:
    mov r1, 1
__sym_cmp_done_301:
    and r1, r1, 1
    mov r7, r1
    mov r1, r9
    cmp r1, 0
    jne __sym_select_yes_302
    mov r1, 0
    jmp __sym_select_done_303
__sym_select_yes_302:
    mov r1, r7
__sym_select_done_303:
    and r1, r1, 1
    mov r7, r1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_304
    jmp __sym_block_139
__sym_edge_true_304:
    jmp __sym_block_115
__sym_block_114:
    call __sym_fn_erase_cell_70
    sub r12, r13, 4
    load_32 r1, [r12]
    add r9, r1, 1
    mov r2, 33136
    load_32 r8, [r2]
    mov r1, 33168
    mov r2, r8
    add r1, r1, r2
    mov r7, r1
    load_8 r7, [r7]
    and r7, r7, 255
    mov r1, r7
    mov r7, r1
    cmp r9, r7
    jb __sym_edge_true_305
    jmp __sym_block_113
__sym_edge_true_305:
    sub r12, r13, 4
    store_32 [r12], r9
    jmp __sym_block_114
__sym_block_115:
    mov r2, 65535
    lsl r2, r2, 16
    or r2, r2, 65535
    add r7, r8, r2
    mov r2, 33128
    store_32 [r2], r7
    mov r1, 1
    mov r2, 33132
    store_32 [r2], r1
    jmp __sym_block_139
__sym_block_116:
    mov r2, 0
    cmp r9, r2
    je __sym_edge_true_306
    jmp __sym_block_117
__sym_edge_true_306:
    jmp __sym_block_139
__sym_block_117:
    mov r2, 65535
    lsl r2, r2, 16
    or r2, r2, 65535
    add r11, r9, r2
    mov r2, 33140
    store_32 [r2], r11
    mov r2, 65535
    lsl r2, r2, 16
    or r2, r2, 65535
    add r10, r8, r2
    mov r2, 33136
    store_32 [r2], r10
    cmp r11, r10
    jb __sym_edge_true_307
    jmp __sym_block_118
__sym_edge_true_307:
    jmp __sym_block_119
__sym_block_118:
    call __sym_fn_redraw_edit_155
    jmp __sym_block_139
__sym_block_119:
    add r9, r11, 1
    mov r1, 33680
    mov r2, r9
    add r1, r1, r2
    mov r7, r1
    load_8 r8, [r7]
    and r8, r8, 255
    mov r1, 33680
    mov r2, r11
    add r1, r1, r2
    mov r7, r1
    store_8 [r7], r8
    cmp r9, r10
    je __sym_edge_true_308
    mov r11, r9
    jmp __sym_block_119
__sym_edge_true_308:
    jmp __sym_block_118
__sym_block_120:
    mov r2, 33144
    load_8 r7, [r2]
    and r7, r7, 1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_309
    jmp __sym_block_121
__sym_edge_true_309:
    jmp __sym_block_122
__sym_block_121:
    mov r1, 1
    mov r2, 33144
    store_8 [r2], r1
    mov r2, 33128
    load_32 r7, [r2]
    mov r2, 33948
    store_32 [r2], r7
    mov r2, 33132
    load_32 r7, [r2]
    mov r2, 33952
    store_32 [r2], r7
    mov r1, 0
    mov r2, 33148
    store_32 [r2], r1
    mov r1, 0
    mov r2, 33140
    store_32 [r2], r1
    jmp __sym_block_122
__sym_block_122:
    mov r2, 33136
    load_32 r8, [r2]
    mov r2, 33140
    store_32 [r2], r8
    sub r12, r13, 12
    store_32 [r12], r8
    call __sym_fn_position_edit_cursor_149
    sub r12, r13, 12
    load_32 r8, [r12]
    mov r1, 33680
    mov r2, r8
    add r1, r1, r2
    mov r7, r1
    mov r1, 10
    store_8 [r7], r1
    add r7, r8, 1
    mov r2, 33152
    store_32 [r2], r7
    mov r1, 0
    mov r2, 33156
    store_32 [r2], r1
    mov r1, 0
    mov r2, 33136
    store_32 [r2], r1
    mov r1, 0
    mov r2, 33140
    store_32 [r2], r1
    mov r1, 0
    mov r2, 33144
    store_8 [r2], r1
    mov r1, 0
    mov r2, 33148
    store_32 [r2], r1
    mov r1, 10
    call __sym_fn_render_53
    jmp __sym_block_139
__sym_block_123:
    mov r2, 65535
    lsl r2, r2, 16
    or r2, r2, 65504
    add r7, r9, r2
    mov r2, 95
    cmp r7, r2
    jb __sym_cmp_yes_310
    mov r1, 0
    jmp __sym_cmp_done_311
__sym_cmp_yes_310:
    mov r1, 1
__sym_cmp_done_311:
    and r1, r1, 1
    mov r10, r1
    mov r2, 33136
    load_32 r7, [r2]
    mov r2, 255
    cmp r7, r2
    jb __sym_cmp_yes_312
    mov r1, 0
    jmp __sym_cmp_done_313
__sym_cmp_yes_312:
    mov r1, 1
__sym_cmp_done_313:
    and r1, r1, 1
    mov r7, r1
    mov r1, r10
    cmp r1, 0
    jne __sym_select_yes_314
    mov r1, 0
    jmp __sym_select_done_315
__sym_select_yes_314:
    mov r1, r7
__sym_select_done_315:
    and r1, r1, 1
    mov r7, r1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_316
    jmp __sym_block_139
__sym_edge_true_316:
    jmp __sym_block_125
__sym_block_124:
    mov r2, 33136
    load_32 r7, [r2]
    mov r2, 255
    cmp r7, r2
    jb __sym_edge_true_317
    jmp __sym_block_139
__sym_edge_true_317:
    jmp __sym_block_125
__sym_block_125:
    mov r2, 33160
    load_32 r7, [r2]
    mov r2, 0
    cmp r7, r2
    je __sym_edge_true_318
    jmp __sym_block_126
__sym_edge_true_318:
    sub r12, r13, 8
    store_32 [r12], r9
    jmp __sym_block_132
__sym_block_126:
    mov r2, 65535
    lsl r2, r2, 16
    or r2, r2, 65439
    add r7, r9, r2
    mov r2, 26
    cmp r7, r2
    jb __sym_edge_true_319
    jmp __sym_block_127
__sym_edge_true_319:
    jmp __sym_block_128
__sym_block_127:
    mov r1, r8
    and r1, r1, 255
    mov r8, r1
    mov r1, 0
    mov r10, r1
    jmp __sym_block_129
__sym_block_128:
    mov r2, 65535
    lsl r2, r2, 16
    or r2, r2, 65504
    add r7, r9, r2
    sub r12, r13, 8
    store_32 [r12], r7
    jmp __sym_block_132
__sym_block_129:
    mov r1, 33956
    mov r2, r10
    add r1, r1, r2
    mov r7, r1
    load_8 r7, [r7]
    and r7, r7, 255
    cmp r7, r8
    je __sym_edge_true_320
    jmp __sym_block_131
__sym_edge_true_320:
    jmp __sym_block_130
__sym_block_130:
    mov r1, 33978
    mov r2, r10
    add r1, r1, r2
    mov r7, r1
    load_8 r7, [r7]
    and r7, r7, 255
    mov r1, r7
    mov r7, r1
    sub r12, r13, 8
    store_32 [r12], r7
    jmp __sym_block_132
__sym_block_131:
    add r7, r10, 1
    mov r2, 21
    cmp r7, r2
    je __sym_edge_true_321
    mov r10, r7
    jmp __sym_block_129
__sym_edge_true_321:
    sub r12, r13, 8
    store_32 [r12], r9
    jmp __sym_block_132
__sym_block_132:
    mov r2, 33144
    load_8 r7, [r2]
    and r7, r7, 1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_322
    jmp __sym_block_133
__sym_edge_true_322:
    jmp __sym_block_134
__sym_block_133:
    mov r1, 1
    mov r2, 33144
    store_8 [r2], r1
    mov r2, 33128
    load_32 r7, [r2]
    mov r2, 33948
    store_32 [r2], r7
    mov r2, 33132
    load_32 r7, [r2]
    mov r2, 33952
    store_32 [r2], r7
    mov r1, 0
    mov r2, 33148
    store_32 [r2], r1
    mov r1, 0
    mov r2, 33140
    store_32 [r2], r1
    jmp __sym_block_134
__sym_block_134:
    mov r2, 33140
    load_32 r11, [r2]
    mov r2, 33136
    load_32 r10, [r2]
    cmp r11, r10
    je __sym_edge_true_323
    jmp __sym_block_135
__sym_edge_true_323:
    jmp __sym_block_136
__sym_block_135:
    cmp r10, r11
    ja __sym_edge_true_324
    jmp __sym_block_137
__sym_edge_true_324:
    mov r9, r10
    jmp __sym_block_138
__sym_block_136:
    sub r12, r13, 8
    load_32 r1, [r12]
    and r1, r1, 255
    mov r8, r1
    mov r1, 33680
    mov r2, r10
    add r1, r1, r2
    mov r7, r1
    store_8 [r7], r8
    mov r2, 33132
    load_32 r7, [r2]
    mov r1, r7
    and r1, r1, 255
    mov r8, r1
    mov r1, 33424
    mov r2, r10
    add r1, r1, r2
    mov r7, r1
    store_8 [r7], r8
    sub r12, r13, 8
    load_32 r1, [r12]
    call __sym_fn_render_53
    mov r10, r1
    mov r1, r10
    and r1, r1, 255
    mov r9, r1
    mov r2, 33136
    load_32 r8, [r2]
    mov r1, 33168
    mov r2, r8
    add r1, r1, r2
    mov r7, r1
    store_8 [r7], r9
    mov r2, 33148
    load_32 r7, [r2]
    add r7, r7, r10
    mov r2, 33148
    store_32 [r2], r7
    add r7, r8, 1
    mov r2, 33136
    store_32 [r2], r7
    mov r2, 33140
    load_32 r7, [r2]
    add r7, r7, 1
    mov r2, 33140
    store_32 [r2], r7
    jmp __sym_block_139
__sym_block_137:
    sub r12, r13, 8
    load_32 r1, [r12]
    and r1, r1, 255
    mov r8, r1
    add r7, r11, 1
    mov r2, 33140
    store_32 [r2], r7
    mov r1, 33680
    mov r2, r11
    add r1, r1, r2
    mov r7, r1
    store_8 [r7], r8
    add r7, r10, 1
    mov r2, 33136
    store_32 [r2], r7
    call __sym_fn_redraw_edit_155
    jmp __sym_block_139
__sym_block_138:
    mov r1, 33680
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
    ja __sym_edge_true_325
    jmp __sym_block_137
__sym_edge_true_325:
    jmp __sym_block_138
__sym_block_139:
    call __sym_fn_reset_cursor_40
    mov r2, 33152
    load_32 r8, [r2]
    mov r2, 33156
    load_32 r7, [r2]
    sub r7, r8, r7
    jmp __sym_block_140
__sym_block_140:
    mov r1, r7
    mov sp, r13
    pop r13
    ret

; function update_cursor, frame 0 bytes
__sym_fn_update_cursor_141:
    push r13
    mov r13, sp
__sym_block_142:
    mov r2, 33164
    load_32 r7, [r2]
    mov r2, 0
    cmp r7, r2
    je __sym_edge_true_326
    jmp __sym_block_148
__sym_edge_true_326:
    jmp __sym_block_143
__sym_block_143:
    time_0 r1
    mov r10, r1
    time_1 r1
    mov r9, r1
    mov r2, 33940
    load_32 r7, [r2]
    sub r11, r10, r7
    mov r2, 33944
    load_32 r8, [r2]
    sub r8, r9, r8
    cmp r10, r7
    jb __sym_cmp_yes_327
    mov r1, 0
    jmp __sym_cmp_done_328
__sym_cmp_yes_327:
    mov r1, 1
__sym_cmp_done_328:
    and r1, r1, 1
    mov r7, r1
    mov r1, r7
    mov r7, r1
    cmp r8, r7
    jne __sym_cmp_yes_329
    mov r1, 0
    jmp __sym_cmp_done_330
__sym_cmp_yes_329:
    mov r1, 1
__sym_cmp_done_330:
    and r1, r1, 1
    mov r8, r1
    mov r2, 7629
    lsl r2, r2, 16
    or r2, r2, 25855
    cmp r11, r2
    ja __sym_cmp_yes_331
    mov r1, 0
    jmp __sym_cmp_done_332
__sym_cmp_yes_331:
    mov r1, 1
__sym_cmp_done_332:
    and r1, r1, 1
    mov r7, r1
    mov r1, r8
    cmp r1, 0
    jne __sym_select_yes_333
    mov r1, r7
    jmp __sym_select_done_334
__sym_select_yes_333:
    mov r1, 1
__sym_select_done_334:
    and r1, r1, 1
    mov r7, r1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_335
    jmp __sym_block_148
__sym_edge_true_335:
    jmp __sym_block_144
__sym_block_144:
    mov r2, 33940
    store_32 [r2], r10
    mov r2, 33944
    store_32 [r2], r9
    mov r2, 33936
    load_32 r8, [r2]
    xor r7, r8, 1
    mov r2, 33936
    store_32 [r2], r7
    mov r2, 1
    cmp r8, r2
    je __sym_edge_true_336
    jmp __sym_block_145
__sym_edge_true_336:
    jmp __sym_block_147
__sym_block_145:
    mov r2, 33164
    load_32 r7, [r2]
    mov r2, 0
    cmp r7, r2
    je __sym_edge_true_337
    jmp __sym_block_148
__sym_edge_true_337:
    jmp __sym_block_146
__sym_block_146:
    mov r2, 33132
    load_32 r7, [r2]
    mov r2, 0
    cmp r7, r2
    je __sym_cmp_yes_338
    mov r1, 0
    jmp __sym_cmp_done_339
__sym_cmp_yes_338:
    mov r1, 1
__sym_cmp_done_339:
    and r1, r1, 1
    mov r10, r1
    mov r2, 33128
    load_32 r9, [r2]
    add r8, r9, 1
    mov r2, 3839
    cmp r8, r2
    ja __sym_cmp_yes_340
    mov r1, 0
    jmp __sym_cmp_done_341
__sym_cmp_yes_340:
    mov r1, 1
__sym_cmp_done_341:
    and r1, r1, 1
    mov r7, r1
    or r7, r10, r7
    and r7, r7, 1
    mov r1, r7
    cmp r1, 0
    jne __sym_select_yes_342
    mov r1, r8
    jmp __sym_select_done_343
__sym_select_yes_342:
    mov r1, r9
__sym_select_done_343:
    mov r7, r1
    mov r1, r7
    mov r2, 1
    call __sym_fn_tty_display_cursor_180
    jmp __sym_block_148
__sym_block_147:
    mov r1, 0
    mov r2, 0
    call __sym_fn_tty_display_cursor_180
    jmp __sym_block_148
__sym_block_148:
    mov r1, 0
    mov sp, r13
    pop r13
    ret

; function position_edit_cursor, frame 0 bytes
__sym_fn_position_edit_cursor_149:
__sym_block_150:
    mov r2, 33948
    load_32 r8, [r2]
    mov r2, 33128
    store_32 [r2], r8
    mov r2, 33952
    load_32 r7, [r2]
    mov r2, 33132
    store_32 [r2], r7
    mov r2, 33140
    load_32 r9, [r2]
    mov r2, 0
    cmp r9, r2
    je __sym_edge_true_344
    jmp __sym_block_151
__sym_edge_true_344:
    jmp __sym_block_154
__sym_block_151:
    add r8, r7, r8
    mov r1, 0
    mov r10, r1
    jmp __sym_block_153
__sym_block_152:
    mod r7, r8, 96
    mov r2, 0
    cmp r7, r2
    je __sym_cmp_yes_345
    mov r1, 0
    jmp __sym_cmp_done_346
__sym_cmp_yes_345:
    mov r1, 1
__sym_cmp_done_346:
    and r1, r1, 1
    mov r7, r1
    mov r1, r7
    mov r7, r1
    mov r2, 33132
    store_32 [r2], r7
    sub r7, r8, r7
    mov r2, 33128
    store_32 [r2], r7
    jmp __sym_block_154
__sym_block_153:
    mov r1, 33168
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
    je __sym_edge_true_347
    mov r10, r7
    jmp __sym_block_153
__sym_edge_true_347:
    jmp __sym_block_152
__sym_block_154:
    mov r1, 0
    ret

; function redraw_edit, frame 16 bytes
__sym_fn_redraw_edit_155:
    push r13
    mov r13, sp
    sub sp, sp, 16
__sym_block_156:
    mov r2, 33948
    load_32 r8, [r2]
    mov r2, 33952
    load_32 r7, [r2]
    add r1, r7, r8
    sub r12, r13, 4
    store_32 [r12], r1
    mov r2, 33148
    load_32 r7, [r2]
    mov r2, 0
    cmp r7, r2
    je __sym_edge_true_348
    mov r1, 0
    mov r8, r1
    jmp __sym_block_158
__sym_edge_true_348:
    jmp __sym_block_157
__sym_block_157:
    mov r2, 33948
    load_32 r7, [r2]
    mov r2, 33128
    store_32 [r2], r7
    mov r2, 33952
    load_32 r7, [r2]
    mov r2, 33132
    store_32 [r2], r7
    mov r1, 0
    mov r2, 33148
    store_32 [r2], r1
    mov r2, 33136
    load_32 r7, [r2]
    mov r2, 0
    cmp r7, r2
    je __sym_edge_true_349
    mov r1, 0
    mov r9, r1
    jmp __sym_block_160
__sym_edge_true_349:
    jmp __sym_block_159
__sym_block_158:
    sub r12, r13, 4
    load_32 r1, [r12]
    add r7, r1, r8
    sub r12, r13, 8
    store_32 [r12], r8
    mov r1, r7
    mov r2, 0
    call __sym_fn_tty_display_put_198
    sub r12, r13, 8
    load_32 r8, [r12]
    add r8, r8, 1
    mov r2, 33148
    load_32 r7, [r2]
    cmp r8, r7
    jb __sym_edge_true_350
    jmp __sym_block_157
__sym_edge_true_350:
    jmp __sym_block_158
__sym_block_159:
    call __sym_fn_position_edit_cursor_149
    mov r1, 0
    mov sp, r13
    pop r13
    ret
__sym_block_160:
    mov r2, 33132
    load_32 r7, [r2]
    mov r1, r7
    and r1, r1, 255
    mov r8, r1
    mov r1, 33424
    mov r2, r9
    add r1, r1, r2
    mov r7, r1
    store_8 [r7], r8
    mov r1, 33680
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
    call __sym_fn_render_53
    sub r12, r13, 12
    load_32 r9, [r12]
    mov r10, r1
    mov r1, r10
    and r1, r1, 255
    mov r8, r1
    mov r1, 33168
    mov r2, r9
    add r1, r1, r2
    mov r7, r1
    store_8 [r7], r8
    mov r2, 33148
    load_32 r7, [r2]
    add r7, r7, r10
    mov r2, 33148
    store_32 [r2], r7
    add r8, r9, 1
    mov r2, 33136
    load_32 r7, [r2]
    cmp r8, r7
    jb __sym_edge_true_351
    jmp __sym_block_159
__sym_edge_true_351:
    mov r9, r8
    jmp __sym_block_160

; function tty_read, frame 16 bytes
__sym_fn_tty_read_161:
    push r13
    mov r13, sp
    sub sp, sp, 16
    sub r12, r13, 4
    store_32 [r12], r1
    sub r12, r13, 8
    store_32 [r12], r2
__sym_block_162:
    sub r12, r13, 4
    load_32 r1, [r12]
    mov r2, 0
    cmp r1, r2
    jne __sym_cmp_yes_352
    mov r1, 0
    jmp __sym_cmp_done_353
__sym_cmp_yes_352:
    mov r1, 1
__sym_cmp_done_353:
    and r1, r1, 1
    mov r8, r1
    sub r12, r13, 8
    load_32 r1, [r12]
    mov r2, 0
    cmp r1, r2
    jne __sym_cmp_yes_354
    mov r1, 0
    jmp __sym_cmp_done_355
__sym_cmp_yes_354:
    mov r1, 1
__sym_cmp_done_355:
    and r1, r1, 1
    mov r7, r1
    and r7, r8, r7
    and r7, r7, 1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_356
    mov r1, 0
    mov r11, r1
    jmp __sym_block_169
__sym_edge_true_356:
    jmp __sym_block_163
__sym_block_163:
    call __sym_fn_tty_poll_93
    mov r7, r1
    mov r2, 0
    cmp r7, r2
    je __sym_edge_true_357
    jmp __sym_block_164
__sym_edge_true_357:
    jmp __sym_block_163
__sym_block_164:
    mov r2, 33152
    load_32 r1, [r2]
    sub r12, r13, 12
    store_32 [r12], r1
    mov r2, 33156
    load_32 r8, [r2]
    sub r12, r13, 12
    load_32 r1, [r12]
    sub r7, r1, r8
    sub r12, r13, 8
    load_32 r1, [r12]
    mov r2, r7
    cmp r1, r2
    jbe __sym_minmax_358
    mov r1, r2
__sym_minmax_358:
    mov r11, r1
    sub r12, r13, 12
    load_32 r1, [r12]
    cmp r1, r8
    je __sym_edge_true_359
    mov r1, 0
    mov r10, r1
    mov r7, r8
    jmp __sym_block_167
__sym_edge_true_359:
    jmp __sym_block_166
__sym_block_165:
    mov r2, 33156
    store_32 [r2], r9
    jmp __sym_block_166
__sym_block_166:
    mov r2, 33156
    load_32 r7, [r2]
    sub r12, r13, 12
    load_32 r2, [r12]
    cmp r7, r2
    je __sym_edge_true_360
    jmp __sym_block_169
__sym_edge_true_360:
    jmp __sym_block_168
__sym_block_167:
    add r9, r7, 1
    mov r1, 33680
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
    je __sym_edge_true_361
    mov r7, r9
    jmp __sym_block_167
__sym_edge_true_361:
    jmp __sym_block_165
__sym_block_168:
    mov r1, 0
    mov r2, 33156
    store_32 [r2], r1
    mov r1, 0
    mov r2, 33152
    store_32 [r2], r1
    jmp __sym_block_169
__sym_block_169:
    mov r1, r11
    mov sp, r13
    pop r13
    ret

; function tty_readline, frame 24 bytes
__sym_fn_tty_readline_170:
    push r13
    mov r13, sp
    sub sp, sp, 24
    sub r12, r13, 4
    store_32 [r12], r1
    sub r12, r13, 8
    store_32 [r12], r2
__sym_block_171:
    sub r1, r13, 9
    mov r10, r1
    sub r12, r13, 4
    load_32 r1, [r12]
    mov r2, 0
    cmp r1, r2
    jne __sym_cmp_yes_362
    mov r1, 0
    jmp __sym_cmp_done_363
__sym_cmp_yes_362:
    mov r1, 1
__sym_cmp_done_363:
    and r1, r1, 1
    mov r8, r1
    sub r12, r13, 8
    load_32 r1, [r12]
    mov r2, 0
    cmp r1, r2
    jne __sym_cmp_yes_364
    mov r1, 0
    jmp __sym_cmp_done_365
__sym_cmp_yes_364:
    mov r1, 1
__sym_cmp_done_365:
    and r1, r1, 1
    mov r7, r1
    and r7, r8, r7
    and r7, r7, 1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_366
    mov r1, 0
    mov r7, r1
    jmp __sym_block_179
__sym_edge_true_366:
    jmp __sym_block_172
__sym_block_172:
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
    jmp __sym_block_173
__sym_block_173:
    sub r12, r13, 20
    store_32 [r12], r10
    sub r12, r13, 24
    store_32 [r12], r11
    mov r1, r10
    mov r2, 1
    call __sym_fn_tty_read_161
    sub r12, r13, 20
    load_32 r10, [r12]
    sub r12, r13, 24
    load_32 r11, [r12]
    load_8 r8, [r10]
    and r8, r8, 255
    mov r2, 10
    cmp r8, r2
    je __sym_cmp_yes_367
    mov r1, 0
    jmp __sym_cmp_done_368
__sym_cmp_yes_367:
    mov r1, 1
__sym_cmp_done_368:
    and r1, r1, 1
    mov r9, r1
    mov r1, r9
    cmp r1, 0
    jne __sym_edge_true_369
    jmp __sym_block_174
__sym_edge_true_369:
    mov r8, r11
    jmp __sym_block_177
__sym_block_174:
    sub r12, r13, 16
    load_32 r2, [r12]
    cmp r11, r2
    jb __sym_edge_true_370
    jmp __sym_block_176
__sym_edge_true_370:
    jmp __sym_block_175
__sym_block_175:
    sub r12, r13, 4
    load_32 r1, [r12]
    mov r2, r11
    add r1, r1, r2
    mov r7, r1
    store_8 [r7], r8
    jmp __sym_block_176
__sym_block_176:
    add r8, r11, 1
    jmp __sym_block_177
__sym_block_177:
    mov r1, r9
    cmp r1, 0
    jne __sym_edge_true_371
    mov r11, r8
    jmp __sym_block_173
__sym_edge_true_371:
    jmp __sym_block_178
__sym_block_178:
    sub r12, r13, 8
    load_32 r1, [r12]
    mov r2, 65535
    lsl r2, r2, 16
    or r2, r2, 65535
    add r7, r1, r2
    mov r1, r8
    mov r2, r7
    cmp r1, r2
    jbe __sym_minmax_372
    mov r1, r2
__sym_minmax_372:
    mov r7, r1
    sub r12, r13, 4
    load_32 r1, [r12]
    mov r2, r7
    add r1, r1, r2
    mov r7, r1
    mov r1, 0
    store_8 [r7], r1
    mov r7, r8
    jmp __sym_block_179
__sym_block_179:
    mov r1, r7
    mov sp, r13
    pop r13
    ret

; function tty_display_cursor, frame 0 bytes
__sym_fn_tty_display_cursor_180:
    mov r10, r1
    mov r9, r2
__sym_block_181:
    mov r2, 34000
    load_8 r7, [r2]
    and r7, r7, 1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_373
    jmp __sym_block_183
__sym_edge_true_373:
    jmp __sym_block_182
__sym_block_182:
    mov r2, 34004
    load_32 r8, [r2]
    mov r2, 49368
    load_32 r7, [r2]
    mov r1, 34008
    mov r2, r7
    lsl r2, r2, 2
    add r1, r1, r2
    mov r7, r1
    store_32 [r7], r8
    mov r1, 0
    mov r2, 34000
    store_8 [r2], r1
    jmp __sym_block_183
__sym_block_183:
    mov r2, 0
    cmp r9, r2
    je __sym_edge_true_374
    jmp __sym_block_184
__sym_edge_true_374:
    jmp __sym_block_185
__sym_block_184:
    mov r2, 49368
    store_32 [r2], r10
    mov r1, 34008
    mov r2, r10
    lsl r2, r2, 2
    add r1, r1, r2
    mov r9, r1
    load_32 r10, [r9]
    mov r2, 34004
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
    mov r2, 34000
    store_8 [r2], r1
    jmp __sym_block_185
__sym_block_185:
    mov r1, 0
    ret

; function tty_display_clear, frame 0 bytes
__sym_fn_tty_display_clear_186:
__sym_block_187:
    mov r2, 34000
    load_8 r7, [r2]
    and r7, r7, 1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_375
    jmp __sym_block_189
__sym_edge_true_375:
    jmp __sym_block_188
__sym_block_188:
    mov r2, 34004
    load_32 r8, [r2]
    mov r2, 49368
    load_32 r7, [r2]
    mov r1, 34008
    mov r2, r7
    lsl r2, r2, 2
    add r1, r1, r2
    mov r7, r1
    store_32 [r7], r8
    mov r1, 0
    mov r2, 34000
    store_8 [r2], r1
    jmp __sym_block_189
__sym_block_189:
    mov r1, 0
    mov r8, r1
    jmp __sym_block_191
__sym_block_190:
    mov r1, 0
    ret
__sym_block_191:
    mov r1, 34008
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
    je __sym_edge_true_376
    mov r8, r7
    jmp __sym_block_191
__sym_edge_true_376:
    jmp __sym_block_190

; function tty_display_init, frame 0 bytes
__sym_fn_tty_display_init_192:
__sym_block_193:
    mov r2, 34000
    load_8 r7, [r2]
    and r7, r7, 1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_377
    jmp __sym_block_195
__sym_edge_true_377:
    jmp __sym_block_194
__sym_block_194:
    mov r2, 34004
    load_32 r8, [r2]
    mov r2, 49368
    load_32 r7, [r2]
    mov r1, 34008
    mov r2, r7
    lsl r2, r2, 2
    add r1, r1, r2
    mov r7, r1
    store_32 [r7], r8
    mov r1, 0
    mov r2, 34000
    store_8 [r2], r1
    jmp __sym_block_195
__sym_block_195:
    mov r1, 0
    mov r8, r1
    jmp __sym_block_196
__sym_block_196:
    mov r1, 34008
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
    je __sym_edge_true_378
    mov r8, r7
    jmp __sym_block_196
__sym_edge_true_378:
    jmp __sym_block_197
__sym_block_197:
    mov r1, 0
    mov r2, 1
    screen r1, r2
    mov r1, 1
    mov r2, 34008
    screen r1, r2
    mov r1, 0
    ret

; function tty_display_put, frame 0 bytes
__sym_fn_tty_display_put_198:
    mov r9, r1
    mov r7, r2
__sym_block_199:
    lsl r7, r7, 24
    mov r2, 255
    lsl r2, r2, 16
    or r8, r7, r2
    mov r1, 34008
    mov r2, r9
    lsl r2, r2, 2
    add r1, r1, r2
    mov r7, r1
    store_32 [r7], r8
    mov r1, 0
    ret

; function tty_display_scroll, frame 0 bytes
__sym_fn_tty_display_scroll_200:
__sym_block_201:
    mov r1, 0
    mov r9, r1
    jmp __sym_block_202
__sym_block_202:
    mov r1, 34008
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
    je __sym_edge_true_379
    mov r9, r7
    jmp __sym_block_202
__sym_edge_true_379:
    mov r1, 3744
    mov r8, r1
    jmp __sym_block_204
__sym_block_203:
    mov r1, 0
    ret
__sym_block_204:
    mov r1, 34008
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
    je __sym_edge_true_380
    mov r8, r7
    jmp __sym_block_204
__sym_edge_true_380:
    jmp __sym_block_203

; function strcmp, frame 0 bytes
__sym_fn_strcmp_205:
    mov r8, r1
    mov r9, r2
__sym_block_206:
    load_8 r10, [r8]
    and r10, r10, 255
    mov r2, 0
    cmp r10, r2
    je __sym_edge_true_381
    jmp __sym_block_207
__sym_edge_true_381:
    mov r7, r9
    mov r1, 0
    mov r8, r1
    jmp __sym_block_210
__sym_block_207:
    load_8 r7, [r9]
    and r7, r7, 255
    cmp r10, r7
    je __sym_edge_true_382
    and r10, r10, 255
    mov r7, r10
    jmp __sym_block_209
__sym_edge_true_382:
    jmp __sym_block_208
__sym_block_208:
    mov r1, r8
    mov r2, 1
    add r1, r1, r2
    mov r8, r1
    mov r1, r9
    mov r2, 1
    add r1, r1, r2
    mov r9, r1
    load_8 r7, [r8]
    and r7, r7, 255
    mov r2, 0
    cmp r7, r2
    je __sym_edge_true_383
    and r7, r7, 255
    mov r10, r7
    jmp __sym_block_207
__sym_edge_true_383:
    mov r1, 0
    and r1, r1, 255
    mov r7, r1
    jmp __sym_block_209
__sym_block_209:
    mov r1, r7
    mov r8, r1
    mov r7, r9
    jmp __sym_block_210
__sym_block_210:
    load_8 r7, [r7]
    and r7, r7, 255
    mov r1, r7
    mov r7, r1
    sub r7, r8, r7
    mov r1, r7
    ret

; function puts, frame 0 bytes
__sym_fn_puts_211:
    push r13
    mov r13, sp
    mov r7, r1
__sym_block_212:
    mov r1, r7
    call __sym_fn_tty_puts_84
    mov r1, 10
    call __sym_fn_tty_putc_49
    mov r1, 0
    mov sp, r13
    pop r13
    ret

; Global addresses (zero tail uses initially zeroed RAM).
; .str = 32768
; .str.1 = 32783
; .str.2 = 32835
; .str.3 = 32841
; .str.4 = 32846
; .str.5 = 32851
; .str.6 = 32857
; .str.7 = 32863
; .str.8 = 32899
; .str.9 = 32948
; .str.10 = 32953
; .str.11 = 32958
; .str.12 = 32976
; .str.13 = 32984
; .str.14 = 33009
; .str.15 = 33031
; .str.16 = 33059
; .str.17 = 33094
; initialized = 33124
; cursor = 33128
; wrap_pending = 33132
; edit_length = 33136
; edit_position = 33140
; edit_active = 33144
; edit_cells = 33148
; ready_length = 33152
; read_offset = 33156
; shift_down = 33160
; cursor_disabled = 33164
; echo_width = 33168
; echo_pending = 33424
; line = 33680
; cursor_phase = 33936
; cursor_time_low = 33940
; cursor_time_high = 33944
; edit_start_cursor = 33948
; edit_start_pending = 33952
; shifted.plain = 33956
; shifted.upper = 33978
; cursor_drawn = 34000
; cursor_saved = 34004
; framebuffer = 34008
; cursor_position = 49368
@32768
U8 83
U8 121
U8 109
U8 112
U8 104
U8 111
U8 110
U8 121
U8 32
U8 115
U8 104
U8 101
U8 108
U8 108
U8 0
U8 84
U8 121
U8 112
U8 101
U8 32
U8 39
U8 104
U8 101
U8 108
U8 112
U8 39
U8 32
U8 102
U8 111
U8 114
U8 32
U8 99
U8 111
U8 109
U8 109
U8 97
U8 110
U8 100
U8 115
U8 46
U8 32
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
U8 101
U8 100
U8 105
U8 116
U8 32
U8 116
U8 104
U8 101
U8 32
U8 108
U8 105
U8 110
U8 101
U8 46
U8 0
U8 115
U8 121
U8 109
U8 62
U8 32
U8 0
U8 101
U8 99
U8 104
U8 111
U8 0
U8 104
U8 101
U8 108
U8 112
U8 0
U8 99
U8 108
U8 101
U8 97
U8 114
U8 0
U8 97
U8 98
U8 111
U8 117
U8 116
U8 0
U8 83
U8 121
U8 109
U8 112
U8 104
U8 111
U8 110
U8 121
U8 32
U8 45
U8 32
U8 57
U8 54
U8 120
U8 52
U8 48
U8 32
U8 99
U8 104
U8 97
U8 114
U8 97
U8 99
U8 116
U8 101
U8 114
U8 32
U8 116
U8 101
U8 114
U8 109
U8 105
U8 110
U8 97
U8 108
U8 0
U8 67
U8 97
U8 110
U8 111
U8 110
U8 105
U8 99
U8 97
U8 108
U8 32
U8 105
U8 110
U8 112
U8 117
U8 116
U8 32
U8 119
U8 105
U8 116
U8 104
U8 32
U8 101
U8 99
U8 104
U8 111
U8 32
U8 97
U8 110
U8 100
U8 32
U8 98
U8 97
U8 99
U8 107
U8 115
U8 112
U8 97
U8 99
U8 101
U8 32
U8 101
U8 100
U8 105
U8 116
U8 105
U8 110
U8 103
U8 46
U8 0
U8 101
U8 120
U8 105
U8 116
U8 0
U8 66
U8 121
U8 101
U8 46
U8 0
U8 85
U8 110
U8 107
U8 110
U8 111
U8 119
U8 110
U8 32
U8 99
U8 111
U8 109
U8 109
U8 97
U8 110
U8 100
U8 58
U8 32
U8 0
U8 85
U8 115
U8 97
U8 103
U8 101
U8 58
U8 32
U8 0
U8 104
U8 101
U8 108
U8 112
U8 32
U8 32
U8 32
U8 32
U8 32
U8 32
U8 32
U8 83
U8 104
U8 111
U8 119
U8 32
U8 99
U8 111
U8 109
U8 109
U8 97
U8 110
U8 100
U8 115
U8 0
U8 101
U8 99
U8 104
U8 111
U8 32
U8 84
U8 69
U8 88
U8 84
U8 32
U8 32
U8 80
U8 114
U8 105
U8 110
U8 116
U8 32
U8 116
U8 101
U8 120
U8 116
U8 0
U8 99
U8 108
U8 101
U8 97
U8 114
U8 32
U8 32
U8 32
U8 32
U8 32
U8 32
U8 67
U8 108
U8 101
U8 97
U8 114
U8 32
U8 116
U8 104
U8 101
U8 32
U8 115
U8 99
U8 114
U8 101
U8 101
U8 110
U8 0
U8 97
U8 98
U8 111
U8 117
U8 116
U8 32
U8 32
U8 32
U8 32
U8 32
U8 32
U8 83
U8 104
U8 111
U8 119
U8 32
U8 115
U8 121
U8 115
U8 116
U8 101
U8 109
U8 32
U8 105
U8 110
U8 102
U8 111
U8 114
U8 109
U8 97
U8 116
U8 105
U8 111
U8 110
U8 0
U8 101
U8 120
U8 105
U8 116
U8 32
U8 32
U8 32
U8 32
U8 32
U8 32
U8 32
U8 76
U8 101
U8 97
U8 118
U8 101
U8 32
U8 116
U8 104
U8 101
U8 32
U8 115
U8 104
U8 101
U8 108
U8 108
@33956
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
