# Sourting Three Numbers
#
# ----------------------------------------------
# Question
#
# Write a program which reads three integers, and prints them in ascending order.
#
# ----------------------------------------------
# Input
#
# Three integers separated by a single space are given in a line.
#
# ----------------------------------------------
# Output
#
# Print the given integers in ascending order in a line. Put a single space between two integers.
#
# ----------------------------------------------

puts gets.split(' ').map(&:to_i).sort!.join(' ')
