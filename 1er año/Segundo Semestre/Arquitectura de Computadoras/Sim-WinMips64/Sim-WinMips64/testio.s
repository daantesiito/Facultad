.data
	coorx: .byte 15
	coory: .byte 30
	color: .byte 0, 0, 255, 0

	CONTROL: .word32 0x10000
	DATA: .word32 0x10008

.code
	lwu $s6, CONTROL($0)
	lwu $s7, DATA($0)

	lbu $s0, coorx($0)
	sb $s0, 5($s7)

	lbu $s1, coory($0)
	sb $s1, 4($s7)

	lwu $s2, color($0)
	sw $s2, 0($s7)

	daddi $t0, $0, 5
	sd $t0, 0($s6)

halt