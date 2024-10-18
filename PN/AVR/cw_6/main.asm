ldi R16, 200
ldi R17, 100


ldi R20,0
add R20, R16
add R20, R17
ldi R21,0
adc R21,R21
clc

ldi R22,0
add R22, R16
add R22, R16
ldi R23,0
adc R23,R23
clc

add R20,R22
adc R21,R23