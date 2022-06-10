; multi-segment executable file template.

data segment
    ; add your data here! 
     
    a db "1st side: $"
    b db "2nd side: $"
    c db "3nd side: $" 
    n db "No $"
    y db "YES $"
ends

stack segment
    dw   128  dup(0)
ends

code segment
start:
; set segment registers:
    mov ax, data
    mov ds, ax
    mov es, ax

    ; add your code here  
    mov ah,9
    lea dx,a    
    int 21h

    
    mov ah , 1
    int 21h
    mov cl , al
     sub cl,48
     mov ah,2
    mov dl,0dh
    int 21h
    mov dl,0ah
    int 21h 
    
    mov ax,data
    mov ds,ax
    
    mov ah,9
    lea dx,b    
    int 21h

    
    mov ah , 1
    int 21h
    mov ch , al  
    sub ch,48
    
    
    
    
    mov ah,2
    mov dl,0dh
    int 21h
    mov dl,0ah
    int 21h 
    
    mov ax,data
    mov ds,ax
    
    mov ah,9
    lea dx,c    
    int 21h
    
    
    mov ah , 1
    int 21h
     sub al,48
    mov bh,ch
    mov bl,cl
    add bh,bl
    add ah,0  

    cmp al, bh
    jle if0_  ;al<=bh 
    jg elif0_ ;al >=bh
    ;jmp else_
    
    if0_:
         add ah,1 
         jmp l1
         
    elif0_:
           jmp no_
         
    ;else_:
       ; mov dl , ch 
       
    l1:  
         mov bh,al
        mov bl,cl
        add bh,bl
           
    
        cmp ch, bh
        jle if1_  ;al<=bh 
        jg elif1_ ;al >=bh
        ;jmp else_
        
        if1_:
               
               add ah,1  
               jmp l2
             
        elif1_:
             
            jmp no_ 
             
         l2:    
                 mov bh,al
                mov bl,ch
                add bh,bl
                   
            
                cmp cl, bh
                jle if2_  ;al<=bh 
                jg elif2_ ;al >bh
                ;jmp else_
                
                if2_:
                       add ah,1 
                        cmp ah,4
                        je y_
                     
                elif2_:
                     jmp no_
                     
         
         
     
     y_:
    
       mov ah,2
    mov dl,0dh
    int 21h
    mov dl,0ah
    int 21h 
    
    mov ax,data
    mov ds,ax
    
    mov ah,9
    lea dx,y    
    int 21h 
     jmp  exit:       
      no_:
    
       mov ah,2
    mov dl,0dh
    int 21h
    mov dl,0ah
    int 21h 
    
    mov ax,data
    mov ds,ax
    
    mov ah,9
    lea dx,n    
    int 21h        
      jmp exit        
     exit:
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
