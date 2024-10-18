ldi R16, 2
rcall DigitTo7segCode

DigitTo7segCode:
	ldi R30, low(Table<<1)
	ldi R31, high(Table<<1)
	Loop:
		push R30
		push R31
		adiw R30:R31,1
		subi R16,1
		brcc Loop
		sbiw R30:R31,1
		lpm R16, Z
		pop R31
		pop R30
	ret
Table: .db 0b0111111,0b0000110,0b1011011,0b1001111,0b1100110,0b1101101,0b1111101,0b0000111,0b1111111,0b1101111