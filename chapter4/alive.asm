;;alive.asm
section .data
	msg1	db	"Hello, World!",10,0	  ; String with NL - code and 0.
	msg1Len 	equ	$-msg1-1	  ; Compute string above lenght.
	msg2	db	"Alive and Kicking!",10,0 ; String with NL - code and 0.
	msg2Len		equ	$-msg2-1	  ; Compute string above lenght.
	radius	dq	357			  ; qword radius = 357.
	pi	dq	3.1415926		  ; qword pi = 3.1415926.
section .bss
section .text
	global main
main:
	push	rbp				  ; Prologue of function.	
	mov	rbp, rsp			  ; Prologue of function.
	
	mov	rax, 1				  ; 1 = write.
	mov	rdi, 1				  ; 1 = stdout.
	mov	rsi, msg1			  ; msg1 string.
	mov     rdx, msg1Len			  ; Lenght of msg1.
	syscall					  ; Write.

	mov	rax, 1				  ; 1 = write.      	
	mov	rdi, 1                            ; 1 = stdout.
	mov	rsi, msg2                         ; msg2 string.
	mov	rdx, msg2Len                      ; Lenght of msg2.
	syscall					  ; Write.

	mov	rsp, rbp			  ; Epilogue of function.
	pop	rbp				  ; Epilogue of function.
	
	mov	rax, 60				  ; 60 = exit.
	mov	rdi, 0				  ; 0 = return success finish.
	syscall					  ; Exit.
