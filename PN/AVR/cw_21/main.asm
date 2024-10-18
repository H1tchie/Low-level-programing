MainLoop: 
rcall DelayNCycles ; 
rjmp MainLoop
DelayNCycles: ;zwyk?a etykieta
nop
nop
rcall Wpisanie
nop
ret ;powrót do miejsca wywo?ania
Wpisanie:
ldi R20,5
ret