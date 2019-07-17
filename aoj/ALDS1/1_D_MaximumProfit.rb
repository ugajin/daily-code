# Maximum Profit
#
# -------------------------------------
# Question
#
# You can obtain profits from foreign exchange margin transactions.
#
# For example, if you buy 1000 dollar at a rate of 100 yen per dollar,
# and sell them at a rate of 108 yen per dollar, you can obtain (108 - 100) × 1000 = 8000 yen.
#
# Write a program which reads values of a currency R t at a certain time t (t = 0, 1, 2,...n − 1),
# and reports the maximum value of Rj − Ri where j > i.
#
# -------------------------------------
# Input
#
# The first line contains an integer n.
# In the following n lines, Rt(t = 0, 1, 2,...n - 1) are given in order.
#
# -------------------------------------
# Output
#
# Print the maximum value in a line.
#
# -------------------------------------
# Constraints
#
# - 2 ≤ n ≤ 200,000
# - 1 ≤ R t ≤ 10 ** 9
#
# -------------------------------------

n = gets.to_i
get = gets.to_i
min = get
max_rate = get * -1

(n-1).times do |i|
  get = gets.to_i

  rate = get - min
  max_rate = rate if max_rate < rate
  min = get if min > get
end
puts max_rate
