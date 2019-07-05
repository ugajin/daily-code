# Watch
#
# ------------------------------------------------
# Question
#
# Write a program which reads an integer S [second] and converts it to h:m:s where h, m, s
# denote hours, minutes (less than 60) and seconds (less than 60) respectively.
#
# ------------------------------------------------
# Input
#
# An integer S is given in a line.
#
# ------------------------------------------------
# Output
#
# Print h, m and s separated by ':'. You do not need to put '0' for a value, which consists of a digit.
#
# ------------------------------------------------

s = gets.to_i

hour = s / 3600
minitue = (s - 3600 * hour) / 60
second = (s - 3600 * hour) % 60

puts "#{hour}:#{minitue}:#{second}"
