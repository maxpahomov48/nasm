;; function2.asm
extern	printf
section	.data
	radius	dq	10.0
section	.bss
section	.text
;-----------------------------------------
area:
	section	.data
		.pi	dq	3.141592654	; Local variable in area funtion.
	section	.text
	
	push	rbp
	mov	rbp, rsp
	
	movsd	xmm0, [radius]
	mulsd	xmm0, [radius]
	mulsd	xmm0, [.pi]
leave
ret
;-----------------------------------------
circum:
	section	.data
		.pi	dq	3.14		; Local variable in circum fuction.
	section	.text

	push	rbp
	mov	rbp, rsp

	movsd	xmm0, [radius]
	addsd	xmm0, [radius]
	mulsd	xmm0, [.pi]
leave
ret
;-----------------------------------------
circle:
	section	.data
		.fmt_area	db	"The area is %.7f",10,0
		.fmt_circle	db	"The circumference is %.7f",10,0
	section	.text

	push	rbp
	mov	rbp, rsp

	call	area
	mov	rdi, .fmt_area
	mov	rax, 1
	call	printf
	call	circum
	mov	rdi, .fmt_circle
	mov	rax, 1
	call	printf
leave
ret
;-----------------------------------------
	global	main
main:
	push	rbp
	mov	rbp, rsp

	call	circle
leave
ret
