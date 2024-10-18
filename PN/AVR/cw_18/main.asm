	 ldi R22,2`
	 ldi R20,0
	 ldi R21,251
	 ldi R16,0
	 ldi R17,1
Loop:brbs 0,Next
     add R20, R17
	 adc R21, R16
	 nop	
	 rjmp Loop
Next:dec R22
	 clc
	 brbs 1,End
	 ldi R20,20	
	 ldi R21,251	 	 
	 rjmp Loop
End: rjmp 0