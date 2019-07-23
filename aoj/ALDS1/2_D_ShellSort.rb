# Shell Sort
#
# -------------------------------------
# Question
#
# Shell Sort is a generalization of Insertion Sort to arrange a list of n elements A.
#
# ```
# insertionSort(A, n, g)
#   for i = g to n-1
#       v = A[i]
#       j = i - g
#       while j >= 0 && A[j] > v
#           A[j+g] = A[j]
#           j = j - g
#           cnt++
#       A[j+g] = v
#
# shellSort(A, n)
#     cnt = 0
#     m = ?
#     G[] = {?, ?,..., ?}
#     for i = 0 to m-1
#         insertionSort(A, n, G[i])
# ```
#
# Your task is to complete the above program by filling?. Write a program which reads an integer 
# n and a sequence A, and prints m, Gi(i = 0, 1,..., m − 1) in the pseudo code and the sequence A in ascending order.
# The output of your program must meet the following requirements:
#
# - 1 ≤ m ≤ 100
# - 0 ≤ G i ≤ n
# - cnt does not exceed [n ** 1.5]
#
# -------------------------------------
# Input
#
# In the first line, an integer n is given.
# In the following n lines, Ai (i = 0, 1, ..., n − 1) are given for each line.
#
# -------------------------------------
# Output
#
# In the first line, print an integer m.
# In the second line, print m integers Gi (i = 0, 1, ..., m − 1) separated by single space character in a line.
# In the third line, print cnt in a line. In the following 
# n lines, print Ai (i = 0, 1, ..., n − 1) respectively.
#
# This problem has multiple solutions and the judge will be performed by a special validator.
#
# -------------------------------------
# Constraints
#
# - 1 ≤ N ≤ 1,000,000
# - 0 ≤ Ai ≤ 10 ** 9
#
# -------------------------------------

def insertion_sort(a, n, g, cnt)
  g.upto(n-1) do |i|
    v = a[i]
    j = i - g
    while j >= 0 && a[j] > v do
      a[j+g] = a[j]
      j = j - g
      cnt += 1
    end

    a[j+g] = v
  end

  return a, cnt
end

def shell_sort(a, n)
  g = [1]
  h = 1

  while true do
    break if (h * 3 + 1) > n

    h = h * 3 + 1
    g << h
  end

  m = g.size

  out_a = []
  cnt = 0

  g.reverse!
  m.times do |i|
    out_a, cnt = insertion_sort(a, n, g[i], cnt)
  end

  puts m
  puts g.join(' ')
  puts cnt
  out_a.each { |oa| puts oa }
end

n = gets.to_i
a = (0..n-1).map { |i| gets.to_i }

shell_sort(a, n)
