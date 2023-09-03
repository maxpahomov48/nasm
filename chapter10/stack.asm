;; stack.asm
extern	printf
section	.data
	strng		db	"ABCDE",0
	strngLen	equ	$-strng-1	;stringlenght without 0.
	fmt1		db	"The original string: %s",10,0
	fmt2		db	"the reserved string: %s",10,0
section	.bss
section	.text
	global main
main:
	push	rbp
	mov	rbp, rsp
	; Print original string.
	mov	rdi, fmt1
	mov	rsi, strng
	mov	rax, 0
	call	printf
	; Pushing string char by char into stack.
	xor	rax, rax		
	mov	rbx, strng		; Adress of strng in rbx.
	mov	rcx, strngLen		; Lenght strng in rcx - counter.
	mov	r12, 0			; Use r12 as a pointer.
	pushLoop:
	mov	al, byte [rbx+r12]	; Write char to rax.
	push	rax			; Push rax into stack.
	inc	r12			; Incremention pointer by 1.
	loop	pushLoop		; Continue...
	; Poping string char by char out from stack.
	; It allows to reverse original string. 
	mov	rbx, strng		; Adress of string in rbx.
	mov	rcx, strngLen		; Lenght string in rcx - counter.
	mov	r12, 0			; Use r12 as a pointer.
	popLoop:
	pop	rax			; Pop char out of stack.
	mov	byte [rbx+r12], al	; Write char to string.
	inc	r12			; Inc r12 by 1.
	loop	popLoop			; Continue...
	mov	byte [rbx+r12], 0	; End of string with zero.
	; Print reversed string to std.
	mov	rdi, fmt2
	mov	rsi, strng
	mov	rax, 0
	call	printf
	
	mov	rsp, rbp
	pop	rbp
	ret
