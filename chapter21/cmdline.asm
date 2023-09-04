;; cmdline.asm
extern	printf
section	.data
	msg	db	"The command and arguments: ",10,0
	fmt	db	"%s",10,0
section	.bss
section	.text
	global main
main:	
	push	rbp
	mov	rbp, rsp

	mov	r12, rdi	; Arguments number.
	mov	r13, rsi	; Adress to the array of arguments.
	; Print heading.
	mov	rdi, msg
	call	printf
	xor	r14, r14
	; Print command name and arguments.
.ploop:	; Going through array.
	mov	rdi, fmt
	mov	rsi, qword [r13+r14*8] ; *8 - means 8 bytes = 64 bits.
	call	printf
	inc	r14
	cmp	r14, r12	; Max number of arguments?
	jl	.ploop
leave
ret

