#Escriba un programa que utilice sucesivamente dos subrutinas: La primera, denominada ingreso, debe solicitar el
#ingreso por teclado de un número entero (de un dígito), verificando que el valor ingresado realmente sea un dígito. La
#segunda, denominada muestra, deberá mostrar en la salida estándar del simulador (ventana Terminal) el valor del
#número ingresado expresado en letras (es decir, si se ingresa un ‘4’, deberá mostrar ‘CUATRO’). Establezca el pasaje
#de parámetros entre subrutinas respetando las convenciones para el uso de los registros y minimice las detenciones
#del cauce

.data
CONTROL: .word 0x10000
DATA: .word 0x10008
CERO: .asciiz 'CERO'
UNO: .asciiz 'UNO'
DOS: .asciiz 'DOS'
TRES: .asciiz 'TRES'
CUATRO: .asciiz 'CUATRO'
CINCO: .asciiz 'CINCO'
SEIS: .asciiz 'SEIS'
SIETE: .asciiz 'SIETE'
OCHO: .asciiz 'OCHO'
NUEVE: .asciiz 'NUEVE'
NUMmax: .asciiz 10
NUMmin: .asciiz 0

.code
ld $s0, CONTROL($zero)
ld $s1, DATA($zero)

daddi $s2, $zero, CERO

daddi $t0, $zero, 9
sd $t0, 0($s0)
ld $t1, 0($s1)

daddi $t0, $zero, 8
dmul $t2, $t1, $t0

daddi $t3, $t2, CERO

sd $t3, 0($s1)
daddi $t0, $zero, 4
sd $t0, 0($s0)

halt