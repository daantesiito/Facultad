; Escribir un programa que solicite el ingreso de una cadena de caracteres por teclado y que finalice al leer el caracter 0.

.data
CONTROL: .word 0x10000
DATA: .word 0x10008
CARACTER: .byte 0
CERO: .asciiz 0

.code
ld $s0, CONTROL($zero)
ld $s1, DATA($zero)

daddi $s4, $zero, 48

loop: daddi $t0, $zero, 9
      sd $t0, 0($s0)
      lbu $t0, 0($s1)
      sb $t0, CARACTER($zero)

      beq $t0, $s4, fin

      daddi $s3, $zero, CARACTER
      sd $s3, 0($s1)

      daddi $t0, $zero, 4
      sd $t1, 0($s0)
      j loop

fin: halt