.data
CONTROL: .word 0x10000
DATA: .word 0x10008
PIXELenROJO: .byte 255,0,0,0 

.code
ld $s0, CONTROL($zero)
ld $s1, DATA($zero)
ld $s2, PIXELenROJO($zero)

sd $s2, 0($s1)

daddi $t0, $zero, 7
sb $t0, 5($s1) # x

daddi $t0, $zero, 3
sb $t0, 4($s1) # y

daddi $t0, $zero, 5
sd $t0, 0($s0)

halt