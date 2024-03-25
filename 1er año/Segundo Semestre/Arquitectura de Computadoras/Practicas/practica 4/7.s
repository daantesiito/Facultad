; Escribir un programa que recorra una TABLA de diez números enteros y determine cuántos elementos son mayores que X.
; El resultado debe almacenarse en una dirección etiquetada CANT. El programa debe generar además otro arreglo llamado RES
; cuyos elementos sean ceros y unos. Un ‘1’ indicará que el entero correspondiente en el arreglo TABLA es mayor que X,
; mientras que un ‘0’ indicará que es menor o igual.

.data
TABLA: .byte 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
X:     .byte 7
CANT:  .word 0
RES:   .byte 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
LONG:  .word 10

.code
lbu r2, X(r0)
ld r3, CANT(r0)
lbu r5, RES(r0)
lbu r6, LONG(r0)

daddi r7, r0, 1
dadd r4, r0, r0

loop: lbu r1, TABLA(r4)

      daddi r4, r4, 1

      slt r5, r2, r1

      lbu r5, RES(r4)
      
      bne r5, r7, MAYOR
      
      daddi r6, r6, -1
      
      sd r5, RES(r4)

      beqz r6, FIN

      j loop

MAYOR: daddi r3, r3, 1

       daddi r6, r6, -1

       beqz r6, FIN

       j loop

FIN: halt