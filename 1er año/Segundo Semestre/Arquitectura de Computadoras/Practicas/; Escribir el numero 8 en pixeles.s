; Escribir el numero 8 en pixeles

.data
PIXEL1: .byte 255, 0, 0, 0, 1, 2, 0, 0
PIXEL2: .byte 255, 0, 0, 0, 1, 3, 0, 0
PIXEL3: .byte 255, 0, 0, 0, 1, 4, 0, 0
PIXEL4: .byte 255, 0, 0, 0, 2, 1, 0, 0
PIXEL5: .byte 255, 0, 0, 0, 2, 5, 0, 0
PIXEL6: .byte 255, 0, 0, 0, 3, 1, 0, 0
PIXEL7: .byte 255, 0, 0, 0, 3, 5, 0, 0
PIXEL8: .byte 255, 0, 0, 0, 4, 1, 0, 0
PIXEL9: .byte 255, 0, 0, 0, 4, 5, 0, 0
PIXEL10: .byte 255, 0, 0, 0, 5, 2, 0, 0
PIXEL11: .byte 255, 0, 0, 0, 5, 3, 0, 0
PIXEL12: .byte 255, 0, 0, 0, 5, 4, 0, 0
PIXEL13: .byte 255, 0, 0, 0, 6, 1, 0, 0
PIXEL14: .byte 255, 0, 0, 0, 6, 5, 0, 0
PIXEL15: .byte 255, 0, 0, 0, 7, 1, 0, 0
PIXEL16: .byte 255, 0, 0, 0, 7, 5, 0, 0
PIXEL17: .byte 255, 0, 0, 0, 8, 2, 0, 0
PIXEL18: .byte 255, 0, 0, 0, 8, 3, 0, 0
PIXEL19: .byte 255, 0, 0, 0, 8, 4, 0, 0
CONTROL: .word 0x10000
DATA: .word 0x10008

.code
ld $s0, CONTROL($zero)
ld $s1, DATA($zero)

ld $t0, PIXEL1($zero)
sd $t0, 0($s1)

daddi $t0, $zero, 5
sd $t0, 0($s0)

ld $t0, PIXEL2($zero)
sd $t0, 0($s1)

daddi $t0, $zero, 5
sd $t0, 0($s0)

ld $t0, PIXEL3($zero)
sd $t0, 0($s1)

daddi $t0, $zero, 5
sd $t0, 0($s0)

ld $t0, PIXEL4($zero)
sd $t0, 0($s1)

daddi $t0, $zero, 5
sd $t0, 0($s0)

ld $t0, PIXEL5($zero)
sd $t0, 0($s1)

daddi $t0, $zero, 5
sd $t0, 0($s0)

ld $t0, PIXEL6($zero)
sd $t0, 0($s1)

daddi $t0, $zero, 5
sd $t0, 0($s0)

ld $t0, PIXEL7($zero)
sd $t0, 0($s1)

daddi $t0, $zero, 5
sd $t0, 0($s0)

ld $t0, PIXEL8($zero)
sd $t0, 0($s1)

daddi $t0, $zero, 5
sd $t0, 0($s0)

ld $t0, PIXEL9($zero)
sd $t0, 0($s1)

daddi $t0, $zero, 5
sd $t0, 0($s0)

ld $t0, PIXEL10($zero)
sd $t0, 0($s1)

daddi $t0, $zero, 5
sd $t0, 0($s0)

ld $t0, PIXEL11($zero)
sd $t0, 0($s1)

daddi $t0, $zero, 5
sd $t0, 0($s0)

ld $t0, PIXEL12($zero)
sd $t0, 0($s1)

daddi $t0, $zero, 5
sd $t0, 0($s0)

ld $t0, PIXEL13($zero)
sd $t0, 0($s1)

daddi $t0, $zero, 5
sd $t0, 0($s0)

ld $t0, PIXEL14($zero)
sd $t0, 0($s1)

daddi $t0, $zero, 5
sd $t0, 0($s0)

ld $t0, PIXEL15($zero)
sd $t0, 0($s1)

daddi $t0, $zero, 5
sd $t0, 0($s0)

ld $t0, PIXEL16($zero)
sd $t0, 0($s1)

daddi $t0, $zero, 5
sd $t0, 0($s0)

ld $t0, PIXEL17($zero)
sd $t0, 0($s1)

daddi $t0, $zero, 5
sd $t0, 0($s0)

ld $t0, PIXEL18($zero)
sd $t0, 0($s1)

daddi $t0, $zero, 5
sd $t0, 0($s0)

ld $t0, PIXEL19($zero)
sd $t0, 0($s1)

daddi $t0, $zero, 5
sd $t0, 0($s0)

halt