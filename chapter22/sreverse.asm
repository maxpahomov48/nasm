; sreverse.asm
section	.data
section	.bss
section	.text
global sreverse
sreverse:
	push	rbp
	mov	rbp, rsp
pushing:
	mov	rcx, rsi,
	mov	rbx, rdi
	mov	r12, 0
pushLoop:
	mov	rax, qword [rbx+r12]
	push	rax
	inc	r12
	loop	pushLoop
pooping:
	mov	rcx, rsi
	mov	rbx, rdi
	mov	r12, 0
popLoop:
	pop	rax
	mov	byte [rbx+r12], al
	inc	r12
	loop	popLoop

	mov	rax, rdi
leave
ret
