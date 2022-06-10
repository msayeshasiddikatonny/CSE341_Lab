.model small


.stack 100h


.data
	 
	
num1 db ?
num2 db ?
temp db ?
ten db 10
readnum db ?
t2 db ?
t1 db ?
	
msg1 db 10,13,"please enter smaller num(if it is 1 byte then add 0 before it): $"
msg2 db 10,13,"please enter higher num(if it is 1 byte then add 0 before it): $"
msg3 db 10,13,"the numbers divisible by 3 are: $"
  

.code

	mov ax,@data
	mov ds,ax
	
	; code starts here
	
	call read1   
	call read2
	call read3

	call div3

	  
	call endl
	  
	  
	mov ax,4c00h
	int 21h


	proc endl
	mov dl,0ah
	mov ah,02h
	int 21h
	ret
	endp

	proc read1
	mov dx,offset msg1
	mov ah,09h
	int 21h

	mov ah,01h
	int 21h
	sub al,48
	mov num1,al

	mov ah,01h
	int 21h
	sub al,48
	mov num2,al   

	mov al,num1
	mul ten
	add al,num2

	mov readnum,al
	  
	ret
	endp   
	  

	proc div3
	  
	mov al,readnum
	mov bl,3
	mov bh,al
loop1:
	mov ah,00
	mov al,bh
	div bl
	cmp ah,00
	jz write
loop2:
	inc bh
	dec cl
	jne loop1
	  
	ret
	endp


	proc read2
	mov dx,offset msg2
	mov ah,09h
	int 21h

	mov ah,01h
	int 21h
	sub al,48
	mov num1,al

	mov ah,01h
	int 21h
	sub al,48
	mov num2,al   

	mov al,num1
	mul ten
	add al,num2   

	mov cl,al
	sub cl,readnum

	ret
	endp
	  
	proc read3
	  
	mov dx,offset msg3
	mov ah,09h
	int 21h
	  
	ret
	endp
	  

	proc write

	mov al,bh
	mov ah,00
	div ten

	mov dl,ah
	mov t2,dl

	mov dl,al
	add dl,48
	mov ah,02h
	int 21h

	mov dl,t2
	add dl,48
	mov ah,02h
	int 21h   

	call sp
	jmp loop2
	endp

	proc sp
	mov dl, ' '
	mov ah, 2
	int 21h
	ret
	endp
	
end
