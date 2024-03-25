.data
A: .word 0
B: .word 2
C: .word 3
D: .word 0

.code
ld r1, A(r0)
ld r2, B(r0)
ld r3, C(r0)
dadd r4, r0, r0

beq r1, r2, cumple
beq r1, r3, cumple
beq r2, r3, cumple

cumple: daddi r4, r4, 1
        
sd r4, D(r0)

halt