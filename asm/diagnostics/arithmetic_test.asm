; Symphony ALU 12/13/14: mul/div/mod. All numbers displayed in hex.
; Nonnegative division/remainder; multiplication keeps low 32 bits.
; ASCII8 screen, 96 columns x 40 rows; framebuffer 0x8000..0x8EFF.
; No stack, mov/call/ret aliases, or tested operations in formatting.
or r1, zr, 0
screen r1, 0
or r1, zr, 1
screen r1, 32768
or r1, zr, 2
screen r1, 255
or r1, zr, 3
screen r1, 0
or r1, zr, 4
screen r1, 0
or r1, zr, 32768
or r2, zr, 32
or r3, zr, 36608
clear_screen:
store_8 [r1], r2
add r1, r1, 1
cmp r1, r3
jb clear_screen
or r9, zr, 0
or r10, zr, 32768
or r1, zr, text_0
or r12, zr, back_1
jmp print_text
back_1:
or r10, zr, 32864
or r1, zr, text_1
or r12, zr, back_2
jmp print_text
back_2:
or r10, zr, 32960
or r1, zr, text_2
or r12, zr, back_3
jmp print_text
back_3:
; Test 1: 0 mul 123 = 0
or r10, zr, 33056
or r5, zr, 0
or r6, zr, 123
or r7, zr, 0
or r8, zr, 42405
lsl r8, r8, 16
or r8, r8, 42405
mul r8, r5, r6
or r1, zr, text_3
or r12, zr, back_4
jmp print_text
back_4:
or r1, zr, r5
or r12, zr, back_5
jmp print_hex
back_5:
or r1, zr, text_4
or r12, zr, back_6
jmp print_text
back_6:
or r1, zr, r6
or r12, zr, back_7
jmp print_hex
back_7:
or r1, zr, text_4
or r12, zr, back_8
jmp print_text
back_8:
or r1, zr, r8
or r12, zr, back_9
jmp print_hex
back_9:
or r1, zr, text_4
or r12, zr, back_10
jmp print_text
back_10:
or r1, zr, r7
or r12, zr, back_11
jmp print_hex
back_11:
or r1, zr, text_4
or r12, zr, back_12
jmp print_text
back_12:
cmp r8, r7
jne fail_1
or r1, zr, text_5
or r12, zr, back_13
jmp print_text
back_13:
jmp done_1
fail_1:
add r9, r9, 1
or r1, zr, text_6
or r12, zr, back_14
jmp print_text
back_14:
done_1:
; Test 2: 1 mul 65535 = 65535
or r10, zr, 33152
or r5, zr, 1
or r6, zr, 65535
or r7, zr, 65535
or r8, zr, 42405
lsl r8, r8, 16
or r8, r8, 42405
mul r8, r5, r6
or r1, zr, text_7
or r12, zr, back_15
jmp print_text
back_15:
or r1, zr, r5
or r12, zr, back_16
jmp print_hex
back_16:
or r1, zr, text_4
or r12, zr, back_17
jmp print_text
back_17:
or r1, zr, r6
or r12, zr, back_18
jmp print_hex
back_18:
or r1, zr, text_4
or r12, zr, back_19
jmp print_text
back_19:
or r1, zr, r8
or r12, zr, back_20
jmp print_hex
back_20:
or r1, zr, text_4
or r12, zr, back_21
jmp print_text
back_21:
or r1, zr, r7
or r12, zr, back_22
jmp print_hex
back_22:
or r1, zr, text_4
or r12, zr, back_23
jmp print_text
back_23:
cmp r8, r7
jne fail_2
or r1, zr, text_5
or r12, zr, back_24
jmp print_text
back_24:
jmp done_2
fail_2:
add r9, r9, 1
or r1, zr, text_6
or r12, zr, back_25
jmp print_text
back_25:
done_2:
; Test 3: 7 mul 9 = 63
or r10, zr, 33248
or r5, zr, 7
or r6, zr, 9
or r7, zr, 63
or r8, zr, 42405
lsl r8, r8, 16
or r8, r8, 42405
mul r8, r5, r6
or r1, zr, text_8
or r12, zr, back_26
jmp print_text
back_26:
or r1, zr, r5
or r12, zr, back_27
jmp print_hex
back_27:
or r1, zr, text_4
or r12, zr, back_28
jmp print_text
back_28:
or r1, zr, r6
or r12, zr, back_29
jmp print_hex
back_29:
or r1, zr, text_4
or r12, zr, back_30
jmp print_text
back_30:
or r1, zr, r8
or r12, zr, back_31
jmp print_hex
back_31:
or r1, zr, text_4
or r12, zr, back_32
jmp print_text
back_32:
or r1, zr, r7
or r12, zr, back_33
jmp print_hex
back_33:
or r1, zr, text_4
or r12, zr, back_34
jmp print_text
back_34:
cmp r8, r7
jne fail_3
or r1, zr, text_5
or r12, zr, back_35
jmp print_text
back_35:
jmp done_3
fail_3:
add r9, r9, 1
or r1, zr, text_6
or r12, zr, back_36
jmp print_text
back_36:
done_3:
; Test 4: 255 mul 257 = 65535
or r10, zr, 33344
or r5, zr, 255
or r6, zr, 257
or r7, zr, 65535
or r8, zr, 42405
lsl r8, r8, 16
or r8, r8, 42405
mul r8, r5, r6
or r1, zr, text_9
or r12, zr, back_37
jmp print_text
back_37:
or r1, zr, r5
or r12, zr, back_38
jmp print_hex
back_38:
or r1, zr, text_4
or r12, zr, back_39
jmp print_text
back_39:
or r1, zr, r6
or r12, zr, back_40
jmp print_hex
back_40:
or r1, zr, text_4
or r12, zr, back_41
jmp print_text
back_41:
or r1, zr, r8
or r12, zr, back_42
jmp print_hex
back_42:
or r1, zr, text_4
or r12, zr, back_43
jmp print_text
back_43:
or r1, zr, r7
or r12, zr, back_44
jmp print_hex
back_44:
or r1, zr, text_4
or r12, zr, back_45
jmp print_text
back_45:
cmp r8, r7
jne fail_4
or r1, zr, text_5
or r12, zr, back_46
jmp print_text
back_46:
jmp done_4
fail_4:
add r9, r9, 1
or r1, zr, text_6
or r12, zr, back_47
jmp print_text
back_47:
done_4:
; Test 5: 65535 mul 65535 = 4294836225
or r10, zr, 33440
or r5, zr, 65535
or r6, zr, 65535
or r7, zr, 65534
lsl r7, r7, 16
or r7, r7, 1
or r8, zr, 42405
lsl r8, r8, 16
or r8, r8, 42405
mul r8, r5, r6
or r1, zr, text_10
or r12, zr, back_48
jmp print_text
back_48:
or r1, zr, r5
or r12, zr, back_49
jmp print_hex
back_49:
or r1, zr, text_4
or r12, zr, back_50
jmp print_text
back_50:
or r1, zr, r6
or r12, zr, back_51
jmp print_hex
back_51:
or r1, zr, text_4
or r12, zr, back_52
jmp print_text
back_52:
or r1, zr, r8
or r12, zr, back_53
jmp print_hex
back_53:
or r1, zr, text_4
or r12, zr, back_54
jmp print_text
back_54:
or r1, zr, r7
or r12, zr, back_55
jmp print_hex
back_55:
or r1, zr, text_4
or r12, zr, back_56
jmp print_text
back_56:
cmp r8, r7
jne fail_5
or r1, zr, text_5
or r12, zr, back_57
jmp print_text
back_57:
jmp done_5
fail_5:
add r9, r9, 1
or r1, zr, text_6
or r12, zr, back_58
jmp print_text
back_58:
done_5:
; Test 6: 305419896 mul 4660 = 1622540384
or r10, zr, 33536
or r5, zr, 4660
lsl r5, r5, 16
or r5, r5, 22136
or r6, zr, 4660
or r7, zr, 24758
lsl r7, r7, 16
or r7, r7, 96
or r8, zr, 42405
lsl r8, r8, 16
or r8, r8, 42405
mul r8, r5, r6
or r1, zr, text_11
or r12, zr, back_59
jmp print_text
back_59:
or r1, zr, r5
or r12, zr, back_60
jmp print_hex
back_60:
or r1, zr, text_4
or r12, zr, back_61
jmp print_text
back_61:
or r1, zr, r6
or r12, zr, back_62
jmp print_hex
back_62:
or r1, zr, text_4
or r12, zr, back_63
jmp print_text
back_63:
or r1, zr, r8
or r12, zr, back_64
jmp print_hex
back_64:
or r1, zr, text_4
or r12, zr, back_65
jmp print_text
back_65:
or r1, zr, r7
or r12, zr, back_66
jmp print_hex
back_66:
or r1, zr, text_4
or r12, zr, back_67
jmp print_text
back_67:
cmp r8, r7
jne fail_6
or r1, zr, text_5
or r12, zr, back_68
jmp print_text
back_68:
jmp done_6
fail_6:
add r9, r9, 1
or r1, zr, text_6
or r12, zr, back_69
jmp print_text
back_69:
done_6:
; Test 7: 0 mul 123 = 0
or r10, zr, 33632
or r5, zr, 0
or r6, zr, 123
or r7, zr, 0
or r8, zr, 42405
lsl r8, r8, 16
or r8, r8, 42405
mul r8, r5, 123
or r1, zr, text_12
or r12, zr, back_70
jmp print_text
back_70:
or r1, zr, r5
or r12, zr, back_71
jmp print_hex
back_71:
or r1, zr, text_4
or r12, zr, back_72
jmp print_text
back_72:
or r1, zr, r6
or r12, zr, back_73
jmp print_hex
back_73:
or r1, zr, text_4
or r12, zr, back_74
jmp print_text
back_74:
or r1, zr, r8
or r12, zr, back_75
jmp print_hex
back_75:
or r1, zr, text_4
or r12, zr, back_76
jmp print_text
back_76:
or r1, zr, r7
or r12, zr, back_77
jmp print_hex
back_77:
or r1, zr, text_4
or r12, zr, back_78
jmp print_text
back_78:
cmp r8, r7
jne fail_7
or r1, zr, text_5
or r12, zr, back_79
jmp print_text
back_79:
jmp done_7
fail_7:
add r9, r9, 1
or r1, zr, text_6
or r12, zr, back_80
jmp print_text
back_80:
done_7:
; Test 8: 1 mul 65535 = 65535
or r10, zr, 33728
or r5, zr, 1
or r6, zr, 65535
or r7, zr, 65535
or r8, zr, 42405
lsl r8, r8, 16
or r8, r8, 42405
mul r8, r5, 65535
or r1, zr, text_13
or r12, zr, back_81
jmp print_text
back_81:
or r1, zr, r5
or r12, zr, back_82
jmp print_hex
back_82:
or r1, zr, text_4
or r12, zr, back_83
jmp print_text
back_83:
or r1, zr, r6
or r12, zr, back_84
jmp print_hex
back_84:
or r1, zr, text_4
or r12, zr, back_85
jmp print_text
back_85:
or r1, zr, r8
or r12, zr, back_86
jmp print_hex
back_86:
or r1, zr, text_4
or r12, zr, back_87
jmp print_text
back_87:
or r1, zr, r7
or r12, zr, back_88
jmp print_hex
back_88:
or r1, zr, text_4
or r12, zr, back_89
jmp print_text
back_89:
cmp r8, r7
jne fail_8
or r1, zr, text_5
or r12, zr, back_90
jmp print_text
back_90:
jmp done_8
fail_8:
add r9, r9, 1
or r1, zr, text_6
or r12, zr, back_91
jmp print_text
back_91:
done_8:
; Test 9: 7 mul 9 = 63
or r10, zr, 33824
or r5, zr, 7
or r6, zr, 9
or r7, zr, 63
or r8, zr, 42405
lsl r8, r8, 16
or r8, r8, 42405
mul r8, r5, 9
or r1, zr, text_14
or r12, zr, back_92
jmp print_text
back_92:
or r1, zr, r5
or r12, zr, back_93
jmp print_hex
back_93:
or r1, zr, text_4
or r12, zr, back_94
jmp print_text
back_94:
or r1, zr, r6
or r12, zr, back_95
jmp print_hex
back_95:
or r1, zr, text_4
or r12, zr, back_96
jmp print_text
back_96:
or r1, zr, r8
or r12, zr, back_97
jmp print_hex
back_97:
or r1, zr, text_4
or r12, zr, back_98
jmp print_text
back_98:
or r1, zr, r7
or r12, zr, back_99
jmp print_hex
back_99:
or r1, zr, text_4
or r12, zr, back_100
jmp print_text
back_100:
cmp r8, r7
jne fail_9
or r1, zr, text_5
or r12, zr, back_101
jmp print_text
back_101:
jmp done_9
fail_9:
add r9, r9, 1
or r1, zr, text_6
or r12, zr, back_102
jmp print_text
back_102:
done_9:
; Test 10: 255 mul 257 = 65535
or r10, zr, 33920
or r5, zr, 255
or r6, zr, 257
or r7, zr, 65535
or r8, zr, 42405
lsl r8, r8, 16
or r8, r8, 42405
mul r8, r5, 257
or r1, zr, text_15
or r12, zr, back_103
jmp print_text
back_103:
or r1, zr, r5
or r12, zr, back_104
jmp print_hex
back_104:
or r1, zr, text_4
or r12, zr, back_105
jmp print_text
back_105:
or r1, zr, r6
or r12, zr, back_106
jmp print_hex
back_106:
or r1, zr, text_4
or r12, zr, back_107
jmp print_text
back_107:
or r1, zr, r8
or r12, zr, back_108
jmp print_hex
back_108:
or r1, zr, text_4
or r12, zr, back_109
jmp print_text
back_109:
or r1, zr, r7
or r12, zr, back_110
jmp print_hex
back_110:
or r1, zr, text_4
or r12, zr, back_111
jmp print_text
back_111:
cmp r8, r7
jne fail_10
or r1, zr, text_5
or r12, zr, back_112
jmp print_text
back_112:
jmp done_10
fail_10:
add r9, r9, 1
or r1, zr, text_6
or r12, zr, back_113
jmp print_text
back_113:
done_10:
; Test 11: 65535 mul 65535 = 4294836225
or r10, zr, 34016
or r5, zr, 65535
or r6, zr, 65535
or r7, zr, 65534
lsl r7, r7, 16
or r7, r7, 1
or r8, zr, 42405
lsl r8, r8, 16
or r8, r8, 42405
mul r8, r5, 65535
or r1, zr, text_16
or r12, zr, back_114
jmp print_text
back_114:
or r1, zr, r5
or r12, zr, back_115
jmp print_hex
back_115:
or r1, zr, text_4
or r12, zr, back_116
jmp print_text
back_116:
or r1, zr, r6
or r12, zr, back_117
jmp print_hex
back_117:
or r1, zr, text_4
or r12, zr, back_118
jmp print_text
back_118:
or r1, zr, r8
or r12, zr, back_119
jmp print_hex
back_119:
or r1, zr, text_4
or r12, zr, back_120
jmp print_text
back_120:
or r1, zr, r7
or r12, zr, back_121
jmp print_hex
back_121:
or r1, zr, text_4
or r12, zr, back_122
jmp print_text
back_122:
cmp r8, r7
jne fail_11
or r1, zr, text_5
or r12, zr, back_123
jmp print_text
back_123:
jmp done_11
fail_11:
add r9, r9, 1
or r1, zr, text_6
or r12, zr, back_124
jmp print_text
back_124:
done_11:
; Test 12: 305419896 mul 4660 = 1622540384
or r10, zr, 34112
or r5, zr, 4660
lsl r5, r5, 16
or r5, r5, 22136
or r6, zr, 4660
or r7, zr, 24758
lsl r7, r7, 16
or r7, r7, 96
or r8, zr, 42405
lsl r8, r8, 16
or r8, r8, 42405
mul r8, r5, 4660
or r1, zr, text_17
or r12, zr, back_125
jmp print_text
back_125:
or r1, zr, r5
or r12, zr, back_126
jmp print_hex
back_126:
or r1, zr, text_4
or r12, zr, back_127
jmp print_text
back_127:
or r1, zr, r6
or r12, zr, back_128
jmp print_hex
back_128:
or r1, zr, text_4
or r12, zr, back_129
jmp print_text
back_129:
or r1, zr, r8
or r12, zr, back_130
jmp print_hex
back_130:
or r1, zr, text_4
or r12, zr, back_131
jmp print_text
back_131:
or r1, zr, r7
or r12, zr, back_132
jmp print_hex
back_132:
or r1, zr, text_4
or r12, zr, back_133
jmp print_text
back_133:
cmp r8, r7
jne fail_12
or r1, zr, text_5
or r12, zr, back_134
jmp print_text
back_134:
jmp done_12
fail_12:
add r9, r9, 1
or r1, zr, text_6
or r12, zr, back_135
jmp print_text
back_135:
done_12:
; Test 13: 0 div 7 = 0
or r10, zr, 34208
or r5, zr, 0
or r6, zr, 7
or r7, zr, 0
or r8, zr, 42405
lsl r8, r8, 16
or r8, r8, 42405
div r8, r5, r6
or r1, zr, text_18
or r12, zr, back_136
jmp print_text
back_136:
or r1, zr, r5
or r12, zr, back_137
jmp print_hex
back_137:
or r1, zr, text_4
or r12, zr, back_138
jmp print_text
back_138:
or r1, zr, r6
or r12, zr, back_139
jmp print_hex
back_139:
or r1, zr, text_4
or r12, zr, back_140
jmp print_text
back_140:
or r1, zr, r8
or r12, zr, back_141
jmp print_hex
back_141:
or r1, zr, text_4
or r12, zr, back_142
jmp print_text
back_142:
or r1, zr, r7
or r12, zr, back_143
jmp print_hex
back_143:
or r1, zr, text_4
or r12, zr, back_144
jmp print_text
back_144:
cmp r8, r7
jne fail_13
or r1, zr, text_5
or r12, zr, back_145
jmp print_text
back_145:
jmp done_13
fail_13:
add r9, r9, 1
or r1, zr, text_6
or r12, zr, back_146
jmp print_text
back_146:
done_13:
; Test 14: 1 div 1 = 1
or r10, zr, 34304
or r5, zr, 1
or r6, zr, 1
or r7, zr, 1
or r8, zr, 42405
lsl r8, r8, 16
or r8, r8, 42405
div r8, r5, r6
or r1, zr, text_19
or r12, zr, back_147
jmp print_text
back_147:
or r1, zr, r5
or r12, zr, back_148
jmp print_hex
back_148:
or r1, zr, text_4
or r12, zr, back_149
jmp print_text
back_149:
or r1, zr, r6
or r12, zr, back_150
jmp print_hex
back_150:
or r1, zr, text_4
or r12, zr, back_151
jmp print_text
back_151:
or r1, zr, r8
or r12, zr, back_152
jmp print_hex
back_152:
or r1, zr, text_4
or r12, zr, back_153
jmp print_text
back_153:
or r1, zr, r7
or r12, zr, back_154
jmp print_hex
back_154:
or r1, zr, text_4
or r12, zr, back_155
jmp print_text
back_155:
cmp r8, r7
jne fail_14
or r1, zr, text_5
or r12, zr, back_156
jmp print_text
back_156:
jmp done_14
fail_14:
add r9, r9, 1
or r1, zr, text_6
or r12, zr, back_157
jmp print_text
back_157:
done_14:
; Test 15: 7 div 3 = 2
or r10, zr, 34400
or r5, zr, 7
or r6, zr, 3
or r7, zr, 2
or r8, zr, 42405
lsl r8, r8, 16
or r8, r8, 42405
div r8, r5, r6
or r1, zr, text_20
or r12, zr, back_158
jmp print_text
back_158:
or r1, zr, r5
or r12, zr, back_159
jmp print_hex
back_159:
or r1, zr, text_4
or r12, zr, back_160
jmp print_text
back_160:
or r1, zr, r6
or r12, zr, back_161
jmp print_hex
back_161:
or r1, zr, text_4
or r12, zr, back_162
jmp print_text
back_162:
or r1, zr, r8
or r12, zr, back_163
jmp print_hex
back_163:
or r1, zr, text_4
or r12, zr, back_164
jmp print_text
back_164:
or r1, zr, r7
or r12, zr, back_165
jmp print_hex
back_165:
or r1, zr, text_4
or r12, zr, back_166
jmp print_text
back_166:
cmp r8, r7
jne fail_15
or r1, zr, text_5
or r12, zr, back_167
jmp print_text
back_167:
jmp done_15
fail_15:
add r9, r9, 1
or r1, zr, text_6
or r12, zr, back_168
jmp print_text
back_168:
done_15:
; Test 16: 3 div 7 = 0
or r10, zr, 34496
or r5, zr, 3
or r6, zr, 7
or r7, zr, 0
or r8, zr, 42405
lsl r8, r8, 16
or r8, r8, 42405
div r8, r5, r6
or r1, zr, text_21
or r12, zr, back_169
jmp print_text
back_169:
or r1, zr, r5
or r12, zr, back_170
jmp print_hex
back_170:
or r1, zr, text_4
or r12, zr, back_171
jmp print_text
back_171:
or r1, zr, r6
or r12, zr, back_172
jmp print_hex
back_172:
or r1, zr, text_4
or r12, zr, back_173
jmp print_text
back_173:
or r1, zr, r8
or r12, zr, back_174
jmp print_hex
back_174:
or r1, zr, text_4
or r12, zr, back_175
jmp print_text
back_175:
or r1, zr, r7
or r12, zr, back_176
jmp print_hex
back_176:
or r1, zr, text_4
or r12, zr, back_177
jmp print_text
back_177:
cmp r8, r7
jne fail_16
or r1, zr, text_5
or r12, zr, back_178
jmp print_text
back_178:
jmp done_16
fail_16:
add r9, r9, 1
or r1, zr, text_6
or r12, zr, back_179
jmp print_text
back_179:
done_16:
; Test 17: 65535 div 255 = 257
or r10, zr, 34592
or r5, zr, 65535
or r6, zr, 255
or r7, zr, 257
or r8, zr, 42405
lsl r8, r8, 16
or r8, r8, 42405
div r8, r5, r6
or r1, zr, text_22
or r12, zr, back_180
jmp print_text
back_180:
or r1, zr, r5
or r12, zr, back_181
jmp print_hex
back_181:
or r1, zr, text_4
or r12, zr, back_182
jmp print_text
back_182:
or r1, zr, r6
or r12, zr, back_183
jmp print_hex
back_183:
or r1, zr, text_4
or r12, zr, back_184
jmp print_text
back_184:
or r1, zr, r8
or r12, zr, back_185
jmp print_hex
back_185:
or r1, zr, text_4
or r12, zr, back_186
jmp print_text
back_186:
or r1, zr, r7
or r12, zr, back_187
jmp print_hex
back_187:
or r1, zr, text_4
or r12, zr, back_188
jmp print_text
back_188:
cmp r8, r7
jne fail_17
or r1, zr, text_5
or r12, zr, back_189
jmp print_text
back_189:
jmp done_17
fail_17:
add r9, r9, 1
or r1, zr, text_6
or r12, zr, back_190
jmp print_text
back_190:
done_17:
; Test 18: 2147483647 div 65535 = 32768
or r10, zr, 34688
or r5, zr, 32767
lsl r5, r5, 16
or r5, r5, 65535
or r6, zr, 65535
or r7, zr, 32768
or r8, zr, 42405
lsl r8, r8, 16
or r8, r8, 42405
div r8, r5, r6
or r1, zr, text_23
or r12, zr, back_191
jmp print_text
back_191:
or r1, zr, r5
or r12, zr, back_192
jmp print_hex
back_192:
or r1, zr, text_4
or r12, zr, back_193
jmp print_text
back_193:
or r1, zr, r6
or r12, zr, back_194
jmp print_hex
back_194:
or r1, zr, text_4
or r12, zr, back_195
jmp print_text
back_195:
or r1, zr, r8
or r12, zr, back_196
jmp print_hex
back_196:
or r1, zr, text_4
or r12, zr, back_197
jmp print_text
back_197:
or r1, zr, r7
or r12, zr, back_198
jmp print_hex
back_198:
or r1, zr, text_4
or r12, zr, back_199
jmp print_text
back_199:
cmp r8, r7
jne fail_18
or r1, zr, text_5
or r12, zr, back_200
jmp print_text
back_200:
jmp done_18
fail_18:
add r9, r9, 1
or r1, zr, text_6
or r12, zr, back_201
jmp print_text
back_201:
done_18:
; Test 19: 0 div 7 = 0
or r10, zr, 34784
or r5, zr, 0
or r6, zr, 7
or r7, zr, 0
or r8, zr, 42405
lsl r8, r8, 16
or r8, r8, 42405
div r8, r5, 7
or r1, zr, text_24
or r12, zr, back_202
jmp print_text
back_202:
or r1, zr, r5
or r12, zr, back_203
jmp print_hex
back_203:
or r1, zr, text_4
or r12, zr, back_204
jmp print_text
back_204:
or r1, zr, r6
or r12, zr, back_205
jmp print_hex
back_205:
or r1, zr, text_4
or r12, zr, back_206
jmp print_text
back_206:
or r1, zr, r8
or r12, zr, back_207
jmp print_hex
back_207:
or r1, zr, text_4
or r12, zr, back_208
jmp print_text
back_208:
or r1, zr, r7
or r12, zr, back_209
jmp print_hex
back_209:
or r1, zr, text_4
or r12, zr, back_210
jmp print_text
back_210:
cmp r8, r7
jne fail_19
or r1, zr, text_5
or r12, zr, back_211
jmp print_text
back_211:
jmp done_19
fail_19:
add r9, r9, 1
or r1, zr, text_6
or r12, zr, back_212
jmp print_text
back_212:
done_19:
; Test 20: 1 div 1 = 1
or r10, zr, 34880
or r5, zr, 1
or r6, zr, 1
or r7, zr, 1
or r8, zr, 42405
lsl r8, r8, 16
or r8, r8, 42405
div r8, r5, 1
or r1, zr, text_25
or r12, zr, back_213
jmp print_text
back_213:
or r1, zr, r5
or r12, zr, back_214
jmp print_hex
back_214:
or r1, zr, text_4
or r12, zr, back_215
jmp print_text
back_215:
or r1, zr, r6
or r12, zr, back_216
jmp print_hex
back_216:
or r1, zr, text_4
or r12, zr, back_217
jmp print_text
back_217:
or r1, zr, r8
or r12, zr, back_218
jmp print_hex
back_218:
or r1, zr, text_4
or r12, zr, back_219
jmp print_text
back_219:
or r1, zr, r7
or r12, zr, back_220
jmp print_hex
back_220:
or r1, zr, text_4
or r12, zr, back_221
jmp print_text
back_221:
cmp r8, r7
jne fail_20
or r1, zr, text_5
or r12, zr, back_222
jmp print_text
back_222:
jmp done_20
fail_20:
add r9, r9, 1
or r1, zr, text_6
or r12, zr, back_223
jmp print_text
back_223:
done_20:
; Test 21: 7 div 3 = 2
or r10, zr, 34976
or r5, zr, 7
or r6, zr, 3
or r7, zr, 2
or r8, zr, 42405
lsl r8, r8, 16
or r8, r8, 42405
div r8, r5, 3
or r1, zr, text_26
or r12, zr, back_224
jmp print_text
back_224:
or r1, zr, r5
or r12, zr, back_225
jmp print_hex
back_225:
or r1, zr, text_4
or r12, zr, back_226
jmp print_text
back_226:
or r1, zr, r6
or r12, zr, back_227
jmp print_hex
back_227:
or r1, zr, text_4
or r12, zr, back_228
jmp print_text
back_228:
or r1, zr, r8
or r12, zr, back_229
jmp print_hex
back_229:
or r1, zr, text_4
or r12, zr, back_230
jmp print_text
back_230:
or r1, zr, r7
or r12, zr, back_231
jmp print_hex
back_231:
or r1, zr, text_4
or r12, zr, back_232
jmp print_text
back_232:
cmp r8, r7
jne fail_21
or r1, zr, text_5
or r12, zr, back_233
jmp print_text
back_233:
jmp done_21
fail_21:
add r9, r9, 1
or r1, zr, text_6
or r12, zr, back_234
jmp print_text
back_234:
done_21:
; Test 22: 3 div 7 = 0
or r10, zr, 35072
or r5, zr, 3
or r6, zr, 7
or r7, zr, 0
or r8, zr, 42405
lsl r8, r8, 16
or r8, r8, 42405
div r8, r5, 7
or r1, zr, text_27
or r12, zr, back_235
jmp print_text
back_235:
or r1, zr, r5
or r12, zr, back_236
jmp print_hex
back_236:
or r1, zr, text_4
or r12, zr, back_237
jmp print_text
back_237:
or r1, zr, r6
or r12, zr, back_238
jmp print_hex
back_238:
or r1, zr, text_4
or r12, zr, back_239
jmp print_text
back_239:
or r1, zr, r8
or r12, zr, back_240
jmp print_hex
back_240:
or r1, zr, text_4
or r12, zr, back_241
jmp print_text
back_241:
or r1, zr, r7
or r12, zr, back_242
jmp print_hex
back_242:
or r1, zr, text_4
or r12, zr, back_243
jmp print_text
back_243:
cmp r8, r7
jne fail_22
or r1, zr, text_5
or r12, zr, back_244
jmp print_text
back_244:
jmp done_22
fail_22:
add r9, r9, 1
or r1, zr, text_6
or r12, zr, back_245
jmp print_text
back_245:
done_22:
; Test 23: 65535 div 255 = 257
or r10, zr, 35168
or r5, zr, 65535
or r6, zr, 255
or r7, zr, 257
or r8, zr, 42405
lsl r8, r8, 16
or r8, r8, 42405
div r8, r5, 255
or r1, zr, text_28
or r12, zr, back_246
jmp print_text
back_246:
or r1, zr, r5
or r12, zr, back_247
jmp print_hex
back_247:
or r1, zr, text_4
or r12, zr, back_248
jmp print_text
back_248:
or r1, zr, r6
or r12, zr, back_249
jmp print_hex
back_249:
or r1, zr, text_4
or r12, zr, back_250
jmp print_text
back_250:
or r1, zr, r8
or r12, zr, back_251
jmp print_hex
back_251:
or r1, zr, text_4
or r12, zr, back_252
jmp print_text
back_252:
or r1, zr, r7
or r12, zr, back_253
jmp print_hex
back_253:
or r1, zr, text_4
or r12, zr, back_254
jmp print_text
back_254:
cmp r8, r7
jne fail_23
or r1, zr, text_5
or r12, zr, back_255
jmp print_text
back_255:
jmp done_23
fail_23:
add r9, r9, 1
or r1, zr, text_6
or r12, zr, back_256
jmp print_text
back_256:
done_23:
; Test 24: 2147483647 div 65535 = 32768
or r10, zr, 35264
or r5, zr, 32767
lsl r5, r5, 16
or r5, r5, 65535
or r6, zr, 65535
or r7, zr, 32768
or r8, zr, 42405
lsl r8, r8, 16
or r8, r8, 42405
div r8, r5, 65535
or r1, zr, text_29
or r12, zr, back_257
jmp print_text
back_257:
or r1, zr, r5
or r12, zr, back_258
jmp print_hex
back_258:
or r1, zr, text_4
or r12, zr, back_259
jmp print_text
back_259:
or r1, zr, r6
or r12, zr, back_260
jmp print_hex
back_260:
or r1, zr, text_4
or r12, zr, back_261
jmp print_text
back_261:
or r1, zr, r8
or r12, zr, back_262
jmp print_hex
back_262:
or r1, zr, text_4
or r12, zr, back_263
jmp print_text
back_263:
or r1, zr, r7
or r12, zr, back_264
jmp print_hex
back_264:
or r1, zr, text_4
or r12, zr, back_265
jmp print_text
back_265:
cmp r8, r7
jne fail_24
or r1, zr, text_5
or r12, zr, back_266
jmp print_text
back_266:
jmp done_24
fail_24:
add r9, r9, 1
or r1, zr, text_6
or r12, zr, back_267
jmp print_text
back_267:
done_24:
; Test 25: 0 mod 7 = 0
or r10, zr, 35360
or r5, zr, 0
or r6, zr, 7
or r7, zr, 0
or r8, zr, 42405
lsl r8, r8, 16
or r8, r8, 42405
mod r8, r5, r6
or r1, zr, text_30
or r12, zr, back_268
jmp print_text
back_268:
or r1, zr, r5
or r12, zr, back_269
jmp print_hex
back_269:
or r1, zr, text_4
or r12, zr, back_270
jmp print_text
back_270:
or r1, zr, r6
or r12, zr, back_271
jmp print_hex
back_271:
or r1, zr, text_4
or r12, zr, back_272
jmp print_text
back_272:
or r1, zr, r8
or r12, zr, back_273
jmp print_hex
back_273:
or r1, zr, text_4
or r12, zr, back_274
jmp print_text
back_274:
or r1, zr, r7
or r12, zr, back_275
jmp print_hex
back_275:
or r1, zr, text_4
or r12, zr, back_276
jmp print_text
back_276:
cmp r8, r7
jne fail_25
or r1, zr, text_5
or r12, zr, back_277
jmp print_text
back_277:
jmp done_25
fail_25:
add r9, r9, 1
or r1, zr, text_6
or r12, zr, back_278
jmp print_text
back_278:
done_25:
; Test 26: 1 mod 1 = 0
or r10, zr, 35456
or r5, zr, 1
or r6, zr, 1
or r7, zr, 0
or r8, zr, 42405
lsl r8, r8, 16
or r8, r8, 42405
mod r8, r5, r6
or r1, zr, text_31
or r12, zr, back_279
jmp print_text
back_279:
or r1, zr, r5
or r12, zr, back_280
jmp print_hex
back_280:
or r1, zr, text_4
or r12, zr, back_281
jmp print_text
back_281:
or r1, zr, r6
or r12, zr, back_282
jmp print_hex
back_282:
or r1, zr, text_4
or r12, zr, back_283
jmp print_text
back_283:
or r1, zr, r8
or r12, zr, back_284
jmp print_hex
back_284:
or r1, zr, text_4
or r12, zr, back_285
jmp print_text
back_285:
or r1, zr, r7
or r12, zr, back_286
jmp print_hex
back_286:
or r1, zr, text_4
or r12, zr, back_287
jmp print_text
back_287:
cmp r8, r7
jne fail_26
or r1, zr, text_5
or r12, zr, back_288
jmp print_text
back_288:
jmp done_26
fail_26:
add r9, r9, 1
or r1, zr, text_6
or r12, zr, back_289
jmp print_text
back_289:
done_26:
; Test 27: 7 mod 3 = 1
or r10, zr, 35552
or r5, zr, 7
or r6, zr, 3
or r7, zr, 1
or r8, zr, 42405
lsl r8, r8, 16
or r8, r8, 42405
mod r8, r5, r6
or r1, zr, text_32
or r12, zr, back_290
jmp print_text
back_290:
or r1, zr, r5
or r12, zr, back_291
jmp print_hex
back_291:
or r1, zr, text_4
or r12, zr, back_292
jmp print_text
back_292:
or r1, zr, r6
or r12, zr, back_293
jmp print_hex
back_293:
or r1, zr, text_4
or r12, zr, back_294
jmp print_text
back_294:
or r1, zr, r8
or r12, zr, back_295
jmp print_hex
back_295:
or r1, zr, text_4
or r12, zr, back_296
jmp print_text
back_296:
or r1, zr, r7
or r12, zr, back_297
jmp print_hex
back_297:
or r1, zr, text_4
or r12, zr, back_298
jmp print_text
back_298:
cmp r8, r7
jne fail_27
or r1, zr, text_5
or r12, zr, back_299
jmp print_text
back_299:
jmp done_27
fail_27:
add r9, r9, 1
or r1, zr, text_6
or r12, zr, back_300
jmp print_text
back_300:
done_27:
; Test 28: 3 mod 7 = 3
or r10, zr, 35648
or r5, zr, 3
or r6, zr, 7
or r7, zr, 3
or r8, zr, 42405
lsl r8, r8, 16
or r8, r8, 42405
mod r8, r5, r6
or r1, zr, text_33
or r12, zr, back_301
jmp print_text
back_301:
or r1, zr, r5
or r12, zr, back_302
jmp print_hex
back_302:
or r1, zr, text_4
or r12, zr, back_303
jmp print_text
back_303:
or r1, zr, r6
or r12, zr, back_304
jmp print_hex
back_304:
or r1, zr, text_4
or r12, zr, back_305
jmp print_text
back_305:
or r1, zr, r8
or r12, zr, back_306
jmp print_hex
back_306:
or r1, zr, text_4
or r12, zr, back_307
jmp print_text
back_307:
or r1, zr, r7
or r12, zr, back_308
jmp print_hex
back_308:
or r1, zr, text_4
or r12, zr, back_309
jmp print_text
back_309:
cmp r8, r7
jne fail_28
or r1, zr, text_5
or r12, zr, back_310
jmp print_text
back_310:
jmp done_28
fail_28:
add r9, r9, 1
or r1, zr, text_6
or r12, zr, back_311
jmp print_text
back_311:
done_28:
; Test 29: 65535 mod 255 = 0
or r10, zr, 35744
or r5, zr, 65535
or r6, zr, 255
or r7, zr, 0
or r8, zr, 42405
lsl r8, r8, 16
or r8, r8, 42405
mod r8, r5, r6
or r1, zr, text_34
or r12, zr, back_312
jmp print_text
back_312:
or r1, zr, r5
or r12, zr, back_313
jmp print_hex
back_313:
or r1, zr, text_4
or r12, zr, back_314
jmp print_text
back_314:
or r1, zr, r6
or r12, zr, back_315
jmp print_hex
back_315:
or r1, zr, text_4
or r12, zr, back_316
jmp print_text
back_316:
or r1, zr, r8
or r12, zr, back_317
jmp print_hex
back_317:
or r1, zr, text_4
or r12, zr, back_318
jmp print_text
back_318:
or r1, zr, r7
or r12, zr, back_319
jmp print_hex
back_319:
or r1, zr, text_4
or r12, zr, back_320
jmp print_text
back_320:
cmp r8, r7
jne fail_29
or r1, zr, text_5
or r12, zr, back_321
jmp print_text
back_321:
jmp done_29
fail_29:
add r9, r9, 1
or r1, zr, text_6
or r12, zr, back_322
jmp print_text
back_322:
done_29:
; Test 30: 2147483647 mod 65535 = 32767
or r10, zr, 35840
or r5, zr, 32767
lsl r5, r5, 16
or r5, r5, 65535
or r6, zr, 65535
or r7, zr, 32767
or r8, zr, 42405
lsl r8, r8, 16
or r8, r8, 42405
mod r8, r5, r6
or r1, zr, text_35
or r12, zr, back_323
jmp print_text
back_323:
or r1, zr, r5
or r12, zr, back_324
jmp print_hex
back_324:
or r1, zr, text_4
or r12, zr, back_325
jmp print_text
back_325:
or r1, zr, r6
or r12, zr, back_326
jmp print_hex
back_326:
or r1, zr, text_4
or r12, zr, back_327
jmp print_text
back_327:
or r1, zr, r8
or r12, zr, back_328
jmp print_hex
back_328:
or r1, zr, text_4
or r12, zr, back_329
jmp print_text
back_329:
or r1, zr, r7
or r12, zr, back_330
jmp print_hex
back_330:
or r1, zr, text_4
or r12, zr, back_331
jmp print_text
back_331:
cmp r8, r7
jne fail_30
or r1, zr, text_5
or r12, zr, back_332
jmp print_text
back_332:
jmp done_30
fail_30:
add r9, r9, 1
or r1, zr, text_6
or r12, zr, back_333
jmp print_text
back_333:
done_30:
; Test 31: 0 mod 7 = 0
or r10, zr, 35936
or r5, zr, 0
or r6, zr, 7
or r7, zr, 0
or r8, zr, 42405
lsl r8, r8, 16
or r8, r8, 42405
mod r8, r5, 7
or r1, zr, text_36
or r12, zr, back_334
jmp print_text
back_334:
or r1, zr, r5
or r12, zr, back_335
jmp print_hex
back_335:
or r1, zr, text_4
or r12, zr, back_336
jmp print_text
back_336:
or r1, zr, r6
or r12, zr, back_337
jmp print_hex
back_337:
or r1, zr, text_4
or r12, zr, back_338
jmp print_text
back_338:
or r1, zr, r8
or r12, zr, back_339
jmp print_hex
back_339:
or r1, zr, text_4
or r12, zr, back_340
jmp print_text
back_340:
or r1, zr, r7
or r12, zr, back_341
jmp print_hex
back_341:
or r1, zr, text_4
or r12, zr, back_342
jmp print_text
back_342:
cmp r8, r7
jne fail_31
or r1, zr, text_5
or r12, zr, back_343
jmp print_text
back_343:
jmp done_31
fail_31:
add r9, r9, 1
or r1, zr, text_6
or r12, zr, back_344
jmp print_text
back_344:
done_31:
; Test 32: 1 mod 1 = 0
or r10, zr, 36032
or r5, zr, 1
or r6, zr, 1
or r7, zr, 0
or r8, zr, 42405
lsl r8, r8, 16
or r8, r8, 42405
mod r8, r5, 1
or r1, zr, text_37
or r12, zr, back_345
jmp print_text
back_345:
or r1, zr, r5
or r12, zr, back_346
jmp print_hex
back_346:
or r1, zr, text_4
or r12, zr, back_347
jmp print_text
back_347:
or r1, zr, r6
or r12, zr, back_348
jmp print_hex
back_348:
or r1, zr, text_4
or r12, zr, back_349
jmp print_text
back_349:
or r1, zr, r8
or r12, zr, back_350
jmp print_hex
back_350:
or r1, zr, text_4
or r12, zr, back_351
jmp print_text
back_351:
or r1, zr, r7
or r12, zr, back_352
jmp print_hex
back_352:
or r1, zr, text_4
or r12, zr, back_353
jmp print_text
back_353:
cmp r8, r7
jne fail_32
or r1, zr, text_5
or r12, zr, back_354
jmp print_text
back_354:
jmp done_32
fail_32:
add r9, r9, 1
or r1, zr, text_6
or r12, zr, back_355
jmp print_text
back_355:
done_32:
; Test 33: 7 mod 3 = 1
or r10, zr, 36128
or r5, zr, 7
or r6, zr, 3
or r7, zr, 1
or r8, zr, 42405
lsl r8, r8, 16
or r8, r8, 42405
mod r8, r5, 3
or r1, zr, text_38
or r12, zr, back_356
jmp print_text
back_356:
or r1, zr, r5
or r12, zr, back_357
jmp print_hex
back_357:
or r1, zr, text_4
or r12, zr, back_358
jmp print_text
back_358:
or r1, zr, r6
or r12, zr, back_359
jmp print_hex
back_359:
or r1, zr, text_4
or r12, zr, back_360
jmp print_text
back_360:
or r1, zr, r8
or r12, zr, back_361
jmp print_hex
back_361:
or r1, zr, text_4
or r12, zr, back_362
jmp print_text
back_362:
or r1, zr, r7
or r12, zr, back_363
jmp print_hex
back_363:
or r1, zr, text_4
or r12, zr, back_364
jmp print_text
back_364:
cmp r8, r7
jne fail_33
or r1, zr, text_5
or r12, zr, back_365
jmp print_text
back_365:
jmp done_33
fail_33:
add r9, r9, 1
or r1, zr, text_6
or r12, zr, back_366
jmp print_text
back_366:
done_33:
; Test 34: 3 mod 7 = 3
or r10, zr, 36224
or r5, zr, 3
or r6, zr, 7
or r7, zr, 3
or r8, zr, 42405
lsl r8, r8, 16
or r8, r8, 42405
mod r8, r5, 7
or r1, zr, text_39
or r12, zr, back_367
jmp print_text
back_367:
or r1, zr, r5
or r12, zr, back_368
jmp print_hex
back_368:
or r1, zr, text_4
or r12, zr, back_369
jmp print_text
back_369:
or r1, zr, r6
or r12, zr, back_370
jmp print_hex
back_370:
or r1, zr, text_4
or r12, zr, back_371
jmp print_text
back_371:
or r1, zr, r8
or r12, zr, back_372
jmp print_hex
back_372:
or r1, zr, text_4
or r12, zr, back_373
jmp print_text
back_373:
or r1, zr, r7
or r12, zr, back_374
jmp print_hex
back_374:
or r1, zr, text_4
or r12, zr, back_375
jmp print_text
back_375:
cmp r8, r7
jne fail_34
or r1, zr, text_5
or r12, zr, back_376
jmp print_text
back_376:
jmp done_34
fail_34:
add r9, r9, 1
or r1, zr, text_6
or r12, zr, back_377
jmp print_text
back_377:
done_34:
; Test 35: 65535 mod 255 = 0
or r10, zr, 36320
or r5, zr, 65535
or r6, zr, 255
or r7, zr, 0
or r8, zr, 42405
lsl r8, r8, 16
or r8, r8, 42405
mod r8, r5, 255
or r1, zr, text_40
or r12, zr, back_378
jmp print_text
back_378:
or r1, zr, r5
or r12, zr, back_379
jmp print_hex
back_379:
or r1, zr, text_4
or r12, zr, back_380
jmp print_text
back_380:
or r1, zr, r6
or r12, zr, back_381
jmp print_hex
back_381:
or r1, zr, text_4
or r12, zr, back_382
jmp print_text
back_382:
or r1, zr, r8
or r12, zr, back_383
jmp print_hex
back_383:
or r1, zr, text_4
or r12, zr, back_384
jmp print_text
back_384:
or r1, zr, r7
or r12, zr, back_385
jmp print_hex
back_385:
or r1, zr, text_4
or r12, zr, back_386
jmp print_text
back_386:
cmp r8, r7
jne fail_35
or r1, zr, text_5
or r12, zr, back_387
jmp print_text
back_387:
jmp done_35
fail_35:
add r9, r9, 1
or r1, zr, text_6
or r12, zr, back_388
jmp print_text
back_388:
done_35:
; Test 36: 2147483647 mod 65535 = 32767
or r10, zr, 36416
or r5, zr, 32767
lsl r5, r5, 16
or r5, r5, 65535
or r6, zr, 65535
or r7, zr, 32767
or r8, zr, 42405
lsl r8, r8, 16
or r8, r8, 42405
mod r8, r5, 65535
or r1, zr, text_41
or r12, zr, back_389
jmp print_text
back_389:
or r1, zr, r5
or r12, zr, back_390
jmp print_hex
back_390:
or r1, zr, text_4
or r12, zr, back_391
jmp print_text
back_391:
or r1, zr, r6
or r12, zr, back_392
jmp print_hex
back_392:
or r1, zr, text_4
or r12, zr, back_393
jmp print_text
back_393:
or r1, zr, r8
or r12, zr, back_394
jmp print_hex
back_394:
or r1, zr, text_4
or r12, zr, back_395
jmp print_text
back_395:
or r1, zr, r7
or r12, zr, back_396
jmp print_hex
back_396:
or r1, zr, text_4
or r12, zr, back_397
jmp print_text
back_397:
cmp r8, r7
jne fail_36
or r1, zr, text_5
or r12, zr, back_398
jmp print_text
back_398:
jmp done_36
fail_36:
add r9, r9, 1
or r1, zr, text_6
or r12, zr, back_399
jmp print_text
back_399:
done_36:
or r10, zr, 36512
cmp r9, 0
jne some_failed
or r1, zr, text_42
or r12, zr, back_400
jmp print_text
back_400:
jmp finished
some_failed:
or r1, zr, text_43
or r12, zr, back_401
jmp print_text
back_401:
or r1, zr, r9
or r12, zr, back_402
jmp print_hex
back_402:
or r1, zr, text_44
or r12, zr, back_403
jmp print_text
back_403:
finished:
jmp finished

; Print zero-terminated text: r1 pointer; preserves r5-r9.
print_text:
load_8 r2, [r1]
cmp r2, 0
je text_return
store_8 [r10], r2
add r10, r10, 1
add r1, r1, 1
jmp print_text
text_return:
jmp r12

; Print exactly eight hex digits without multiplication/division/modulo.
print_hex:
or r2, zr, 28
hex_loop:
lsr r3, r1, r2
and r3, r3, 15
cmp r3, 10
jb hex_digit
add r3, r3, 55
jmp hex_write
hex_digit:
add r3, r3, 48
hex_write:
store_8 [r10], r3
add r10, r10, 1
cmp r2, 0
je hex_return
sub r2, r2, 4
jmp hex_loop
hex_return:
jmp r12

text_0:
"ALU 12 MUL / 13 DIV / 14 MOD - 36 TESTS (HEX)\0"
text_1:
"R=register I=immediate; DIV/MOD nonnegative; MUL low 32 bits\0"
text_2:
"ID OP  F A        B        ACTUAL   EXPECTED STATUS\0"
text_3:
"01 MUL R \0"
text_4:
" \0"
text_5:
"PASS\0"
text_6:
"FAIL\0"
text_7:
"02 MUL R \0"
text_8:
"03 MUL R \0"
text_9:
"04 MUL R \0"
text_10:
"05 MUL R \0"
text_11:
"06 MUL R \0"
text_12:
"07 MUL I \0"
text_13:
"08 MUL I \0"
text_14:
"09 MUL I \0"
text_15:
"10 MUL I \0"
text_16:
"11 MUL I \0"
text_17:
"12 MUL I \0"
text_18:
"13 DIV R \0"
text_19:
"14 DIV R \0"
text_20:
"15 DIV R \0"
text_21:
"16 DIV R \0"
text_22:
"17 DIV R \0"
text_23:
"18 DIV R \0"
text_24:
"19 DIV I \0"
text_25:
"20 DIV I \0"
text_26:
"21 DIV I \0"
text_27:
"22 DIV I \0"
text_28:
"23 DIV I \0"
text_29:
"24 DIV I \0"
text_30:
"25 MOD R \0"
text_31:
"26 MOD R \0"
text_32:
"27 MOD R \0"
text_33:
"28 MOD R \0"
text_34:
"29 MOD R \0"
text_35:
"30 MOD R \0"
text_36:
"31 MOD I \0"
text_37:
"32 MOD I \0"
text_38:
"33 MOD I \0"
text_39:
"34 MOD I \0"
text_40:
"35 MOD I \0"
text_41:
"36 MOD I \0"
text_42:
"ALL 36 PASS - DONE\0"
text_43:
"FAILURES: 0x\0"
text_44:
" / 36 - DONE; inspect FAIL rows above\0"
