##################################################################### 
# 
# CSCB58 Winter 2022 Assembly Final Project 
# University of Toronto, Scarborough 
# 
# Student: Name, Student Number, UTorID, official email 
# 
# Bitmap Display Configuration: 
# - Unit width in pixels: 4 (update this as needed)  
# - Unit height in pixels: 4 (update this as needed) 
# - Display width in pixels: 256 (update this as needed) 
# - Display height in pixels: 256 (update this as needed) 
# - Base Address for Display: 0x10008000 ($gp) 
# 
# Which milestones have been reached in this submission? 
# (See the assignment handout for descriptions of the milestones) 
# - Milestone 1/2/3 (choose the one the applies) 
# 
# Which approved features have been implemented for milestone 3? 
# (See the assignment handout for the list of additional features) 
# 1. (fill in the feature, if any) 
# 2. (fill in the feature, if any) 
# 3. (fill in the feature, if any) 
# ... (add more if necessary) 
# 
# Link to video demonstration for final submission: 
# - (insert YouTube / MyMedia / other URL here). Make sure we can view it! 
# 
# Are you OK with us sharing the video with people outside course staff? 
# - yes / no / yes, and please share this project github link as well! 
# 
# Any additional information that the TA needs to know: 
# - (write here, if any) 
# 
##################################################################### 
 
.eqv  BASE_ADDRESS  0x10008000 
 
.data
 human: .space 16
 
.text 
 li $t0, BASE_ADDRESS # $t0 stores the base address for display 
 li $t1, 0xdc6c1b   # $t1 stores the lava orange
 li $t2, 0x847e87   # $t2 stores the platform grey
 li $t3, 0xffffff   # $t3 stores white 
 li $t9, 0xfbc736   # $t9 stores yellow
 li $t8, 0x99e550   # $t8 stores green
 li $s1, 0xffff0000 # $s1 should store keypress memory location
  
 
 
initialize: 	#draw lava floor
		sw $t1, 13568($t0)   
 		sw $t1, 13572($t0)
 		sw $t1, 13576($t0)  
 		sw $t1, 13580($t0)
 		sw $t1, 13584($t0)   
 		sw $t1, 13588($t0)
 		sw $t1, 13592($t0)  
 		sw $t1, 13596($t0)
 		sw $t1, 13600($t0)  
 		sw $t1, 13604($t0)
 		sw $t1, 13608($t0) 
 		sw $t1, 13612($t0)
 		sw $t1, 13616($t0)  
 		sw $t1, 13620($t0)
 		sw $t1, 13624($t0)  
 		sw $t1, 13628($t0)
 		sw $t1, 13632($t0)  
 		sw $t1, 13636($t0)
 		sw $t1, 13640($t0)  
 		sw $t1, 13644($t0)
 		sw $t1, 13648($t0)  
 		sw $t1, 13652($t0)
 		sw $t1, 13656($t0)  
 		sw $t1, 13660($t0)
 		sw $t1, 13664($t0)
		sw $t1, 13668($t0)  
 		sw $t1, 13672($t0)
 		sw $t1, 13676($t0)  
 		sw $t1, 13680($t0)
 		sw $t1, 13684($t0) 
 		sw $t1, 13688($t0)
 		sw $t1, 13692($t0)  
 		sw $t1, 13696($t0)
 		sw $t1, 13700($t0)  
 		sw $t1, 13704($t0)
 		sw $t1, 13708($t0)  
 		sw $t1, 13712($t0)
 		sw $t1, 13716($t0) 
 		sw $t1, 13720($t0)
 		sw $t1, 13724($t0)   
 		sw $t1, 13728($t0)
 		sw $t1, 13732($t0)   
 		sw $t1, 13736($t0)
 		sw $t1, 13740($t0)  
 		sw $t1, 13744($t0)
 		sw $t1, 13748($t0)  
 		sw $t1, 13752($t0)
 		sw $t1, 13756($t0)  
 		sw $t1, 13760($t0)
 		sw $t1, 13764($t0)   
 		sw $t1, 13768($t0)
 		sw $t1, 13772($t0)
 		sw $t1, 13776($t0)   
 		sw $t1, 13780($t0)
 		sw $t1, 13784($t0)  
 		sw $t1, 13788($t0)
 		sw $t1, 13792($t0)  
 		sw $t1, 13796($t0)
 		sw $t1, 13800($t0)  
 		sw $t1, 13804($t0)
 		sw $t1, 13808($t0)  
 		sw $t1, 13812($t0)
 		sw $t1, 13816($t0)  
 		sw $t1, 13820($t0)
 		
 		#draw platforms
		li $a0, 2
		li $a1, 52
		jal drawplatform
		
		li $a0, 49
		li $a1, 52
		jal drawplatform
		
		li $a0, 16
		li $a1, 40
		jal drawplatform

		li $a0, 32
		li $a1, 27
		jal drawplatform
		
		li $a0, 11
		li $a1, 30
		jal drawplatform
		
		#initiate human coordinates and position
		li $a0, 5
		li $a1, 51
		li $a2, 1
		jal drawperson
		
		
		#initiate alien coordinates and position
		li $a0, 52
		li $a1, 51
		li $a2, 0
		jal drawalien
		
		#place coins / stars
		sw $t9 7216($t0)
		sw $t9 7224($t0)
		sw $t9 7232($t0)
		sw $t9 7240($t0)
		
		sw $t9 9800($t0)
		sw $t9 9808($t0)
		sw $t9 9816($t0)
		sw $t9 9824($t0)
		
		sw $t8 6552($t0)
		sw $t8 6560($t0)
		
		
		#intialize exit condition
		li $t4, 1
		
		
 		# INITIALIZE HUMAN STRUCT:
 		# X, Y, V_x, V_y
		la $t5, human
		add $t6, $zero, 5
 		sw $t6, 0($t5)
 		add $t6, $zero, 51
 		sw $t6, 4($t5)
 		add $t6, $zero, $zero
 		sw $t6, 8($t5)
 		sw $t6, 12($t5)
 		
 		
		
		j play
		
 		j exit
 		
 
 drawplatform: 	li $t7, 4
 		mult $a0, $t7
 		mflo $t4		#$t4 now stores 4 * x
 		li $t7, 256
 		mult $a1, $t7
 		mflo $t7		#$t5 now stores 256 * y
 		add $t6, $t0, $t4
 		add $t6, $t6, $t7	#$t6 should now contain address of starting pixel (baseaddress + 256 * y + 4 * x)
 		add $a0, $t6, $zero
 		add $a3, $zero, $zero
 		add $t4, $zero, $zero
 		j platformloop1
 
 platformloop1: 	
 		li $s3, 40
 		bge $t4, $s3, nextstep
 		add $t7, $t6, $t4	#$t7 should now contain address of immediate pixel to colour.
 		sw $t2, 0($t7)
 		add $t4, $t4, 4		#increment i by 4
		j platformloop1

 nextstep:  	add $t6, $t6, 256	#$t6 should now contain address of starting pixel for second platform row
 		add $a0, $t6, $zero
 		blez $a3 steppingstone
 		jr $ra

steppingstone: 	add $a3, $a3, 1
		j platformloop1
 			

 drawperson: 	blez $a2, drawleft
 		j drawright
 		
 drawleft:	li $t7, 4
 		mult $a0, $t7
 		mflo $t4		#$t4 now stores 4 * x
 		li $t7, 256
 		mult $a1, $t7
 		mflo $t7		#$t5 now stores 256 * y
 		add $t6, $t0, $t4
 		add $t6, $t6, $t7	#$t6 should now contain address of starting pixel (baseaddress + 256 * y + 4 * x)
 		sw $t3, 0($t6)
 		sub $t6, $t6, 256
 		sw $t3, 0($t6)
 		add $t6, $t6, 4
 		sw $t3, 0($t6)
 		sub $t6, $t6, 260
 		sw $t9, 0($t6)
 		j drawcomplete
 
 drawright:	
 		li $t7, 4
 		mult $a0, $t7
 		mflo $t4		#$t4 now stores 4 * x
 		li $t7, 256
 		mult $a1, $t7
 		mflo $t7		#$s6 now stores 256 * y
 		add $t6, $t0, $t4
 		add $t6, $t6, $t7	#$t6 should now contain address of starting pixel (baseaddress + 256 * y + 4 * x)
 		#lw $t4, 0($t6)
 		#beq $t4, $t3, gameover
 		sw $t3, 0($t6)
 		sub $t6, $t6, 256
 		sw $t3, 0($t6)
 		sub $t6, $t6, 4
 		sw $t3, 0($t6)
 		sub $t6, $t6, 252
 		sw $t9, 0($t6)
 		j drawcomplete
 
 drawcomplete: 	jr $ra
 
 drawalien: 	blez $a2, drawaleft
 		j drawaright
 		
 drawaleft:	li $t7, 4
 		mult $a0, $t7
 		mflo $t4		#$t4 now stores 4 * x
 		li $t7, 256
 		mult $a1, $t7
 		mflo $t7		#$t5 now stores 256 * y
 		add $t6, $t0, $t4
 		add $t6, $t6, $t7	#$t6 should now contain address of starting pixel (baseaddress + 256 * y + 4 * x)
 		sw $t3, 0($t6)
 		sub $t6, $t6, 256
 		sw $t3, 0($t6)
 		add $t6, $t6, 4
 		sw $t3, 0($t6)
 		sub $t6, $t6, 260
 		sw $t8, 0($t6)
 		j drawacomplete
 
 drawaright:	
 		li $t7, 4
 		mult $a0, $t7
 		mflo $t4		#$t4 now stores 4 * x
 		li $t7, 256
 		mult $a1, $t7
 		mflo $t7		#$t5 now stores 256 * y
 		add $t6, $t0, $t4
 		add $t6, $t6, $t7	#$t6 should now contain address of starting pixel (baseaddress + 256 * y + 4 * x)
 		sw $t3, 0($t6)
 		sub $t6, $t6, 256
 		sw $t3, 0($t6)
 		sub $t6, $t6, 4
 		sw $t3, 0($t6)
 		sub $t6, $t6, 252
 		sw $t8, 0($t6)
 		j drawacomplete
 
 drawacomplete: jr $ra
 
 
 
 #while playing, $t5 and $t6 represent human coordinates
 #'', 
 play: 		blez $t4, exit
 		lw $t6, 12($t5)
 		bltz $t6 falling
 		beq $t6, $zero, level
 		bgtz $t6, jumping
 
 postvertical:	
 		lw $t6, 0($s1)
 		beq $t6, 1, keypress
 		li $t6, 0
 		sw $t6, 8($t5)
 		
 		
 postkeypress:
 		lw $a0, 0($t5)
 		lw $a1, 4($t5)
 		j removehuman
 		
 postremoval:
 		lw $t6, 8($t5) 	#load in V_x from $t5
 		lw $s3, 0($t5)	#load in x from $t5
 		add $s3, $s3, $t6
 		sw $s3, 0($t5)	#store updated x coordinate in struct
 		
 		# want to check: if pixel being moved to (in struct 0($t5)) is white, game over\
 		
 		lw $a0, 0($t5)	
 		beq $a0, 52, gameover
 		lw $a1, 4($t5)
 		li $a2, 1
 		jal drawperson
 	
 		li $v0, 32
 		li $a0, 40
 		syscall
 		j play
 
 falling:	
 		j postvertical
 
 level:
 		j postvertical
 
 jumping:
		j postvertical
	
keypress:
		lw $t6, 4($s1)
		beq $t6, 0x61, leftinput
		beq $t6, 0x64, rightinput
		beq $t6, 0x77, jumpinput
		beq $t6, 0x70, reset
	
 leftinput:
 		li $t6, -1
 		sw $t6, 8($t5)
 		j postkeypress
 
 rightinput:
 		li $t6, 1
 		sw $t6, 8($t5)
 		j postkeypress
 
 jumpinput:
 		lw $t6, 12($t5)	#check if vertical velocity = 0
 		beqz $t6, jump	#if V_y = 0, jump input should jump
 		j postkeypress		#otherwise, if jumping or falling should have no impact
 
 		
 reset:		li $t7, 0	#on p press, reinitialize and run game.
 				#need to colour every pixel black, run initialize again.
 		li $s2, 16384
 		j resetloop
 		
 resetloop:	bge $t7, $s2, initialize
 		add $s3, $t0, $t7	#$s3 should now contain memory address of each pixel during loop
 		sw $zero 0($s3)		#set pixel colour to black
 		add $t7, $t7, 4
 		j resetloop
  
 removehuman: 				#given coordinates of human in $t5 struct, remove human (replace pixels with black, redraw platforms)	
 		li $t7, 4
 		mult $a0, $t7
 		mflo $t4		#$t4 now stores 4 * x
 		li $t7, 256
 		mult $a1, $t7
 		mflo $t7		#$t5 now stores 256 * y
 		add $t6, $t0, $t4
 		add $t6, $t6, $t7	#$t6 should now contain address of starting pixel (baseaddress + 256 * y + 4 * x)
 		sw $zero, 0($t6)
 		sub $t6, $t6, 256
 		sw $zero, 0($t6)
 		sub $t6, $t6, 4
 		sw $zero, 0($t6)
 		sub $t6, $t6, 252
 		sw $zero, 0($t6)
 		
 		#redraw platforms
 		li $a0, 2
		li $a1, 52
		jal drawplatform
		
		li $a0, 49
		li $a1, 52
		jal drawplatform
		
		li $a0, 16
		li $a1, 40
		jal drawplatform

		li $a0, 32
		li $a1, 27
		jal drawplatform
		
		li $a0, 11
		li $a1, 30
		jal drawplatform

 		j postremoval

jump:

gameover: 	li $t7, 0	#on p press, reinitialize and run game.
 				#need to colour every pixel black, run initialize again.
 		li $s2, 16384
 		j resetloop1
 		
 resetloop1:	bge $t7, $s2, enddisplay
 		add $s3, $t0, $t7	#$s3 should now contain memory address of each pixel during loop
 		sw $zero 0($s3)		#set pixel colour to black
 		add $t7, $t7, 4
 		j resetloop1

enddisplay: 	sw $t3, 6520($t0)
		sw $t3, 6524($t0)
		sw $t3, 6528($t0)
		sw $t3, 6532($t0)
		sw $t3, 6536($t0)
		sw $t3, 6772($t0)
		sw $t3, 6776($t0)
		sw $t3, 6780($t0)
		sw $t3, 6784($t0)
		sw $t3, 6788($t0)
		sw $t3, 6792($t0)
		sw $t3, 6796($t0)
		sw $t3, 7024($t0)
		sw $t3, 7028($t0)
		sw $t3, 7040($t0)
		sw $t3, 7052($t0)
		sw $t3, 7056($t0)
		sw $t3, 7280($t0)
		sw $t3, 7296($t0)
		sw $t3, 7312($t0)
		sw $t3, 7536($t0)
		sw $t3, 7552($t0)
		sw $t3, 7568($t0)
		sw $t3, 7792($t0)
		sw $t3, 7804($t0)
		sw $t3, 7808($t0)
		sw $t3, 7812($t0)
		sw $t3, 7824($t0)
		sw $t3, 8048($t0)
		sw $t3, 8052($t0)
		sw $t3, 8056($t0)
		sw $t3, 8060($t0)
		sw $t3, 8068($t0)
		sw $t3, 8072($t0)
		sw $t3, 8076($t0)
		sw $t3, 8080($t0)
		sw $t3, 8308($t0)
		sw $t3, 8312($t0)
		sw $t3, 8316($t0)
		sw $t3, 8320($t0)
		sw $t3, 8324($t0)
		sw $t3, 8328($t0)
		sw $t3, 8332($t0)
		sw $t3, 8568($t0)
		sw $t3, 8824($t0)
		sw $t3, 8832($t0)
		sw $t3, 8576($t0)
		sw $t3, 8584($t0)
		sw $t3, 8840($t0)
		
		
 exit: 		li $v0, 10 # terminate the program gracefully 
 		syscall

