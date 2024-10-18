		AREA	MAIN_CODE, CODE, READONLY
		GET		LPC213x.s
		
		ENTRY
__main
__use_two_region_memory
		EXPORT			__main
		EXPORT			__use_two_region_memory

CURR_DIG rn R12

DIG_0 rn R8
DIG_1 rn R9
DIG_2 rn R10
DIG_3 rn R11


	ldr DIG_0, =0
	ldr DIG_1, =0
	ldr DIG_2, =0
	ldr DIG_3, =0

	ldr CURR_DIG, =0

	ldr r5, =IO0DIR
	ldr r4, =0xF0000
	str r4, [r5]

	ldr r5, =IO1DIR
	ldr r4, =0xFF0000
	str r4, [r5]
	
main_loop
	
	ldr r5, =IO0CLR
	ldr r4, =0xF0000
	str r4, [r5]

	ldr r5, =IO1CLR
	ldr r4, =0xFF0000
	str r4, [r5]
	
	ldr r5, =IO0SET
	ldr r4, =0x80000
	mov r4, r4,lsr CURR_DIG
	str r4, [r5]
	
	cmp CURR_DIG, #0
		moveq R6, DIG_0
	cmp CURR_DIG, #1
		moveq R6, DIG_1
	cmp CURR_DIG, #2
		moveq R6, DIG_2
	cmp CURR_DIG, #3
		moveq R6, DIG_3
		
	adr R5, digit
	add R4,R6,R5
	ldrb R6,[R4]
	
	ldr R5, =IO1SET
	mov R6,R6,lsl #16
	str R6,[R5]
	
	add DIG_0, #1
	cmp DIG_0, #10
	blo end_inc
	
	ldr DIG_0, =0
	add DIG_1, #1
	cmp DIG_1, #10
	blo end_inc
	
	ldr DIG_1, =0
	add DIG_2, #1
	cmp DIG_2, #10
	blo end_inc
	
	ldr DIG_2, =0
	add DIG_3, #1
	cmp DIG_3, #10	
	ldrhs DIG_3, =0	
end_inc	
	add CURR_DIG, #1
	cmp CURR_DIG, #4	
	ldrhs CURR_DIG, =0	
	
	ldr R0, =5
	bl delay_in_ms

	b	main_loop
	
delay_in_ms
	ldr R1, =15000
	mul R2,R1,R0
wait_loop
	subs R2, #1
	bne wait_loop
	bx lr

digit dcb 0x3f,0x06,0x5B,0x4F,0x66,0x6d,0x7D,0x07,0x7f,0x6f
		END

