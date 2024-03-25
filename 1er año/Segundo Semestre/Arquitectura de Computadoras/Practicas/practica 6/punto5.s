.data
CONTROL: .word 0x10000
DATA: .word 0x10008

.code
ld $s0, CONTROL($zero)
ld $s1, DATA($zero)

daddi $t0, $zero, 8 // ingresa la base
sd $t0, 0($s0)
l.d f1, 0($s1)

daddi $t0, $zero, 8 // ingresa la potencia
sd $t0, 0($s0)
ld $a0, 0($s1)

jal a_la_potencia

s.d f1, 0($s1) // manda a data el num

daddi $t0, $zero, 3 // imprime el flotante
sd $t0, 0($s0)

halt

a_la_potencia: mul.d f1, f1, f1
               daddi $a0, $zero, -1
               bnez $a0, a_la_potencia
               jr $ra