MainLoop: 
rcall DelayNCycles ; 
rjmp MainLoop
DelayNCycles: ;zwyk?a etykieta
nop
nop
ldi R22,2`
ldi R20,50
ldi R21,5
ldi R16,0
ldi R17,1
rcall DelayInms
nop
ret ;powr�t do miejsca wywo?ania
DelayInMs:	
Loop:brbs 0,Next
     sub R20, R17
	 sbc R21, R16
	 nop	
	 rjmp Loop
Next:dec R22
	 clc
	 brbs 1,End
	 ldi R20,50	
	 ldi R21,5	 	 
	 rjmp Loop
End: ret
