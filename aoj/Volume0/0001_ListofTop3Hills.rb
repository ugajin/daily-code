# Question
#
# There is a data which provides heights (in meter) of mountains. The data is only for ten mountains.
# Write a program which prints heights of the top three mountains in descending order.
#
# --------------------------
# Input
#
# Height of mountain 1
# Height of mountain 2
# Height of mountain 3
#  .
#  .
# Height of mountain 10
#---------------------------
# Constraints
#
# 0 ≤ height of mountain (integer) ≤ 10,000
# --------------------------
# Output
#
# Height of the 1st mountain
# Height of the 2nd mountain
# Height of the 3rd mountain

heights = 10.times.map{ gets.to_i }.sort!
puts heights[-1], heights[-2], heights[-3]
