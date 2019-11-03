cr	equ	0dh
lf	equ	0ah

data	segment
table	db	'0123456789ABCDEF'
n1	db	002h
n2	db	002h
res	db	00h
msg	db	'The Result is '
asres	db	2 dup(?)
	db	cr,lf,'$'
data	ends

code	segment
	assume	cs:code,ds:data
start:	mov	ax,data
	mov	ds,ax
	mov	al,n1
	sub	al,n2
	mov	res,al
	lea	bx,table
	lea	si,asres
	inc	si
	mov	al,res
	and	al,00FH
	xlat
	mov	[si],al
	dec	si
	mov	al,res
	and	al,0F0H
	mov	cl,04H
	shr	al,cl
	xlat
	mov	[si],al
	mov	ah,09H
	lea	dx,msg
	int	21h
quit:	mov	al,0
	mov	ah,04ch
	int	21h
	code	ends
	end	start