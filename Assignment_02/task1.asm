.MODEL SMALL
.STACK 100H
.DATA
a db "1st input: $"
b db "2nd input: $"
c db "The product is $"
 
.CODE


MAIN PROC
    mov ax,@DATA
    mov ds,ax
    
    mov ah,9
    lea dx,a    
    int 21h
    
    mov ah,1
    int 21h        
    mov bl,al 
                     
    mov ah,2
    mov dl,0dh
    int 21h
    mov dl,0ah
    int 21h 
    
    mov ax,@DATA
    mov ds,ax
    
    mov ah,9
    lea dx,b    
    int 21h
    
     mov ah,1
    int 21h        
       
       
      sub bl,48
      sub al,48
      mul bl
   
      mov bl,al 
      add bl,48
    
    mov ah,2
    mov dl,0dh
    int 21h
    mov dl,0ah
    int 21h
      mov ax,@DATA
    mov ds,ax
    
    mov ah,9
    lea dx,c    
    int 21h
     
       mov ah,2
    mov dl,0dh
    int 21h
    mov dl,0ah
    int 21h 
        
        
    mov ah , 2
         
    mov dl ,bl
    int 21h 
    
    
      
    
    
    
    
    
    MAIN ENDP
END MAIN