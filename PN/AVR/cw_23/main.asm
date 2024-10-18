MainLoop: 
rcall DelayInMs ; 
rjmp MainLoop

DelayInMs:
	ldi R22,2
	Next: rcall DelayOneMs
		dec R22
		clc
		brbs 1,Final 	 
		rjmp Next
Final:ret

DelayOneMs:
		ldi R20,50
		ldi R21,5
		ldi R16,0
		ldi R17,1	
		Loop:brbs 0, End
		     sub R20, R17
			 sbc R21, R16
			 nop	
			 rjmp Loop
		End: ret