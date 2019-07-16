# Prime Numbers
#
# -------------------------------------
# Question
#
# A prime number is a natural number which has exactly two distinct natural number divisors: 1 and itself.
# For example, the first four prime numbers are: 2, 3, 5 and 7.
#
# Write a program which reads a list of N integers and prints the number of prime numbers in the list.
#
# -------------------------------------
# Input
#
# The first line contains an integer N, the number of elements in the list.
#
# N numbers are given in the following lines.
#
# -------------------------------------
# Output
#
# Print the number of prime numbers in the given list.
#
# -------------------------------------
# Constraints
#
# 1 ≤ N ≤ 10000
#
# 2 ≤ an element of the list ≤ 108
#
# -------------------------------------

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

res = 0
gets.to_i.times { |i| res += 1 if prime?(gets.to_i, [2, 3, 5, 7]) }
puts res
