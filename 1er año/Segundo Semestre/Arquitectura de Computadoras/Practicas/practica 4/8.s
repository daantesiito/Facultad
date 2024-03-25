Escribir un programa que multiplique dos números enteros utilizando sumas repetidas (similar a Ejercicio 6 o 7 de la Práctica
1). El programa debe estar optimizado para su ejecución con la opción Delay Slot habilitada.

.data
NUM1: .word 2
NUM2: .word 4
RES: .word 0

.code
ld r1, NUM1(r0)
ld r2, NUM2(r0)
dadd r3, r0, r0
loop: dadd r3, r3, r1
      daddi r2, r2, -1
      bnez r2, loop
sd r3, RES(r0)

