.MODEL SMALL
.STACK 100H
.DATA
a db "Enter First Initial: $"
b db "Enter Second Initial: $"
c db "Enter Third Initial: $"
.CODE


MAIN PROC
    mov ax,@DATA
    mov ds,ax
    
    mov ah,9
    lea dx,a      ; show    "Enter First Initial: $"
    int 21h
    
    mov ah,1           ;take input 
    int 21h        
    mov bl,al
                     
    mov ah,2
    mov dl,0dh        ;print line
    int 21h
    mov dl,0ah
    int 21h 
    
    mov ax,@DATA
    mov ds,ax
    
    mov ah,9
    lea dx,b               ;show "Enter Second Initial: $"
    int 21h
    
     mov ah,1
    int 21h               ;take input
    mov bh,al
    
    mov ah,2
    mov dl,0dh
    int 21h              ;print line
    mov DL,0ah
    int 21h
    
    mov ax,@DATA
    mov ds,ax
    
    mov ah,9          ; "Enter Third Initial: $"
    lea dx,c    
    int 21h
    
    mov ah,1              ;take input
    int 21h        
    mov cl,al
    
    mov ah,2
    mov dl,0dh
    int 21h           ;print line
    mov dl,0ah
    int 21h
    
    
     
    mov dl,bl      ;print A
    int 21h
    
     mov dl,bh
    int 21h       ;print S
    
    mov ah,2
    mov dl,0dh
    int 21h         ;print line
    mov dl,0ah
    int 21h
    
     mov dl,cl
    int 21h        ;print T
    
    
    
    
    
    MAIN ENDP
END MAIN