; Escribir una subrutina que reciba como argumento una tabla de números terminada en 0. La subrutina debe contar la
; cantidad de números que son impares en la tabla. Ésta condición se debe verificar usando la subrutina ES_IMPAR. La
; subrutina ES_IMPAR debe devolver 1 si el número es impar y 0 si no lo es.

.data
tabla: .byte 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0

.code

daddi $a0, $zero, tabla
dadd $s0, $zero, $zero
daddi $s1, $zero, 11
loop: ld $a0, tabla($t0)

      jal ES_IMPAR
      
      bnez $v0, sumar

      sumar: daddi $s0, $s0, 1

seguir: daddi $t0, $t0, 1
        beq $t0, $s1, fin
        j loop

fin: halt

ES_IMPAR: dadd $v0, $zero, $zero
          andi $t1, $a0, 1
          beqz $t1, seguir
          bnez $t1, sies
          sies: daddi $v0, $v0, 1
          jr $ra