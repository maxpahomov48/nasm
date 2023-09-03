;; function.asm
extern	printf
section	.data
	radius	dq	10.0
	pi	dq	3.1415926
	fmt	db	"The area of the circle is %.5f",10,0
section	.bss
section	.text
	global main
;------------------------------------------------------------
main:
	push	rbp
	mov	rbp, rsp
	
	call	area
	mov	rdi, fmt
	movsd	xmm1, [radius]	; Write float to xmm1.
	mov	rax, 1		; Value of the square in xmm0.
	call	printf
leave
ret
;------------------------------------------------------------
area:
	push	rbp
	mov	rbp, rsp
	
	movsd	xmm0, [radius]
	mulsd	xmm0, [radius]
	mulsd	xmm0, [pi]
leave
ret
