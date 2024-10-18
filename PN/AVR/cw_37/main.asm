ldi R16, 2
rcall Konwert

Konwert:
	ldi R30, low(Table<<1)
	ldi R31, high(Table<<1)
	Loop:
		adiw R30:R31,1
		subi R16,1
		brcc Loop
		sbiw R30:R31,1
		lpm R16, Z
	ret
Table: .db 0,1,4,9,16,25,36,49,64,81