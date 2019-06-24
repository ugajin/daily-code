# GCD and LCM
#
# ----------------------------------
# Question
#
# Write a program which computes the greatest common divisor (GCD) and the least common multiple (LCM) of given a and b.
#
# -----------------------------------
# Input
#
# Input consists of several data sets.
# Each data set contains a and b separated by a single space in a line.
# The input terminates with EOF.
#
# -----------------------------------
# Constraints
#
# 0 < a,b ≤ 2,000,000,000
# LCM(a,b) ≤ 2,000,000,000
# The number of data sets ≤ 50
#
# -----------------------------------
# Output
#
# For each data set, print GCD and LCM separated by a single space in a line.
#
# -----------------------------------

def calc_gcd(m, n)
  while true do
    tmp = n
    n = m % n
    m = tmp

    return m if n == 0
  end
end

def calc_gcm(m, n, gcd)
  m * n / gcd
end

while line = gets do
  a, b = line.chop.split(/\s+/).map { |s| s.to_i }
  gcd = calc_gcd(a, b)
  gcm = calc_gcm(a, b, gcd)

  puts("#{gcd} #{gcm}")
end
