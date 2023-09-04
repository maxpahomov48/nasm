;; icalc.asm

extern	printf

section .data
	number1	dq	128
	number2 dq	19
	neg_num	dq	-12
	fmt	db	"the number is %ld and %ld",10,0
	fmtint	db	"%s %ld",10,0
	sumi	db	"The sum is",0
	difi	db	"The difference is",0
	inci	db	"Number 1 Incremented:",0
	deci	db	"Number 1 Decremented:",0
	sali	db	"Number 1 Shift left 2 (x4):",0
	sari	db	"Number 1 Shift right 2 (/4):",0
	sariex	db	"Number 1 Shift right 2 (/4) with "
		db	"sign extension:",0
	multi	db	"The product is",0
	divi	db	"The integer quotient is",0
	remi	db	"The modulo is",0

section	.bss
	resulti	resq	1
	modulo	resq	1

section	.text
	global main
main:
	push	rbp
	mov	rbp, rsp
; Numbers 1 and 2 wirte to stdout.
	mov	rdi, fmt
	mov	rsi, [number1]
	mov	rdx, [number2]
	mov	rax, 0
	call	printf
; Add number1 and number2.
	mov	rax, [number1]
	add	rax, [number2]
	mov	[resulti], rax
	; dispaying the result.
	mov	rdi, fmtint
	mov	rsi, sumi
	mov	rdx, [resulti]
	mov	rax, 0
	call printf
; Substraction.
	mov	rax, [number1]
	sub	rax, [number2]
	mov	[resulti], rax
	; displaying the result.
	mov	rdi, fmtint
	mov	rsi, difi
	mov	rdx, [resulti]
	mov	rax, 0
	call	printf
; Incremention
	mov	rax, [number1]
	inc	rax
	mov	[resulti], rax
	; displaying the result.
	mov	rdi, fmtint
	mov	rsi, inci
	mov	rdx, [resulti]
	mov	rax, 0
	call	printf
; Decremention
	mov	rax, [number1]
	dec	rax
	mov	[resulti], rax
	; displaying the result.
	mov	rdi, fmtint
	mov	rsi, deci
	mov	rdx, [resulti]
	mov	rax, 0
	call	printf
; Ariphmetic shift left.
	mov	rax, [number1]
	sal	rax, 2			; Mutiply rax by 4.
	mov	[resulti], rax
	; displaying the result.
	mov	rdi, fmtint
	mov	rsi, sali
	mov	rdx, [resulti]
	mov	rax, 0
	call	printf
; Ariphmetic shift right.
	mov	rax, [number1]
	sar	rax, 2			; Divide rax by 4.
	mov	[resulti], rax
	; displaying the result.
	mov	rdi, fmtint
	mov	rsi, sari
	mov	rdx, [resulti]
	mov	rax, 0
	call	printf
; Ariphmetic shift right with sign bit.
	mov	rax, [neg_num]
	sar	rax, 2			; Divide rax by 4.
	mov	[resulti], rax
	; displaying the result.
	mov	rdi, fmtint
	mov	rsi, sariex
	mov	rdx, [resulti]
	mov	rax, 0
	call	printf
; Multiply.
	mov	rax, [number1]
	imul	qword [number2]		; Multiply number1 by number2.	
	mov	[resulti], rax
	; displaying the result.
	mov	rdi, fmtint
	mov	rsi, multi
	mov	rdx, [resulti]
	mov	rax, 0
	call	printf
; Division.
	mov	rax, [number1]
	mov	rdx, 0			; in rdx must be 0 before idiv.
	idiv	qword [number2]		; division rax by number2, tail in rdx.
	mov	[resulti], rax
	mov	[modulo], rdx
	; displaying the result.
	mov	rdi, fmtint
	mov	rsi, divi
	mov	rdx, [resulti]
	mov	rax, 0
	call	printf
	mov	rdi, fmtint
	mov	rsi, remi
	mov	rdx, [modulo]
	mov	rax, 0
	call	printf
	mov	rsp, rbp
	pop	rbp
	ret


