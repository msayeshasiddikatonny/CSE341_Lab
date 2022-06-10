.MODEL SMALL
.STACK 100H
.DATA
a db "ENTER A HEX DIGIT: $"
b db "IN DECIMAL IT IS $  "
.CODE


MAIN PROC
    mov ax, data
    mov ds, ax
    mov es, ax

    ; add your code here
     
    lea dx, a
    mov ah, 9     ;show   ENTER A HEX DIGIT
    int 21h
    
    mov ah,1 
    int 21h        ;take input and store in bh
    mov bh , al
    
     
    mov dl, 0AH
    mov ah , 2
    int 21h
    mov dL,0DH          ;print line
    int 21h 
    mov dL,0AH 
    int 21h
    
    lea dx, b          ;show  "IN DECIMAL IT IS $
    mov ah, 9
    int 21h
    
     
    mov ah , 2
    mov dl , 31h      ;print 1 as first num 1
    int 21h
    
    
     
    mov ah , 2
    sub bh , 11h   ;printing 2nd numby sub 11h
    mov dl , bh
    int 21h  
    
    
    MAIN ENDP
END MAIN