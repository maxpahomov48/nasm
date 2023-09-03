;; console1.asm
section	.data
	msg1		db	"Hello, World!",10,0
	msg1len		equ	$-msg1
	msg2		db	"Your turn: ",0
	msg2len		equ	$-msg2
	msg3		db	"You answered: ",0
	msg3len		equ	$-msg3
	inputlen 	equ	10 			; InputBuffer lenght.
section	.bss
	input		resb	inputlen+1		; Reserved place for 0.
section	.text
	global main
main:
	push	rbp
	mov	rbp, rsp
	
	mov	rsi, msg1				; First string output.
	mov	rdx, msg1len
	call	prints

	mov	rsi, msg2
	mov	rdx, msg2len
	call	prints
	
	mov	rsi, input				; Inputbuffer's adress.
	mov	rdx, inputlen				; Inputbuffer's lenght.
	call	reads					; Input is waiting.
	
	mov	rsi, msg3
	mov	rdx, msg3len
	call	prints

	mov	rsi, input
	mov	rdx, inputlen
	call	prints

	leave
	ret
;--------------------------------------
prints:
	push	rbp
	mov	rbp, rsp

	; rsi - adress of string.
	; rdi - string lenght.
	
	mov	rax, 1					; 1 = write.
	mov	rdi, 1					; 1 = stdout - standart output.
	syscall

	leave
	ret
;--------------------------------------
reads:
	push	rbp
	mov	rbp, rsp

	; rsi - adress of inputbuffer.
	; rdi - lenght of inputbuffer.

	mov	rax, 0					; 0 = read.
	mov	rdi, 1					; 1 = stdin - standart input.
	syscall
	
	leave
	ret
