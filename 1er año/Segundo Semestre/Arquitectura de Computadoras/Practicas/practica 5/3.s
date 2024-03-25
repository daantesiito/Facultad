; Escribir un programa que calcule la superficie de un triángulo rectángulo de base 5,85 cm y altura 13,47 cm.
; Pista: la superficie de un triángulo se calcula como:
; Superficie = (base x altura) / 2

.data
base: .double 5.85
altura: .double 13,47

l.d $s0, base
l.d $s1, altura

daddi $s2, $zero, 2
mtcl $s2, $s3
cvt.d.l $s4, $s2

mul.d $t0, $s0, $s1
div.d $t1, $t0, $s2