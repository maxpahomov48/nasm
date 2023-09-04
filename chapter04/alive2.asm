; alive2.asm
section .data
	msg1	db	"Hello, World!",0
	msg2	db	"Alive and Kicking!",0
	radius	dd	357
	pi	dq	3.141592601
	fmtstr	db	"%s",10,0	; Format for out string.
	fmtflt	db	"%lf",10,0	; Format for out float.
	fmtint	db	"%d",10,0	; Format for integer.
section .bss
section	.text

extern	printf

	global main
main:
; Epilogue
	push	rbp
	mov	rbp, rsp
; print msg1
	mov	rax, 0			; Without float point.
	mov	rdi, fmtstr
	mov	rsi, msg1
	call	printf
; print msg2
	mov	rax, 0			; Without float point.
	mov	rdi, fmtstr
	mov	rsi, msg2
	call	printf
; print radius
	mov	rax, 0			; Without float point.
	mov	rdi, fmtint
	mov	rsi, [radius]
	call printf
; print pi
	mov	rax, 1			; Using 1 register xmm.
	movq	xmm0, [pi]
	mov	rdi, fmtflt
	call	printf
; Prologue
	mov	rsp, rbp
	pop	rbp
	ret
