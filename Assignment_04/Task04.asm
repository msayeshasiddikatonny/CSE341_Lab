

.model small

.stack 100h

.data
 
msg db 0ah,0dh,"ENTER A DEC DIGIT: $"
ch1 db ?  
 
msg1 db 0ah,0dh,"IN HEX IT IS: "
ch3 db ?,"$"
     
  
msg3 db 0ah,0dh,"DO YOU WANT TO DO IT AGAIN?:$"
c3 db ?  
msg4 db 0ah,0dh,"ILLEGAL CHARACTER ,INSERT AGAIN:  $"




       
.code
main proc



; enter your code here
 
 mov ax,@data
 mov ds,ax
 



again:
     
    mov ah,9
    lea dx,msg
    int 21h
    
    
    ;read a character
    mov ah,1
    int 21h
    mov ch1,al  
    jmp l1
    
   l1:
    ;checking the hex character
    cmp ch1,39h
    jbe digit
    
    
    mov ah,9
    lea dx,msg4
    int 21h 
    
    mov ah,1
    int 21h
    mov ch1,al  
    jmp l1 
     
 
input:
    ;if want to take more
    mov ah,9
    lea dx,msg3
    int 21h
    mov ah,1
    int 21h
    mov c3,al
    cmp c3,'y'
    
    je again
    jmp exit 
    
    
    digit:
        mov ah,9
        lea dx,msg1
        int 21h
        mov ah,2
        mov dl,ch1
        int 21h
        jmp input
    
    exit:
        mov ah,4ch
        int 21h
        main endp
    

 
    
ends

 