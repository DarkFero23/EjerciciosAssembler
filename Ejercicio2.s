.data
    str_ingresar: .asciiz "\nCuantos numeros desea ingresar?: "
    str_ing: .asciiz "\nIngrese un numero: "
    str_suma: .asciiz "\nLa suma es: "
    str_prom: .asciiz "\nEl promedio es: "
    str_mayor: .asciiz "\nEl mayor es: "
    str_men: .asciiz "\nEl menor es: "
    .text
main: 
	
     #Imprimir texto 1
        li $v0, 4 				
        la $a0, str_ingresar 		
        syscall

        #Leemos el valor n
        li $v0, 5 					
        syscall
        move $t0, $v0        

         #Index e iteraciones
        li $t1, 1   
	    #T0 es el tope
        li $t2, 0 #sumar
        li $t3, 0 #promedio
        li $t4, 0 #mayor
        li $t5, 0 #menor
        li $t6, 0 #temporal


        #Leemos el valor n
        li $v0, 5 					
        syscall
        move $t6, $v0
        move $t4 , $v0
        move $t5 , $v0

        add $t2, $t2, $t6 #suma

        Loop:
            beq $t0,$t1, Exit
            
             #Leemos el valor n
            li $v0, 5 					
            syscall
            move $t6, $v0

            add $t2, $t2, $t6 #suma

            bge $t6, $t4, PRIMER_IF  #si el primero es mayor
	
            PRIMER_ELSE:

                bge $t5, $t6, SEGUNDO_IF
                SEGUNDO_ELSE:

                    b END_PRIMER_IF

                SEGUNDO_IF:
                    move $t5, $t6

                    b END_PRIMER_IF

            PRIMER_IF:

                move $t4, $t6  

            END_PRIMER_IF:	
                li $v0, 4
                syscall  
            add $t1, $t1, 1  		
            j Loop       
	    Exit:

            #Imprimir texto 1
            li $v0, 4 				
            la $a0, str_mayor 		
            syscall

             move $a0, $t4
            li $v0, 1 
            syscall

            #Imprimir texto 1
            li $v0, 4 				
            la $a0, str_men 		
            syscall

             move $a0, $t5
            li $v0, 1 
            syscall

             #Imprimir texto 1
            li $v0, 4 				
            la $a0, str_suma 		
            syscall

             move $a0, $t2
            li $v0, 1 
            syscall

            li $v0, 4
            la $a0, str_prom
            syscall
                
            
            divu $t2, $t2 , $t0
            move $a0, $t2 
            li $v0, 1
            syscall




	
	
	jr $ra