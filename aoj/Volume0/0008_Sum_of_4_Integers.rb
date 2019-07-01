# Sum of 4 Integers
#
# ----------------------------------
# Question
#
# Write a program which reads an integer n and identifies the number of combinations of a,b,c and d (0 ≤ a,b,c,d ≤ 9) which meet the following equality:
#
# a+b+c+d=n
#
# For example, for n = 35, we have 4 different combinations of (a,b,c,d): (8,9,9,9), (9,8,9,9), (9,9,8,9), and (9,9,9,8).
#
# -----------------------------------
# Input
#
# The input consists of several datasets.
# Each dataset consists of n (1 ≤ n ≤ 50) in a line. The number of datasets is less than or equal to 50.
#
# -----------------------------------
# Output
#
# Print the number of combination in a line.
#
# -----------------------------------

def calc_sum_number(n, map)
  return 1 if n == 0
  return 4 if n == 1
  return 10 if n == 2
  
  salt = n < 10 ? 1 : -3
  map[n-1] * 3 - map[n-2] * 3 + map[n-3] + salt
end

map = []
0.upto(18) do |n|
  map << calc_sum_number(n, map)
end

while (line = gets)
  n = line.chop.to_i
  if n > 36
    puts 0
    next
  end

  n < 19 ? puts(map[n]) : puts(map[18 - (n - 18)])
end
