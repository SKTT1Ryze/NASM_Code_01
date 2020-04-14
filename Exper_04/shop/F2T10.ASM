;本模块完成功能：将有符号二进制数转换成十进制ASCII码输出。
    PUBLIC  F2T10
.386
;子程序F2T10
;功能：将有符号二进制数转换成十进制ASCII码输出（16位段）。
;入口参数：
    ;AX/EAX 存放待转换的二进制数。
    ;DX 存放16位或32位标志，(DX)=32表示待转换数在EAX中。返回时会被修改（因为要输出）。
;出口参数：无。

;子程序RADIX
;功能：将EAX中的32位无符号二进制数转换为P进制数（16位段）。
;入口参数：
    ;EAX 存放待转换的二进制数。
    ;EBX 存放要转换数制的基数。
    ;SI 存放转换后的P进制ASCII码数字串的字节缓冲区首址。
;出口参数：
    ;所求P进制ASCII码数字串按高位在前，低位在后的顺序存放在以SI为指针的字节缓冲区中。
    ;SI 指向字节缓冲区中最后一个ASCII码的下一个字节处。
DATA SEGMENT USE16 PARA PUBLIC 'DATA'
BUF     DB  12 DUP(?)
DATA ENDS
CODE SEGMENT USE16 PARA PUBLIC 'CODE'
    ASSUME  CS:CODE, DS:DATA
F2T10   PROC    FAR     ;NEAR会如何呢？
        PUSH EBX
        PUSH SI
        LEA SI, BUF
        CMP DX, 32
        JE B
        MOVSX EAX, AX
B:      OR EAX, EAX
        JNS PLUS
        NEG EAX
        MOV BYTE PTR [SI], '-'
        INC SI
PLUS:   MOV EBX, 10
        CALL RADIX
        MOV BYTE PTR [SI], '$'
        LEA DX, BUF
        MOV AH, 9
        INT 21H
        POP SI
        POP EBX
        RET
F2T10   ENDP

RADIX   PROC
        PUSH CX
        PUSH EDX
        XOR CX, CX
LOP1:   XOR EDX, EDX
        DIV EBX
        PUSH DX     ;余数入栈
        INC CX      ;记录余数个数
        OR EAX, EAX
        JNZ LOP1
LOP2:   POP AX
        CMP AL, 10
        JB L1 
        ADD AL, 7
L1:     ADD AL, 30H
        MOV [SI], AL
        INC SI
        LOOP LOP2
        POP EDX
        POP CX
        RET
RADIX   ENDP
CODE    ENDS
        END 