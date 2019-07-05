# Rectangle
#
# ------------------------------------------------
# Question
#
# Write a program which calculates the area and perimeter of a given rectangle.
#
# ------------------------------------------------
# Input
#
# The length a and breadth b of the rectangle are given in a line separated by a single space.
#
# ------------------------------------------------
# Output
#
# Print the area and perimeter of the rectangle in a line.
# The two integers should be separated by a single space.
#
# ------------------------------------------------

a, b = gets.split(' ').map(&:to_i)

puts "#{a*b} #{a*2+b*2}"
