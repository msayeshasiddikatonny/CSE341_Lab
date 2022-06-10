

.model small

.stack 100h

.data
 


       
.code
main proc



; enter your code here
 
mov cx,49  
mov ax,1
mov bx,1

l1:
    add ax,bx
    add bx,3
    loop l1
    
;dos exit   

    int 21h
    mov ah,4ch
    int 21h


 
    
ends

 