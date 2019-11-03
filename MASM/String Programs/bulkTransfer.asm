cr	equ	0dh
lf	equ	0ah
data	segment
string1	db	40h,10h,50h,20h,90h,12h,56h,45h,36h
min	db	0
data	ends

code	segment
assume	cs:code,ds:data
start:	mov ax,data
mov	ds,ax
xor	di,di
mov	cl,10
lea	si,string1
lea	di,min

loop:	mov	di,[si]
inc	si
inc	di
dec	cl
jnz	loop			
code 	ends
end start