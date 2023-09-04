;; memory.asm
section	.data
	bNum	db	123
	wNum	dw	12345
	warray	times	5 dw 0		; Arrive with 5 words.

	dNum	dd	12345
	qNum1	dq	12345
	text1	db	"abc",0
	qNum2	dq	3.141592654
	text2	db	"cde",0

section	.bss
	bvar	resb	1
	dvar	resd	2
	wvar	resw	10
	qvar	resq	3

section .text
	global main
main:	
	push	rbp
	mov	rbp, rsp		; Epilogue

	lea	rax, [bNum]		; Load bNum - adress to rax.
	mov	rax, bNum		; Load bNum - adress to rax.
	mov	rax, [bNum]		; Load bNum - value to rax.
	mov	[bvar], rax		; Load from rax to memory adress-bvar.

	lea	rax, [bvar]		; Load bvar - adress to rax.
	lea 	rax, [wNum]		; Load wNum - adress to rax.
	mov	rax, [wNum]		; Load value wNum to rax.
	lea	rax, [text1]		; Load text1 - adress to rax.

	mov	rax, text1		; Load text1 - adress to rax.
	mov	rax, text1+1		; Load second char from text1 to rax.
	lea	rax, [text1+1]		; Load second char from text1 to rax.
	mov	rax, [text1]		; Load, from adress text1 to rax.
	mov	rax, [text1+1]		; Load, from adress text1+1 to rax.

	mov	rsp, rbp		; Prologue
	pop	rbp
	ret
