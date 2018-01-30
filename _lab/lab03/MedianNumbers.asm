# xSpim MedianNumbers.asm program
# 
#

#  Data Area - allocate and initialize variables
.data

	# TODO: Complete these declarations / initializations

	.asciiz "Enter the next number:\n"

	.asciiz "Median: "


#Text Area (i.e. instructions)
.text

main:

	# TODO: Write your code here



exit:

	# Exit
	ori     $v0, $0, 10
	syscall

