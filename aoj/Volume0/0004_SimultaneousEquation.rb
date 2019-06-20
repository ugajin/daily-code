# Simultaneous Equation
#
# ----------------------------------
# Question
#
# Write a program which solve a simultaneous equation:
#
# ax+by=c
# dx+ey=f
#
# The program should print x and y for given a, b, c, d, e and f (-1,000 ≤ a,b,c,d,e,f ≤ 1,000).
# You can suppose that given equation has a unique solution.
#
# -----------------------------------
# Input
#
# The input consists of several data sets, 1 line for each data set. In a data set, there will be a,b,c,d,e,f separated by a single space.
# The input terminates with EOF.
#
# -----------------------------------
# Output
#
# For each data set, print x and y separated by a single space. Print the solution to three places of decimals.
# Round off the solution to three decimal places.For each data set, print x and y separated by a single space.
# Print the solution to three places of decimals. Round off the solution to three decimal places.
# -----------------------------------
while line = gets do
  a, b, c, d, e, f = line.chop.split(/\s+/).map { |s| s.to_f }
  x = (e*c - b*f)/(a*e - b*d) + 0.0
  y = (d*c - a*f)/(d*b - a*e) + 0.0
  printf("%.3f %.3f\n", x, y)
end
