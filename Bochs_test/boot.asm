;boot.asm
;test file for bochs
;hustccc
;2020/3/27
;Archlinux
org	07c00h		;goto 7c00
	mov	ax,	cs
	mov	ds,	ax
	mov	es,	ax
	call	DispStr	;loop call
	jmp	$	
DispStr:
	mov	ax,	BootMessage
	mov	bp,	ax	;es:dp=string address
	mov	cx,	16	;cx=length of string
	mov	ax,	01301h
	mov	bx,	000ch;
	mov	dl,	0
	int	10h;
	ret
BootMessage:
	db	"Hello,OS World!"
	times	510-($-$$)	db	0
	dw	0xaa55;
