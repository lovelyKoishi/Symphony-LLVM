; Symphony LLVM backend 0.1. Big endian, 32-bit values/pointers.
__sym_start:
    mov sp, 256
    lsl sp, sp, 16
    call __sym_fn_main_0
__sym_halt:
    jmp __sym_halt
__sym_trap:
    jmp __sym_trap

; function main, frame 328 bytes
__sym_fn_main_0:
    push r13
    mov r13, sp
    sub sp, sp, 328
__sym_block_1:
    sub r1, r13, 260
    sub r12, r13, 4
    store_32 [r12], r1
    sub r1, r13, 298
    sub r12, r13, 264
    store_32 [r12], r1
    sub r1, r13, 308
    sub r12, r13, 304
    store_32 [r12], r1
    mov r1, 1
    lsl r1, r1, 16
    call __sym_fn_puts_181
    mov r1, 1
    lsl r1, r1, 16
    or r1, r1, 43
    call __sym_fn_puts_181
    mov r1, 1
    lsl r1, r1, 16
    or r1, r1, 97
    call __sym_fn_tty_puts_50
    sub r12, r13, 4
    load_32 r1, [r12]
    mov r2, 256
    call __sym_fn_tty_readline_91
    sub r12, r13, 4
    load_32 r1, [r12]
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 100
    call __sym_fn_strcmp_101
    mov r7, r1
    mov r1, r7
    mov r2, 0
    cmp r1, r2
    je __sym_cmp_yes_183
    mov r1, 0
    jmp __sym_cmp_done_184
__sym_cmp_yes_183:
    mov r1, 1
__sym_cmp_done_184:
    and r1, r1, 1
    mov r8, r1
    mov r1, r8
    cmp r1, 0
    jne __sym_edge_true_185
    jmp __sym_block_3
__sym_edge_true_185:
    jmp __sym_block_2
__sym_block_2:
    mov r1, 0
    mov sp, r13
    pop r13
    ret
__sym_block_3:
    mov r1, 0
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 4864
    store_32 [r2], r1
    sub r12, r13, 4
    load_32 r1, [r12]
    sub r12, r13, 304
    load_32 r2, [r12]
    mov r3, 0
    call __sym_fn_strtol_109
    sub r12, r13, 312
    store_32 [r12], r1
    sub r12, r13, 304
    load_32 r2, [r12]
    load_32 r1, [r2]
    mov r7, r1
    mov r1, r7
    sub r12, r13, 4
    load_32 r2, [r12]
    cmp r1, r2
    jne __sym_cmp_yes_186
    mov r1, 0
    jmp __sym_cmp_done_187
__sym_cmp_yes_186:
    mov r1, 1
__sym_cmp_done_187:
    and r1, r1, 1
    mov r8, r1
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 4864
    load_32 r1, [r2]
    mov r9, r1
    mov r1, r9
    mov r2, 0
    cmp r1, r2
    je __sym_cmp_yes_188
    mov r1, 0
    jmp __sym_cmp_done_189
__sym_cmp_yes_188:
    mov r1, 1
__sym_cmp_done_189:
    and r1, r1, 1
    mov r10, r1
    mov r1, r8
    cmp r1, 0
    jne __sym_select_yes_190
    mov r1, 0
    jmp __sym_select_done_191
__sym_select_yes_190:
    mov r1, r10
__sym_select_done_191:
    and r1, r1, 1
    sub r12, r13, 316
    store_32 [r12], r1
    mov r2, r7
    load_8 r1, [r2]
    and r1, r1, 255
    mov r8, r1
    mov r1, r8
    mov r7, r1
    mov r1, r7
    call __sym_fn_isspace_107
    mov r8, r1
    mov r1, r8
    mov r2, 0
    cmp r1, r2
    je __sym_cmp_yes_192
    mov r1, 0
    jmp __sym_cmp_done_193
__sym_cmp_yes_192:
    mov r1, 1
__sym_cmp_done_193:
    and r1, r1, 1
    mov r7, r1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_194
    jmp __sym_block_4
__sym_edge_true_194:
    jmp __sym_block_5
__sym_block_4:
    sub r12, r13, 304
    load_32 r2, [r12]
    load_32 r1, [r2]
    mov r7, r1
    mov r1, r7
    mov r2, 1
    add r1, r1, r2
    mov r8, r1
    mov r1, r8
    sub r12, r13, 304
    load_32 r2, [r12]
    store_32 [r2], r1
    mov r2, r8
    load_8 r1, [r2]
    and r1, r1, 255
    mov r7, r1
    mov r1, r7
    mov r8, r1
    mov r1, r8
    call __sym_fn_isspace_107
    mov r7, r1
    mov r1, r7
    mov r2, 0
    cmp r1, r2
    je __sym_cmp_yes_195
    mov r1, 0
    jmp __sym_cmp_done_196
__sym_cmp_yes_195:
    mov r1, 1
__sym_cmp_done_196:
    and r1, r1, 1
    mov r8, r1
    mov r1, r8
    cmp r1, 0
    jne __sym_edge_true_197
    jmp __sym_block_4
__sym_edge_true_197:
    jmp __sym_block_5
__sym_block_5:
    sub r12, r13, 316
    load_32 r1, [r12]
    cmp r1, 0
    jne __sym_edge_true_198
    mov r1, 1
    lsl r1, r1, 16
    or r1, r1, 105
    sub r12, r13, 324
    store_32 [r12], r1
    sub r12, r13, 324
    load_32 r1, [r12]
    sub r12, r13, 320
    store_32 [r12], r1
    jmp __sym_block_8
__sym_edge_true_198:
    jmp __sym_block_6
__sym_block_6:
    sub r12, r13, 304
    load_32 r2, [r12]
    load_32 r1, [r2]
    mov r7, r1
    mov r2, r7
    load_8 r1, [r2]
    and r1, r1, 255
    mov r8, r1
    mov r1, r8
    mov r2, 0
    cmp r1, r2
    je __sym_cmp_yes_199
    mov r1, 0
    jmp __sym_cmp_done_200
__sym_cmp_yes_199:
    mov r1, 1
__sym_cmp_done_200:
    and r1, r1, 1
    mov r7, r1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_201
    mov r1, 1
    lsl r1, r1, 16
    or r1, r1, 105
    sub r12, r13, 324
    store_32 [r12], r1
    sub r12, r13, 324
    load_32 r1, [r12]
    sub r12, r13, 320
    store_32 [r12], r1
    jmp __sym_block_8
__sym_edge_true_201:
    jmp __sym_block_7
__sym_block_7:
    sub r12, r13, 312
    load_32 r1, [r12]
    sub r12, r13, 264
    load_32 r2, [r12]
    mov r3, 34
    mov r4, 10
    call __sym_fn_sym_i32toa_165
    mov r1, 1
    lsl r1, r1, 16
    or r1, r1, 159
    call __sym_fn_tty_puts_50
    sub r12, r13, 264
    load_32 r1, [r12]
    call __sym_fn_puts_181
    sub r12, r13, 312
    load_32 r1, [r12]
    sub r12, r13, 264
    load_32 r2, [r12]
    mov r3, 34
    mov r4, 16
    call __sym_fn_sym_u32toa_151
    mov r1, 1
    lsl r1, r1, 16
    or r1, r1, 169
    call __sym_fn_tty_puts_50
    sub r12, r13, 264
    load_32 r1, [r12]
    sub r12, r13, 324
    store_32 [r12], r1
    sub r12, r13, 324
    load_32 r1, [r12]
    sub r12, r13, 320
    store_32 [r12], r1
    jmp __sym_block_8
__sym_block_8:
    sub r12, r13, 320
    load_32 r1, [r12]
    call __sym_fn_puts_181
    mov r1, 1
    lsl r1, r1, 16
    or r1, r1, 97
    call __sym_fn_tty_puts_50
    sub r12, r13, 4
    load_32 r1, [r12]
    mov r2, 256
    call __sym_fn_tty_readline_91
    sub r12, r13, 4
    load_32 r1, [r12]
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 100
    call __sym_fn_strcmp_101
    mov r7, r1
    mov r1, r7
    mov r2, 0
    cmp r1, r2
    je __sym_cmp_yes_202
    mov r1, 0
    jmp __sym_cmp_done_203
__sym_cmp_yes_202:
    mov r1, 1
__sym_cmp_done_203:
    and r1, r1, 1
    mov r8, r1
    mov r1, r8
    cmp r1, 0
    jne __sym_edge_true_204
    jmp __sym_block_3
__sym_edge_true_204:
    jmp __sym_block_2

; function tty_init, frame 16 bytes
__sym_fn_tty_init_9:
    push r13
    mov r13, sp
    sub sp, sp, 16
__sym_block_10:
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 4036
    load_8 r1, [r2]
    and r1, r1, 1
    mov r7, r1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_205
    jmp __sym_block_13
__sym_edge_true_205:
    mov r1, 0
    sub r12, r13, 8
    store_32 [r12], r1
    sub r12, r13, 8
    load_32 r1, [r12]
    sub r12, r13, 4
    store_32 [r12], r1
    jmp __sym_block_11
__sym_block_11:
    mov r1, 1
    lsl r1, r1, 16
    or r1, r1, 182
    sub r12, r13, 4
    load_32 r2, [r12]
    add r1, r1, r2
    mov r7, r1
    mov r1, 0
    mov r2, r7
    store_8 [r2], r1
    sub r12, r13, 4
    load_32 r1, [r12]
    mov r2, 1
    add r1, r1, r2
    sub r12, r13, 12
    store_32 [r12], r1
    sub r12, r13, 12
    load_32 r1, [r12]
    mov r2, 3840
    cmp r1, r2
    je __sym_cmp_yes_206
    mov r1, 0
    jmp __sym_cmp_done_207
__sym_cmp_yes_206:
    mov r1, 1
__sym_cmp_done_207:
    and r1, r1, 1
    mov r7, r1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_208
    sub r12, r13, 12
    load_32 r1, [r12]
    sub r12, r13, 8
    store_32 [r12], r1
    sub r12, r13, 8
    load_32 r1, [r12]
    sub r12, r13, 4
    store_32 [r12], r1
    jmp __sym_block_11
__sym_edge_true_208:
    jmp __sym_block_12
__sym_block_12:
    mov r1, 0
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 4024
    store_32 [r2], r1
    mov r1, 0
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 4028
    store_8 [r2], r1
    mov r1, 0
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 4032
    store_32 [r2], r1
    jmp __sym_block_13
__sym_block_13:
    mov r1, 1
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 4036
    store_8 [r2], r1
    mov r1, 0
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 4024
    store_32 [r2], r1
    mov r1, 0
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 4028
    store_8 [r2], r1
    mov r1, 0
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 4032
    store_32 [r2], r1
    mov r1, 0
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 4040
    store_32 [r2], r1
    mov r1, 0
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 4044
    store_32 [r2], r1
    mov r1, 0
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 4048
    store_32 [r2], r1
    mov r1, 0
    mov r2, 0
    screen r1, r2
    mov r1, 1
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 182
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
    mov sp, r13
    pop r13
    ret

; function tty_putc, frame 8 bytes
__sym_fn_tty_putc_14:
    push r13
    mov r13, sp
    sub sp, sp, 8
    sub r12, r13, 4
    store_32 [r12], r1
__sym_block_15:
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 4036
    load_8 r1, [r2]
    and r1, r1, 1
    mov r7, r1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_209
    jmp __sym_block_16
__sym_edge_true_209:
    jmp __sym_block_17
__sym_block_16:
    call __sym_fn_tty_init_9
    jmp __sym_block_17
__sym_block_17:
    sub r12, r13, 4
    load_32 r1, [r12]
    mov r2, 255
    and r1, r1, r2
    mov r7, r1
    mov r1, r7
    call __sym_fn_render_18
    mov r1, 0
    mov sp, r13
    pop r13
    ret

; function render, frame 32 bytes
__sym_fn_render_18:
    push r13
    mov r13, sp
    sub sp, sp, 32
    sub r12, r13, 4
    store_32 [r12], r1
__sym_block_19:
    sub r12, r13, 4
    load_32 r1, [r12]
    mov r2, 10
    cmp r1, r2
    je __sym_switch_210
    mov r2, 13
    cmp r1, r2
    je __sym_switch_211
    mov r2, 8
    cmp r1, r2
    je __sym_switch_212
    mov r2, 9
    cmp r1, r2
    je __sym_switch_213
    jmp __sym_block_27
__sym_switch_210:
    jmp __sym_block_20
__sym_switch_211:
    jmp __sym_block_21
__sym_switch_212:
    jmp __sym_block_22
__sym_switch_213:
    jmp __sym_block_23
__sym_block_20:
    call __sym_fn_next_line_30
    mov r1, 0
    sub r12, r13, 28
    store_32 [r12], r1
    sub r12, r13, 28
    load_32 r1, [r12]
    sub r12, r13, 24
    store_32 [r12], r1
    jmp __sym_block_29
__sym_block_21:
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 4024
    load_32 r1, [r2]
    mov r7, r1
    mov r1, r7
    mov r2, 96
    mod r1, r1, r2
    mov r8, r1
    mov r1, r7
    mov r2, r8
    sub r1, r1, r2
    mov r9, r1
    mov r1, r9
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 4024
    store_32 [r2], r1
    mov r1, 0
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 4028
    store_8 [r2], r1
    mov r1, 0
    sub r12, r13, 28
    store_32 [r12], r1
    sub r12, r13, 28
    load_32 r1, [r12]
    sub r12, r13, 24
    store_32 [r12], r1
    jmp __sym_block_29
__sym_block_22:
    call __sym_fn_erase_cell_36
    mov r1, 0
    sub r12, r13, 28
    store_32 [r12], r1
    sub r12, r13, 28
    load_32 r1, [r12]
    sub r12, r13, 24
    store_32 [r12], r1
    jmp __sym_block_29
__sym_block_23:
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 4028
    load_8 r1, [r2]
    and r1, r1, 1
    mov r7, r1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_214
    jmp __sym_block_25
__sym_edge_true_214:
    jmp __sym_block_24
__sym_block_24:
    call __sym_fn_next_line_30
    jmp __sym_block_25
__sym_block_25:
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 4024
    load_32 r1, [r2]
    mov r7, r1
    mov r1, r7
    mov r2, 7
    and r1, r1, r2
    mov r8, r1
    mov r1, 8
    mov r2, r8
    sub r1, r1, r2
    sub r12, r13, 8
    store_32 [r12], r1
    mov r1, 0
    sub r12, r13, 16
    store_32 [r12], r1
    sub r12, r13, 16
    load_32 r1, [r12]
    sub r12, r13, 12
    store_32 [r12], r1
    jmp __sym_block_26
__sym_block_26:
    mov r1, 32
    call __sym_fn_print_cell_43
    sub r12, r13, 12
    load_32 r1, [r12]
    mov r2, 1
    add r1, r1, r2
    sub r12, r13, 20
    store_32 [r12], r1
    sub r12, r13, 20
    load_32 r1, [r12]
    sub r12, r13, 8
    load_32 r2, [r12]
    cmp r1, r2
    je __sym_cmp_yes_215
    mov r1, 0
    jmp __sym_cmp_done_216
__sym_cmp_yes_215:
    mov r1, 1
__sym_cmp_done_216:
    and r1, r1, 1
    mov r7, r1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_217
    sub r12, r13, 20
    load_32 r1, [r12]
    sub r12, r13, 16
    store_32 [r12], r1
    sub r12, r13, 16
    load_32 r1, [r12]
    sub r12, r13, 12
    store_32 [r12], r1
    jmp __sym_block_26
__sym_edge_true_217:
    sub r12, r13, 8
    load_32 r1, [r12]
    sub r12, r13, 28
    store_32 [r12], r1
    sub r12, r13, 28
    load_32 r1, [r12]
    sub r12, r13, 24
    store_32 [r12], r1
    jmp __sym_block_29
__sym_block_27:
    sub r12, r13, 4
    load_32 r1, [r12]
    mov r2, 31
    cmp r1, r2
    ja __sym_cmp_yes_218
    mov r1, 0
    jmp __sym_cmp_done_219
__sym_cmp_yes_218:
    mov r1, 1
__sym_cmp_done_219:
    and r1, r1, 1
    mov r7, r1
    sub r12, r13, 4
    load_32 r1, [r12]
    mov r2, 127
    cmp r1, r2
    jne __sym_cmp_yes_220
    mov r1, 0
    jmp __sym_cmp_done_221
__sym_cmp_yes_220:
    mov r1, 1
__sym_cmp_done_221:
    and r1, r1, 1
    mov r8, r1
    mov r1, r7
    mov r2, r8
    and r1, r1, r2
    and r1, r1, 1
    mov r9, r1
    mov r1, r9
    cmp r1, 0
    jne __sym_edge_true_222
    mov r1, 0
    sub r12, r13, 28
    store_32 [r12], r1
    sub r12, r13, 28
    load_32 r1, [r12]
    sub r12, r13, 24
    store_32 [r12], r1
    jmp __sym_block_29
__sym_edge_true_222:
    jmp __sym_block_28
__sym_block_28:
    sub r12, r13, 4
    load_32 r1, [r12]
    call __sym_fn_print_cell_43
    mov r1, 1
    sub r12, r13, 28
    store_32 [r12], r1
    sub r12, r13, 28
    load_32 r1, [r12]
    sub r12, r13, 24
    store_32 [r12], r1
    jmp __sym_block_29
__sym_block_29:
    sub r12, r13, 24
    load_32 r1, [r12]
    mov sp, r13
    pop r13
    ret

; function next_line, frame 32 bytes
__sym_fn_next_line_30:
    push r13
    mov r13, sp
    sub sp, sp, 32
__sym_block_31:
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 4024
    load_32 r1, [r2]
    mov r7, r1
    mov r1, r7
    mov r2, 96
    mod r1, r1, r2
    mov r8, r1
    mov r1, r7
    mov r2, r8
    sub r1, r1, r2
    sub r12, r13, 4
    store_32 [r12], r1
    sub r12, r13, 4
    load_32 r1, [r12]
    mov r2, 96
    add r1, r1, r2
    mov r7, r1
    mov r1, r7
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 4024
    store_32 [r2], r1
    mov r1, 0
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 4028
    store_8 [r2], r1
    mov r1, r7
    mov r2, 3840
    cmp r1, r2
    jb __sym_cmp_yes_223
    mov r1, 0
    jmp __sym_cmp_done_224
__sym_cmp_yes_223:
    mov r1, 1
__sym_cmp_done_224:
    and r1, r1, 1
    mov r8, r1
    mov r1, r8
    cmp r1, 0
    jne __sym_edge_true_225
    mov r1, 0
    sub r12, r13, 12
    store_32 [r12], r1
    sub r12, r13, 12
    load_32 r1, [r12]
    sub r12, r13, 8
    store_32 [r12], r1
    jmp __sym_block_32
__sym_edge_true_225:
    jmp __sym_block_35
__sym_block_32:
    mov r1, 1
    lsl r1, r1, 16
    or r1, r1, 182
    sub r12, r13, 8
    load_32 r2, [r12]
    add r1, r1, r2
    mov r7, r1
    mov r1, r7
    mov r2, 96
    add r1, r1, r2
    mov r8, r1
    mov r2, r8
    load_8 r1, [r2]
    and r1, r1, 255
    mov r9, r1
    mov r1, r9
    mov r2, r7
    store_8 [r2], r1
    sub r12, r13, 8
    load_32 r1, [r12]
    mov r2, 1
    add r1, r1, r2
    sub r12, r13, 16
    store_32 [r12], r1
    sub r12, r13, 16
    load_32 r1, [r12]
    mov r2, 3744
    cmp r1, r2
    je __sym_cmp_yes_226
    mov r1, 0
    jmp __sym_cmp_done_227
__sym_cmp_yes_226:
    mov r1, 1
__sym_cmp_done_227:
    and r1, r1, 1
    mov r7, r1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_228
    sub r12, r13, 16
    load_32 r1, [r12]
    sub r12, r13, 12
    store_32 [r12], r1
    sub r12, r13, 12
    load_32 r1, [r12]
    sub r12, r13, 8
    store_32 [r12], r1
    jmp __sym_block_32
__sym_edge_true_228:
    mov r1, 3744
    sub r12, r13, 24
    store_32 [r12], r1
    sub r12, r13, 24
    load_32 r1, [r12]
    sub r12, r13, 20
    store_32 [r12], r1
    jmp __sym_block_34
__sym_block_33:
    sub r12, r13, 4
    load_32 r1, [r12]
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 4024
    store_32 [r2], r1
    jmp __sym_block_35
__sym_block_34:
    mov r1, 1
    lsl r1, r1, 16
    or r1, r1, 182
    sub r12, r13, 20
    load_32 r2, [r12]
    add r1, r1, r2
    mov r7, r1
    mov r1, 0
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
    mov r2, 3840
    cmp r1, r2
    je __sym_cmp_yes_229
    mov r1, 0
    jmp __sym_cmp_done_230
__sym_cmp_yes_229:
    mov r1, 1
__sym_cmp_done_230:
    and r1, r1, 1
    mov r7, r1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_231
    sub r12, r13, 28
    load_32 r1, [r12]
    sub r12, r13, 24
    store_32 [r12], r1
    sub r12, r13, 24
    load_32 r1, [r12]
    sub r12, r13, 20
    store_32 [r12], r1
    jmp __sym_block_34
__sym_edge_true_231:
    jmp __sym_block_33
__sym_block_35:
    mov r1, 0
    mov sp, r13
    pop r13
    ret

; function erase_cell, frame 8 bytes
__sym_fn_erase_cell_36:
    push r13
    mov r13, sp
    sub sp, sp, 8
__sym_block_37:
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 4028
    load_8 r1, [r2]
    and r1, r1, 1
    mov r7, r1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_232
    jmp __sym_block_39
__sym_edge_true_232:
    jmp __sym_block_38
__sym_block_38:
    mov r1, 0
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 4028
    store_8 [r2], r1
    jmp __sym_block_41
__sym_block_39:
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 4024
    load_32 r1, [r2]
    sub r12, r13, 4
    store_32 [r12], r1
    sub r12, r13, 4
    load_32 r1, [r12]
    mov r2, 0
    cmp r1, r2
    je __sym_cmp_yes_233
    mov r1, 0
    jmp __sym_cmp_done_234
__sym_cmp_yes_233:
    mov r1, 1
__sym_cmp_done_234:
    and r1, r1, 1
    mov r7, r1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_235
    jmp __sym_block_40
__sym_edge_true_235:
    jmp __sym_block_42
__sym_block_40:
    sub r12, r13, 4
    load_32 r1, [r12]
    mov r2, 65535
    lsl r2, r2, 16
    or r2, r2, 65535
    add r1, r1, r2
    mov r7, r1
    mov r1, r7
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 4024
    store_32 [r2], r1
    jmp __sym_block_41
__sym_block_41:
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 4024
    load_32 r1, [r2]
    mov r7, r1
    mov r1, 1
    lsl r1, r1, 16
    or r1, r1, 182
    mov r2, r7
    add r1, r1, r2
    mov r8, r1
    mov r1, 0
    mov r2, r8
    store_8 [r2], r1
    jmp __sym_block_42
__sym_block_42:
    mov r1, 0
    mov sp, r13
    pop r13
    ret

; function print_cell, frame 8 bytes
__sym_fn_print_cell_43:
    push r13
    mov r13, sp
    sub sp, sp, 8
    sub r12, r13, 4
    store_32 [r12], r1
__sym_block_44:
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 4028
    load_8 r1, [r2]
    and r1, r1, 1
    mov r7, r1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_236
    jmp __sym_block_46
__sym_edge_true_236:
    jmp __sym_block_45
__sym_block_45:
    call __sym_fn_next_line_30
    jmp __sym_block_46
__sym_block_46:
    sub r12, r13, 4
    load_32 r1, [r12]
    and r1, r1, 255
    mov r7, r1
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 4024
    load_32 r1, [r2]
    sub r12, r13, 8
    store_32 [r12], r1
    mov r1, 1
    lsl r1, r1, 16
    or r1, r1, 182
    sub r12, r13, 8
    load_32 r2, [r12]
    add r1, r1, r2
    mov r8, r1
    mov r1, r7
    mov r2, r8
    store_8 [r2], r1
    sub r12, r13, 8
    load_32 r1, [r12]
    mov r2, 96
    mod r1, r1, r2
    mov r7, r1
    mov r1, r7
    mov r2, 95
    cmp r1, r2
    je __sym_cmp_yes_237
    mov r1, 0
    jmp __sym_cmp_done_238
__sym_cmp_yes_237:
    mov r1, 1
__sym_cmp_done_238:
    and r1, r1, 1
    mov r8, r1
    mov r1, r8
    cmp r1, 0
    jne __sym_edge_true_239
    jmp __sym_block_48
__sym_edge_true_239:
    jmp __sym_block_47
__sym_block_47:
    mov r1, 1
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 4028
    store_8 [r2], r1
    jmp __sym_block_49
__sym_block_48:
    sub r12, r13, 8
    load_32 r1, [r12]
    mov r2, 1
    add r1, r1, r2
    mov r7, r1
    mov r1, r7
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 4024
    store_32 [r2], r1
    jmp __sym_block_49
__sym_block_49:
    mov r1, 0
    mov sp, r13
    pop r13
    ret

; function tty_puts, frame 40 bytes
__sym_fn_tty_puts_50:
    push r13
    mov r13, sp
    sub sp, sp, 40
    sub r12, r13, 4
    store_32 [r12], r1
__sym_block_51:
    sub r12, r13, 4
    load_32 r1, [r12]
    mov r2, 0
    cmp r1, r2
    je __sym_cmp_yes_240
    mov r1, 0
    jmp __sym_cmp_done_241
__sym_cmp_yes_240:
    mov r1, 1
__sym_cmp_done_241:
    and r1, r1, 1
    mov r7, r1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_242
    jmp __sym_block_52
__sym_edge_true_242:
    mov r1, 0
    sub r12, r13, 40
    store_32 [r12], r1
    sub r12, r13, 40
    load_32 r1, [r12]
    sub r12, r13, 36
    store_32 [r12], r1
    jmp __sym_block_54
__sym_block_52:
    sub r12, r13, 4
    load_32 r2, [r12]
    load_8 r1, [r2]
    and r1, r1, 255
    sub r12, r13, 8
    store_32 [r12], r1
    sub r12, r13, 8
    load_32 r1, [r12]
    mov r2, 0
    cmp r1, r2
    je __sym_cmp_yes_243
    mov r1, 0
    jmp __sym_cmp_done_244
__sym_cmp_yes_243:
    mov r1, 1
__sym_cmp_done_244:
    and r1, r1, 1
    mov r7, r1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_245
    sub r12, r13, 8
    load_32 r1, [r12]
    sub r12, r13, 16
    store_32 [r12], r1
    mov r1, 0
    sub r12, r13, 24
    store_32 [r12], r1
    sub r12, r13, 16
    load_32 r1, [r12]
    and r1, r1, 255
    sub r12, r13, 12
    store_32 [r12], r1
    sub r12, r13, 24
    load_32 r1, [r12]
    sub r12, r13, 20
    store_32 [r12], r1
    jmp __sym_block_53
__sym_edge_true_245:
    mov r1, 0
    sub r12, r13, 40
    store_32 [r12], r1
    sub r12, r13, 40
    load_32 r1, [r12]
    sub r12, r13, 36
    store_32 [r12], r1
    jmp __sym_block_54
__sym_block_53:
    sub r12, r13, 12
    load_32 r1, [r12]
    mov r7, r1
    mov r1, r7
    call __sym_fn_tty_putc_14
    sub r12, r13, 20
    load_32 r1, [r12]
    mov r2, 1
    add r1, r1, r2
    sub r12, r13, 28
    store_32 [r12], r1
    sub r12, r13, 4
    load_32 r1, [r12]
    sub r12, r13, 28
    load_32 r2, [r12]
    add r1, r1, r2
    mov r7, r1
    mov r2, r7
    load_8 r1, [r2]
    and r1, r1, 255
    sub r12, r13, 32
    store_32 [r12], r1
    sub r12, r13, 32
    load_32 r1, [r12]
    mov r2, 0
    cmp r1, r2
    je __sym_cmp_yes_246
    mov r1, 0
    jmp __sym_cmp_done_247
__sym_cmp_yes_246:
    mov r1, 1
__sym_cmp_done_247:
    and r1, r1, 1
    mov r7, r1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_248
    sub r12, r13, 32
    load_32 r1, [r12]
    sub r12, r13, 16
    store_32 [r12], r1
    sub r12, r13, 28
    load_32 r1, [r12]
    sub r12, r13, 24
    store_32 [r12], r1
    sub r12, r13, 16
    load_32 r1, [r12]
    and r1, r1, 255
    sub r12, r13, 12
    store_32 [r12], r1
    sub r12, r13, 24
    load_32 r1, [r12]
    sub r12, r13, 20
    store_32 [r12], r1
    jmp __sym_block_53
__sym_edge_true_248:
    sub r12, r13, 28
    load_32 r1, [r12]
    sub r12, r13, 40
    store_32 [r12], r1
    sub r12, r13, 40
    load_32 r1, [r12]
    sub r12, r13, 36
    store_32 [r12], r1
    jmp __sym_block_54
__sym_block_54:
    sub r12, r13, 36
    load_32 r1, [r12]
    mov sp, r13
    pop r13
    ret

; function tty_poll, frame 96 bytes
__sym_fn_tty_poll_55:
    push r13
    mov r13, sp
    sub sp, sp, 96
__sym_block_56:
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 4036
    load_8 r1, [r2]
    and r1, r1, 1
    mov r7, r1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_249
    jmp __sym_block_57
__sym_edge_true_249:
    jmp __sym_block_58
__sym_block_57:
    call __sym_fn_tty_init_9
    jmp __sym_block_58
__sym_block_58:
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 4040
    load_32 r1, [r2]
    sub r12, r13, 4
    store_32 [r12], r1
    sub r12, r13, 4
    load_32 r1, [r12]
    mov r2, 0
    cmp r1, r2
    je __sym_cmp_yes_250
    mov r1, 0
    jmp __sym_cmp_done_251
__sym_cmp_yes_250:
    mov r1, 1
__sym_cmp_done_251:
    and r1, r1, 1
    mov r7, r1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_252
    jmp __sym_block_59
__sym_edge_true_252:
    jmp __sym_block_60
__sym_block_59:
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 4044
    load_32 r1, [r2]
    mov r7, r1
    sub r12, r13, 4
    load_32 r1, [r12]
    mov r2, r7
    sub r1, r1, r2
    sub r12, r13, 8
    store_32 [r12], r1
    sub r12, r13, 8
    load_32 r1, [r12]
    sub r12, r13, 96
    store_32 [r12], r1
    sub r12, r13, 96
    load_32 r1, [r12]
    sub r12, r13, 92
    store_32 [r12], r1
    jmp __sym_block_81
__sym_block_60:
    keyboard r1
    sub r12, r13, 12
    store_32 [r12], r1
    sub r12, r13, 12
    load_32 r1, [r12]
    mov r2, 255
    and r1, r1, r2
    sub r12, r13, 16
    store_32 [r12], r1
    sub r12, r13, 16
    load_32 r1, [r12]
    mov r2, 16
    cmp r1, r2
    je __sym_cmp_yes_253
    mov r1, 0
    jmp __sym_cmp_done_254
__sym_cmp_yes_253:
    mov r1, 1
__sym_cmp_done_254:
    and r1, r1, 1
    mov r7, r1
    sub r12, r13, 12
    load_32 r1, [r12]
    mov r2, 256
    and r1, r1, r2
    sub r12, r13, 20
    store_32 [r12], r1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_255
    jmp __sym_block_62
__sym_edge_true_255:
    jmp __sym_block_61
__sym_block_61:
    sub r12, r13, 20
    load_32 r1, [r12]
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 4048
    store_32 [r2], r1
    mov r1, 0
    sub r12, r13, 96
    store_32 [r12], r1
    sub r12, r13, 96
    load_32 r1, [r12]
    sub r12, r13, 92
    store_32 [r12], r1
    jmp __sym_block_81
__sym_block_62:
    sub r12, r13, 20
    load_32 r1, [r12]
    mov r2, 0
    cmp r1, r2
    je __sym_cmp_yes_256
    mov r1, 0
    jmp __sym_cmp_done_257
__sym_cmp_yes_256:
    mov r1, 1
__sym_cmp_done_257:
    and r1, r1, 1
    mov r7, r1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_258
    jmp __sym_block_63
__sym_edge_true_258:
    mov r1, 0
    sub r12, r13, 96
    store_32 [r12], r1
    sub r12, r13, 96
    load_32 r1, [r12]
    sub r12, r13, 92
    store_32 [r12], r1
    jmp __sym_block_81
__sym_block_63:
    sub r12, r13, 12
    load_32 r1, [r12]
    and r1, r1, 255
    mov r7, r1
    mov r1, r7
    mov r2, 13
    cmp r1, r2
    je __sym_switch_259
    mov r2, 10
    cmp r1, r2
    je __sym_switch_260
    mov r2, 9
    cmp r1, r2
    je __sym_switch_261
    jmp __sym_block_70
__sym_switch_259:
    jmp __sym_block_64
__sym_switch_260:
    jmp __sym_block_69
__sym_switch_261:
    jmp __sym_block_71
__sym_block_64:
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 4032
    load_32 r1, [r2]
    sub r12, r13, 24
    store_32 [r12], r1
    sub r12, r13, 24
    load_32 r1, [r12]
    mov r2, 0
    cmp r1, r2
    je __sym_cmp_yes_262
    mov r1, 0
    jmp __sym_cmp_done_263
__sym_cmp_yes_262:
    mov r1, 1
__sym_cmp_done_263:
    and r1, r1, 1
    mov r7, r1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_264
    jmp __sym_block_65
__sym_edge_true_264:
    jmp __sym_block_80
__sym_block_65:
    sub r12, r13, 24
    load_32 r1, [r12]
    mov r2, 65535
    lsl r2, r2, 16
    or r2, r2, 65535
    add r1, r1, r2
    sub r12, r13, 28
    store_32 [r12], r1
    sub r12, r13, 28
    load_32 r1, [r12]
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 4032
    store_32 [r2], r1
    mov r1, 1
    lsl r1, r1, 16
    or r1, r1, 4052
    sub r12, r13, 28
    load_32 r2, [r12]
    add r1, r1, r2
    mov r7, r1
    mov r2, r7
    load_8 r1, [r2]
    and r1, r1, 255
    mov r8, r1
    mov r1, r8
    sub r12, r13, 32
    store_32 [r12], r1
    mov r1, r8
    mov r2, 0
    cmp r1, r2
    je __sym_cmp_yes_265
    mov r1, 0
    jmp __sym_cmp_done_266
__sym_cmp_yes_265:
    mov r1, 1
__sym_cmp_done_266:
    and r1, r1, 1
    mov r7, r1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_267
    mov r1, 0
    sub r12, r13, 44
    store_32 [r12], r1
    sub r12, r13, 44
    load_32 r1, [r12]
    sub r12, r13, 40
    store_32 [r12], r1
    jmp __sym_block_67
__sym_edge_true_267:
    jmp __sym_block_66
__sym_block_66:
    mov r1, 1
    lsl r1, r1, 16
    or r1, r1, 4308
    sub r12, r13, 28
    load_32 r2, [r12]
    add r1, r1, r2
    mov r7, r1
    mov r2, r7
    load_8 r1, [r2]
    and r1, r1, 255
    mov r8, r1
    mov r1, r8
    mov r2, 0
    cmp r1, r2
    jne __sym_cmp_yes_268
    mov r1, 0
    jmp __sym_cmp_done_269
__sym_cmp_yes_268:
    mov r1, 1
__sym_cmp_done_269:
    and r1, r1, 1
    mov r7, r1
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 4024
    load_32 r1, [r2]
    sub r12, r13, 36
    store_32 [r12], r1
    sub r12, r13, 36
    load_32 r1, [r12]
    mov r2, 0
    cmp r1, r2
    jne __sym_cmp_yes_270
    mov r1, 0
    jmp __sym_cmp_done_271
__sym_cmp_yes_270:
    mov r1, 1
__sym_cmp_done_271:
    and r1, r1, 1
    mov r8, r1
    mov r1, r7
    cmp r1, 0
    jne __sym_select_yes_272
    mov r1, 0
    jmp __sym_select_done_273
__sym_select_yes_272:
    mov r1, r8
__sym_select_done_273:
    and r1, r1, 1
    mov r9, r1
    mov r1, r9
    cmp r1, 0
    jne __sym_edge_true_274
    jmp __sym_block_80
__sym_edge_true_274:
    jmp __sym_block_68
__sym_block_67:
    call __sym_fn_erase_cell_36
    sub r12, r13, 40
    load_32 r1, [r12]
    mov r2, 1
    add r1, r1, r2
    sub r12, r13, 48
    store_32 [r12], r1
    sub r12, r13, 48
    load_32 r1, [r12]
    sub r12, r13, 32
    load_32 r2, [r12]
    cmp r1, r2
    je __sym_cmp_yes_275
    mov r1, 0
    jmp __sym_cmp_done_276
__sym_cmp_yes_275:
    mov r1, 1
__sym_cmp_done_276:
    and r1, r1, 1
    mov r7, r1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_277
    sub r12, r13, 48
    load_32 r1, [r12]
    sub r12, r13, 44
    store_32 [r12], r1
    sub r12, r13, 44
    load_32 r1, [r12]
    sub r12, r13, 40
    store_32 [r12], r1
    jmp __sym_block_67
__sym_edge_true_277:
    jmp __sym_block_66
__sym_block_68:
    sub r12, r13, 36
    load_32 r1, [r12]
    mov r2, 65535
    lsl r2, r2, 16
    or r2, r2, 65535
    add r1, r1, r2
    mov r7, r1
    mov r1, r7
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 4024
    store_32 [r2], r1
    mov r1, 1
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 4028
    store_8 [r2], r1
    jmp __sym_block_80
__sym_block_69:
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 4032
    load_32 r1, [r2]
    mov r7, r1
    mov r1, 1
    lsl r1, r1, 16
    or r1, r1, 4564
    mov r2, r7
    add r1, r1, r2
    mov r8, r1
    mov r1, 10
    mov r2, r8
    store_8 [r2], r1
    mov r1, r7
    mov r2, 1
    add r1, r1, r2
    mov r8, r1
    mov r1, r8
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 4040
    store_32 [r2], r1
    mov r1, 0
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 4044
    store_32 [r2], r1
    mov r1, 0
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 4032
    store_32 [r2], r1
    mov r1, 10
    call __sym_fn_render_18
    jmp __sym_block_80
__sym_block_70:
    sub r12, r13, 16
    load_32 r1, [r12]
    mov r2, 65535
    lsl r2, r2, 16
    or r2, r2, 65504
    add r1, r1, r2
    mov r7, r1
    mov r1, r7
    mov r2, 95
    cmp r1, r2
    jb __sym_cmp_yes_278
    mov r1, 0
    jmp __sym_cmp_done_279
__sym_cmp_yes_278:
    mov r1, 1
__sym_cmp_done_279:
    and r1, r1, 1
    mov r8, r1
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 4032
    load_32 r1, [r2]
    mov r7, r1
    mov r1, r7
    mov r2, 255
    cmp r1, r2
    jb __sym_cmp_yes_280
    mov r1, 0
    jmp __sym_cmp_done_281
__sym_cmp_yes_280:
    mov r1, 1
__sym_cmp_done_281:
    and r1, r1, 1
    mov r9, r1
    mov r1, r8
    cmp r1, 0
    jne __sym_select_yes_282
    mov r1, 0
    jmp __sym_select_done_283
__sym_select_yes_282:
    mov r1, r9
__sym_select_done_283:
    and r1, r1, 1
    mov r7, r1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_284
    jmp __sym_block_80
__sym_edge_true_284:
    jmp __sym_block_72
__sym_block_71:
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 4032
    load_32 r1, [r2]
    mov r7, r1
    mov r1, r7
    mov r2, 255
    cmp r1, r2
    jb __sym_cmp_yes_285
    mov r1, 0
    jmp __sym_cmp_done_286
__sym_cmp_yes_285:
    mov r1, 1
__sym_cmp_done_286:
    and r1, r1, 1
    mov r8, r1
    mov r1, r8
    cmp r1, 0
    jne __sym_edge_true_287
    jmp __sym_block_80
__sym_edge_true_287:
    jmp __sym_block_72
__sym_block_72:
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 4048
    load_32 r1, [r2]
    mov r7, r1
    mov r1, r7
    mov r2, 0
    cmp r1, r2
    je __sym_cmp_yes_288
    mov r1, 0
    jmp __sym_cmp_done_289
__sym_cmp_yes_288:
    mov r1, 1
__sym_cmp_done_289:
    and r1, r1, 1
    mov r8, r1
    mov r1, r8
    cmp r1, 0
    jne __sym_edge_true_290
    jmp __sym_block_73
__sym_edge_true_290:
    sub r12, r13, 16
    load_32 r1, [r12]
    sub r12, r13, 80
    store_32 [r12], r1
    sub r12, r13, 80
    load_32 r1, [r12]
    sub r12, r13, 76
    store_32 [r12], r1
    jmp __sym_block_79
__sym_block_73:
    sub r12, r13, 16
    load_32 r1, [r12]
    mov r2, 65535
    lsl r2, r2, 16
    or r2, r2, 65439
    add r1, r1, r2
    mov r7, r1
    mov r1, r7
    mov r2, 26
    cmp r1, r2
    jb __sym_cmp_yes_291
    mov r1, 0
    jmp __sym_cmp_done_292
__sym_cmp_yes_291:
    mov r1, 1
__sym_cmp_done_292:
    and r1, r1, 1
    mov r8, r1
    mov r1, r8
    cmp r1, 0
    jne __sym_edge_true_293
    jmp __sym_block_74
__sym_edge_true_293:
    jmp __sym_block_75
__sym_block_74:
    sub r12, r13, 12
    load_32 r1, [r12]
    and r1, r1, 255
    sub r12, r13, 52
    store_32 [r12], r1
    mov r1, 0
    sub r12, r13, 64
    store_32 [r12], r1
    sub r12, r13, 64
    load_32 r1, [r12]
    sub r12, r13, 60
    store_32 [r12], r1
    jmp __sym_block_76
__sym_block_75:
    sub r12, r13, 16
    load_32 r1, [r12]
    mov r2, 65535
    lsl r2, r2, 16
    or r2, r2, 65504
    add r1, r1, r2
    sub r12, r13, 56
    store_32 [r12], r1
    sub r12, r13, 56
    load_32 r1, [r12]
    sub r12, r13, 80
    store_32 [r12], r1
    sub r12, r13, 80
    load_32 r1, [r12]
    sub r12, r13, 76
    store_32 [r12], r1
    jmp __sym_block_79
__sym_block_76:
    mov r1, 1
    lsl r1, r1, 16
    or r1, r1, 4820
    sub r12, r13, 60
    load_32 r2, [r12]
    add r1, r1, r2
    mov r7, r1
    mov r2, r7
    load_8 r1, [r2]
    and r1, r1, 255
    mov r8, r1
    mov r1, r8
    sub r12, r13, 52
    load_32 r2, [r12]
    cmp r1, r2
    je __sym_cmp_yes_294
    mov r1, 0
    jmp __sym_cmp_done_295
__sym_cmp_yes_294:
    mov r1, 1
__sym_cmp_done_295:
    and r1, r1, 1
    mov r7, r1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_296
    jmp __sym_block_78
__sym_edge_true_296:
    jmp __sym_block_77
__sym_block_77:
    mov r1, 1
    lsl r1, r1, 16
    or r1, r1, 4842
    sub r12, r13, 60
    load_32 r2, [r12]
    add r1, r1, r2
    mov r7, r1
    mov r2, r7
    load_8 r1, [r2]
    and r1, r1, 255
    mov r8, r1
    mov r1, r8
    sub r12, r13, 68
    store_32 [r12], r1
    sub r12, r13, 68
    load_32 r1, [r12]
    sub r12, r13, 80
    store_32 [r12], r1
    sub r12, r13, 80
    load_32 r1, [r12]
    sub r12, r13, 76
    store_32 [r12], r1
    jmp __sym_block_79
__sym_block_78:
    sub r12, r13, 60
    load_32 r1, [r12]
    mov r2, 1
    add r1, r1, r2
    sub r12, r13, 72
    store_32 [r12], r1
    sub r12, r13, 72
    load_32 r1, [r12]
    mov r2, 21
    cmp r1, r2
    je __sym_cmp_yes_297
    mov r1, 0
    jmp __sym_cmp_done_298
__sym_cmp_yes_297:
    mov r1, 1
__sym_cmp_done_298:
    and r1, r1, 1
    mov r7, r1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_299
    sub r12, r13, 72
    load_32 r1, [r12]
    sub r12, r13, 64
    store_32 [r12], r1
    sub r12, r13, 64
    load_32 r1, [r12]
    sub r12, r13, 60
    store_32 [r12], r1
    jmp __sym_block_76
__sym_edge_true_299:
    sub r12, r13, 16
    load_32 r1, [r12]
    sub r12, r13, 80
    store_32 [r12], r1
    sub r12, r13, 80
    load_32 r1, [r12]
    sub r12, r13, 76
    store_32 [r12], r1
    jmp __sym_block_79
__sym_block_79:
    sub r12, r13, 76
    load_32 r1, [r12]
    and r1, r1, 255
    mov r7, r1
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 4032
    load_32 r1, [r2]
    sub r12, r13, 84
    store_32 [r12], r1
    mov r1, 1
    lsl r1, r1, 16
    or r1, r1, 4564
    sub r12, r13, 84
    load_32 r2, [r12]
    add r1, r1, r2
    mov r8, r1
    mov r1, r7
    mov r2, r8
    store_8 [r2], r1
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 4028
    load_8 r1, [r2]
    and r1, r1, 1
    mov r7, r1
    mov r1, r7
    and r1, r1, 255
    mov r8, r1
    mov r1, 1
    lsl r1, r1, 16
    or r1, r1, 4308
    sub r12, r13, 84
    load_32 r2, [r12]
    add r1, r1, r2
    mov r7, r1
    mov r1, r8
    mov r2, r7
    store_8 [r2], r1
    sub r12, r13, 76
    load_32 r1, [r12]
    call __sym_fn_render_18
    mov r7, r1
    mov r1, r7
    and r1, r1, 255
    mov r8, r1
    mov r1, 1
    lsl r1, r1, 16
    or r1, r1, 4052
    sub r12, r13, 84
    load_32 r2, [r12]
    add r1, r1, r2
    mov r7, r1
    mov r1, r8
    mov r2, r7
    store_8 [r2], r1
    sub r12, r13, 84
    load_32 r1, [r12]
    mov r2, 1
    add r1, r1, r2
    mov r7, r1
    mov r1, r7
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 4032
    store_32 [r2], r1
    jmp __sym_block_80
__sym_block_80:
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 4040
    load_32 r1, [r2]
    mov r7, r1
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 4044
    load_32 r1, [r2]
    mov r8, r1
    mov r1, r7
    mov r2, r8
    sub r1, r1, r2
    sub r12, r13, 88
    store_32 [r12], r1
    sub r12, r13, 88
    load_32 r1, [r12]
    sub r12, r13, 96
    store_32 [r12], r1
    sub r12, r13, 96
    load_32 r1, [r12]
    sub r12, r13, 92
    store_32 [r12], r1
    jmp __sym_block_81
__sym_block_81:
    sub r12, r13, 92
    load_32 r1, [r12]
    mov sp, r13
    pop r13
    ret

; function tty_read, frame 56 bytes
__sym_fn_tty_read_82:
    push r13
    mov r13, sp
    sub sp, sp, 56
    sub r12, r13, 4
    store_32 [r12], r1
    sub r12, r13, 8
    store_32 [r12], r2
__sym_block_83:
    sub r12, r13, 4
    load_32 r1, [r12]
    mov r2, 0
    cmp r1, r2
    jne __sym_cmp_yes_300
    mov r1, 0
    jmp __sym_cmp_done_301
__sym_cmp_yes_300:
    mov r1, 1
__sym_cmp_done_301:
    and r1, r1, 1
    mov r7, r1
    sub r12, r13, 8
    load_32 r1, [r12]
    mov r2, 0
    cmp r1, r2
    jne __sym_cmp_yes_302
    mov r1, 0
    jmp __sym_cmp_done_303
__sym_cmp_yes_302:
    mov r1, 1
__sym_cmp_done_303:
    and r1, r1, 1
    mov r8, r1
    mov r1, r7
    mov r2, r8
    and r1, r1, r2
    and r1, r1, 1
    mov r9, r1
    mov r1, r9
    cmp r1, 0
    jne __sym_edge_true_304
    mov r1, 0
    sub r12, r13, 52
    store_32 [r12], r1
    sub r12, r13, 52
    load_32 r1, [r12]
    sub r12, r13, 48
    store_32 [r12], r1
    jmp __sym_block_90
__sym_edge_true_304:
    jmp __sym_block_84
__sym_block_84:
    call __sym_fn_tty_poll_55
    mov r7, r1
    mov r1, r7
    mov r2, 0
    cmp r1, r2
    je __sym_cmp_yes_305
    mov r1, 0
    jmp __sym_cmp_done_306
__sym_cmp_yes_305:
    mov r1, 1
__sym_cmp_done_306:
    and r1, r1, 1
    mov r8, r1
    mov r1, r8
    cmp r1, 0
    jne __sym_edge_true_307
    jmp __sym_block_85
__sym_edge_true_307:
    jmp __sym_block_84
__sym_block_85:
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 4040
    load_32 r1, [r2]
    sub r12, r13, 12
    store_32 [r12], r1
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 4044
    load_32 r1, [r2]
    sub r12, r13, 16
    store_32 [r12], r1
    sub r12, r13, 12
    load_32 r1, [r12]
    sub r12, r13, 16
    load_32 r2, [r12]
    sub r1, r1, r2
    mov r7, r1
    sub r12, r13, 8
    load_32 r1, [r12]
    mov r2, r7
    cmp r1, r2
    jbe __sym_minmax_308
    mov r1, r2
__sym_minmax_308:
    sub r12, r13, 20
    store_32 [r12], r1
    sub r12, r13, 12
    load_32 r1, [r12]
    sub r12, r13, 16
    load_32 r2, [r12]
    cmp r1, r2
    je __sym_cmp_yes_309
    mov r1, 0
    jmp __sym_cmp_done_310
__sym_cmp_yes_309:
    mov r1, 1
__sym_cmp_done_310:
    and r1, r1, 1
    mov r7, r1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_311
    mov r1, 0
    sub r12, r13, 28
    store_32 [r12], r1
    sub r12, r13, 16
    load_32 r1, [r12]
    sub r12, r13, 36
    store_32 [r12], r1
    sub r12, r13, 28
    load_32 r1, [r12]
    sub r12, r13, 24
    store_32 [r12], r1
    sub r12, r13, 36
    load_32 r1, [r12]
    sub r12, r13, 32
    store_32 [r12], r1
    jmp __sym_block_88
__sym_edge_true_311:
    jmp __sym_block_87
__sym_block_86:
    sub r12, r13, 40
    load_32 r1, [r12]
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 4044
    store_32 [r2], r1
    jmp __sym_block_87
__sym_block_87:
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 4044
    load_32 r1, [r2]
    mov r7, r1
    mov r1, r7
    sub r12, r13, 12
    load_32 r2, [r12]
    cmp r1, r2
    je __sym_cmp_yes_312
    mov r1, 0
    jmp __sym_cmp_done_313
__sym_cmp_yes_312:
    mov r1, 1
__sym_cmp_done_313:
    and r1, r1, 1
    mov r8, r1
    mov r1, r8
    cmp r1, 0
    jne __sym_edge_true_314
    sub r12, r13, 20
    load_32 r1, [r12]
    sub r12, r13, 52
    store_32 [r12], r1
    sub r12, r13, 52
    load_32 r1, [r12]
    sub r12, r13, 48
    store_32 [r12], r1
    jmp __sym_block_90
__sym_edge_true_314:
    jmp __sym_block_89
__sym_block_88:
    sub r12, r13, 32
    load_32 r1, [r12]
    mov r2, 1
    add r1, r1, r2
    sub r12, r13, 40
    store_32 [r12], r1
    mov r1, 1
    lsl r1, r1, 16
    or r1, r1, 4564
    sub r12, r13, 32
    load_32 r2, [r12]
    add r1, r1, r2
    mov r7, r1
    mov r2, r7
    load_8 r1, [r2]
    and r1, r1, 255
    mov r8, r1
    sub r12, r13, 4
    load_32 r1, [r12]
    sub r12, r13, 24
    load_32 r2, [r12]
    add r1, r1, r2
    mov r7, r1
    mov r1, r8
    mov r2, r7
    store_8 [r2], r1
    sub r12, r13, 24
    load_32 r1, [r12]
    mov r2, 1
    add r1, r1, r2
    sub r12, r13, 44
    store_32 [r12], r1
    sub r12, r13, 44
    load_32 r1, [r12]
    sub r12, r13, 20
    load_32 r2, [r12]
    cmp r1, r2
    je __sym_cmp_yes_315
    mov r1, 0
    jmp __sym_cmp_done_316
__sym_cmp_yes_315:
    mov r1, 1
__sym_cmp_done_316:
    and r1, r1, 1
    mov r7, r1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_317
    sub r12, r13, 44
    load_32 r1, [r12]
    sub r12, r13, 28
    store_32 [r12], r1
    sub r12, r13, 40
    load_32 r1, [r12]
    sub r12, r13, 36
    store_32 [r12], r1
    sub r12, r13, 28
    load_32 r1, [r12]
    sub r12, r13, 24
    store_32 [r12], r1
    sub r12, r13, 36
    load_32 r1, [r12]
    sub r12, r13, 32
    store_32 [r12], r1
    jmp __sym_block_88
__sym_edge_true_317:
    jmp __sym_block_86
__sym_block_89:
    mov r1, 0
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 4044
    store_32 [r2], r1
    mov r1, 0
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 4040
    store_32 [r2], r1
    sub r12, r13, 20
    load_32 r1, [r12]
    sub r12, r13, 52
    store_32 [r12], r1
    sub r12, r13, 52
    load_32 r1, [r12]
    sub r12, r13, 48
    store_32 [r12], r1
    jmp __sym_block_90
__sym_block_90:
    sub r12, r13, 48
    load_32 r1, [r12]
    mov sp, r13
    pop r13
    ret

; function tty_readline, frame 56 bytes
__sym_fn_tty_readline_91:
    push r13
    mov r13, sp
    sub sp, sp, 56
    sub r12, r13, 4
    store_32 [r12], r1
    sub r12, r13, 8
    store_32 [r12], r2
__sym_block_92:
    sub r1, r13, 13
    sub r12, r13, 12
    store_32 [r12], r1
    sub r12, r13, 4
    load_32 r1, [r12]
    mov r2, 0
    cmp r1, r2
    jne __sym_cmp_yes_318
    mov r1, 0
    jmp __sym_cmp_done_319
__sym_cmp_yes_318:
    mov r1, 1
__sym_cmp_done_319:
    and r1, r1, 1
    mov r7, r1
    sub r12, r13, 8
    load_32 r1, [r12]
    mov r2, 0
    cmp r1, r2
    jne __sym_cmp_yes_320
    mov r1, 0
    jmp __sym_cmp_done_321
__sym_cmp_yes_320:
    mov r1, 1
__sym_cmp_done_321:
    and r1, r1, 1
    mov r8, r1
    mov r1, r7
    mov r2, r8
    and r1, r1, r2
    and r1, r1, 1
    mov r9, r1
    mov r1, r9
    cmp r1, 0
    jne __sym_edge_true_322
    mov r1, 0
    sub r12, r13, 56
    store_32 [r12], r1
    sub r12, r13, 56
    load_32 r1, [r12]
    sub r12, r13, 52
    store_32 [r12], r1
    jmp __sym_block_100
__sym_edge_true_322:
    jmp __sym_block_93
__sym_block_93:
    sub r12, r13, 8
    load_32 r1, [r12]
    mov r2, 65535
    lsl r2, r2, 16
    or r2, r2, 65535
    add r1, r1, r2
    sub r12, r13, 20
    store_32 [r12], r1
    mov r1, 0
    sub r12, r13, 28
    store_32 [r12], r1
    sub r12, r13, 28
    load_32 r1, [r12]
    sub r12, r13, 24
    store_32 [r12], r1
    jmp __sym_block_94
__sym_block_94:
    sub r12, r13, 12
    load_32 r1, [r12]
    mov r2, 1
    call __sym_fn_tty_read_82
    sub r12, r13, 12
    load_32 r2, [r12]
    load_8 r1, [r2]
    and r1, r1, 255
    sub r12, r13, 32
    store_32 [r12], r1
    sub r12, r13, 32
    load_32 r1, [r12]
    mov r2, 10
    cmp r1, r2
    je __sym_cmp_yes_323
    mov r1, 0
    jmp __sym_cmp_done_324
__sym_cmp_yes_323:
    mov r1, 1
__sym_cmp_done_324:
    and r1, r1, 1
    sub r12, r13, 36
    store_32 [r12], r1
    sub r12, r13, 36
    load_32 r1, [r12]
    cmp r1, 0
    jne __sym_edge_true_325
    jmp __sym_block_95
__sym_edge_true_325:
    sub r12, r13, 24
    load_32 r1, [r12]
    sub r12, r13, 48
    store_32 [r12], r1
    sub r12, r13, 48
    load_32 r1, [r12]
    sub r12, r13, 44
    store_32 [r12], r1
    jmp __sym_block_98
__sym_block_95:
    sub r12, r13, 24
    load_32 r1, [r12]
    sub r12, r13, 20
    load_32 r2, [r12]
    cmp r1, r2
    jb __sym_cmp_yes_326
    mov r1, 0
    jmp __sym_cmp_done_327
__sym_cmp_yes_326:
    mov r1, 1
__sym_cmp_done_327:
    and r1, r1, 1
    mov r7, r1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_328
    jmp __sym_block_97
__sym_edge_true_328:
    jmp __sym_block_96
__sym_block_96:
    sub r12, r13, 4
    load_32 r1, [r12]
    sub r12, r13, 24
    load_32 r2, [r12]
    add r1, r1, r2
    mov r7, r1
    sub r12, r13, 32
    load_32 r1, [r12]
    mov r2, r7
    store_8 [r2], r1
    jmp __sym_block_97
__sym_block_97:
    sub r12, r13, 24
    load_32 r1, [r12]
    mov r2, 1
    add r1, r1, r2
    sub r12, r13, 40
    store_32 [r12], r1
    sub r12, r13, 40
    load_32 r1, [r12]
    sub r12, r13, 48
    store_32 [r12], r1
    sub r12, r13, 48
    load_32 r1, [r12]
    sub r12, r13, 44
    store_32 [r12], r1
    jmp __sym_block_98
__sym_block_98:
    sub r12, r13, 36
    load_32 r1, [r12]
    cmp r1, 0
    jne __sym_edge_true_329
    sub r12, r13, 44
    load_32 r1, [r12]
    sub r12, r13, 28
    store_32 [r12], r1
    sub r12, r13, 28
    load_32 r1, [r12]
    sub r12, r13, 24
    store_32 [r12], r1
    jmp __sym_block_94
__sym_edge_true_329:
    jmp __sym_block_99
__sym_block_99:
    sub r12, r13, 8
    load_32 r1, [r12]
    mov r2, 65535
    lsl r2, r2, 16
    or r2, r2, 65535
    add r1, r1, r2
    mov r7, r1
    sub r12, r13, 44
    load_32 r1, [r12]
    mov r2, r7
    cmp r1, r2
    jbe __sym_minmax_330
    mov r1, r2
__sym_minmax_330:
    mov r8, r1
    sub r12, r13, 4
    load_32 r1, [r12]
    mov r2, r8
    add r1, r1, r2
    mov r7, r1
    mov r1, 0
    mov r2, r7
    store_8 [r2], r1
    sub r12, r13, 44
    load_32 r1, [r12]
    sub r12, r13, 56
    store_32 [r12], r1
    sub r12, r13, 56
    load_32 r1, [r12]
    sub r12, r13, 52
    store_32 [r12], r1
    jmp __sym_block_100
__sym_block_100:
    sub r12, r13, 52
    load_32 r1, [r12]
    mov sp, r13
    pop r13
    ret

; function strcmp, frame 88 bytes
__sym_fn_strcmp_101:
    push r13
    mov r13, sp
    sub sp, sp, 88
    sub r12, r13, 4
    store_32 [r12], r1
    sub r12, r13, 8
    store_32 [r12], r2
__sym_block_102:
    sub r12, r13, 4
    load_32 r2, [r12]
    load_8 r1, [r2]
    and r1, r1, 255
    sub r12, r13, 12
    store_32 [r12], r1
    sub r12, r13, 12
    load_32 r1, [r12]
    mov r2, 0
    cmp r1, r2
    je __sym_cmp_yes_331
    mov r1, 0
    jmp __sym_cmp_done_332
__sym_cmp_yes_331:
    mov r1, 1
__sym_cmp_done_332:
    and r1, r1, 1
    mov r7, r1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_333
    sub r12, r13, 12
    load_32 r1, [r12]
    sub r12, r13, 20
    store_32 [r12], r1
    sub r12, r13, 8
    load_32 r1, [r12]
    sub r12, r13, 28
    store_32 [r12], r1
    sub r12, r13, 4
    load_32 r1, [r12]
    sub r12, r13, 36
    store_32 [r12], r1
    sub r12, r13, 20
    load_32 r1, [r12]
    and r1, r1, 255
    sub r12, r13, 16
    store_32 [r12], r1
    sub r12, r13, 28
    load_32 r1, [r12]
    sub r12, r13, 24
    store_32 [r12], r1
    sub r12, r13, 36
    load_32 r1, [r12]
    sub r12, r13, 32
    store_32 [r12], r1
    jmp __sym_block_103
__sym_edge_true_333:
    sub r12, r13, 8
    load_32 r1, [r12]
    sub r12, r13, 76
    store_32 [r12], r1
    mov r1, 0
    sub r12, r13, 84
    store_32 [r12], r1
    sub r12, r13, 76
    load_32 r1, [r12]
    sub r12, r13, 72
    store_32 [r12], r1
    sub r12, r13, 84
    load_32 r1, [r12]
    sub r12, r13, 80
    store_32 [r12], r1
    jmp __sym_block_106
__sym_block_103:
    sub r12, r13, 24
    load_32 r2, [r12]
    load_8 r1, [r2]
    and r1, r1, 255
    mov r7, r1
    sub r12, r13, 16
    load_32 r1, [r12]
    mov r2, r7
    cmp r1, r2
    je __sym_cmp_yes_334
    mov r1, 0
    jmp __sym_cmp_done_335
__sym_cmp_yes_334:
    mov r1, 1
__sym_cmp_done_335:
    and r1, r1, 1
    mov r8, r1
    mov r1, r8
    cmp r1, 0
    jne __sym_edge_true_336
    sub r12, r13, 24
    load_32 r1, [r12]
    sub r12, r13, 56
    store_32 [r12], r1
    sub r12, r13, 16
    load_32 r1, [r12]
    sub r12, r13, 64
    store_32 [r12], r1
    sub r12, r13, 56
    load_32 r1, [r12]
    sub r12, r13, 52
    store_32 [r12], r1
    sub r12, r13, 64
    load_32 r1, [r12]
    and r1, r1, 255
    sub r12, r13, 60
    store_32 [r12], r1
    jmp __sym_block_105
__sym_edge_true_336:
    jmp __sym_block_104
__sym_block_104:
    sub r12, r13, 32
    load_32 r1, [r12]
    mov r2, 1
    add r1, r1, r2
    sub r12, r13, 40
    store_32 [r12], r1
    sub r12, r13, 24
    load_32 r1, [r12]
    mov r2, 1
    add r1, r1, r2
    sub r12, r13, 44
    store_32 [r12], r1
    sub r12, r13, 40
    load_32 r2, [r12]
    load_8 r1, [r2]
    and r1, r1, 255
    sub r12, r13, 48
    store_32 [r12], r1
    sub r12, r13, 48
    load_32 r1, [r12]
    mov r2, 0
    cmp r1, r2
    je __sym_cmp_yes_337
    mov r1, 0
    jmp __sym_cmp_done_338
__sym_cmp_yes_337:
    mov r1, 1
__sym_cmp_done_338:
    and r1, r1, 1
    mov r7, r1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_339
    sub r12, r13, 48
    load_32 r1, [r12]
    sub r12, r13, 20
    store_32 [r12], r1
    sub r12, r13, 44
    load_32 r1, [r12]
    sub r12, r13, 28
    store_32 [r12], r1
    sub r12, r13, 40
    load_32 r1, [r12]
    sub r12, r13, 36
    store_32 [r12], r1
    sub r12, r13, 20
    load_32 r1, [r12]
    and r1, r1, 255
    sub r12, r13, 16
    store_32 [r12], r1
    sub r12, r13, 28
    load_32 r1, [r12]
    sub r12, r13, 24
    store_32 [r12], r1
    sub r12, r13, 36
    load_32 r1, [r12]
    sub r12, r13, 32
    store_32 [r12], r1
    jmp __sym_block_103
__sym_edge_true_339:
    sub r12, r13, 44
    load_32 r1, [r12]
    sub r12, r13, 56
    store_32 [r12], r1
    mov r1, 0
    sub r12, r13, 64
    store_32 [r12], r1
    sub r12, r13, 56
    load_32 r1, [r12]
    sub r12, r13, 52
    store_32 [r12], r1
    sub r12, r13, 64
    load_32 r1, [r12]
    and r1, r1, 255
    sub r12, r13, 60
    store_32 [r12], r1
    jmp __sym_block_105
__sym_block_105:
    sub r12, r13, 60
    load_32 r1, [r12]
    sub r12, r13, 68
    store_32 [r12], r1
    sub r12, r13, 52
    load_32 r1, [r12]
    sub r12, r13, 76
    store_32 [r12], r1
    sub r12, r13, 68
    load_32 r1, [r12]
    sub r12, r13, 84
    store_32 [r12], r1
    sub r12, r13, 76
    load_32 r1, [r12]
    sub r12, r13, 72
    store_32 [r12], r1
    sub r12, r13, 84
    load_32 r1, [r12]
    sub r12, r13, 80
    store_32 [r12], r1
    jmp __sym_block_106
__sym_block_106:
    sub r12, r13, 72
    load_32 r2, [r12]
    load_8 r1, [r2]
    and r1, r1, 255
    mov r7, r1
    mov r1, r7
    mov r8, r1
    sub r12, r13, 80
    load_32 r1, [r12]
    mov r2, r8
    sub r1, r1, r2
    mov r7, r1
    mov r1, r7
    mov sp, r13
    pop r13
    ret

; function isspace, frame 8 bytes
__sym_fn_isspace_107:
    push r13
    mov r13, sp
    sub sp, sp, 8
    sub r12, r13, 4
    store_32 [r12], r1
__sym_block_108:
    sub r12, r13, 4
    load_32 r1, [r12]
    mov r2, 32
    cmp r1, r2
    je __sym_cmp_yes_340
    mov r1, 0
    jmp __sym_cmp_done_341
__sym_cmp_yes_340:
    mov r1, 1
__sym_cmp_done_341:
    and r1, r1, 1
    mov r7, r1
    sub r12, r13, 4
    load_32 r1, [r12]
    mov r2, 65535
    lsl r2, r2, 16
    or r2, r2, 65527
    add r1, r1, r2
    mov r8, r1
    mov r1, r8
    mov r2, 5
    cmp r1, r2
    jb __sym_cmp_yes_342
    mov r1, 0
    jmp __sym_cmp_done_343
__sym_cmp_yes_342:
    mov r1, 1
__sym_cmp_done_343:
    and r1, r1, 1
    mov r9, r1
    mov r1, r7
    mov r2, r9
    or r1, r1, r2
    and r1, r1, 1
    mov r8, r1
    mov r1, r8
    mov r7, r1
    mov r1, r7
    mov sp, r13
    pop r13
    ret

; function strtol, frame 40 bytes
__sym_fn_strtol_109:
    push r13
    mov r13, sp
    sub sp, sp, 40
    sub r12, r13, 4
    store_32 [r12], r1
    sub r12, r13, 8
    store_32 [r12], r2
    sub r12, r13, 12
    store_32 [r12], r3
__sym_block_110:
    sub r1, r13, 20
    sub r12, r13, 16
    store_32 [r12], r1
    sub r1, r13, 28
    sub r12, r13, 24
    store_32 [r12], r1
    sub r12, r13, 4
    load_32 r1, [r12]
    sub r12, r13, 8
    load_32 r2, [r12]
    sub r12, r13, 12
    load_32 r3, [r12]
    mov r4, 1
    sub r12, r13, 16
    load_32 r5, [r12]
    sub r12, r13, 24
    load_32 r6, [r12]
    call __sym_fn_parse_111
    mov r7, r1
    sub r12, r13, 24
    load_32 r2, [r12]
    load_32 r1, [r2]
    mov r8, r1
    mov r1, r8
    mov r2, 0
    cmp r1, r2
    je __sym_cmp_yes_344
    mov r1, 0
    jmp __sym_cmp_done_345
__sym_cmp_yes_344:
    mov r1, 1
__sym_cmp_done_345:
    and r1, r1, 1
    mov r9, r1
    sub r12, r13, 16
    load_32 r2, [r12]
    load_32 r1, [r2]
    mov r8, r1
    mov r1, r8
    mov r2, 0
    cmp r1, r2
    je __sym_cmp_yes_346
    mov r1, 0
    jmp __sym_cmp_done_347
__sym_cmp_yes_346:
    mov r1, 1
__sym_cmp_done_347:
    and r1, r1, 1
    mov r10, r1
    mov r1, r10
    cmp r1, 0
    jne __sym_select_yes_348
    mov r1, 32768
    lsl r1, r1, 16
    jmp __sym_select_done_349
__sym_select_yes_348:
    mov r1, 32767
    lsl r1, r1, 16
    or r1, r1, 65535
__sym_select_done_349:
    mov r8, r1
    mov r1, 0
    mov r2, r7
    sub r1, r1, r2
    sub r12, r13, 32
    store_32 [r12], r1
    mov r1, r10
    cmp r1, 0
    jne __sym_select_yes_350
    sub r12, r13, 32
    load_32 r1, [r12]
    jmp __sym_select_done_351
__sym_select_yes_350:
    mov r1, r7
__sym_select_done_351:
    sub r12, r13, 36
    store_32 [r12], r1
    mov r1, r9
    cmp r1, 0
    jne __sym_select_yes_352
    mov r1, r8
    jmp __sym_select_done_353
__sym_select_yes_352:
    sub r12, r13, 36
    load_32 r1, [r12]
__sym_select_done_353:
    sub r12, r13, 40
    store_32 [r12], r1
    sub r12, r13, 40
    load_32 r1, [r12]
    mov sp, r13
    pop r13
    ret

; function parse, frame 248 bytes
__sym_fn_parse_111:
    push r13
    mov r13, sp
    sub sp, sp, 248
    sub r12, r13, 4
    store_32 [r12], r1
    sub r12, r13, 8
    store_32 [r12], r2
    sub r12, r13, 12
    store_32 [r12], r3
    sub r12, r13, 16
    store_32 [r12], r4
    sub r12, r13, 20
    store_32 [r12], r5
    sub r12, r13, 24
    store_32 [r12], r6
__sym_block_112:
    mov r1, 0
    sub r12, r13, 20
    load_32 r2, [r12]
    store_32 [r2], r1
    mov r1, 0
    sub r12, r13, 24
    load_32 r2, [r12]
    store_32 [r2], r1
    sub r12, r13, 8
    load_32 r1, [r12]
    mov r2, 0
    cmp r1, r2
    je __sym_cmp_yes_354
    mov r1, 0
    jmp __sym_cmp_done_355
__sym_cmp_yes_354:
    mov r1, 1
__sym_cmp_done_355:
    and r1, r1, 1
    sub r12, r13, 28
    store_32 [r12], r1
    sub r12, r13, 28
    load_32 r1, [r12]
    cmp r1, 0
    jne __sym_edge_true_356
    jmp __sym_block_113
__sym_edge_true_356:
    jmp __sym_block_114
__sym_block_113:
    sub r12, r13, 4
    load_32 r1, [r12]
    sub r12, r13, 8
    load_32 r2, [r12]
    store_32 [r2], r1
    jmp __sym_block_114
__sym_block_114:
    sub r12, r13, 12
    load_32 r1, [r12]
    mov r2, 0
    cmp r1, r2
    jne __sym_cmp_yes_357
    mov r1, 0
    jmp __sym_cmp_done_358
__sym_cmp_yes_357:
    mov r1, 1
__sym_cmp_done_358:
    and r1, r1, 1
    mov r7, r1
    sub r12, r13, 12
    load_32 r1, [r12]
    mov r2, 65535
    lsl r2, r2, 16
    or r2, r2, 65499
    add r1, r1, r2
    mov r8, r1
    mov r1, r8
    mov r2, 65535
    lsl r2, r2, 16
    or r2, r2, 65501
    cmp r1, r2
    jb __sym_cmp_yes_359
    mov r1, 0
    jmp __sym_cmp_done_360
__sym_cmp_yes_359:
    mov r1, 1
__sym_cmp_done_360:
    and r1, r1, 1
    mov r9, r1
    mov r1, r7
    mov r2, r9
    and r1, r1, r2
    and r1, r1, 1
    mov r8, r1
    mov r1, r8
    cmp r1, 0
    jne __sym_edge_true_361
    sub r12, r13, 4
    load_32 r1, [r12]
    sub r12, r13, 36
    store_32 [r12], r1
    sub r12, r13, 36
    load_32 r1, [r12]
    sub r12, r13, 32
    store_32 [r12], r1
    jmp __sym_block_115
__sym_edge_true_361:
    mov r1, 22
    sub r12, r13, 232
    store_32 [r12], r1
    mov r1, 0
    sub r12, r13, 240
    store_32 [r12], r1
    sub r12, r13, 232
    load_32 r1, [r12]
    sub r12, r13, 228
    store_32 [r12], r1
    sub r12, r13, 240
    load_32 r1, [r12]
    sub r12, r13, 236
    store_32 [r12], r1
    jmp __sym_block_149
__sym_block_115:
    sub r12, r13, 32
    load_32 r2, [r12]
    load_8 r1, [r2]
    and r1, r1, 255
    mov r7, r1
    mov r1, r7
    mov r8, r1
    mov r1, r8
    call __sym_fn_isspace_107
    mov r7, r1
    mov r1, r7
    mov r2, 0
    cmp r1, r2
    je __sym_cmp_yes_362
    mov r1, 0
    jmp __sym_cmp_done_363
__sym_cmp_yes_362:
    mov r1, 1
__sym_cmp_done_363:
    and r1, r1, 1
    mov r8, r1
    sub r12, r13, 32
    load_32 r1, [r12]
    mov r2, 1
    add r1, r1, r2
    sub r12, r13, 40
    store_32 [r12], r1
    mov r1, r8
    cmp r1, 0
    jne __sym_edge_true_364
    sub r12, r13, 40
    load_32 r1, [r12]
    sub r12, r13, 36
    store_32 [r12], r1
    sub r12, r13, 36
    load_32 r1, [r12]
    sub r12, r13, 32
    store_32 [r12], r1
    jmp __sym_block_115
__sym_edge_true_364:
    jmp __sym_block_116
__sym_block_116:
    sub r12, r13, 32
    load_32 r2, [r12]
    load_8 r1, [r2]
    and r1, r1, 255
    sub r12, r13, 44
    store_32 [r12], r1
    sub r12, r13, 44
    load_32 r1, [r12]
    mov r2, 45
    cmp r1, r2
    je __sym_switch_365
    mov r2, 43
    cmp r1, r2
    je __sym_switch_366
    sub r12, r13, 32
    load_32 r1, [r12]
    sub r12, r13, 56
    store_32 [r12], r1
    sub r12, r13, 56
    load_32 r1, [r12]
    sub r12, r13, 52
    store_32 [r12], r1
    jmp __sym_block_118
__sym_switch_365:
    jmp __sym_block_117
__sym_switch_366:
    jmp __sym_block_117
__sym_block_117:
    sub r12, r13, 44
    load_32 r1, [r12]
    mov r2, 45
    cmp r1, r2
    je __sym_cmp_yes_367
    mov r1, 0
    jmp __sym_cmp_done_368
__sym_cmp_yes_367:
    mov r1, 1
__sym_cmp_done_368:
    and r1, r1, 1
    mov r7, r1
    mov r1, r7
    mov r8, r1
    mov r1, r8
    sub r12, r13, 20
    load_32 r2, [r12]
    store_32 [r2], r1
    sub r12, r13, 32
    load_32 r1, [r12]
    mov r2, 1
    add r1, r1, r2
    sub r12, r13, 48
    store_32 [r12], r1
    sub r12, r13, 48
    load_32 r1, [r12]
    sub r12, r13, 56
    store_32 [r12], r1
    sub r12, r13, 56
    load_32 r1, [r12]
    sub r12, r13, 52
    store_32 [r12], r1
    jmp __sym_block_118
__sym_block_118:
    sub r12, r13, 12
    load_32 r1, [r12]
    mov r2, 47
    and r1, r1, r2
    mov r7, r1
    mov r1, r7
    mov r2, 0
    cmp r1, r2
    je __sym_cmp_yes_369
    mov r1, 0
    jmp __sym_cmp_done_370
__sym_cmp_yes_369:
    mov r1, 1
__sym_cmp_done_370:
    and r1, r1, 1
    mov r8, r1
    mov r1, r8
    cmp r1, 0
    jne __sym_edge_true_371
    sub r12, r13, 52
    load_32 r1, [r12]
    sub r12, r13, 104
    store_32 [r12], r1
    sub r12, r13, 12
    load_32 r1, [r12]
    sub r12, r13, 112
    store_32 [r12], r1
    sub r12, r13, 104
    load_32 r1, [r12]
    sub r12, r13, 100
    store_32 [r12], r1
    sub r12, r13, 112
    load_32 r1, [r12]
    sub r12, r13, 108
    store_32 [r12], r1
    jmp __sym_block_127
__sym_edge_true_371:
    jmp __sym_block_119
__sym_block_119:
    sub r12, r13, 52
    load_32 r2, [r12]
    load_8 r1, [r2]
    and r1, r1, 255
    mov r7, r1
    mov r1, r7
    mov r2, 48
    cmp r1, r2
    je __sym_cmp_yes_372
    mov r1, 0
    jmp __sym_cmp_done_373
__sym_cmp_yes_372:
    mov r1, 1
__sym_cmp_done_373:
    and r1, r1, 1
    mov r8, r1
    mov r1, r8
    cmp r1, 0
    jne __sym_edge_true_374
    sub r12, r13, 52
    load_32 r1, [r12]
    sub r12, r13, 104
    store_32 [r12], r1
    sub r12, r13, 12
    load_32 r1, [r12]
    sub r12, r13, 112
    store_32 [r12], r1
    sub r12, r13, 104
    load_32 r1, [r12]
    sub r12, r13, 100
    store_32 [r12], r1
    sub r12, r13, 112
    load_32 r1, [r12]
    sub r12, r13, 108
    store_32 [r12], r1
    jmp __sym_block_127
__sym_edge_true_374:
    jmp __sym_block_120
__sym_block_120:
    sub r12, r13, 52
    load_32 r1, [r12]
    mov r2, 1
    add r1, r1, r2
    mov r7, r1
    mov r2, r7
    load_8 r1, [r2]
    and r1, r1, 255
    mov r8, r1
    mov r1, r8
    mov r2, 120
    cmp r1, r2
    je __sym_switch_375
    mov r2, 88
    cmp r1, r2
    je __sym_switch_376
    sub r12, r13, 52
    load_32 r1, [r12]
    sub r12, r13, 104
    store_32 [r12], r1
    sub r12, r13, 12
    load_32 r1, [r12]
    sub r12, r13, 112
    store_32 [r12], r1
    sub r12, r13, 104
    load_32 r1, [r12]
    sub r12, r13, 100
    store_32 [r12], r1
    sub r12, r13, 112
    load_32 r1, [r12]
    sub r12, r13, 108
    store_32 [r12], r1
    jmp __sym_block_127
__sym_switch_375:
    jmp __sym_block_121
__sym_switch_376:
    jmp __sym_block_121
__sym_block_121:
    sub r12, r13, 52
    load_32 r1, [r12]
    mov r2, 2
    add r1, r1, r2
    sub r12, r13, 60
    store_32 [r12], r1
    sub r12, r13, 60
    load_32 r2, [r12]
    load_8 r1, [r2]
    and r1, r1, 255
    sub r12, r13, 64
    store_32 [r12], r1
    sub r12, r13, 64
    load_32 r1, [r12]
    sub r12, r13, 68
    store_32 [r12], r1
    sub r12, r13, 64
    load_32 r1, [r12]
    mov r2, 208
    add r1, r1, r2
    and r1, r1, 255
    mov r7, r1
    mov r1, r7
    mov r2, 10
    cmp r1, r2
    jb __sym_cmp_yes_377
    mov r1, 0
    jmp __sym_cmp_done_378
__sym_cmp_yes_377:
    mov r1, 1
__sym_cmp_done_378:
    and r1, r1, 1
    mov r8, r1
    mov r1, r8
    cmp r1, 0
    jne __sym_edge_true_379
    jmp __sym_block_123
__sym_edge_true_379:
    jmp __sym_block_122
__sym_block_122:
    sub r12, r13, 68
    load_32 r1, [r12]
    mov r2, 65535
    lsl r2, r2, 16
    or r2, r2, 65488
    add r1, r1, r2
    sub r12, r13, 72
    store_32 [r12], r1
    sub r12, r13, 72
    load_32 r1, [r12]
    sub r12, r13, 88
    store_32 [r12], r1
    sub r12, r13, 88
    load_32 r1, [r12]
    sub r12, r13, 84
    store_32 [r12], r1
    jmp __sym_block_126
__sym_block_123:
    sub r12, r13, 64
    load_32 r1, [r12]
    mov r2, 159
    add r1, r1, r2
    and r1, r1, 255
    mov r7, r1
    mov r1, r7
    mov r2, 26
    cmp r1, r2
    jb __sym_cmp_yes_380
    mov r1, 0
    jmp __sym_cmp_done_381
__sym_cmp_yes_380:
    mov r1, 1
__sym_cmp_done_381:
    and r1, r1, 1
    mov r8, r1
    mov r1, r8
    cmp r1, 0
    jne __sym_edge_true_382
    jmp __sym_block_125
__sym_edge_true_382:
    jmp __sym_block_124
__sym_block_124:
    sub r12, r13, 68
    load_32 r1, [r12]
    mov r2, 65535
    lsl r2, r2, 16
    or r2, r2, 65449
    add r1, r1, r2
    sub r12, r13, 76
    store_32 [r12], r1
    sub r12, r13, 76
    load_32 r1, [r12]
    sub r12, r13, 88
    store_32 [r12], r1
    sub r12, r13, 88
    load_32 r1, [r12]
    sub r12, r13, 84
    store_32 [r12], r1
    jmp __sym_block_126
__sym_block_125:
    sub r12, r13, 64
    load_32 r1, [r12]
    mov r2, 191
    add r1, r1, r2
    and r1, r1, 255
    mov r7, r1
    mov r1, r7
    mov r2, 26
    cmp r1, r2
    jb __sym_cmp_yes_383
    mov r1, 0
    jmp __sym_cmp_done_384
__sym_cmp_yes_383:
    mov r1, 1
__sym_cmp_done_384:
    and r1, r1, 1
    mov r8, r1
    sub r12, r13, 68
    load_32 r1, [r12]
    mov r2, 65535
    lsl r2, r2, 16
    or r2, r2, 65481
    add r1, r1, r2
    mov r7, r1
    mov r1, r8
    cmp r1, 0
    jne __sym_select_yes_385
    mov r1, 36
    jmp __sym_select_done_386
__sym_select_yes_385:
    mov r1, r7
__sym_select_done_386:
    sub r12, r13, 80
    store_32 [r12], r1
    sub r12, r13, 80
    load_32 r1, [r12]
    sub r12, r13, 88
    store_32 [r12], r1
    sub r12, r13, 88
    load_32 r1, [r12]
    sub r12, r13, 84
    store_32 [r12], r1
    jmp __sym_block_126
__sym_block_126:
    sub r12, r13, 84
    load_32 r1, [r12]
    mov r2, 16
    cmp r1, r2
    jb __sym_cmp_yes_387
    mov r1, 0
    jmp __sym_cmp_done_388
__sym_cmp_yes_387:
    mov r1, 1
__sym_cmp_done_388:
    and r1, r1, 1
    mov r7, r1
    mov r1, r7
    cmp r1, 0
    jne __sym_select_yes_389
    sub r12, r13, 52
    load_32 r1, [r12]
    jmp __sym_select_done_390
__sym_select_yes_389:
    sub r12, r13, 60
    load_32 r1, [r12]
__sym_select_done_390:
    sub r12, r13, 92
    store_32 [r12], r1
    mov r1, r7
    cmp r1, 0
    jne __sym_select_yes_391
    sub r12, r13, 12
    load_32 r1, [r12]
    jmp __sym_select_done_392
__sym_select_yes_391:
    mov r1, 16
__sym_select_done_392:
    sub r12, r13, 96
    store_32 [r12], r1
    sub r12, r13, 92
    load_32 r1, [r12]
    sub r12, r13, 104
    store_32 [r12], r1
    sub r12, r13, 96
    load_32 r1, [r12]
    sub r12, r13, 112
    store_32 [r12], r1
    sub r12, r13, 104
    load_32 r1, [r12]
    sub r12, r13, 100
    store_32 [r12], r1
    sub r12, r13, 112
    load_32 r1, [r12]
    sub r12, r13, 108
    store_32 [r12], r1
    jmp __sym_block_127
__sym_block_127:
    sub r12, r13, 108
    load_32 r1, [r12]
    mov r2, 0
    cmp r1, r2
    je __sym_cmp_yes_393
    mov r1, 0
    jmp __sym_cmp_done_394
__sym_cmp_yes_393:
    mov r1, 1
__sym_cmp_done_394:
    and r1, r1, 1
    mov r7, r1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_395
    sub r12, r13, 108
    load_32 r1, [r12]
    sub r12, r13, 124
    store_32 [r12], r1
    sub r12, r13, 124
    load_32 r1, [r12]
    sub r12, r13, 120
    store_32 [r12], r1
    jmp __sym_block_129
__sym_edge_true_395:
    jmp __sym_block_128
__sym_block_128:
    sub r12, r13, 100
    load_32 r2, [r12]
    load_8 r1, [r2]
    and r1, r1, 255
    mov r7, r1
    mov r1, r7
    mov r2, 48
    cmp r1, r2
    je __sym_cmp_yes_396
    mov r1, 0
    jmp __sym_cmp_done_397
__sym_cmp_yes_396:
    mov r1, 1
__sym_cmp_done_397:
    and r1, r1, 1
    mov r8, r1
    mov r1, r8
    cmp r1, 0
    jne __sym_select_yes_398
    mov r1, 10
    jmp __sym_select_done_399
__sym_select_yes_398:
    mov r1, 8
__sym_select_done_399:
    sub r12, r13, 116
    store_32 [r12], r1
    sub r12, r13, 116
    load_32 r1, [r12]
    sub r12, r13, 124
    store_32 [r12], r1
    sub r12, r13, 124
    load_32 r1, [r12]
    sub r12, r13, 120
    store_32 [r12], r1
    jmp __sym_block_129
__sym_block_129:
    sub r12, r13, 16
    load_32 r1, [r12]
    mov r2, 0
    cmp r1, r2
    je __sym_cmp_yes_400
    mov r1, 0
    jmp __sym_cmp_done_401
__sym_cmp_yes_400:
    mov r1, 1
__sym_cmp_done_401:
    and r1, r1, 1
    mov r7, r1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_402
    jmp __sym_block_130
__sym_edge_true_402:
    mov r1, 65535
    lsl r1, r1, 16
    or r1, r1, 65535
    sub r12, r13, 136
    store_32 [r12], r1
    sub r12, r13, 136
    load_32 r1, [r12]
    sub r12, r13, 132
    store_32 [r12], r1
    jmp __sym_block_131
__sym_block_130:
    sub r12, r13, 20
    load_32 r2, [r12]
    load_32 r1, [r2]
    mov r7, r1
    mov r1, r7
    mov r2, 32767
    lsl r2, r2, 16
    or r2, r2, 65535
    add r1, r1, r2
    sub r12, r13, 128
    store_32 [r12], r1
    sub r12, r13, 128
    load_32 r1, [r12]
    sub r12, r13, 136
    store_32 [r12], r1
    sub r12, r13, 136
    load_32 r1, [r12]
    sub r12, r13, 132
    store_32 [r12], r1
    jmp __sym_block_131
__sym_block_131:
    sub r12, r13, 132
    load_32 r1, [r12]
    mov r7, r1
    sub r12, r13, 120
    load_32 r1, [r12]
    mov r8, r1
    mov r1, r7
    mov r2, r8
    div r1, r1, r2
    sub r12, r13, 140
    store_32 [r12], r1
    sub r12, r13, 140
    load_32 r1, [r12]
    mov r2, r8
    mul r1, r1, r2
    mov r9, r1
    mov r1, r7
    mov r2, r9
    sub r1, r1, r2
    sub r12, r13, 144
    store_32 [r12], r1
    sub r12, r13, 100
    load_32 r1, [r12]
    sub r12, r13, 152
    store_32 [r12], r1
    mov r1, 0
    sub r12, r13, 160
    store_32 [r12], r1
    sub r12, r13, 152
    load_32 r1, [r12]
    sub r12, r13, 148
    store_32 [r12], r1
    sub r12, r13, 160
    load_32 r1, [r12]
    sub r12, r13, 156
    store_32 [r12], r1
    jmp __sym_block_132
__sym_block_132:
    sub r12, r13, 148
    load_32 r2, [r12]
    load_8 r1, [r2]
    and r1, r1, 255
    sub r12, r13, 164
    store_32 [r12], r1
    sub r12, r13, 164
    load_32 r1, [r12]
    sub r12, r13, 168
    store_32 [r12], r1
    sub r12, r13, 164
    load_32 r1, [r12]
    mov r2, 208
    add r1, r1, r2
    and r1, r1, 255
    mov r7, r1
    mov r1, r7
    mov r2, 10
    cmp r1, r2
    jb __sym_cmp_yes_403
    mov r1, 0
    jmp __sym_cmp_done_404
__sym_cmp_yes_403:
    mov r1, 1
__sym_cmp_done_404:
    and r1, r1, 1
    mov r8, r1
    mov r1, r8
    cmp r1, 0
    jne __sym_edge_true_405
    jmp __sym_block_134
__sym_edge_true_405:
    jmp __sym_block_133
__sym_block_133:
    sub r12, r13, 168
    load_32 r1, [r12]
    mov r2, 65535
    lsl r2, r2, 16
    or r2, r2, 65488
    add r1, r1, r2
    sub r12, r13, 172
    store_32 [r12], r1
    sub r12, r13, 172
    load_32 r1, [r12]
    sub r12, r13, 188
    store_32 [r12], r1
    sub r12, r13, 188
    load_32 r1, [r12]
    sub r12, r13, 184
    store_32 [r12], r1
    jmp __sym_block_137
__sym_block_134:
    sub r12, r13, 164
    load_32 r1, [r12]
    mov r2, 159
    add r1, r1, r2
    and r1, r1, 255
    mov r7, r1
    mov r1, r7
    mov r2, 26
    cmp r1, r2
    jb __sym_cmp_yes_406
    mov r1, 0
    jmp __sym_cmp_done_407
__sym_cmp_yes_406:
    mov r1, 1
__sym_cmp_done_407:
    and r1, r1, 1
    mov r8, r1
    mov r1, r8
    cmp r1, 0
    jne __sym_edge_true_408
    jmp __sym_block_136
__sym_edge_true_408:
    jmp __sym_block_135
__sym_block_135:
    sub r12, r13, 168
    load_32 r1, [r12]
    mov r2, 65535
    lsl r2, r2, 16
    or r2, r2, 65449
    add r1, r1, r2
    sub r12, r13, 176
    store_32 [r12], r1
    sub r12, r13, 176
    load_32 r1, [r12]
    sub r12, r13, 188
    store_32 [r12], r1
    sub r12, r13, 188
    load_32 r1, [r12]
    sub r12, r13, 184
    store_32 [r12], r1
    jmp __sym_block_137
__sym_block_136:
    sub r12, r13, 164
    load_32 r1, [r12]
    mov r2, 191
    add r1, r1, r2
    and r1, r1, 255
    mov r7, r1
    mov r1, r7
    mov r2, 26
    cmp r1, r2
    jb __sym_cmp_yes_409
    mov r1, 0
    jmp __sym_cmp_done_410
__sym_cmp_yes_409:
    mov r1, 1
__sym_cmp_done_410:
    and r1, r1, 1
    mov r8, r1
    sub r12, r13, 168
    load_32 r1, [r12]
    mov r2, 65535
    lsl r2, r2, 16
    or r2, r2, 65481
    add r1, r1, r2
    mov r7, r1
    mov r1, r8
    cmp r1, 0
    jne __sym_select_yes_411
    mov r1, 36
    jmp __sym_select_done_412
__sym_select_yes_411:
    mov r1, r7
__sym_select_done_412:
    sub r12, r13, 180
    store_32 [r12], r1
    sub r12, r13, 180
    load_32 r1, [r12]
    sub r12, r13, 188
    store_32 [r12], r1
    sub r12, r13, 188
    load_32 r1, [r12]
    sub r12, r13, 184
    store_32 [r12], r1
    jmp __sym_block_137
__sym_block_137:
    sub r12, r13, 184
    load_32 r1, [r12]
    sub r12, r13, 120
    load_32 r2, [r12]
    cmp r1, r2
    jb __sym_cmp_yes_413
    mov r1, 0
    jmp __sym_cmp_done_414
__sym_cmp_yes_413:
    mov r1, 1
__sym_cmp_done_414:
    and r1, r1, 1
    sub r12, r13, 192
    store_32 [r12], r1
    sub r12, r13, 192
    load_32 r1, [r12]
    cmp r1, 0
    jne __sym_edge_true_415
    sub r12, r13, 148
    load_32 r1, [r12]
    sub r12, r13, 216
    store_32 [r12], r1
    sub r12, r13, 156
    load_32 r1, [r12]
    sub r12, r13, 224
    store_32 [r12], r1
    sub r12, r13, 216
    load_32 r1, [r12]
    sub r12, r13, 212
    store_32 [r12], r1
    sub r12, r13, 224
    load_32 r1, [r12]
    sub r12, r13, 220
    store_32 [r12], r1
    jmp __sym_block_144
__sym_edge_true_415:
    jmp __sym_block_138
__sym_block_138:
    sub r12, r13, 24
    load_32 r2, [r12]
    load_32 r1, [r2]
    mov r7, r1
    mov r1, r7
    mov r2, 0
    cmp r1, r2
    je __sym_cmp_yes_416
    mov r1, 0
    jmp __sym_cmp_done_417
__sym_cmp_yes_416:
    mov r1, 1
__sym_cmp_done_417:
    and r1, r1, 1
    mov r8, r1
    mov r1, r8
    cmp r1, 0
    jne __sym_edge_true_418
    sub r12, r13, 156
    load_32 r1, [r12]
    sub r12, r13, 204
    store_32 [r12], r1
    sub r12, r13, 204
    load_32 r1, [r12]
    sub r12, r13, 200
    store_32 [r12], r1
    jmp __sym_block_143
__sym_edge_true_418:
    jmp __sym_block_139
__sym_block_139:
    sub r12, r13, 156
    load_32 r1, [r12]
    sub r12, r13, 140
    load_32 r2, [r12]
    cmp r1, r2
    ja __sym_cmp_yes_419
    mov r1, 0
    jmp __sym_cmp_done_420
__sym_cmp_yes_419:
    mov r1, 1
__sym_cmp_done_420:
    and r1, r1, 1
    mov r7, r1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_421
    jmp __sym_block_140
__sym_edge_true_421:
    jmp __sym_block_141
__sym_block_140:
    sub r12, r13, 156
    load_32 r1, [r12]
    sub r12, r13, 140
    load_32 r2, [r12]
    cmp r1, r2
    je __sym_cmp_yes_422
    mov r1, 0
    jmp __sym_cmp_done_423
__sym_cmp_yes_422:
    mov r1, 1
__sym_cmp_done_423:
    and r1, r1, 1
    mov r7, r1
    sub r12, r13, 184
    load_32 r1, [r12]
    sub r12, r13, 144
    load_32 r2, [r12]
    cmp r1, r2
    ja __sym_cmp_yes_424
    mov r1, 0
    jmp __sym_cmp_done_425
__sym_cmp_yes_424:
    mov r1, 1
__sym_cmp_done_425:
    and r1, r1, 1
    mov r8, r1
    mov r1, r7
    mov r2, r8
    and r1, r1, r2
    and r1, r1, 1
    mov r9, r1
    mov r1, r9
    cmp r1, 0
    jne __sym_edge_true_426
    jmp __sym_block_142
__sym_edge_true_426:
    jmp __sym_block_141
__sym_block_141:
    mov r1, 1
    sub r12, r13, 24
    load_32 r2, [r12]
    store_32 [r2], r1
    sub r12, r13, 156
    load_32 r1, [r12]
    sub r12, r13, 204
    store_32 [r12], r1
    sub r12, r13, 204
    load_32 r1, [r12]
    sub r12, r13, 200
    store_32 [r12], r1
    jmp __sym_block_143
__sym_block_142:
    sub r12, r13, 156
    load_32 r1, [r12]
    sub r12, r13, 120
    load_32 r2, [r12]
    mul r1, r1, r2
    mov r7, r1
    sub r12, r13, 184
    load_32 r1, [r12]
    mov r2, r7
    add r1, r1, r2
    sub r12, r13, 196
    store_32 [r12], r1
    sub r12, r13, 196
    load_32 r1, [r12]
    sub r12, r13, 204
    store_32 [r12], r1
    sub r12, r13, 204
    load_32 r1, [r12]
    sub r12, r13, 200
    store_32 [r12], r1
    jmp __sym_block_143
__sym_block_143:
    sub r12, r13, 148
    load_32 r1, [r12]
    mov r2, 1
    add r1, r1, r2
    sub r12, r13, 208
    store_32 [r12], r1
    sub r12, r13, 208
    load_32 r1, [r12]
    sub r12, r13, 216
    store_32 [r12], r1
    sub r12, r13, 200
    load_32 r1, [r12]
    sub r12, r13, 224
    store_32 [r12], r1
    sub r12, r13, 216
    load_32 r1, [r12]
    sub r12, r13, 212
    store_32 [r12], r1
    sub r12, r13, 224
    load_32 r1, [r12]
    sub r12, r13, 220
    store_32 [r12], r1
    jmp __sym_block_144
__sym_block_144:
    sub r12, r13, 192
    load_32 r1, [r12]
    cmp r1, 0
    jne __sym_edge_true_427
    jmp __sym_block_145
__sym_edge_true_427:
    sub r12, r13, 212
    load_32 r1, [r12]
    sub r12, r13, 152
    store_32 [r12], r1
    sub r12, r13, 220
    load_32 r1, [r12]
    sub r12, r13, 160
    store_32 [r12], r1
    sub r12, r13, 152
    load_32 r1, [r12]
    sub r12, r13, 148
    store_32 [r12], r1
    sub r12, r13, 160
    load_32 r1, [r12]
    sub r12, r13, 156
    store_32 [r12], r1
    jmp __sym_block_132
__sym_block_145:
    sub r12, r13, 212
    load_32 r1, [r12]
    sub r12, r13, 100
    load_32 r2, [r12]
    cmp r1, r2
    je __sym_cmp_yes_428
    mov r1, 0
    jmp __sym_cmp_done_429
__sym_cmp_yes_428:
    mov r1, 1
__sym_cmp_done_429:
    and r1, r1, 1
    mov r7, r1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_430
    jmp __sym_block_146
__sym_edge_true_430:
    mov r1, 0
    sub r12, r13, 248
    store_32 [r12], r1
    sub r12, r13, 248
    load_32 r1, [r12]
    sub r12, r13, 244
    store_32 [r12], r1
    jmp __sym_block_150
__sym_block_146:
    sub r12, r13, 28
    load_32 r1, [r12]
    cmp r1, 0
    jne __sym_edge_true_431
    jmp __sym_block_147
__sym_edge_true_431:
    jmp __sym_block_148
__sym_block_147:
    sub r12, r13, 212
    load_32 r1, [r12]
    sub r12, r13, 8
    load_32 r2, [r12]
    store_32 [r2], r1
    jmp __sym_block_148
__sym_block_148:
    sub r12, r13, 24
    load_32 r2, [r12]
    load_32 r1, [r2]
    mov r7, r1
    mov r1, r7
    mov r2, 0
    cmp r1, r2
    je __sym_cmp_yes_432
    mov r1, 0
    jmp __sym_cmp_done_433
__sym_cmp_yes_432:
    mov r1, 1
__sym_cmp_done_433:
    and r1, r1, 1
    mov r8, r1
    mov r1, r8
    cmp r1, 0
    jne __sym_edge_true_434
    mov r1, 34
    sub r12, r13, 232
    store_32 [r12], r1
    sub r12, r13, 132
    load_32 r1, [r12]
    sub r12, r13, 240
    store_32 [r12], r1
    sub r12, r13, 232
    load_32 r1, [r12]
    sub r12, r13, 228
    store_32 [r12], r1
    sub r12, r13, 240
    load_32 r1, [r12]
    sub r12, r13, 236
    store_32 [r12], r1
    jmp __sym_block_149
__sym_edge_true_434:
    sub r12, r13, 220
    load_32 r1, [r12]
    sub r12, r13, 248
    store_32 [r12], r1
    sub r12, r13, 248
    load_32 r1, [r12]
    sub r12, r13, 244
    store_32 [r12], r1
    jmp __sym_block_150
__sym_block_149:
    sub r12, r13, 228
    load_32 r1, [r12]
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 4864
    store_32 [r2], r1
    sub r12, r13, 236
    load_32 r1, [r12]
    sub r12, r13, 248
    store_32 [r12], r1
    sub r12, r13, 248
    load_32 r1, [r12]
    sub r12, r13, 244
    store_32 [r12], r1
    jmp __sym_block_150
__sym_block_150:
    sub r12, r13, 244
    load_32 r1, [r12]
    mov sp, r13
    pop r13
    ret

; function sym_u32toa, frame 128 bytes
__sym_fn_sym_u32toa_151:
    push r13
    mov r13, sp
    sub sp, sp, 128
    sub r12, r13, 4
    store_32 [r12], r1
    sub r12, r13, 8
    store_32 [r12], r2
    sub r12, r13, 12
    store_32 [r12], r3
    sub r12, r13, 16
    store_32 [r12], r4
__sym_block_152:
    sub r1, r13, 52
    sub r12, r13, 20
    store_32 [r12], r1
    sub r12, r13, 8
    load_32 r1, [r12]
    mov r2, 0
    cmp r1, r2
    jne __sym_cmp_yes_435
    mov r1, 0
    jmp __sym_cmp_done_436
__sym_cmp_yes_435:
    mov r1, 1
__sym_cmp_done_436:
    and r1, r1, 1
    mov r7, r1
    sub r12, r13, 12
    load_32 r1, [r12]
    mov r2, 0
    cmp r1, r2
    jne __sym_cmp_yes_437
    mov r1, 0
    jmp __sym_cmp_done_438
__sym_cmp_yes_437:
    mov r1, 1
__sym_cmp_done_438:
    and r1, r1, 1
    mov r8, r1
    mov r1, r7
    mov r2, r8
    and r1, r1, r2
    and r1, r1, 1
    mov r9, r1
    mov r1, r9
    cmp r1, 0
    jne __sym_edge_true_439
    jmp __sym_block_154
__sym_edge_true_439:
    jmp __sym_block_153
__sym_block_153:
    mov r1, 0
    sub r12, r13, 8
    load_32 r2, [r12]
    store_8 [r2], r1
    jmp __sym_block_154
__sym_block_154:
    sub r12, r13, 8
    load_32 r1, [r12]
    mov r2, 0
    cmp r1, r2
    je __sym_cmp_yes_440
    mov r1, 0
    jmp __sym_cmp_done_441
__sym_cmp_yes_440:
    mov r1, 1
__sym_cmp_done_441:
    and r1, r1, 1
    mov r7, r1
    sub r12, r13, 16
    load_32 r1, [r12]
    mov r2, 65535
    lsl r2, r2, 16
    or r2, r2, 65499
    add r1, r1, r2
    mov r8, r1
    mov r1, r8
    mov r2, 65535
    lsl r2, r2, 16
    or r2, r2, 65501
    cmp r1, r2
    jb __sym_cmp_yes_442
    mov r1, 0
    jmp __sym_cmp_done_443
__sym_cmp_yes_442:
    mov r1, 1
__sym_cmp_done_443:
    and r1, r1, 1
    mov r9, r1
    mov r1, r7
    mov r2, r9
    or r1, r1, r2
    and r1, r1, 1
    mov r8, r1
    mov r1, r8
    cmp r1, 0
    jne __sym_edge_true_444
    jmp __sym_block_156
__sym_edge_true_444:
    jmp __sym_block_155
__sym_block_155:
    mov r1, 22
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 4864
    store_32 [r2], r1
    mov r1, 65535
    lsl r1, r1, 16
    or r1, r1, 65535
    sub r12, r13, 124
    store_32 [r12], r1
    sub r12, r13, 124
    load_32 r1, [r12]
    sub r12, r13, 120
    store_32 [r12], r1
    jmp __sym_block_164
__sym_block_156:
    sub r12, r13, 4
    load_32 r1, [r12]
    sub r12, r13, 60
    store_32 [r12], r1
    mov r1, 0
    sub r12, r13, 68
    store_32 [r12], r1
    sub r12, r13, 60
    load_32 r1, [r12]
    sub r12, r13, 56
    store_32 [r12], r1
    sub r12, r13, 68
    load_32 r1, [r12]
    sub r12, r13, 64
    store_32 [r12], r1
    jmp __sym_block_157
__sym_block_157:
    sub r12, r13, 56
    load_32 r1, [r12]
    mov r7, r1
    mov r1, r7
    sub r12, r13, 16
    load_32 r2, [r12]
    div r1, r1, r2
    sub r12, r13, 72
    store_32 [r12], r1
    sub r12, r13, 72
    load_32 r1, [r12]
    sub r12, r13, 16
    load_32 r2, [r12]
    mul r1, r1, r2
    mov r8, r1
    mov r1, r7
    mov r2, r8
    sub r1, r1, r2
    mov r9, r1
    mov r1, r9
    mov r2, 10
    cmp r1, r2
    jb __sym_cmp_yes_445
    mov r1, 0
    jmp __sym_cmp_done_446
__sym_cmp_yes_445:
    mov r1, 1
__sym_cmp_done_446:
    and r1, r1, 1
    mov r7, r1
    mov r1, r9
    mov r2, 48
    or r1, r1, r2
    mov r8, r1
    mov r1, r9
    mov r2, 87
    add r1, r1, r2
    mov r10, r1
    mov r1, r7
    cmp r1, 0
    jne __sym_select_yes_447
    mov r1, r10
    jmp __sym_select_done_448
__sym_select_yes_447:
    mov r1, r8
__sym_select_done_448:
    mov r9, r1
    mov r1, r9
    and r1, r1, 255
    mov r7, r1
    sub r12, r13, 64
    load_32 r1, [r12]
    mov r2, 1
    add r1, r1, r2
    sub r12, r13, 76
    store_32 [r12], r1
    sub r12, r13, 20
    load_32 r1, [r12]
    sub r12, r13, 64
    load_32 r2, [r12]
    add r1, r1, r2
    mov r8, r1
    mov r1, r7
    mov r2, r8
    store_8 [r2], r1
    sub r12, r13, 16
    load_32 r1, [r12]
    sub r12, r13, 56
    load_32 r2, [r12]
    cmp r1, r2
    ja __sym_cmp_yes_449
    mov r1, 0
    jmp __sym_cmp_done_450
__sym_cmp_yes_449:
    mov r1, 1
__sym_cmp_done_450:
    and r1, r1, 1
    mov r7, r1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_451
    sub r12, r13, 72
    load_32 r1, [r12]
    sub r12, r13, 60
    store_32 [r12], r1
    sub r12, r13, 76
    load_32 r1, [r12]
    sub r12, r13, 68
    store_32 [r12], r1
    sub r12, r13, 60
    load_32 r1, [r12]
    sub r12, r13, 56
    store_32 [r12], r1
    sub r12, r13, 68
    load_32 r1, [r12]
    sub r12, r13, 64
    store_32 [r12], r1
    jmp __sym_block_157
__sym_edge_true_451:
    jmp __sym_block_158
__sym_block_158:
    sub r12, r13, 64
    load_32 r1, [r12]
    mov r2, 2
    add r1, r1, r2
    mov r7, r1
    sub r12, r13, 12
    load_32 r1, [r12]
    mov r2, r7
    cmp r1, r2
    jb __sym_cmp_yes_452
    mov r1, 0
    jmp __sym_cmp_done_453
__sym_cmp_yes_452:
    mov r1, 1
__sym_cmp_done_453:
    and r1, r1, 1
    mov r8, r1
    mov r1, r8
    cmp r1, 0
    jne __sym_edge_true_454
    jmp __sym_block_160
__sym_edge_true_454:
    jmp __sym_block_159
__sym_block_159:
    mov r1, 34
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 4864
    store_32 [r2], r1
    mov r1, 65535
    lsl r1, r1, 16
    or r1, r1, 65535
    sub r12, r13, 116
    store_32 [r12], r1
    sub r12, r13, 116
    load_32 r1, [r12]
    sub r12, r13, 112
    store_32 [r12], r1
    jmp __sym_block_163
__sym_block_160:
    sub r12, r13, 76
    load_32 r1, [r12]
    mov r2, 0
    cmp r1, r2
    je __sym_cmp_yes_455
    mov r1, 0
    jmp __sym_cmp_done_456
__sym_cmp_yes_455:
    mov r1, 1
__sym_cmp_done_456:
    and r1, r1, 1
    mov r7, r1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_457
    mov r1, 0
    sub r12, r13, 84
    store_32 [r12], r1
    sub r12, r13, 76
    load_32 r1, [r12]
    sub r12, r13, 92
    store_32 [r12], r1
    sub r12, r13, 84
    load_32 r1, [r12]
    sub r12, r13, 80
    store_32 [r12], r1
    sub r12, r13, 92
    load_32 r1, [r12]
    sub r12, r13, 88
    store_32 [r12], r1
    jmp __sym_block_161
__sym_edge_true_457:
    mov r1, 0
    sub r12, r13, 108
    store_32 [r12], r1
    sub r12, r13, 108
    load_32 r1, [r12]
    sub r12, r13, 104
    store_32 [r12], r1
    jmp __sym_block_162
__sym_block_161:
    sub r12, r13, 88
    load_32 r1, [r12]
    mov r2, 65535
    lsl r2, r2, 16
    or r2, r2, 65535
    add r1, r1, r2
    sub r12, r13, 96
    store_32 [r12], r1
    sub r12, r13, 20
    load_32 r1, [r12]
    sub r12, r13, 96
    load_32 r2, [r12]
    add r1, r1, r2
    mov r7, r1
    mov r2, r7
    load_8 r1, [r2]
    and r1, r1, 255
    mov r8, r1
    sub r12, r13, 80
    load_32 r1, [r12]
    mov r2, 1
    add r1, r1, r2
    sub r12, r13, 100
    store_32 [r12], r1
    sub r12, r13, 8
    load_32 r1, [r12]
    sub r12, r13, 80
    load_32 r2, [r12]
    add r1, r1, r2
    mov r7, r1
    mov r1, r8
    mov r2, r7
    store_8 [r2], r1
    sub r12, r13, 96
    load_32 r1, [r12]
    mov r2, 0
    cmp r1, r2
    je __sym_cmp_yes_458
    mov r1, 0
    jmp __sym_cmp_done_459
__sym_cmp_yes_458:
    mov r1, 1
__sym_cmp_done_459:
    and r1, r1, 1
    mov r7, r1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_460
    sub r12, r13, 100
    load_32 r1, [r12]
    sub r12, r13, 84
    store_32 [r12], r1
    sub r12, r13, 96
    load_32 r1, [r12]
    sub r12, r13, 92
    store_32 [r12], r1
    sub r12, r13, 84
    load_32 r1, [r12]
    sub r12, r13, 80
    store_32 [r12], r1
    sub r12, r13, 92
    load_32 r1, [r12]
    sub r12, r13, 88
    store_32 [r12], r1
    jmp __sym_block_161
__sym_edge_true_460:
    sub r12, r13, 100
    load_32 r1, [r12]
    sub r12, r13, 108
    store_32 [r12], r1
    sub r12, r13, 108
    load_32 r1, [r12]
    sub r12, r13, 104
    store_32 [r12], r1
    jmp __sym_block_162
__sym_block_162:
    sub r12, r13, 8
    load_32 r1, [r12]
    sub r12, r13, 104
    load_32 r2, [r12]
    add r1, r1, r2
    mov r7, r1
    mov r1, 0
    mov r2, r7
    store_8 [r2], r1
    sub r12, r13, 104
    load_32 r1, [r12]
    sub r12, r13, 116
    store_32 [r12], r1
    sub r12, r13, 116
    load_32 r1, [r12]
    sub r12, r13, 112
    store_32 [r12], r1
    jmp __sym_block_163
__sym_block_163:
    sub r12, r13, 112
    load_32 r1, [r12]
    sub r12, r13, 124
    store_32 [r12], r1
    sub r12, r13, 124
    load_32 r1, [r12]
    sub r12, r13, 120
    store_32 [r12], r1
    jmp __sym_block_164
__sym_block_164:
    sub r12, r13, 120
    load_32 r1, [r12]
    mov sp, r13
    pop r13
    ret

; function sym_i32toa, frame 144 bytes
__sym_fn_sym_i32toa_165:
    push r13
    mov r13, sp
    sub sp, sp, 144
    sub r12, r13, 4
    store_32 [r12], r1
    sub r12, r13, 8
    store_32 [r12], r2
    sub r12, r13, 12
    store_32 [r12], r3
    sub r12, r13, 16
    store_32 [r12], r4
__sym_block_166:
    sub r1, r13, 52
    sub r12, r13, 20
    store_32 [r12], r1
    sub r12, r13, 4
    load_32 r1, [r12]
    asr r2, r1, 31
    xor r1, r1, r2
    sub r1, r1, r2
    sub r12, r13, 56
    store_32 [r12], r1
    sub r12, r13, 4
    load_32 r1, [r12]
    mov r2, 31
    lsr r1, r1, r2
    sub r12, r13, 60
    store_32 [r12], r1
    sub r12, r13, 8
    load_32 r1, [r12]
    mov r2, 0
    cmp r1, r2
    jne __sym_cmp_yes_461
    mov r1, 0
    jmp __sym_cmp_done_462
__sym_cmp_yes_461:
    mov r1, 1
__sym_cmp_done_462:
    and r1, r1, 1
    mov r7, r1
    sub r12, r13, 12
    load_32 r1, [r12]
    mov r2, 0
    cmp r1, r2
    jne __sym_cmp_yes_463
    mov r1, 0
    jmp __sym_cmp_done_464
__sym_cmp_yes_463:
    mov r1, 1
__sym_cmp_done_464:
    and r1, r1, 1
    mov r8, r1
    mov r1, r7
    mov r2, r8
    and r1, r1, r2
    and r1, r1, 1
    mov r9, r1
    mov r1, r9
    cmp r1, 0
    jne __sym_edge_true_465
    jmp __sym_block_168
__sym_edge_true_465:
    jmp __sym_block_167
__sym_block_167:
    mov r1, 0
    sub r12, r13, 8
    load_32 r2, [r12]
    store_8 [r2], r1
    jmp __sym_block_168
__sym_block_168:
    sub r12, r13, 8
    load_32 r1, [r12]
    mov r2, 0
    cmp r1, r2
    je __sym_cmp_yes_466
    mov r1, 0
    jmp __sym_cmp_done_467
__sym_cmp_yes_466:
    mov r1, 1
__sym_cmp_done_467:
    and r1, r1, 1
    mov r7, r1
    sub r12, r13, 16
    load_32 r1, [r12]
    mov r2, 65535
    lsl r2, r2, 16
    or r2, r2, 65499
    add r1, r1, r2
    mov r8, r1
    mov r1, r8
    mov r2, 65535
    lsl r2, r2, 16
    or r2, r2, 65501
    cmp r1, r2
    jb __sym_cmp_yes_468
    mov r1, 0
    jmp __sym_cmp_done_469
__sym_cmp_yes_468:
    mov r1, 1
__sym_cmp_done_469:
    and r1, r1, 1
    mov r9, r1
    mov r1, r7
    mov r2, r9
    or r1, r1, r2
    and r1, r1, 1
    mov r8, r1
    mov r1, r8
    cmp r1, 0
    jne __sym_edge_true_470
    jmp __sym_block_170
__sym_edge_true_470:
    jmp __sym_block_169
__sym_block_169:
    mov r1, 22
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 4864
    store_32 [r2], r1
    mov r1, 65535
    lsl r1, r1, 16
    or r1, r1, 65535
    sub r12, r13, 140
    store_32 [r12], r1
    sub r12, r13, 140
    load_32 r1, [r12]
    sub r12, r13, 136
    store_32 [r12], r1
    jmp __sym_block_180
__sym_block_170:
    sub r12, r13, 56
    load_32 r1, [r12]
    sub r12, r13, 68
    store_32 [r12], r1
    mov r1, 0
    sub r12, r13, 76
    store_32 [r12], r1
    sub r12, r13, 68
    load_32 r1, [r12]
    sub r12, r13, 64
    store_32 [r12], r1
    sub r12, r13, 76
    load_32 r1, [r12]
    sub r12, r13, 72
    store_32 [r12], r1
    jmp __sym_block_171
__sym_block_171:
    sub r12, r13, 64
    load_32 r1, [r12]
    mov r7, r1
    mov r1, r7
    sub r12, r13, 16
    load_32 r2, [r12]
    div r1, r1, r2
    sub r12, r13, 80
    store_32 [r12], r1
    sub r12, r13, 80
    load_32 r1, [r12]
    sub r12, r13, 16
    load_32 r2, [r12]
    mul r1, r1, r2
    mov r8, r1
    mov r1, r7
    mov r2, r8
    sub r1, r1, r2
    mov r9, r1
    mov r1, r9
    mov r2, 10
    cmp r1, r2
    jb __sym_cmp_yes_471
    mov r1, 0
    jmp __sym_cmp_done_472
__sym_cmp_yes_471:
    mov r1, 1
__sym_cmp_done_472:
    and r1, r1, 1
    mov r7, r1
    mov r1, r9
    mov r2, 48
    or r1, r1, r2
    mov r8, r1
    mov r1, r9
    mov r2, 87
    add r1, r1, r2
    mov r10, r1
    mov r1, r7
    cmp r1, 0
    jne __sym_select_yes_473
    mov r1, r10
    jmp __sym_select_done_474
__sym_select_yes_473:
    mov r1, r8
__sym_select_done_474:
    mov r9, r1
    mov r1, r9
    and r1, r1, 255
    mov r7, r1
    sub r12, r13, 72
    load_32 r1, [r12]
    mov r2, 1
    add r1, r1, r2
    sub r12, r13, 84
    store_32 [r12], r1
    sub r12, r13, 20
    load_32 r1, [r12]
    sub r12, r13, 72
    load_32 r2, [r12]
    add r1, r1, r2
    mov r8, r1
    mov r1, r7
    mov r2, r8
    store_8 [r2], r1
    sub r12, r13, 16
    load_32 r1, [r12]
    sub r12, r13, 64
    load_32 r2, [r12]
    cmp r1, r2
    ja __sym_cmp_yes_475
    mov r1, 0
    jmp __sym_cmp_done_476
__sym_cmp_yes_475:
    mov r1, 1
__sym_cmp_done_476:
    and r1, r1, 1
    mov r7, r1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_477
    sub r12, r13, 80
    load_32 r1, [r12]
    sub r12, r13, 68
    store_32 [r12], r1
    sub r12, r13, 84
    load_32 r1, [r12]
    sub r12, r13, 76
    store_32 [r12], r1
    sub r12, r13, 68
    load_32 r1, [r12]
    sub r12, r13, 64
    store_32 [r12], r1
    sub r12, r13, 76
    load_32 r1, [r12]
    sub r12, r13, 72
    store_32 [r12], r1
    jmp __sym_block_171
__sym_edge_true_477:
    jmp __sym_block_172
__sym_block_172:
    sub r12, r13, 60
    load_32 r1, [r12]
    mov r2, 1
    add r1, r1, r2
    mov r7, r1
    mov r1, r7
    sub r12, r13, 84
    load_32 r2, [r12]
    add r1, r1, r2
    mov r8, r1
    sub r12, r13, 12
    load_32 r1, [r12]
    mov r2, r8
    cmp r1, r2
    jb __sym_cmp_yes_478
    mov r1, 0
    jmp __sym_cmp_done_479
__sym_cmp_yes_478:
    mov r1, 1
__sym_cmp_done_479:
    and r1, r1, 1
    mov r7, r1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_480
    jmp __sym_block_174
__sym_edge_true_480:
    jmp __sym_block_173
__sym_block_173:
    mov r1, 34
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 4864
    store_32 [r2], r1
    mov r1, 65535
    lsl r1, r1, 16
    or r1, r1, 65535
    sub r12, r13, 132
    store_32 [r12], r1
    sub r12, r13, 132
    load_32 r1, [r12]
    sub r12, r13, 128
    store_32 [r12], r1
    jmp __sym_block_179
__sym_block_174:
    sub r12, r13, 4
    load_32 r1, [r12]
    mov r2, 65535
    lsl r2, r2, 16
    or r2, r2, 65535
    cmp r1, r2
    jg __sym_cmp_yes_481
    mov r1, 0
    jmp __sym_cmp_done_482
__sym_cmp_yes_481:
    mov r1, 1
__sym_cmp_done_482:
    and r1, r1, 1
    mov r7, r1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_483
    jmp __sym_block_175
__sym_edge_true_483:
    mov r1, 0
    sub r12, r13, 92
    store_32 [r12], r1
    sub r12, r13, 92
    load_32 r1, [r12]
    sub r12, r13, 88
    store_32 [r12], r1
    jmp __sym_block_176
__sym_block_175:
    mov r1, 45
    sub r12, r13, 8
    load_32 r2, [r12]
    store_8 [r2], r1
    mov r1, 1
    sub r12, r13, 92
    store_32 [r12], r1
    sub r12, r13, 92
    load_32 r1, [r12]
    sub r12, r13, 88
    store_32 [r12], r1
    jmp __sym_block_176
__sym_block_176:
    sub r12, r13, 84
    load_32 r1, [r12]
    mov r2, 0
    cmp r1, r2
    je __sym_cmp_yes_484
    mov r1, 0
    jmp __sym_cmp_done_485
__sym_cmp_yes_484:
    mov r1, 1
__sym_cmp_done_485:
    and r1, r1, 1
    mov r7, r1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_486
    sub r12, r13, 88
    load_32 r1, [r12]
    sub r12, r13, 100
    store_32 [r12], r1
    sub r12, r13, 84
    load_32 r1, [r12]
    sub r12, r13, 108
    store_32 [r12], r1
    sub r12, r13, 100
    load_32 r1, [r12]
    sub r12, r13, 96
    store_32 [r12], r1
    sub r12, r13, 108
    load_32 r1, [r12]
    sub r12, r13, 104
    store_32 [r12], r1
    jmp __sym_block_177
__sym_edge_true_486:
    sub r12, r13, 88
    load_32 r1, [r12]
    sub r12, r13, 124
    store_32 [r12], r1
    sub r12, r13, 124
    load_32 r1, [r12]
    sub r12, r13, 120
    store_32 [r12], r1
    jmp __sym_block_178
__sym_block_177:
    sub r12, r13, 104
    load_32 r1, [r12]
    mov r2, 65535
    lsl r2, r2, 16
    or r2, r2, 65535
    add r1, r1, r2
    sub r12, r13, 112
    store_32 [r12], r1
    sub r12, r13, 20
    load_32 r1, [r12]
    sub r12, r13, 112
    load_32 r2, [r12]
    add r1, r1, r2
    mov r7, r1
    mov r2, r7
    load_8 r1, [r2]
    and r1, r1, 255
    mov r8, r1
    sub r12, r13, 96
    load_32 r1, [r12]
    mov r2, 1
    add r1, r1, r2
    sub r12, r13, 116
    store_32 [r12], r1
    sub r12, r13, 8
    load_32 r1, [r12]
    sub r12, r13, 96
    load_32 r2, [r12]
    add r1, r1, r2
    mov r7, r1
    mov r1, r8
    mov r2, r7
    store_8 [r2], r1
    sub r12, r13, 112
    load_32 r1, [r12]
    mov r2, 0
    cmp r1, r2
    je __sym_cmp_yes_487
    mov r1, 0
    jmp __sym_cmp_done_488
__sym_cmp_yes_487:
    mov r1, 1
__sym_cmp_done_488:
    and r1, r1, 1
    mov r7, r1
    mov r1, r7
    cmp r1, 0
    jne __sym_edge_true_489
    sub r12, r13, 116
    load_32 r1, [r12]
    sub r12, r13, 100
    store_32 [r12], r1
    sub r12, r13, 112
    load_32 r1, [r12]
    sub r12, r13, 108
    store_32 [r12], r1
    sub r12, r13, 100
    load_32 r1, [r12]
    sub r12, r13, 96
    store_32 [r12], r1
    sub r12, r13, 108
    load_32 r1, [r12]
    sub r12, r13, 104
    store_32 [r12], r1
    jmp __sym_block_177
__sym_edge_true_489:
    sub r12, r13, 116
    load_32 r1, [r12]
    sub r12, r13, 124
    store_32 [r12], r1
    sub r12, r13, 124
    load_32 r1, [r12]
    sub r12, r13, 120
    store_32 [r12], r1
    jmp __sym_block_178
__sym_block_178:
    sub r12, r13, 8
    load_32 r1, [r12]
    sub r12, r13, 120
    load_32 r2, [r12]
    add r1, r1, r2
    mov r7, r1
    mov r1, 0
    mov r2, r7
    store_8 [r2], r1
    sub r12, r13, 120
    load_32 r1, [r12]
    sub r12, r13, 132
    store_32 [r12], r1
    sub r12, r13, 132
    load_32 r1, [r12]
    sub r12, r13, 128
    store_32 [r12], r1
    jmp __sym_block_179
__sym_block_179:
    sub r12, r13, 128
    load_32 r1, [r12]
    sub r12, r13, 140
    store_32 [r12], r1
    sub r12, r13, 140
    load_32 r1, [r12]
    sub r12, r13, 136
    store_32 [r12], r1
    jmp __sym_block_180
__sym_block_180:
    sub r12, r13, 136
    load_32 r1, [r12]
    mov sp, r13
    pop r13
    ret

; function puts, frame 8 bytes
__sym_fn_puts_181:
    push r13
    mov r13, sp
    sub sp, sp, 8
    sub r12, r13, 4
    store_32 [r12], r1
__sym_block_182:
    sub r12, r13, 4
    load_32 r1, [r12]
    call __sym_fn_tty_puts_50
    mov r1, 10
    call __sym_fn_tty_putc_14
    mov r1, 0
    mov sp, r13
    pop r13
    ret

; Global addresses (zero tail uses initially zeroed RAM).
; .str = 65536
; .str.1 = 65579
; .str.2 = 65633
; .str.3 = 65636
; .str.4 = 65641
; .str.5 = 65695
; .str.6 = 65705
; framebuffer = 65718
; cursor = 69560
; wrap_pending = 69564
; edit_length = 69568
; initialized = 69572
; ready_length = 69576
; read_offset = 69580
; shift_down = 69584
; echo_width = 69588
; echo_pending = 69844
; line = 70100
; shifted.plain = 70356
; shifted.upper = 70378
; sym_errno = 70400
@65536
U8 67
U8 32
U8 108
U8 105
U8 98
U8 114
U8 97
U8 114
U8 121
U8 32
U8 100
U8 101
U8 109
U8 111
U8 58
U8 32
U8 101
U8 110
U8 116
U8 101
U8 114
U8 32
U8 97
U8 110
U8 32
U8 105
U8 110
U8 116
U8 101
U8 103
U8 101
U8 114
U8 44
U8 32
U8 111
U8 114
U8 32
U8 113
U8 117
U8 105
U8 116
U8 46
U8 0
U8 68
U8 101
U8 99
U8 105
U8 109
U8 97
U8 108
U8 44
U8 32
U8 48
U8 120
U8 32
U8 104
U8 101
U8 120
U8 32
U8 97
U8 110
U8 100
U8 32
U8 108
U8 101
U8 97
U8 100
U8 105
U8 110
U8 103
U8 45
U8 122
U8 101
U8 114
U8 111
U8 32
U8 111
U8 99
U8 116
U8 97
U8 108
U8 32
U8 97
U8 114
U8 101
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
U8 62
U8 32
U8 0
U8 113
U8 117
U8 105
U8 116
U8 0
U8 73
U8 110
U8 118
U8 97
U8 108
U8 105
U8 100
U8 32
U8 105
U8 110
U8 116
U8 101
U8 103
U8 101
U8 114
U8 32
U8 111
U8 114
U8 32
U8 118
U8 97
U8 108
U8 117
U8 101
U8 32
U8 111
U8 117
U8 116
U8 115
U8 105
U8 100
U8 101
U8 32
U8 115
U8 105
U8 103
U8 110
U8 101
U8 100
U8 32
U8 51
U8 50
U8 45
U8 98
U8 105
U8 116
U8 32
U8 114
U8 97
U8 110
U8 103
U8 101
U8 46
U8 0
U8 100
U8 101
U8 99
U8 105
U8 109
U8 97
U8 108
U8 58
U8 32
U8 0
U8 104
U8 101
U8 120
U8 32
U8 98
U8 105
U8 116
U8 115
U8 58
U8 32
U8 48
U8 120
@70356
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
