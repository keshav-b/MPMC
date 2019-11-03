cr	equ	0dh
lf	equ	0ah

data	segment
table	db	'0123456789abcdef'
array	db	40h,39h,81h,11h
result	db	00h
msg	db	'the largest number is '
asciir	db	2 dup(?)
	db	cr,lf,'$'
data	ends

code	segment

	assume	cs:code,ds:data
start:	mov	ax,data
	mov	ds,ax
	mov	cx,004h
	dec	cx
	lea	si,array
	mov	al,[si]
top:	inc	si
	cmp	al,[si]
	jc	down
	loop	top
	jmp	last
down:	xchg	al,[si]
	loop	top
last:	mov	result,al
	lea	bx,table
	lea	di,asciir
	inc	di
	mov	al,result
	and	al,00fh
	xlat
	mov	[di],al
	dec	di
	mov	al,result
	and	al,0f0h
	mov	cl,04h
	shr	al,cl
	xlat
	mov	[di],al
	mov	ah,09h
	lea	dx,msg
	int	21h
quit:	mov	al,00h
	mov	ah,04ch
	int	21h
code	ends
	end	start
	