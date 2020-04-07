;global head file for Experiment 3
;hustccc
;2020/4/6
;Manjaro
;define write
%macro  write   2
    mov	edx,	%1 ;length of string
    mov	ecx,	%2 ;address of string
    mov	ebx,	1
    mov	eax,	4
    int	0x80	
    %endmacro
;define read
%macro  read    2
    mov	edx,	%1 ;length of string
    mov	ecx,	%2 ;address of string
	mov	ebx,	0
	mov	eax,	3
	int	0x80
	%endmacro 
%macro  write_16   2
    mov	dx,	%1 ;length of string
    mov	cx,	%2 ;address of string
    mov	ebx,	1
    mov	eax,	4
    int	0x80	
    %endmacro
%macro  Block   0
    push   bx
    write   len_block,  block
    pop bx
    %endmacro
%macro  call2to10   1
    mov ax, WORD %1
    push    dx
    mov dx, 16
    call    f2to10
    pop dx
    %endmacro
%macro  CRLF    0
    push    ebx
    mov	edx,	len_crlf
    mov	ecx,	crlf
    mov	ebx,	1
    mov	eax,	4
    int	0x80
    pop ebx
    %endmacro
%macro  write_pbx   2
    push    ebx
    mov	edx,	%1 ;length of string
    mov	ecx,	%2 ;address of string
    mov	ebx,	1
    mov	eax,	4
    int	0x80	
    pop ebx
    %endmacro
%macro  read_pbx    2
    push    ebx
    mov	edx,	%1 ;length of string
    mov	ecx,	%2 ;address of string
	mov	ebx,	0
	mov	eax,	3
	int	0x80
	pop    ebx
	%endmacro 
