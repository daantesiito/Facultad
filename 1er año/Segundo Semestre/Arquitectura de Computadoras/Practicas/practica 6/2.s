; Escriba un programa que utilice sucesivamente dos subrutinas: La primera, denominada ingreso, debe solicitar el
; ingreso por teclado de un número entero (de un dígito), verificando que el valor ingresado realmente sea un dígito. La
; segunda, denominada muestra, deberá mostrar en la salida estándar del simulador (ventana Terminal) el valor del
; número ingresado expresado en letras (es decir, si se ingresa un ‘4’, deberá mostrar ‘CUATRO’). Establezca el pasaje
; de parámetros entre subrutinas respetando las convenciones para el uso de los registros y minimice las detenciones
; del cauce (ejercicio similar al ejercicio 6 de Práctica 2).

.data
CONTROL: .word 0x10000
DATA: .word 0x10008
MENSAJE:      .asciiz " INGRESE UN CARACTER: "
MENSAJEMAL:  .asciiz "  EL CARACTER NO ES UN DIGITO. "
CERO:         .asciiz " CERO  "
UNO:          .asciiz " UNO   "
DOS:          .asciiz " DOS   "
TRES:         .asciiz " TRES  "
CUATRO:       .asciiz " CUATRO"
CINCO:        .asciiz " CINCO "
SEIS:         .asciiz " SEIS  "
SIETE:        .asciiz " SIETE "
OCHO:         .asciiz " OCHO  "
NUEVE:        .asciiz " NUEVE "
DIG: .word 0
CAR: .word 0

.code
ld $a0, CONTROL($zero)
ld $a1, DATA($zero)

jal ingreso

jal muestra



fin: halt

ingreso: daddi $t0, $zero, 8
         sd $a0, 0($t0)
         ld $a2, 0($a1)
         sd $a2, DIG($zero)
         jr $ra

muestra: daddi $t0, $zero, 9
         sd $a0, 0($t0)
         ld $a2, 0($a1)
         sd $a2, CAR($zero)
         jr $ra

