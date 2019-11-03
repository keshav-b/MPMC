data segment
string1 db 40h,10h,50h,20h,99h,12h,56h,45h,36h
data ends
code segment
	assume cs:code,ds:data
start: 	mov ax,data
	mov ds,ax
	mov ch,08h
up2:	mov cl,08h
	lea si,string1
up1:	mov al,[si]
	mov bl,[si+1]
	cmp al,bl
	jc down
	mov dl,[si+1]
	xchg [si],dl
	mov [si+1],dl
down:	inc si
	dec cl
	jnz up1
	dec ch
	jnz up2
quit:	mov al,0
	mov ah,04ch
	int 21h
code	ends
	end start