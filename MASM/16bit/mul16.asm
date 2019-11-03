cr	equ	0dh
lf	equ	0ah
data	segment
	table 	db	 '0123456789abcdef'
	n1 		db	  002h	
	n2		db    002h
	result 	dw 	  00000h
	msg 	db 	  'the result is '
	asciir 	db 	  4 dup(?)
		db  cr,lf,'$'
data	ends

code	segment
	assume	 cs:code,ds:data
start:	mov ax,data
	mov	ds,ax
	mov al,n1
	mov bl,n2
	mul bl
	lea bx,table
	mov result,ax	
	lea si,asciir
	add si,3
	mov ax,result
	and ax,0000Fh
	xlat
	mov [si],al
	dec si
	mov ax,result
	and ax,000f0h
	mov cl,04h
	shr al,cl
	xlat
	mov [si],al
	dec si
	mov ax,result
	and ax,00f00h 
	mov cl,08h 
	shr ax,cl 
	xlat
	mov [si],al
	dec si
	mov ax,result
	and ax,0f000h
	mov cl,0bh
	shr al,cl
	xlat
	mov [si],al
	mov ah,09h
	lea dx,msg
	int 21h
	quit: mov al,00h
	mov ah,04ch
	int 21h
	code	ends
end 	start