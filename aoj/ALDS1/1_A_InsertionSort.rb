# Insertion Sort
#
# -------------------------------------
# Question
#
# Write a program of the Insertion Sort algorithm which sorts a sequence A in ascending order. 
# To illustrate the algorithms, your program should trace intermediate result for each step.
#
# -------------------------------------
# Input
#
# The first line of the input includes an integer N, the number of elements in the sequence.
# In the second line, N elements of the sequence are given separated by a single space.
#
# -------------------------------------
# Output
#
# The output consists of N lines. Please output the intermediate sequence in a line for each step.
# Elements of the sequence should be separated by single space.
#
# -------------------------------------
# Constraints
#
# 1 ≤ N ≤ 100
#
# -------------------------------------

gets
inputs = gets.split(' ').map(&:to_i)
results = inputs

inputs.each_with_index do |input, i|
  k = 0
  results.each_with_index do |result, j|
    k = j
    break if input == result || input <= result
  end

  tmp = results[i]
  results.delete_at(i)
  results.insert(k, tmp)

  puts results.join(' ')
end
