;; jumploop.asm
extern	printf
section	.data
	number	dq	1000000000
	fmt	db	"The sum from 0 to %ld is %ld",10,0
section	.bss
section	.text
	global main
main:
	push	rbp		; Prologue
	mov	rbp, rsp	; funtcion.
	mov	rbx, 0		; Counter.
	mov	rax, 0		; Sum will accumulate in rax.
jloop:	
	add	rax, rbx	; rax = rax + rbx.
	inc 	rbx		; rbx = rbx + 1.
	cmp	rbx, [number]	; Compare rbx with Number = 5.
	jle	jloop		; Jump if less or equal, if rbx <= 5.
	mov	rdi, fmt	; Direction is fmt.
	mov	rsi, [number]	; Source is number.
	mov	rdx, rax	; rdx = rax.
	mov	rax, 0		; rax = 0.
	call	printf
	mov	rsp, rbp
	pop	rbp
	ret
