; Escribir un programa que cuente la cantidad de veces que un determinado caracter aparece en una cadena de texto. Observar
; cómo se almacenan en memoria los códigos ASCII de los caracteres (código de la letra “a” es 61H). Utilizar la instrucción lbu
; (load byte unsigned) para cargar códigos en registros. La inicialización de los datos es la siguiente:

.data
long: .byte 16                     ; cantidad de caracteres en la cadena
cadena: .asciiz "adbdcdedfdgdhdid" ; cadena a analizar
car: .asciiz "d"                   ; caracter buscado
cant: .word 0                      ; cantidad de veces que se repite el caracter car en cadena.

.code
lbu r1, cadena(r0)
lbu r2, car(r0)
ld r3, long(r0)
ld r4, cant(r0)

dadd r5, r0, r0

loop: lbu r1, cadena(r5)
      beq r2, r1, esIgual

seguir: daddi r5, r5, 8
         daddi r3, r3, -1
         bnez r3, loop
         j FIN

esIgual: daddi r4, r4, 1
         j seguir

FIN: halt