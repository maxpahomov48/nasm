;; fcalc.asm
extern	printf
section	.data
	number1		dq	9.0
	number2		dq	73.0
	fmt		db	"The number are %f and %f",10,0
	fmtfloat	db	"%s %f",10,0
	f_sum		db	"The float sum of %f and %f is %f",10,0
	f_dif		db	"The float difference of %f and %f is %f",10,0
	f_mul		db	"The float product of %f and %f is %f",10,0
	f_div		db	"The float division of %f by %f is %f",10,0
	f_sqrt		db	"the float squareroot of %f is %f",10,0
section	.bss
section	.text
	global main
main:
	; Prologue.
	push	rbp
	mov	rbp, rsp
	; Print nubmers.
	movsd	xmm0, [number1]
	movsd	xmm1, [number2]
	mov	rdi, fmt
	mov	rax, 2			; Two float numbers.
	call	printf
	; Calculate the sum.
	movsd	xmm2, [number1]
	addsd	xmm2, [number2]
		; Print the result.
		movsd	xmm0, [number1]
		movsd	xmm1, [number2]
		mov	rdi, f_sum
		mov	rax, 3		; Three float numbers.
		call	printf
	; Calculate the difference.
	movsd	xmm2, [number1]
	subsd	xmm2, [number2]
		; Print the result.
		movsd 	xmm0, [number1]
		movsd 	xmm1, [number2]
		mov	rdi, f_dif
		mov	rax, 3		; Three float numbers.
		call	printf
	; Calculate the product.
	movsd	xmm2, [number1]
	mulsd	xmm2, [number2]
		; Print the result.
		movsd	xmm0, [number1]
		movsd	xmm1, [number2]
		mov	rdi, f_mul
		mov 	rax, 3		; Three float numbers.
		call 	printf
	; Calculate the division.
	movsd	xmm2, [number1]
	divsd	xmm2, [number2]
		; Print the result.
		movsd	xmm0, [number1]
		movsd	xmm1, [number2]
		mov	rdi, f_div
		mov	rax, 1		; One float number.
		call	printf
	; Calculate the sqrt.
	sqrtsd	xmm1, [number1]		; Sqrt double precision in xmm.
		; Print the result.
		movsd	xmm0, [number1]
		mov	rdi, f_sqrt
		mov	rax, 2		; Two float numbers.
		call	printf
	; Epilogue.
	mov	rsp, rbp
	pop	rbp
	ret


