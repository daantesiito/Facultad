.data
CONTROL: .word 0x10000
DATA: .word 0x10008
TABLA1: .word 21, 12, 5, 16, 8, 39, 10, 41, 4, 33
TABLA2: .word 32, 24, 15, 32, 17, 28, 11, 20, 44, 21
VERDE: .byte 0, 255, 0, 0
ROJO: .byte 255, 0, 0, 0

.code
ld $s0, CONTROL($zero)
ld $s1, DATA($zero)

daddi $a0, $zero, TABLA1
daddi $a1, $zero, 10

jal min_max

dadd $s2, $zero, $v0
dadd $s3, $zero, $v1

daddi $a0, $zero, TABLA2
daddi $a1, $zero, 10

jal min_max

lwu $t0, ROJO($zero)
sw $t0, 0($s1)

sb $s2, 5($s1)
sb $v1, 4($s1)

daddi $t4, $zero, 5
sd $t4, 0($s0)

lwu $t0, VERDE($zero)
sw $t0, 0($s1)

sb $v0, 5($s1)
sb $s3, 4($s1)

sd $t4, 0($s0)

halt

min_max: daddi $v0, $zero, 999
         daddi $v1, $zero, 0
         daddi $t2, $zero, 1
loop:    ld $t0, 0($a0)
         slt $t1, $t0, $v0
         beq $t1, $t2, ESMENOR
sigue:   slt $t3, $v1, $t0
         beq $t3, $t2, ESMAYOR
sigue2:  daddi $a1, $a1, -1
         daddi $a0, $a0, 8
         bnez $a1, loop
         jr $ra

         ESMENOR: dadd $v0, $zero, $t0
                  j sigue

         ESMAYOR: dadd $v1, $zero, $t0
                  j sigue2
