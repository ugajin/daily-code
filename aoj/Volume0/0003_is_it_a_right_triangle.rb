# Is it a Right Triangle?
#
#-----------------------------
# Question
#
# Write a program which judges wheather given length of three side form a right triangle.
# Print "YES" if the given sides (integers) form a right triangle, "NO" if not so.
#
# -----------------------------
# Input
#
# Input consists of several data sets. In the first line, the number of data set, N is given.
# Then, N lines follow, each line corresponds to a data set. A data set consists of three integers separated by a single space.
#
# -----------------------------
# Constraints
#
# - 1 ≤ length of the side ≤ 1,000
# - N ≤ 1,000
#
# -----------------------------
# Output
#
# For each data set, print "YES" or "NO".
# -----------------------------

def right_triangle?(sides)
  sides.sort!
  (sides[0] ** 2) + (sides[1] ** 2) == sides[2] ** 2
end

gets.to_i.times { |i| right_triangle?(gets.split(" ").map(&:to_i)) ? puts('YES') : puts('NO') }
