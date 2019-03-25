# Title: Filename: HW01
# Author: Omar Yassin Date: 06/02/2019
# Description: the programs find if the first number is less than the second number if so it adds them else it substracts them
# Input: NULL
# Output: THE TOTAL
################# Data segment #####################
.data
prompt: .asciiz "The program runs \n"

################# Code segment #####################
.text
.globl main
main: # main program entry
la $a0,prompt # display prompt string
li $v0,4
syscall
li $s1, 100
li $s2, 200
li $s3, 20
slt $s0, $s1, $s2  # s1 < s2
beq $s0, $zero , lessthan, # if no, skip
add $	, $s1,$s2
j done
lessthan:
sub $s3, $s1, $s2 

done:
move $a0, $s3
li	$v0, 1			#Prints total
syscall	
#########################################

li $v0, 10		
syscall
