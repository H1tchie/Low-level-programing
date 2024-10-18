
.macro LOAD_CONST
ldi @0, high(@2)
ldi @1,  low(@2)
.endmacro


ldi R18, 0b00111111 
ldi R17, 0b00000110
ldi R16, 0b01101101
ldi R19, 0b01111001

ldi R20, 0x7F 
out DDRD, R20

.equ Digits_P=PORTB
.equ Segments_P=PORTD


ldi R20, 0b011110
out DDRB, R20	
out Digits_P, R20  

ldi R20,0b10


LOAD_CONST R17,R16,5 


	out Digits_P,R20
	out Segments_P,R18	
	clc
	rol R20
	out Digits_P,R20
	out Segments_P,R17
	clc
	rol R20
	out Digits_P,R20
	out Segments_P,R16	
	clc
	rol R20
	out Digits_P,R20
	out Segments_P,R19	


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