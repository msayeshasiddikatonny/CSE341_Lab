.model small

; Macro for printing messages

printtext macro msg
push ax
push bx
push cx
push dx
LEA dx,msg
mov ah,09h
int 21h
pop dx
pop cx
pop bx
pop ax
endm

 
.data
msg1 db 0ah,0dh,"Enter First Number:$"
msg2 db 0ah,0dh,"Enter Second Number:$"   
msg3 db 0ah,0dh,"Result=$"
msg4 db 0ah,0dh,"Divisible$"
msg5 db 0ah,0dh,"Not-Divisible$"   
num dw 0
.code
mov ax,@data  
mov ds,ax
printtext msg1  
call readnum
mov bx,num
  
printtext msg2  
call readnum
mov ax,num  




  
mul  bx 

 
mov dx,ax
mov cl,02
mov ch,05


  
div cl
cmp ah,00
je x1
x2:
    printtext msg5
    jmp ex
  
x1:
    mov ax,dx
    div ch
    cmp ah,00
    jnz x2
    printtext msg4
ex:
mov ah,4ch
int 21h

; Procedure to read a number to the variable num declared in the data segment

readnum proc near
push ax
push bx
push cx
push dx
mov num,00
r1:
mov ah,01h
int 21h
cmp al,0dh
je r2
mov cx,ax
and cx,00ffh
sub cx,30h
mov bx,10
mov ax,num
mul bx
add ax,cx
mov num,ax
jmp r1
r2:
pop dx
pop cx
pop bx
pop ax
ret
readnum endp

end