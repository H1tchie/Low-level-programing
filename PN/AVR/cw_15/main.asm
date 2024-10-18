	 ldi R20,72
	 ldi R21,20
Loop:brbs 1,6
     dec R20
	 nop
	 rjmp Loop
	 dec R21
	 brbs 1,10
	 ldi R20,100	 	 
	 rjmp Loop
	 rjmp 0