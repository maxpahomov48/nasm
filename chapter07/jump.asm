;; jump.asm
extern printf
section .data
	number1	dq	40
	number2	dq	42
	fmt1	db	"Number1 > = number2",10,0
	fmt2	db	"Number1 < number2",10,0
section .bss
section .text
	global main
main:
	  push	rbp		; Prologue
	  mov	rbp, rsp	; Function.
	
	  mov	rax, [number1]	; number1 -> rax.
	  mov	rbx, [number2]	; number2 -> rbx.
	  cmp	rax, rbx	; cmp rax with rbx.
	  jge	greater		; if rax >= rbx, then jump to greater.
	  mov	rdi, fmt2	; if rax < rbx, then continue...
	  mov	rax, 0		; xmm does NOT use.
	  call	printf		; print fmt2 string.
	  jmp	exit		; go exit after.
greater:
	  mov	rdi, fmt1	; rax greater rbx.
	  mov	rax, 0		; xmm does NOT use.
	  call	printf
exit:	
	  mov	rsp, rbp
	  pop	rbp
	  ret
