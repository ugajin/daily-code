# Range
#
# ----------------------------------------------
# Question
#
# Write a program which reads three integers a, b and c, and prints "Yes" if a<b<c, otherwise "No".
#
# ----------------------------------------------
# Input
#
# Three integers a, b and c separated by a single space are given in a line.
#
# ----------------------------------------------
# Output
#
# Print "Yes" or "No" in a line.
#
# ----------------------------------------------

a, b, c = gets.split(' ').map(&:to_i)
puts a < b && b < c ? 'Yes' : 'No'
