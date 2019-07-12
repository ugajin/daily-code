# Gratest Common Divisor
#
# -------------------------------------
# Question
#
# Write a program which finds the greatest common divisor of two natural numbers a and b
#
# -------------------------------------
# Input
#
# a and b are given in a line sparated by a single space.
#
# -------------------------------------
# Output
#
# Output the greatest common divisor of a and b.
#
# -------------------------------------
# Constraints
#
# 1 ≤ a, b ≤ 109
#
# -------------------------------------

def calc_gcd(m, n)
  while true do
    tmp = n
    n = m % n
    m = tmp

    return m if n == 0
  end
end

a, b = gets.split(' ').map(&:to_i)
puts calc_gcd(a, b)
