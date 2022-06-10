; multi-segment executable file template.

data segment
    ; add your data here! 
    pkey db "result $"
    a db "1st input: $"
    b db "2nd input: $"
    c db "3nd input: $"
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
     
    
       

    cmp cl , ch
    jle if0_  ;cl<=ch 
    jge elif_ ;cl >=ch
    ;jmp else_
    
    if0_:
        ;mov dl , cl
        ;jmp display_   
         mov ch,al 
         jmp l1_
    elif_:
        mov cl,al 
         
    ;else_:
       ; mov dl , ch
      
    l1_:  
    cmp cl , ch
    jle if_
    jmp else_ 
    
    
    
    if_:
        mov dl , cl
        jmp display_
    
    else_:
        mov dl , ch 
        
        jmp display_
    display_: 
         
             
         
             
            mov ah , 2
            int 21h
     
   
      
     
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
