;module:show good status:
    ;parameter
    ;BX:address of good
;che chunchi
;2020/4/6
;manjaro
;procedure:2 to 10 printf
    ;parameter:
    ;AX/EAX:2 bit number
    ;DX:flag
%include "global.h"

;global define
global  goodstatus
global  f2to10
global  good_name
global  len_good_name
global  count
global  len_count
global  in_price
global  len_in_price
global  out_price
global  len_out_price
global  in_num
global  len_in_num
global  out_num
global  len_out_num
global  grand
global  len_grand
extern  crlf
extern  len_crlf

;data segment
section .data  
buf times   12  db  0
testing    db  "testing"
len_testing    equ $-testing
block   db  "[]"
len_block   equ $-block

good_name   db  "good_name="
len_good_name   equ $-good_name
count   db  "count="
len_count   equ $-count
in_price    db  "in_price="
len_in_price    equ $-in_price
out_price   db  "out_price="
len_out_price   equ $-out_price
in_num  db  "in_num="
len_in_num  equ $-in_num
out_num db  "out_num="
len_out_num equ $-out_num
grand   db  "grand="
len_grand   equ $-grand
showend db  "show end"
len_showend equ $-showend




;code segment
section .text
;test
;global  _start
;_start:
;    mov eax,    0
;    mov ax, 0xAB
;    mov dx, 16
;    call    f2to10
    ;write   len_testing,   testing
;exit:
;	mov	ebx,	0
;	mov	eax,	1
;	int	0x80    

goodstatus:
    push    eax
    write_pbx   len_good_name,  good_name
    ;printf name
    push    ebx
    write_16   10, bx
	pop    ebx
	;
    CRLF
    
    write_pbx   len_count,  count
    ;printf +10
    mov al, BYTE [ds:bx+10]
    mov ah, 0
    push    dx
    mov dx, 16
    call    f2to10
    pop dx
    ;
    CRLF
    
    write_pbx   len_in_price,   in_price
    ;printf +11
    call2to10   [ds:bx+11]
    ;
    CRLF
    
    write_pbx   len_out_price,  out_price
    ;printf +13
    call2to10   [ds:bx+13]
    ;
    CRLF
    
    write_pbx   len_in_num, in_num
    ;printf +15
    call2to10   [ds:bx+15]
    ;
    CRLF
    
    write_pbx   len_out_num,    out_num
    ;printf +17
    call2to10   [ds:bx+17]
    ;
    CRLF
    
    write_pbx   len_grand,  grand
    ;printf +19
    call2to10   [ds:bx+19]
    ;
    CRLF
    
    write_pbx   len_showend,    showend
    
    pop eax
    ret
	
	
;2 to 10 procedure
f2to10:
        push ebx
        push si
        ;lea si, [buf]
        mov si, buf
        cmp dx, 32
        je b
        movsx eax, ax
b:      or eax, eax
        jns plus
        neg eax
        mov BYTE [si],  '-'
        inc si
plus:   mov ebx, 10
        call radix
        mov byte [si], 0
        ;lea dx, buf
        ;mov ah, 9
        ;int 21h
        write_16   12,   buf
        ;mov	edx,	12 ;length of string
        ;mov	ecx,	buf ;address of string
        ;mov	ebx,	1
        ;mov	eax,	4
        ;int	0x80	
        pop si
        pop ebx
        ret
radix:
        push cx
        push edx
        xor cx, cx
lop1:   xor edx, edx
        div ebx
        push dx     
        inc cx     
        or eax, eax
        jnz lop1
lop2:   pop ax
        cmp al, 10
        jb l1 
        add al, 7
l1:     add al, 0x30
        mov [si], al
        inc si
        loop lop2
        pop edx
        pop cx
        ret
