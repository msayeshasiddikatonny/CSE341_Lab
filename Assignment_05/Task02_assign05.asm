.model small
 
.stack 100h
 
.data 

p db 'Enter Three numbers: $'
x db ' $' 
q dw 3  
r db 'Lowest Number: $'



 .code 
main proc 

 

mov ax,@data 
mov ds,ax 
    lea DX,p
    mov AH,9
    int 21h
     
    mov ah,2
    mov dl,0dh
    int 21h
    mov dl,0ah
    int 21h
    
    mov cx,q
    mov ah,1
    mov si,0
    
    begin:
    int 21h
    mov p[si],al
    add si,1
    loop begin
    
    mov si,0
    mov al,p[si]
    mov bl,p[si+1]
    cmp al,bl
    jl begin2
    
    jg begin3
    
    begin2:
    mov si,0
    mov al,p[si]
    mov cl,p[si+2]
    cmp al,cl
    jl resultal
    jg resultcl
    jmp end
             
    begin3:
    mov si,1
    mov bl,p[si]
    mov cl,p[si+1]
    cmp bl,cl
    jl resultbl
    jg resultcl
    jmp end  
    
    
    
    resultal:
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    lea DX,r
    mov AH,9
    int 21h
     
    mov ah,2
    mov dl,0dh
    int 21h
    mov dl,0ah
    int 21h
    
    mov si,0
    mov ah,2
    mov dl,p[si]
    int 21h
    jmp end
    
    resultbl:
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    lea DX,r
    mov AH,9
    int 21h
     
    mov ah,2
    mov dl,0dh
    int 21h
    mov dl,0ah
    int 21h
    mov si,1
    mov ah,2
    mov dl,p[si]
    int 21h
    jmp end
    
    resultcl:       
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    lea DX,r
    mov AH,9
    int 21h
     
    mov ah,2
    mov dl,0dh
    int 21h
    mov dl,0ah
    int 21h
    mov si,2
    mov ah,2
    mov dl,p[si]
    int 21h
    jmp end
            

end:
  
     
;exit to dos 
               
mov ax,4c00h
int 21h 

main endp
    end main
