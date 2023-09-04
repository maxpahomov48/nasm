; asum.asm
section	.data
section	.bss
section	.text
global asum
asum:
	section	.text
	; Calculate the sum.
	mov	rcx, rsi	; Array length.
	mov	rbx, rdi	; Array adress.
	mov	r12, 0
	movsd	xmm0, qword [rbx+r12*8]
	dec	rcx		; One loop less, element already in xmm0.
sloop:
	inc	r12
	addsd	xmm0, qword [rbx+r12*8]
	loop	sloop
	ret			; Sum return to xmm0.
