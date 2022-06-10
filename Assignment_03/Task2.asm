; 

.model small

.stack 100h

.data
str1 db ' 1st input: $'
str2 db ' 2nd input: $' 
msg1 db "It is divisible by 2 and 5$"
msg2 db "It is not divisible by 2 and 5$"


       
.code
main proc



; enter your code here
 
mov ax,@data
mov ds,ax
lea dx,str1
mov ah,9
int 21h   


mov ah,1   ;taking the input of hex digit
int 21h
mov bl,al
sub bl,48d


mov ah,2
mov dl,0dh
int 21h
mov dl,0ah
int 21h 

mov ax,@data
mov ds,ax
lea dx,str2
mov ah,9
int 21h 

mov ah,1  
int 21h
mov cl,al
sub cl,48d

   

mov al,cl
mul bl
mov bl,al
add bl,48d
 


mov ah,2
mov dl,0dh
int 21h
mov dl,bl
int 21h 
mov dx,bx
int 21h

    mov ax, data
    mov ds, ax
    mov es, ax

       
    
    mov cl , dl 
    ;sub cl,48d
    mov bh , 2
    mov bl , 5
    sub cl,48d
    mov al , cl
    div bh
    cmp ah , 0
    je check5
    jmp noPrint
    
    check5:
        mov al , cl
        div bl
        cmp ah , 0
        je print
        jmp noPrint
        
    print:
        
        lea dx, msg1
        mov ah, 9
        int 21h
        jmp exit 
        
    noPrint:
        lea dx, msg2
        mov ah, 9
        int 21h
        jmp exit
        
    exit:
    
ends

 