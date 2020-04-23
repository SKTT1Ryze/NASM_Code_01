;test file for write function
;hustccc
;2020/3/26
section	.data				;data segment
	msg1	db	"test",0xA	;string1
	len1	equ	$-msg1		;length of string1
	msg2	dw	"write",0xA	;string2
	len2	equ	$-msg2		;length of string2
section	.text				;code segment
global	_start				;start define
_start:
	mov	edx,	len1
	mov	ecx,	msg1	
	mov	ebx,	1
	mov	eax,	4
	int	0x80
	jmp	second
exit:
	mov	ebx,	0
	mov	eax,	1
	int	0x80	
second:
	mov	edx,	len2
	mov	ecx,	msg2
	mov	ebx,	1
	mov	eax,	4
	int	0x80	
	jmp	exit
