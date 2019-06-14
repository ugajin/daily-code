#
# Write a program which computes the digit number of sum of two integers a and b.
#
# -----------------------------
# Input
#
# There are several test cases. Each test case consists of two non-negative integers a and b which are
# separeted by a space in a line. The input terminates with EOF.
#
# -----------------------------
# Constraints
#
# - 0 ≤ a, b ≤ 1,000,000
# - The number of datasets ≤ 200
#
# -----------------------------
# Output
#
# Print the number of digits of a + b for each data set.
#
# -----------------------------

def digit(gets_sum)
  i = 0
  while (gets_sum != 0) do
    gets_sum /= 10
    i += 1
  end
  i
end

while (str = gets) do
  puts digit(str.split(" ").map(&:to_i).sum)
end
