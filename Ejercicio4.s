.data 
    text_1: .asciiz "\nIngrese un número: "
    text_2: .asciiz "\nEl numero " 
    text_3: .asciiz "no es multiplo de: "
    text_4: .asciiz "sí es multiplo de: "
.text 
    main:       

        #Imprimir texto 1
        li $v0, 4 				
        la $a0, text_1 		
        syscall

        #Leemos el valor n
        li $v0, 5 					
        syscall
        move $t9, $v0

        #Index e iteraciones
        li $t1, 1   
	    li $t2, 21  
	    move $t3, $v0  

        Loop:
            beq $t2,$t1, Exit

            rem $t4, $t1, $t3
            #Escribe el texto            
            li $v0, 4 				
            la $a0, text_2 		
            syscall

            move $a0, $t1
            li $v0, 1 
            syscall

            beq  $t4, 0, LABEL_IF
	
            LABEL_ELSE:
                #Escribe el texto            
                li $v0, 4 				
                la $a0, text_3 		
                syscall
                b END_LABEL_IF

            LABEL_IF:
                #Escribe el texto            
                li $v0, 4 				
                la $a0, text_4 		
                syscall
                
            END_LABEL_IF:	
                move $a0, $t9
                li $v0, 1 
                syscall



            add $t1, $t1, 1  		
            j Loop       
	    Exit:


        
    jr $ra   
 