# Stable Sort
#
# -------------------------------------
# Question
#
# Let's arrange a deck of cards.
# There are totally 36 cards of 4 suits(S, H, C, D) and 9 values (1, 2, ... 9).
# For example, 'eight of heart' is represented by H8 and 'one of diamonds' is represented by D1.
#
# Your task is to write a program which sorts a given set of cards in ascending order by their values using the Bubble Sort algorithms and the Selection Sort algorithm respectively.
#
# -------------------------------------
# Input
#
# The first line contains an integer N, the number of cards.
# N cards are given in the following line.
# Each card is represented by two characters.
# Two consecutive cards are separated by a space character.
#
# -------------------------------------
# Output
#
# In the first line, print the arranged cards provided by the Bubble Sort algorithm.
# Two consecutive cards should be separated by a space character.
#
# In the second line, print the stability ("Stable" or "Not stable") of this output.
#
# In the third line, print the arranged cards provided by the Selection Sort algorithm.
# Two consecutive cards should be separated by a space character.
#
# In the fourth line, print the stability ("Stable" or "Not stable") of this output.
#
# -------------------------------------
# Constraints
#
# 1 ≤ N ≤ 36
#
# -------------------------------------

def bubble_sort(n, line)
  n.times do |i|
    trade = 0
    (n-i).times do |j|
      next if line[j+1].nil?

      if line[j][1].to_i > line[j+1][1].to_i
        tmp = line[j]
        line[j] = line[j+1]
        line[j+1] = tmp
        trade += 1
      else
        next
      end
    end
    break if trade == 0
  end

  line
end

def selection_sort(n, line)
  n.times do |i|
    num_line = line.map{ |l| l[1].to_i }
    index = num_line[i..-1].index(num_line[i..-1].min) + i
    next if i == index
  
    tmp = line[i]
    line[i] = line[index]
    line[index] = tmp
  end

  line
end

def stable_state(gets, results)
  gets_dups = []
  results_dups = []

  1.upto(13) do |i|
    gets_dups << gets.select { |g| g[1].to_i == i }
    results_dups << results.select { |r| r[1].to_i == i }
  end

  gets_dups.each_with_index do |g, i|
    return 'Not stable' if g != results_dups[i]
  end

  'Stable'
end

n = gets.to_i
line = gets.split(' ')
bubble_line = line.dup
selection_line = line.dup

bubble = bubble_sort(n, bubble_line)
selection = selection_sort(n, selection_line)

puts bubble.join(' ')
puts stable_state(line, bubble_line)
puts selection.join(' ')
puts stable_state(line, selection_line)
