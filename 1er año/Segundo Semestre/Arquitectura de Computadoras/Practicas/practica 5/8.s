; Escriba una subrutina que reciba como parámetros las direcciones del comienzo de dos cadenas terminadas en cero y
; retorne la posición en la que las dos cadenas difieren. En caso de que las dos cadenas sean idénticas, debe retornar -1.

.data
lista1: .asciiz "hola"
lista2: .asciiz "hola"
posInt: .word 0

.code
daddi $a0, $zero, lista1
daddi $a1, $zero, lista2
daddi $a2, $zero, 11
jal subrutina

halt

subrutina: dadd $v0, $zero, $zero
           comparar: lbu $t0, 0($a0)
                     lbu $t1, 0($a1)
                     beqz $t0, nodifieren
                     beqz $t1, fin
                     bne $t0, $t1, fin
                     daddi $v0, $v0, 1
                     daddi $a0, $a0, 1
                     daddi $a1, $a1, 1
                     j comparar
            
            nodifieren: bnez $t1, fin 
                        daddi $v1, $zero, -1            
            fin: jr $ra