; Escribir un programa que implemente el siguiente fragmento escrito en un lenguaje de alto nivel:
; 
; while a > 0 do
; begin
;     x := x + y;
;     a := a - 1;
; end;
; 
; Ejecutar con la opción Delay Slot habilitada.

.data
a: .word 5
x: .word 4
y: .word 9

.code
ld r1, a(r0)
ld r2, x(r0)
ld r3, y(r0)

loop: dadd r2, r2, r3
      daddi r1, r1, -1
      bnez r1, loop

fin: halt