.data
newline: .asciiz "\n"

.text
.globl main

main:
    li $v0, 5
    syscall
    move $t0, $v0      
    li $t1, 0          
    li $t2, 0          

loop_numbers:
    beq $t1, $t0, print_result
    li $v0, 5
    syscall
    move $t3, $v0      

digit_loop:
    beq $t3, $zero, next_number
    li $t4, 10
    div $t3, $t4
    mfhi $t5           
    mflo $t3           
    add $t2, $t2, $t5 
    j digit_loop

next_number:
    addi $t1, $t1, 1
    j loop_numbers

print_result:
    move $a0, $t2
    li $v0, 1
    syscall
    li $v0, 10
    syscall