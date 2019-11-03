cr equ 0dh
lf equ 0ah

data segment
password db 'mpmclab'

rmsg db 10,13,'enter your password: $'
msg db 10,13,'the password is correct $'
wmsg db 10,13,'the password is wrong $'
new db 10,13,'$'

data ends

code segment
     assume cs:code,ds:data

start: mov ax,data
mov ds,ax

lea dx,rmsg
mov ah,09h
int 21h

mov dx,00h

lea bx,password

top:
mov ah,01
int 21h

cmp al,[bx]
je counter

cmp al,0dh
je endl

cmp al,[bx]
jne top

inc bx
jmp endl

counter: inc dx
inc bx
jmp top

endl:
cmp dx,07
je correct
cmp dx,07h
jne notcorrect

correct:
lea dx,msg
mov ah,09h
int 21h
jmp exit

notcorrect:
lea dx,wmsg
mov ah,09h
int 21h
jmp exit

exit:
mov ah,04ch
int 21h

code ends
end  start 