;module:change good status:
    ;parameter
    ;bx:address of good
;che chunchi
;2020/4/6
;manjaro
;procedure:10 to 2 printf
    ;parameter:
    ;si:address of string
    ;cx:length of string
    ;ax:result
%include "global.h"

;global define
global  f10t2
global  ch_status

extern  f2to10
extern  good_name
extern  len_good_name
extern  count
extern  len_count
extern  in_price
extern  len_in_price
extern  out_price
extern  len_out_price
extern  in_num
extern  len_in_num
extern  out_num
extern  len_out_num
extern  grand
extern  len_grand
extern  crlf
extern  len_crlf
extern  auth
;data segment
section .data   
dat dw  0AH
sign    db  0
in_db   times   5   db  0
in_dw   times   5   dw  0
result  dw  0
foward  db  "~>"
len_foward  equ $-foward
changeend   db  "change end"
len_changeend   equ $-changeend
good_none   db  "good:none"
len_good_none   equ $-good_none
not_boss    db  "Permission denied"
len_not_boss    equ $-not_boss
;code segment
section .text
;test
;global  _start
;_start:
;    read    2,  in_dw
;    mov si, in_dw
;    mov cx, 2
;    call    f10t2
;    mov [result],   ax
;exit:
;	mov	ebx,	0
;	mov	eax,	1
;	int	0x80    

ch_status:
    push    eax
    push    ecx
    push    edx
    push    si
    ;check have good
    cmp bx, 0
    jne check_boss
    write_pbx   len_good_none,  good_none
    pop    si
    pop    edx
    pop    ecx
    pop    eax
    ret
;check is boss
check_boss:
    cmp BYTE [auth],    1
    je  change_body
    write_pbx   len_not_boss,   not_boss
    pop    si
    pop    edx
    pop    ecx
    pop    eax
    ret
    
change_body:
    push    ebx
    write_16   10, [ds:bx]
    pop ebx
    
    ;count
    write_pbx   len_count,  count
    ;printf +10
    mov al, BYTE [ds:bx+10]
    mov ah, 0
    push    dx
    mov dx, 16
    call    f2to10
    pop dx
    
    write_pbx   len_foward, foward
    
    ;change
    read_pbx    5,  in_db
    mov si, in_db
    mov cx, 5
    mov ax, 0
    call    f10t2
    mov BYTE [ds:bx+10],    al
    
    ;in_price
    write_pbx   len_in_price,   in_price
    ;printf +11
    mov ax, WORD [ds:bx+11]
    push    dx
    mov dx, 16
    call    f2to10
    pop dx
    
    write_pbx   len_foward, foward
    
    ;change
    read_pbx    5,  in_dw
    mov si, in_dw
    mov cx, 5
    mov ax, 0
    call    f10t2
    mov WORD [ds:bx+11],    ax

    ;out_price
    write_pbx   len_out_price,   out_price
    ;printf +13
    mov ax, WORD [ds:bx+13]
    push    dx
    mov dx, 16
    call    f2to10
    pop dx
    
    write_pbx   len_foward, foward
    
    ;change
    read_pbx    5,  in_dw
    mov si, in_dw
    mov cx, 5
    mov ax, 0
    call    f10t2
    mov WORD [ds:bx+13],    ax

    
    ;in_num
    write_pbx   len_in_num,   in_num
    ;printf +15
    mov ax, WORD [ds:bx+15]
    push    dx
    mov dx, 16
    call    f2to10
    pop dx
    
    write_pbx   len_foward, foward
    
    ;change
    read_pbx    5,  in_dw
    mov si, in_dw
    mov cx, 5
    mov ax, 0
    call    f10t2
    mov WORD [ds:bx+15],    ax
    
    write_pbx   len_changeend,  changeend
    
    pop    si
    pop    edx
    pop    ecx
    pop    eax
    ret
    
f10t2:
	push dx
	push bx
	mov ax,0
	mov BYTE [sign],0
	mov bl,BYTE [si]
	cmp bl,'+'
	jz  a
	cmp bl,'-'
	jne next2
	mov BYTE [sign],1
a:
	dec cx
	jz err
next1:
	inc si
	mov bl,BYTE [si]
next2:
	cmp bl,'0'
	jb err
	cmp bl,'9'
	ja err
	sub bl,30h
	mov bh,0
	mul WORD [dat]
	jo err
	add ax,bx
	jc err
	
	dec cx
	jnz next1
	cmp BYTE [sign],1
	jne qq
	neg ax

qq:
	pop bx
	pop dx
	ret
err:
	mov si,-1
	jmp qq






