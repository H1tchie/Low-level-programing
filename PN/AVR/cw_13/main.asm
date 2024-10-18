	 ldi R20,6 
Loop:brbs 1,5
     dec R20
	 nop
	 rjmp Loop
	 nop
	 nop
	 rjmp 0
	 // Cycle=(R20*4)+3