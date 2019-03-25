# Title: Filename: Lab01
# Author: Omar Yassin Date: 30/01/2019
# Description: the programs find the average of 3 numbers and outputs the data
# Input: 3 numbers
# Output: The average is: XXX1 and xxx2/xxx3
################# Data segment #####################
.data
prompt: .asciiz "Please enter three numbers: \n"
and_print: .asciiz " and "
print_slash: .asciiz "\\"
avrg_msg: .asciiz "The average is: "

################# Code segment #####################
.text
.globl main
main: # main program entry
la $a0,prompt # display prompt string
li $v0,4
syscall
li $v0,5 # read 1st integer into $t0
syscall
move $t0,$v0
li $v0,5 # read 2nd integer into $t1
syscall
move $t1,$v0
li $v0,5 # read 3rd integer into $t2
syscall
move $t2,$v0
addu $t0,$t0,$t1 # accumulate the sum
addu $t0,$t0,$t2
la $a0,avrg_msg # write sum message
li $v0,4
syscall
li $t3, 3
div $t0, $t3 # dividing 2 numbers
mflo $t3
mfhi $t4
move $a0,$t3 # output qoutiont
li $v0,1
syscall
la $a0,and_print # output and
li $v0,4
syscall
move $a0,$t4 # output remainder
li $v0,1
syscall
la $a0,print_slash # output slash
li $v0,4
syscall
move $a0,$t0 # output sum
li $v0,1
syscall
li $v0, 10 # Exit program
syscall
