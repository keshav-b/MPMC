CR EQU 0DH
LF EQU 0AH
DATA SEGMENT
STRING1 DB 'LIRIL'
STRLENGTH EQU $-STRING1
MESSAGE1 DB 'THE GIVEN WORD IS PALINDROME'
DB CR, LF, '$'
MESSAGE2 DB 'THE GIVEN WORD IS NOT PALINDROME'
DB CR, LF, '$'
STRING2 DB 5 DUP(' ')
DB CR, LF, '$'
DATA ENDS
CODE SEGMENT
Assume CS:Code, DS: Data
START: MOV AX, DATA
MOV DS, AX
MOV ES,AX
LEA SI,STRING1
LEA DI, STRING2+STRLENGTH-1
MOV CX, STRLENGTH
TOP: CLD
LODSB
STD
STOSB
LOOP TOP
LEA SI, STRING1
LEA DI, STRING2
CLD
MOV CX, STRLENGTH
REPE CMPSB
CMP CX,00H
JNZ NOTPALINDROME
MOV AH,09H
LEA DX, MESSAGE1
INT 21H
JMP QUIT
NOTPALINDROME: MOV AH,09H
LEA DX, MESSAGE2
INT 21H
QUIT: MOV AL,0
MOV AH, 04CH
INT 21H
CODE ENDS
END START
