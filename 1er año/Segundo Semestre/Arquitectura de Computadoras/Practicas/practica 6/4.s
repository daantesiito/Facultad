; Escriba un programa que solicite el ingreso por teclado de una clave (sucesión de cuatro caracteres) utilizando la
; subrutina char de ingreso de un carácter. Luego, debe comparar la secuencia ingresada con una cadena almacenada
; en la variable clave. Si las dos cadenas son iguales entre si, la subrutina llamada respuesta mostrará el texto
; “Bienvenido” en la salida estándar del simulador (ventana Terminal). En cambio, si las cadenas no son iguales, la
; subrutina deberá mostrar “ERROR” y solicitar nuevamente el ingreso de la clave.

.data
CONTROL: .word 0x10000
DATA: .word 0x10008
CLAVE_ES: .asciiz 'hola'
CLAVE_INPUT: .asciiz ''
BIENVENIDO: .word 'Bienvenido'
ERROR: .word 'ERROR'

.code
ld $s0, CONTROL($zero)
ld $s1, DATA($zero)
daddi $s3, $zero, 4
ld $s4, CLAVE_ES($zero)

armarclave: daddi $t0, $zero, 9
            sd $t0, 0($s0)
            lbu $t0, 0($s1)
            sb $t0, CLAVE_INPUT($zero)
            dadd $s2, $zero, $t0
            daddi $s3, $s3, -1
            bnez $s3, armarclave

daddi $t0, $zero, 6
sd $t0, 0($s0)

beq $s3, $s4, respuesta
bne $s3, $s4, suberror

respuesta: daddi $t0, $zero, BIENVENIDO
           sd $t0, 0($s1)
           daddi $t0, $zero, 4
           sd $t0, 0($s0)
           j fin

suberror: daddi $t0, $zero, ERROR
          sd $t0, 0($s1)
          daddi $t0, $zero, 4
          sd $t0, 0($s0)
          j armarclave

fin: halt