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
PESO: .double 210.8
ALTURA: .double 3.02
ETIQUETA: .word 0
NUM1: .double 18.5
NUM2: .double 25.0
NUM3: .double 30.0

.code
l.d f1, PESO($zero)
l.d f2, ALTURA($zero)
l.d f3, IMC($zero)
l.d f5, NUM1($zero)
l.d f6, NUM2($zero)
l.d f7, NUM3($zero)

mul.d f4, f2, f2
div.d f3, f1, f4

c.lt.d f3, f5
bc1t infrapeso
bc1f sig1

sig1: c.lt.d f3, f6
      bc1t normal
      bc1f sig2

sig2: c.lt.d f3, f7
      bc1t sobrepeso
      bc1f obeso

infrapeso: daddi $s0, $zero, 1
           sd $s0, ETIQUETA($zero)
           j fin

normal: daddi $s0, $zero, 2
        sd $s0, ETIQUETA($zero)
        j fin

sobrepeso: daddi $s0, $zero, 3
           sd $s0, ETIQUETA($zero)
           j fin

obeso: daddi $s0, $zero, 4
       sd $s0, ETIQUETA($zero)
       j fin

fin: halt