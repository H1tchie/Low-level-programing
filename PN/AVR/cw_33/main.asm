.macro LOAD_CONST
ldi @0, high(@2)
ldi @1,  low(@2)
.endmacro

.equ Digits_P=PORTB
.equ Segments_P=PORTD

; main program

; constant values
ldi R18, 0b00111111 ; 0 on display
ldi R19, 0b00000110 ; 1 on display
ldi R22, 0b01011011 ; 2 on display
ldi R23, 0b01001111 ; 3 on display

; initialization
ldi R20, 0x7F ; 0b01111111 - we dont need 1st bit
out DDRD, R20

ldi R20, 0b00011110
out DDRB, R20	; output
ldi R20, 0x02	; PB1
ldi R21, 0		; for clearing digits

LOAD_CONST R25,R24,0x0005 ; 1/50 = 20 ms => 20ms/4 = 5ms delay <-- ****************** tutaj zmiana

; infinite loop
InfLoop:
	out Digits_P, R20  ; digit on

	sbic Digits_P, 1		; kinda switch-case structure
	out Segments_P,R18
	sbic Digits_P, 2
	out Segments_P,R19
	sbic Digits_P, 3
	out Segments_P,R22
	sbic Digits_P, 4
	out Segments_P,R23
	
	rcall DelayInMs
	lsl R20 ; shift left
	cpi R20,0x20 ; if is > than PB4
	brlo InfLoop
	ldi R20, 0x02 ; than start from 1st one
	rjmp InfLoop

; subprograms


DelayInMs:
	push R25
	push R24
	InternalLoop:
		rcall DelayOneMs
		sbiw R25:R24,1
		brbc 1,InternalLoop
	pop R24
	pop R25
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