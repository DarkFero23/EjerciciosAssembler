.data
str_ingresar: .asciiz "\nIngrese un numero:"
str_suma:  .asciiz "\nLa suma es:"
str_resta: .asciiz "\nLa resta es:"
str_mult: .asciiz "\nLa multi es:"
str_div:  .asciiz "\nLa division es:"
str_prom: .asciiz "\nEl promedio es :"
.text

main:
    la $a0, str_ingresar
    li $v0, 4
	syscall
	
	
    li $v0, 5
	syscall
	
	
    add $t0, $v0, 0
	# imprimir
	move $a0, $v0
	li $v0, 1 					
	syscall	
	

    la $a0, str_ingresar
		
    li $v0, 4
	syscall

    li $v0, 5
    syscall
	
		
    add $t1, $v0, 0
	
	 # imprimir
	move $a0, $v0
	li $v0, 1 					
	syscall	
		

    la $a0, str_suma
    li $v0, 4
    syscall

    add $a0, $t0, $t1
    li $v0, 1
    syscall
	
	la $a0, str_resta
    li $v0, 4
    syscall

    sub $a0, $t0, $t1
    li $v0, 1
    syscall
	
	la $a0, str_mult
    li $v0, 4
    syscall

    mul $a0, $t0, $t1
    li $v0, 1
    syscall
	
	la $a0, str_div
    li $v0, 4
    syscall
	

    div $a0, $t0, $t1
    li $v0, 1
    syscall
	
	la $a0, str_prom
    li $v0, 4
    syscall
	
	add $t2, $t0, $t1
	div $a0, $t2 ,2
    li $v0, 1
    syscall

    
	
	jr$ra