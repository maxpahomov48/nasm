;; hello4.asm
extern	printf			; External function
section .data
	msg	db	"Hello, World!",0
	fmtstr	db	"This is our string: %s",10,0
section .bss
section .text
	global main
main:
	push	rbp		; Epilogue.
	mov	rbp, rsp	; Epilogue.

	mov	rdi, fmtstr	; First arg for printf.
	mov	rsi, msg	; Second arg for printf.
	mov	rax, 0		; XMM - don't use.
	call	printf

	mov	rsp, rbp	; Prologue.
	pop	rbp		; Prologue.

	mov	rax, 60
	mov	rdi, 0
	syscall
