; Escriba un programa que realice la suma de dos números enteros (de un dígito cada uno) utilizando dos subrutinas: La
; denominada ingreso del ejercicio anterior (ingreso por teclado de un dígito numérico) y otra denominada
; resultado, que muestre en la salida estándar del simulador (ventana Terminal) el resultado numérico de la suma de
; los dos números ingresados

.data
CONTROL: .word 0x10000
DATA: .word 0x10008
NUM1: .byte 0
NUM2: .byte 0
RESULTADOSUMA: .word 0

.code
ld $s0, CONTROL($zero)
ld $s1, DATA($zero)

jal ingreso

daddi $s2, $zero, 6
sd $s2, 0($s0)

jal resultado

fin: halt

ingreso: daddi $t0, $zero, 8
         sd $t0, 0($s0)
         ld $t1, 0($s1)
         sd $t1, NUM1($zero)

         daddi $t0, $zero, 8
         sd $t0, 0($s0)
         ld $t1, 0($s1)
         sd $t1, NUM2($zero)
         jr $ra

resultado: ld $t2, NUM1($zero)
           ld $t3, NUM2($zero)
           
           dadd $t4, $zero, $zero

           dadd $t4, $t2, $t3

           daddi $t4, $zero, RESULTADOSUMA
           sd $t4, 0($s1)

           daddi $t5, $zero, 1
           sd $t5, 0($s0)
           
           jr $ra
