.MODEL SMALL
.STACK 100H
.DATA
.CODE


MAIN PROC    
    ;take input
    mov ah,1  
    int 21h        
    mov bl,al     
     
    ;convert it
    sub bl ,20h
     
     
     ;print line
    mov ah,2
    mov dl,0dh
    int 21h
    mov dl,0ah
    int 21h
    
      ;print result
    mov dl,bl
    int 21h
    
    
     
    
    
    
    MAIN ENDP
END MAIN