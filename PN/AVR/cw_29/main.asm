
.macro LOAD_CONST
ldi @0, high(@2)
ldi @1,  low(@2)
.endmacro


ldi R18, 0b00111111 
ldi R19, 0b00000110 

ldi R20, 0x7F 
out DDRD, R20

ldi R20, 0x02
out DDRB, R20	
out PORTB, R20  

LOAD_CONST R17,R16,0x00FA 

InfLoop:
	out PORTD,R18
	rcall DelayInMs
	out PORTD,R19
	rcall DelayInMs 
	rjmp InfLoop

DelayInMs:
	push R17
	push R16
	InternalLoop:
		rcall DelayOneMs
		subi R16,1
		brbc 1,InternalLoop
		subi R17,1
		brcc InternalLoop
	pop R16
	pop R17
	ret

DelayOneMs:
	push R25
	push R24
	ldi R25, 6
	ldi R24, 59
	CombinedLoop:
		sbiw R25:R24, 1
		nop
		brcc CombinedLoop
	pop R24
	pop R25
	nop
	nop
	nop
	nop
	ret