# Bubble Sort
#
# -------------------------------------
# Question
#
# Write a program of the Bubble Sort algorithm which sorts a sequence A in ascending order.
# Your program should also print the number of swap operations defined in line 4 of the pseudocode.
#
# -------------------------------------
# Input
#
# The first line of the input includes an integer N, the number of elements in the sequence.
# In the second line, N elements of the sequence are given separated by spaces characters.
#
# -------------------------------------
# Output
#
# The output consists of 2 lines.
#
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

n = (gets.to_i) - 1
line = gets.split(' ').map(&:to_i)
total_trade = 0

n.times do |i|
  trade = 0
  (n-i).times do |j|
    if line[j] > line[j+1]
      tmp = line[j]
      line[j] = line[j+1]
      line[j+1] = tmp
      trade += 1
    else
      next
    end
  end
  break if trade == 0
  total_trade += trade
end
puts line.join(' ')
puts total_trade
