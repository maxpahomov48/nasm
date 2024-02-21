; cpu.asm
extern	printf
section	.data
	fmt_no_sse db  "This CPU does not support SSE",10,0
	fmt_sse42  db  "This CPU supports SSE 4.2",10,0
	fmt_sse41  db  "This CPU supports SSE 4.1",10,0
	fmt_ssse3  db  "This CPU supports SSSE 3",10,0
	fmt_sse3   db  "This CPU supports SSE 3",10,0
	fmt_sse2   db  "This CPU supports SSE 2",10,0
	fmt_sse    db  "This CPU supports SSE",10,0
section	.bss
section	.text
	global main
main:
	push	rbp
	mov	rbp,rsp

	call	cpu_sse		; Return 1 into rax, if supports sse, else 0.
leave
ret
;----------------------------------------------------------
cpu_sse:
	push	rbp
	mov	rbp,rsp
	xor	r12,r12		; Flag SSE available.
	mov	eax,1		; Query cpu-flags.
	cpuid
; Test support SSE.
	test	edx,2000000h	; Test 25-bit (SSE).
	jz	sse2		; SSE - available.
	mov	r12,1
	xor	rax,rax
	mov	rdi,fmt_sse
	push	rcx
	push	rdx
	call	printf
	pop	rdx
	pop	rcx
sse2:
	test	edx,4000000h	; Test 26-bit (SSE 2).
	jz	sse3		; SSE 2 available.
	mov	r12,1
	xor	rax,rax
	mov	rdi,fmt_sse2
	push	rcx
	push	rdx
	call	printf
	pop	rdx
	pop	rcx
sse3:	
	test	ecx,1		; Test bit 0 (SSE 3).
	jz	ssse3		; SSE 3 available.
	mov	r12,1
	xor	rax,rax
	mov	rdi,fmt_sse3
	push	rcx
	call	printf
	pop	rcx
ssse3:	
	test	ecx, 9h		; Test bit 0 (SSSE 3).
	jz	sse41		; SSE 3 available.
	mov	r12,1
	xor	rax,rax
	mov	rdi,fmt_ssse3
	push	rcx
	call	printf
	pop	rcx
sse41:
	test	ecx,80000h	; Test 19 bit (SSE 4.1).
	jz	sse42		; SSE 4.1 available.
	mov	r12,1
	xor	rax,rax
	mov	rdi,fmt_sse41
	push	rcx
	call	printf
	pop	rcx
sse42:
	test	ecx,100000h	; Test 20 bit (SSE 4.2).
	jz	wrapup		; SSE 4.2 available.
	mov	r12,1
	xor	rax,rax
	mov	rdi,fmt_sse42
	push	rcx
	call	printf
	pop	rcx
wrapup:
	cmp	r12,1
	je	sse_ok
	mov	rdi,fmt_no_sse
	xor	rax,rax		; Print msg, if SSE doesn't available.
	call	printf
	jmp	the_exit
sse_ok:
	mov	rax,12		; Return 1, sse supports.
the_exit:
leave
ret
