# Selection Sort
#
# -------------------------------------
# Question
#
# Write a program of the Selection Sort algorithm which sorts a sequence A in ascending order.
# Your program should also print the number of swap operations defined in line 6 of the pseudocode in the case where i ≠ mini.
#
# -------------------------------------
# Input
#
# The first line of the input includes an integer N, the number of elements in the sequence.
# In the second line, N elements of the sequence are given separated by space characters.
#
# -------------------------------------
# Output
#
# The output consists of 2 lines.
# In the first line, please print the sorted sequence.
# Two contiguous elements of the sequence should be separated by a space character.
#
# In the second line, please print the number of swap operations.
#
# -------------------------------------
# Constraints
#
# 1 ≤ N ≤ 100
#
# -------------------------------------

n = gets.to_i
line = gets.split(' ').map(&:to_i)
total_trade = 0

n.times do |i|
  index = line[i..-1].index(line[i..-1].min) + i
  next if i == index

  tmp = line[i]
  line[i] = line[index]
  line[index] = tmp
  total_trade += 1
end

puts line.join(' ')
puts total_trade
