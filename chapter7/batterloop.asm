;; batterloop.asm
extern	printf
section	.data
	number	dq	1000000000
	fmt	db	"The sum from 0 to %ld is %ld",10,0
section	.bss
section	.text
	global main
main:
	push	rbp
	mov	rbp, rsp

	mov	rcx, [number]		; Initialize rcx with value number.
	mov	rax, 0
bloop:	
	add	rax, rcx		; rax = rax + rcx
	loop	bloop			; Cycle, while rcx decrement 1.
					; Do while then rcx = 0.
	mov	rdi, fmt		; rcx=0, continue here.
	mov	rsi, [number]		; Out summary.
	mov	rdx, rax		
	mov	rax, 0			; No float.
	call	printf			; Out result.
	
	mov	rsp, rbp
	pop	rbp
	ret
