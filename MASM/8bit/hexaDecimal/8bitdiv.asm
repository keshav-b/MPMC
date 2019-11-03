CR EQU 0DH
LF EQU 0AH

DATA SEGMENT
TABLE   DB '0123456789ABCDF'
lsbdiv	db	09h
msbdiv	db	08h
divisor	db	09h
msg1	db	' The Quotient is '
asquo	db	1 dup(?)
db	cr,lf,'$'
msg2	db	' The Remainder is '
asrem	db	1 dup(?)
db	cr,lf,'$'

data	ends

code	segment
assume	cs:code,ds:data
start:	mov	ax,data
mov	ds,ax
mov	al,lsbdiv
mov	ah,msbdiv
mov	dh,divisor
aad
div	dh
lea	bx,table
lea	si,asquo
xlat
mov	[si],al
mov	ah,09h
lea	dx,msg1
int	21h
lea	si,asrem

xlat
mov	[si],al
mov	ah,09h
lea	dx,msg2
int	21h
quit:	mov	al,0
mov	ah,04ch
int	21h
code ends
end	start