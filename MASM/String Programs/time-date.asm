cr equ 0dh
lf equ 0ah

data segment

mess1 db 'The Current System Time Is : $'

mess2 db 'The Cuurent System Date Is : $'

newline db cr,lf,'$'

data ends

code segment
	assume cs:code,ds:data

start:
mov ax,data
mov ds,ax


;TIME

lea dx,mess1
mov ah,09h
int 21h


mov ah,02ch
int 21h

mov al,ch
call disp

mov dl,':'
mov ah,02h
int 21h


mov al,cl
call disp

mov dl,':'
mov ah,02h
int 21h

mov al,dh
call disp

; TIME OVER NOW DATE PARAKKKK!!!!!!!


;before that printing new line!!!!!1

lea dx,newline
mov ah,09h
int 21h




;DATE

lea dx,mess2
mov ah,09h
int 21h

mov ah,02ah
int 21h

mov al,dl
call disp

mov dl,'/'
mov ah,02h
int 21h

mov al,dh
call disp

mov dl,'/'
mov ah,02h
int 21h

mov al,14h
call disp


mov al,cl
call disp

mov ah,04ch
int 21h








disp proc

aam

add ax,3030h
mov bx,ax


mov dl,ah
mov ah,02h
int 21h

mov dl,bl
mov ah,02h
int 21h

ret

disp endp

code ends
end start

