;; console2.asm
section	.data
	msg1		db	"Hello, World!",10,0
	msg2		db	"Your turn (only a-z): ",0
	msg3		db	"You answered: ",0
	inputlen	equ	10				; Buffer lenght
	NL		db	0xa
section	.bss
	input	resb	inputlen+1
section	.text
	global main
main:
	push	rbp
	mov	rbp, rsp

	mov	rdi, msg1
	call	prints
	mov	rdi, msg2
	call	prints
	mov	rdi, input
	mov	rsi, inputlen
	call	reads
	mov	rdi, msg3
	call	prints
	mov	rdi, input
	call	prints
	mov	rdi, NL				; New line symbol.
	call	prints
leave
ret
;--------------------------------------
prints:
	push	rbp
	mov	rbp, rsp
	push	r12				; Saved register by calling func.
	; Count chars.
	xor	rdx, rdx			; length in rdx.
	mov	r12, rdi
.lengthloop:
	cmp	byte [r12], 0
	je	.lengthfound
	inc	rdx
	inc	r12
	jmp	.lengthloop
.lengthfound:					; string out, lenght in rdx.
	cmp	rdx, 0				; string doesn't exist(len=0).
	je	.done
	mov	rsi, rdi			; rdi - string adress.
	mov	rax, 1				; 1 = write.
	mov	rdi, 1				; 1 = stdout.
	syscall
.done:
	pop	r12
	leave
	ret
;--------------------------------------
reads:
section	.data
section	.bss
	.inputchar	resb	1
section	.text
	push	rbp
	mov	rbp, rsp

	push	r12
	push	r13
	push	r14
	mov	r12, rdi			; inputbuffer's adress.
	mov	r13, rsi			; Maximum length in r13.
	xor	r14, r14			; Char's counter.
.readc:
	xor	rax, rax			; Read.
	mov	rdi, 1				; 1 = stdin.
	lea	rsi, [.inputchar]		; Source adress.
	mov	rdx, 1				; Number of reading chars.
	syscall
	mov	al, [.inputchar]		; Input NL?
	cmp	al, byte [NL]
	je	.done				; NL - end of input.
	cmp	al, 97				; Char code < a?
	jl	.readc				; Cut the char.
	cmp	al, 122				; Char code > z?
	jg	.readc				; Cut the char.
	inc	r14				; Inc counter of chars.
	cmp	r14, r13			
	ja	.readc				; Maximum buffer fill, cut the excludings.
	mov	byte [r12], al
	inc	r12				; Mov pointer to next char.
	jmp	.readc
.done:
	inc	r12
	mov	byte [r12], 0			; Add NL to inputbuffer.
	pop	r14
	pop	r13
	pop	r12
leave
ret
