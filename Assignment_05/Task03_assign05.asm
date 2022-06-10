.model small
 printmsg macro msg
         push ax
         push bx
         push cx
         push dx
         LEA dx,msg
         mov ah,09h
         int 21h
         pop dx
         pop cx
         pop bx
         pop ax 
endm
.stack 100h

.data 
        arr db 4 dup("$")  
        
        
        p db  0ah,0dh,'Please enter 4 number $' 
        
        q db 0ah,0dh,'Sorted array:  $ ' 
        
        x db ' $'  
         



.code 
  

 

        mov ax,@data 
        mov ds,ax 
     
         
        
        
        mov cl,04
        mov ch,cl
         
        mov si,00 
        
        printmsg p  
        
     begin:
        mov ah,01h
        int 21h
        sub al,30h
        
        printmsg x
        
        mov arr[si],al
        inc si
        dec cl
        cmp cl,00
        jnz begin
        
     mov cl,ch
     dec cl 
        
        
     begin2:
        mov bl,cl
        mov si,00
        
        
     begin3:
        mov al,arr[si]
        mov ah,arr[si+1]
        cmp al,ah
        
        jc begin4 
        
            mov arr[si],ah
            mov arr[si+1],al 
        
         
     begin4:
        inc si
        dec bl
        cmp bl,00
        jnz begin3
     
    dec cl
    cmp cl,00
    jnz begin2 
        
        printmsg q
         
         
        
        mov cl,ch
        mov si,00
         
        ;mov ah,2
        ;mov dl,10
        ;int 21h
        ;mov dl,13
        ;int 21h
        ;mov dx,q
        ;mov ah,9
        ;int 21h
        ;mov cl,4
        ;mov ah,2
        ;mov si,0 
        
        
     begin5:
        mov dl,arr[si]
        inc si
        add dl,30h
        mov ah,02h
        int 21h
        
        printmsg x
        dec cl
        cmp cl,00
        
        jnz begin5
        
        
      
         
     ex: 
                   
        mov ah,4ch
        int 21h 

end
