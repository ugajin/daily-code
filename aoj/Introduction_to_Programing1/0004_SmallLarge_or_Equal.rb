# Small, Large, or Equal
#
# Question
#
# Write a program which prints small/large/equal relation of given two integers a and b.
# ----------------------------------------------
# Input
# Two integers a and b separated by a single space are given in a line.
#
# ----------------------------------------------
# Output
# For given two integers a and b, print
#
# ----------------------------------------------

a, b = gets.split(' ').map(&:to_i)
condition = '<' if a < b
condition = '>' if a > b
condition = '==' if a == b

puts "a #{condition} b"
