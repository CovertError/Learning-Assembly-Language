# Title: Filename: Lab022
# Author: Omar Yassin Date: 06/02/2019
# Description: the programs takes in a string and then looks for e and if it found it would print e and the address	
# Input: string
# Output: E and its pointer 
################# Data segment #####################
.data
prompt: .asciiz "The program runs \n"
notFound: .asciiz "e not found.\n"
buffer: .space 256

################# Code segment #####################
.text
.globl main
main: # main program entry
la $a0,prompt # display prompt string
li $v0,4
syscall

la $a0, buffer #load byte space into address
li $a1, 256 # allot the byte space for string
li $v0,8 #take in input
syscall

la $s0, buffer
findE:  
lb $s2, ($s0)  # We do as always, get the first byte pointed by the address
beqz $s2, notfound  # if is equal to zero, the string is terminated  
li $s1, 'e'  
beq $s2, $s1, foundE  # must be lowered, if less and equals to 'e' 
continue:  
# Continue the iteration  
li $s5,1
add $s0, $s0,$s5   # Increment the address  
j findE
# The while loop ends here
foundE:
li $v0, 11    # Print the string  
la $a0, ($s2)   
syscall 
li $v0, 1    # Print the string  
la $a0, ($s0)   
syscall
j end 
notfound:    
li $v0, 4    # Print the string  
la $a0, notFound   
syscall  
end:
li $v0, 10 # Exit program
syscall
