cr equ 0dh
lf equ 0ah

data segment
str db 'THIS IS UPPERCASE MESSAGE $'

n dw $ -str
data ends

code segment
     assume cs:code,ds:data

start: mov ax,data
mov ds,ax

mov cx,n
dec cx

lea dx,str
mov ah,09h
int 21h

lea si,str


top: mov al,[si]
or al,020h
mov [si],al
inc si
loop top

lea dx,str
mov ah,09h
int 21h

exit: mov al,00h
mov ah,04ch
int 21h
code ends
end start