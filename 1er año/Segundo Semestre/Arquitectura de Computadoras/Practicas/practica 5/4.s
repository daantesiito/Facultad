; El índice de masa corporal (IMC) es una medida de asociación entre el peso y la talla de un individuo.
; Se calcula a partir del peso (expresado en kilogramos, por ejemplo: 75,7 kg) y la estatura (expresada en metros,
; por ejemplo 1,73 m), usando la fórmula:
; IMC = peso / (estatura)2
; De acuerdo al valor calculado con este índice, puede clasificarse el estado nutricional de una persona en:
; Infrapeso (IMC < 18,5), Normal (18,5 ≤ IMC < 25), Sobrepeso (25 ≤ IMC < 30) y Obeso (IMC ≥ 30).
; Escriba un programa que dado el peso y la estatura de una persona calcule su IMC y lo guarde en la dirección
; etiquetada IMC. También deberá guardar en la dirección etiquetada estado un valor según la siguiente tabla:

.data
IMC: .double 0.0
PESO: .double 21000.52
ALTURA: .double 4.02
ETIQUETA: .word 0
num1: .double 18.5
num0: .double 0.0

.code
l.d f1, PESO($zero)
l.d f2, ALTURA($zero)
l.d f3, IMC($zero)
l.d f7, num1($zero)
l.d f8, num0($zero)

add.d f4, f8, f7
mtc1 $s1, f4
cvt.d.l f6, $s1

daddi $s2, $zero, 25

daddi $s3, $zero, 30

daddi $s4, $zero, 35

mul.d f2, f2, f2
div.d f5, f1, f2

slt $s5, f5, f6
beqz $s5, sig1
bnez $s5, est1

sig1: slt $s5, $s0, $s2
      beqz $s5, sig2
      bnez $s5, est2

sig2: slt $s5, $s0, $s3
      beqz $s5, sig3
      bnez $s5, est3

sig3: slt $s5, $s0, $s4
      beqz $s5, est4

est1: daddi $s6, $zero, 1
      j fin
est2: daddi $s6, $zero, 2
      j fin
est3: daddi $s6, $zero, 3
      j fin
est4: daddi $s6, $zero, 4
      j fin
      
fin: halt