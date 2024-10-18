MainLoop: 
rcall DelayInMs ; 
rjmp MainLoop

DelayInMs:
	ldi R20,1
	Next: rcall DelayOneMs
		dec R20
		clc
		brbs 1,Final 	 
		rjmp Next
Final:ret

DelayOneMs:
		sts $3C,R20
		sts $3D,R17
		ldi R20,255
		ldi R17,1	
		Loop:brbs 0, End
		     sub R20, R17
			 nop
			 nop
			 nop
			 nop	
			 nop
			 nop
			 nop
			 nop
			 nop
			 nop
			 nop
			 nop
			 nop	
			 nop
			 nop
			 nop
			 nop
			 nop
			 nop
			 nop
			 nop	
			 nop
			 nop	
			 nop
			 nop
			 nop
			 nop
			 rjmp Loop
		End: lds R20,$3C
		lds R17,$3D
		ret