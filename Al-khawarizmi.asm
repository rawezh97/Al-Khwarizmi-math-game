org 100h
include emu8086.inc
define_print_num
define_print_num_uns
define_scan_num
 
;in this game it give you an euqation and you have to calculate the numbers that benfit with equation 
;if it's right it will give you +5 point,and if its wrong it will decreace your pont by -5 
;we have three defrint level with deffrient equation that must be solved. 
point dw 0

printn "welcome to [ Al-Khwarizmi ] math game. " 
;(Al-Khwarizmi) was a Persian mathematician, astronomer, and geographer who lived during the Islamic Golden Age in the 9th century.
; He is considered to be the father of algebra, as he wrote a book called "Kitab al-Jabr wa-l-Muqabala" 
; which introduced systematic solutions of linear and quadratic equations. His name is also the origin of the word "algorithm."
printn "find the the right answer. "
printn "type -1 for exit the game."
printn 

main:
    cmp point,10
    jl level1
    cmp point,10
    je level2
    cmp point,20
    jl level2
    cmp point,20
    je level3

    jne level1

level1: 
    
    mov ah,2ch
    int 21h
    
    mov bx,dx
    
    mov ax,bx
    mov cx,1234h
    
    mul cx
    
    mov bl,al
    mov ax,0
    mov al,bl
    mov bp,ax
    
    printn "Current level 1"
    printn
    print " x + y = "
    call print_num 
    
    printn
    
    print " value of x ="
    call scan_num 
    
    cmp cx,-1
    je exit

    mov si,cx  
    
    printn
    
    print " value of y ="
    call scan_num
    mov di,cx 
    
    add si,di

    
    printn
    check:    
        cmp si,bp
        jne wrong
        je success
        
        
    wrong:
        printn
        print "[ ! ] Wrong Answer" 
         
        mov bx,5
        sub point,bx
        mov ax,point
        print "     point "
        call print_num
        printn
        printn
        jmp main
        
    success: 
        printn
        print "[ + ] Right Answer"          
        mov bx,5
        add point,bx
        mov ax,point
        print "     point "
        call print_num
        printn
        printn
        jmp main 

level2: 

    mov ah,2ch
    int 21h
    
    mov bx,dx
    
    mov ax,bx
    mov cx,1234h
    
    mul cx
    
    mov bl,al
    mov ax,0
    mov al,bl
    mov bp,ax
    printn "Current level 2"
    printn
    print " 2x + y = "
    call print_num 
    
    printn
    
    print " value of x ="
    call scan_num 
    
    cmp cx,-1
    je exit
    
    
    mov ax,cx
    mov bx,2
    mul bx 
    mov si,ax  
    
    printn
    
    print " value of y ="
    call scan_num
    mov di,cx 
    add si,di
 
 
 
    
    printn
    check2:    
        cmp si,bp
        jne wrong
        je success
        
        
 level3: 
        mov ah,2ch
    int 21h
    
    mov bx,dx
    
    mov ax,bx
    mov cx,1234h
    
    mul cx
    
    mov bl,al
    mov ax,0
    mov al,bl
    mov bp,ax 
    printn "Current level end-level"
    printn
    print " 2x + y - 3 = "
    call print_num 
    
    printn
    
    print " value of x ="
    call scan_num 
    
    cmp cx,-1
    je exit
    
    
    mov ax,cx
    mov bx,2
    mul bx 
    mov si,ax  
    
    printn
    
    print " value of y ="
    call scan_num
    mov di,cx 
    
    add si,di
    mov bx,3
    sub si,bx

    
    printn
    check3:    
        cmp si,bp
        jne wrong3
        je success3
        
        
    wrong3:
        printn
        print "[ ! ] Wrong Answer" 
         
        mov bx,5
        sub point,bx
        mov ax,point
        print "            point "
        call print_num
        printn
        printn
        jmp main
        
    success3: 
        printn
        printn "[ + ] Winner Winner chiken diner"          
        printn 
        print "[ + ] Cangragulation You can successfuly complete our game [ + ]"
        cmp point,20
        je exit
    
        
        
exit:
    mov ah, 4Ch ; Set AH to 4Ch to indicate program termination
    mov al, 0   ; Set AL to the desired exit code
    int 21h          
    
end
    
    
