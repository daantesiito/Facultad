; Escriba la subrutina ES_VOCAL que determina si un caracter es vocal o no, ya sea mayúscula o minúscula. La
; rutina debe recibir el caracter y debe retornar el valor 1 si es una vocal ó 0 en caso contrario.

.data
caracter: .asciiz 'e'
vocales: .asciiz 'AEIOUaeiou'
resultado: .word 0

.code
lbu $a0, caracter($zero)
jal ES_VOCAL
sd $v0, resultado($zero)

ES_VOCAL: dadd $v0, $zero, $zero
          dadd $t0, $zero, $zero
          loop: lbu $t1, vocales($t0)
                beqz $t0, fin
                beq $a0, $t1, sies
                daddi $t0, $t0, 1
                j loop

sies: daddi $v0, $zero, 1

fin: jr $ra