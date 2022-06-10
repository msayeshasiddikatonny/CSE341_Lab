.model small
 
.stack 100h
 
.data 

    msg1 db  'Enter Name: $'
    msg2 db  'Output: $'
   
    a1 label byte
    m1 db 50
    l1 db ?
    a11 db 50 dup ('$')
   
 .code 
main proc 

    assume cs:code,ds:data
start:
        mov ax,data
        mov ds,ax                
               
        lea dx,msg1
        mov ah,9
        int 21h
       
        lea dx,a1
        mov ah,0ah    
        int 21h
                 
         
        mov ah,2
        mov dl,0dh
        int 21h
        mov dl,0ah
        int 21h 
                   
        lea dx,msg2
        mov ah,9
        int 21h 
        
        
        mov ah,2
        mov dl,0dh
        int 21h
        mov dl,0ah
        int 21h
               
        lea si,a11
              
        mov cl,l1
        mov ch,0       
check:
        cmp [si],41h
        jb print
       
        cmp [si],5bh
        jb lower
       
        cmp [si],61h
        jb print
       
        cmp [si],7bh
        jg print
       
upper:    sub [si],20h
        jmp print
lower:    add [si],20h
            
print:   inc si
        loop check
               
        mov ah,9
        lea dx,a11
        int 21h
                               
        mov ah,4ch
        int 21h
end:
  
     
;exit to dos 
               
mov ax,4c00h
int 21h 

main endp
    end main
