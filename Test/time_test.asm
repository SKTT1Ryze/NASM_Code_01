;test file for time call
;hustccc
;Archlinux
;2020/3/29
section	.data
notice1	db	"begin",0xA
len_notice1	equ	$-notice1
notice2	db	"end",0xA
len_notice2	equ	$-notice2
time1	dd	0
time2	dd	0

timeval:
	tv_sec	dd	0
	tv_usec	dd	0
timezone:
	a	dd	0
	b	dd	0
section	.stack
times	200	db	0

section	.text
global	_start
_start:
	mov	bp,	timeval
	;begin
	mov	edx,	len_notice1
	mov	ecx,	notice1
	mov	ebx,	1
	mov	eax,	4
	int	0x80

	;time
time:	
	mov	eax,	78
	mov	ebx,	timeval
	mov	ecx,	timezone
	;syscall
	int	0x80

	;loop
	mov	si,	9999
loop:	mov	ebx,	0x9999
	mul	ebx
	div	ebx
	sub	si,	1
	cmp	si,	0
	jne	loop
	;loop end
	;end
	mov	edx,	len_notice2
	mov	ecx,	notice2
	mov	ebx,	1
	mov	eax,	4
	int	0x80
	
	;time
	mov	eax,	78
	mov	ebx,	timeval
	mov	ecx,	timezone
	int	0x80
exit:	
	mov	ebx,	0
	mov	eax,	1
	int	0x80
