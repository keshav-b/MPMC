cr equ 0dh
lf equ 0ah

data 	segment
table 	db	'0123456789abcdef'
n1 	db 	055h
n2 	db 	054h
r 	db 	000h
msg 	db 	'the result is   '
asciir 	db 	4 dup(?)
	db	cr,lf,'$'
data	ends

code 	segment
	assume	cs:code,ds:data
start:	mov	ax,data
	mov	ds,ax
	mov 	al,n1
	sub	al,n2
	lea	bx,table
	mov	r,al
	lea	si,asciir
	add	si,3
	mov	al,r
	and	al,00fh
	xlat	
	mov	[si],al
	dec	si
	mov	al,r
	and	al,0f0h
	mov	cl,04h
	shr	al,cl
	xlat
	mov	[si],al
	
	mov	ah,09h
	lea	dx,msg
	int	21h
quit:	mov	al,0
	mov	ah,04ch
	int	21h
	code	ends
	end 	start