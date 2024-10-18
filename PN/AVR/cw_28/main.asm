in R16,DDRB
ori R16, 0b00011110
out DDRB, R16
mov R17,R16
com R17
Loop:
	in R18,PORTB
	or R18,R16
	out PORTB,R18
	in R18,PORTB
	and R18,R17
	out PORTB,R18
rjmp Loop
