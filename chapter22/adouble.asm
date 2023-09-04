; adouble.asm
section	.data
section	.bss
section	.text
global adouble
adouble:
	section	.text
; Multiply by 2.
	mov	rcx, rsi	; array length.
	mov	rbx, rdi	; array adress.
	mov	r12, 0
aloop:
	movsd	xmm0, qword [rbx+r12*8]		; Take element.
	addsd	xmm0, xmm0			; Double it.
	movsd	qword [rbx+r12*8], xmm0		; Move result back to array.
	inc	r12
	loop	aloop
ret
