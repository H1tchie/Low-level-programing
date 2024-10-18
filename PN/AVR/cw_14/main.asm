	 ldi R20,50
	 ldi R21,10
Loop:brbs 1,6
     dec R20
	 nop
	 rjmp Loop
	 dec R21
	 brbs 1,10
	 ldi R20,10	 	 
	 rjmp Loop
	 rjmp 0
	 // Cycle=(R20*4)+3