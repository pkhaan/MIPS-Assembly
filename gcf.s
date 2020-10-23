# Author: Petros Chanas

#
# | Information about usage of Registers |
 
.text
.globl _begin
_begin:
        li $v0, 4
        la $a0, msg_give_int
        syscall 	# print(msg_give_int);
 
        li $v0, 5
        syscall
        move $t0, $v0 	# $t0 = readInt();
 
        li $v0, 4
        la $a0, msg_give_int
        syscall 	# print(msg_give_int);
 
        li $v0, 5
        syscall
        move $t1, $v0 	# $t0 = readInt();
   
        div $t0, $t1
        mfhi $t2 	#t2 = $t0 % $t1
 
        li $v0, 4
        la $a0, msg_ask_GCF_1
        syscall 	# print(msg_ask_GCF_1);
       
        li $v0, 1
        move $a0, $t0
        syscall 	# print($t0);
       
        li $v0, 4
        la $a0, msg_ask_GCF_2
        syscall 	# print(msg_ask_GCF_2);
       
        li $v0,1
        move $a0, $t1
        syscall 	# print($t1);
       
        li $v0, 4
        la $a0, msg_quest
        syscall 	# print(msg_quest);
   
    loop1:
        beq $t2, $zero, continue1
        add $t0, $t1, $zero
        add $t1, $t2, $zero
        div $t0, $t1
        mfhi $t2
        j loop1 	# It is a for loop which breaks when $t2 == $zero;
       
    continue1:
        li $v0, 5
        syscall 
        move $t3, $v0 	# $t3 = readInt();
 
    loop2:
        beq $t1, $t3, continue2

        li $v0, 4
        la $a0, msg_wrong_guess
        syscall 	# print( msg_wrong_guess);
 
        li $v0, 5
        syscall
        move $t3, $v0 	# $t3 = readInt();
        j loop2 	#loop which brakes when $t1 == $t3;
 
    continue2:
        li $v0, 4
        la $a0, msg_right_guess
        syscall  	# print(msg_right_guess);
           
        li $v0, 10
        syscall 	# System.exit(0);
 
.data #Store NullTerminatedString used for printing user-friendly messages.
msg_welcome_user: .asciiz "Welcoming message"
msg_give_int: .asciiz "Give an integer : \n"
msg_give_guess: .asciiz "Give me your guess : \n"
msg_wrong_guess: .asciiz "Wrong GCF. Please try again! \n"
msg_right_guess: .asciiz "Bravo, you are correct :) \n"
msg_ask_GCF_1: .asciiz "Which is the GCF of "
msg_ask_GCF_2: .asciiz " and "
msg_quest: .asciiz " ?\n"
