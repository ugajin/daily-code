# Prime Number
#
# ----------------------------------
# Question
#
# Write a program which reads an integer n and prints the number of prime numbers which are less than or equal to n.
# A prime number is a natural number which has exactly two distinct natural number divisors: 1 and itself.
# For example, the first four prime numbers are: 2, 3, 5 and 7.
#
# -----------------------------------
# Input
#
# Input consists of several datasets.
# Each dataset has an integer n (1 ≤ n ≤ 999,999) in a line.
#
# The number of datasets is less than or equal to 30.
#
# -----------------------------------
# Output
#
# For each dataset, prints the number of prime numbers.
#
# -----------------------------------

def generate_map
  single_primes = [2, 3, 5, 7]
  map = []

  1000000.times { |i| map << prime?(i, single_primes) }

  map
end

def prime?(n, single_primes)
  return false if n <= 1
  return true if single_primes.include?(n)
  return false if n % 2 == 0
  return false if single_primes.any? { |sp| n % sp == 0 }

  2.upto((n ** 0.5).to_i) do |i|
    if n % i == 0
      return false
      break
    end
  end

  true
end

map = generate_map
while i = gets
  n = i.to_i
  puts map[0..n].count(true)
end
