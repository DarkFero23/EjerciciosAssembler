.data 
    text_1: .asciiz "\nIngrese el primer lado del triangulo: "
    text_2: .asciiz "\nIngrese el segundo lado del triangulo: "
    text_3: .asciiz "\nIngrese el tercer lado del triangulo: "
    text_4: .asciiz "\nEl triangulo es valido\n"
    text_5: .asciiz "\nEl triangulo NO es valido\n"
  
.text 
    main: 
        #Lados del triángulo
        li $t1, 0
        li $t2, 0
        li $t3, 0
        
        #Sumas
        li $t4, 0
        li $t5, 0
        li $t6, 0

        #Imprimir texto 1
        li $v0, 4 				
        la $a0, text_1 		
        syscall
        #Leemos 1er valor
        li $v0, 5 					
	    syscall
        add $t1, $t1, $v0


        #Imprimir texto 2
        li $v0, 4 				
        la $a0, text_2 		
        syscall
        #Leemos 2do valor
        li $v0, 5 					
	    syscall
        add $t2, $t2, $v0

        #Imprimir texto 3
        li $v0, 4 				
        la $a0, text_3 		
        syscall
        #Leemos 3er valor
        li $v0, 5 					
	    syscall
        add $t3, $t3, $v0

        #Sumas
        add $t4, $t1 , $t2
        add $t5, $t1 , $t3
        add $t6, $t2 , $t3

        bge $t4, $t3, PRIMER_IF  #si el primero es mayor	
            PRIMER_ELSE:                
                li $v0, 4 				
                la $a0, text_5 		
                syscall
                b END_PRIMER_IF

            PRIMER_IF:

                bge $t5, $t2, SEGUNDO_IF  #si el primero es mayor
                SEGUNDO_ELSE: 
                    li $v0, 4 				
                    la $a0, text_5 		
                    syscall
                    b END_PRIMER_IF
                SEGUNDO_IF: 
                    bge $t6, $t1, TERCER_IF  #si el primero es mayor
                    TERCER_ELSE:
                        li $v0, 4 				
                        la $a0, text_5 		
                        syscall
                        b END_PRIMER_IF
                    TERCER_IF:
                        li $v0, 4 				
                        la $a0, text_4 		
                        syscall             
                
                
            END_PRIMER_IF:	
                

 
    jr $ra   
            
