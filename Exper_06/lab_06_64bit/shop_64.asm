;assemble lab 6 nasm file
;2020/5/10
;Manjaro
;hustccc
[section	.text]
global	nasmadd
global	nasmprintf
global	nasmscanf
global	nasmsub
nasmadd:
	push	rbp
	mov	rbp,	rsp
	push	rbx
	mov	rax,	rdi
	mov	rbx,	rsi
	add	rax,	rbx
	pop	rbx
	leave
	ret

nasmprintf:
	push	rbp
	mov	rbp,	rsp
	push	rbx
	mov	rbx,	rdi	;parameter 1, fd
	mov	rcx,	rsi	;parameter 2, address of  msg
				;parameter 3 already in rdx
	mov	eax,	1	;system call index 64 bit
	syscall
	pop	rbx
	leave
	ret

nasmscanf:
	push	rbp
	mov	rbp,	rsp
	push	rbx
	mov	rbx,	rdi	;parameter 1, fd
	mov	rcx,	rsi	;parameter 2, address of msg
				;parameter 3 already in rdx
	mov	eax,	0	;system call index 64 bit
	syscall
	pop	rbx
	leave
	ret

nasmsub:
	push	rbp
	mov	rbp,	rsp
	push	rbx
	mov	rax,	rdi
	mov	rbx,	rsi
	sub	rax,	rbx
	pop	rbx
	leave
	ret
