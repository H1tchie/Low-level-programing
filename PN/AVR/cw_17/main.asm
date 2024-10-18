	 ldi R22,1`
	 ldi R20,79
	 ldi R21,20
Loop:brbs 1,7
     dec R20
	 nop
	 rjmp Loop
	 dec R21
	 brbs 1,11
	 ldi R20,79	 	 
	 rjmp Loop
	 dec R22
	 brbs 1,15
	 ldi R21,20	 	 
	 rjmp Loop
     rjmp 0