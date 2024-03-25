.data
CONTROL: .word 0x10000
DATA: .word 0x10008
valor: .double 10.0
mensaje: .word 'El resultado es: '

.code
ld $s0, CONTROL($zero)
ld $s1, DATA($zero)
l.d F1, valor($zero)

daddi $t0, $zero, 8
sd $t0, 0($s0)
l.d f2, 0($s1)
s.d f2, num($zero)

c.lt.d f1, f2
bclt menor
bclf mayor

menor: sub.d f3, f1, f2
       div.d f4, f3, f2
       j seguir

mayor: sub.d f3, f2, f1
       mul.d f4, f3, f2
       j seguir

seguir: daddi $t0, $zero, mensaje
        sd $t0, 0($s1)
        daddi $t0, $zero, 4
        sd $t0, 0($s0)
        s.d f4, 0($s1)
        daddi $t0, $zero, 3
        sd $t0, 0($s0)
halt