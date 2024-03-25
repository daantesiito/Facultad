; Escriba una subrutina que reciba como parámetros un número positivo M de 64 bits, la dirección del comienzo de una
; tabla que contenga valores numéricos de 64 bits sin signo y la cantidad de valores almacenados en dicha tabla.
; La subrutina debe retornar la cantidad de valores mayores que M contenidos en la tabla.

.data
M: .word 5
TABLA: .word 0, 4, 5, 7, 10, 34, 23, 50, 2, 94, 55, 222

.code
ld $a0, M($zero)

daddi $a1, $zero, TABLA

daddi $a2, $zero, 12

jal subrutina
halt

subrutina: ld $t0, 0($a1)
           dadd $v0, $zero, $zero
           loop: slt $a3, $a0, $t0
                 bnez $a3, mayor
           seguir:  daddi $t0, $t0, 8
                    daddi $a2, $a2, -1
                    bnez $a2, loop
                    jr $ra

mayor: daddi $v0, $v0, 1
       j seguir