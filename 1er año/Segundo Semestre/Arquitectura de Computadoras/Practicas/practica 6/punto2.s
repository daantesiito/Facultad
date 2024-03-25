#Escriba un programa que realice la suma de dos números enteros (de un dígito cada uno) utilizando dos subrutinas: La
#denominada ingreso del ejercicio anterior (ingreso por teclado de un dígito numérico) y otra denominada
#resultado, que muestre en la salida estándar del simulador (ventana Terminal) el resultado numérico de la suma de
#los dos números ingresados

.data
CONTROL: .word 0x10000
DATA: .word 0x10008

.code
ld $s0, CONTROL($zero)
ld $s1, DATA($zero)

jal ingreso

jal resultado
halt

ingreso: daddi $t0, $zero, 8
         sb $t0, 0($s0)
         lbu $s2, 0($s1)
         daddi $t0, $zero, 8
         sb $t0, 0($s0)
         lbu $s3, 0($s1)
         jr $ra

resultado: daddi $s4, $s2, $s3
           sd $s4, 0($s1)
           daddi $t0, $zero, 1
           sd $t0, 0($s0)
           jr $ra
