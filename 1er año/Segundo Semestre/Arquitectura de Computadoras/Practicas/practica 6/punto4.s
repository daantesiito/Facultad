#Escriba un programa que solicite el ingreso por teclado de una clave (sucesión de cuatro caracteres) utilizando la
#subrutina char de ingreso de un carácter. Luego, debe comparar la secuencia ingresada con una cadena almacenada
#en la variable clave. Si las dos cadenas son iguales entre si, la subrutina llamada respuesta mostrará el texto
#“Bienvenido” en la salida estándar del simulador (ventana Terminal). En cambio, si las cadenas no son iguales, la
#subrutina deberá mostrar “ERROR” y solicitar nuevamente el ingreso de la clave.

.data
CONTROL: .word 0x10000
DATA: .word 0x10008
CLAVE: .asciiz 'hola' 
INPUT: .asciiz 'xxxx'
BIENVENIDO: .word 'BIENVENIDO'
ERROR: .word 'ERROR'

.code
ld $s0, CONTROL($zero)
ld $s1, DATA($zero)
ld $s2, CLAVE($zero)

jal char
halt

char: daddi $s3, $zero, 4
      daddi $s4, $zero, INPUT
      loop: daddi $t0, $zero, 9
            sb $t0, 0($s0)
            lbu $t0, 0($s1)
            sb $t0, 0($s4)
            daddi $s4, $s4, 1
            daddi $s3, $zero, -1
            bnez $s3, loop
            beqz $s3, seguir

      seguir: beq $s2, $s4, bienvenidosub
              bne $s2, $s4, errorsub

      bienvenidosub: daddi $t0, $zero, BIENVENIDO
                     ld $t0, 0($s1)
                     daddi $t0, $zero, 4
                     ld $t0, 0($s0)
                     jr $ra

      errorsub: daddi $t0, $zero, ERROR
                ld $t0, 0($s1)
                daddi $t0, $zero, 4
                ld $t0, 0($s0)
                j char