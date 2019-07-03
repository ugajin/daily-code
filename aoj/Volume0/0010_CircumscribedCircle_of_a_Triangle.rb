# Circumscribed Circle of a Triangle
#
# ----------------------------------
# Question
#
# Write a program which prints the central coordinate (Px, Py)
# and the radius r of a circumscribed circle of a triangle which is constructed by three points (X1, Y1), (X2, Y2) and (X3, Y3) on the plane surface.
#
# -----------------------------------
# Input
#
# Input consists of several datasets. In the first line, the number of datasets n is given.
# Each dataset consists of:
#
# X1 Y1 X2 Y2 X3 Y3
#
# in a line. All the input are real numbers.
#
# -----------------------------------
# Output
#
# For each dataset, print Px, Py and r separated by a space in a line.
# Print the solution to three places of decimals. Round off the solution to three decimal places.
#
# -----------------------------------
# Constraints
#
# - -100 <= x1, y1, x2, y2, x3, y3 <= 100
# - n <= 20
# 
# ------------------------------------

include Math
gets.to_i.times do
  x1, y1, x2, y2, x3, y3 = gets.split(' ').map(&:to_f)

  a = ((x3 - x2) ** 2 + (y3 - y2) ** 2) ** 0.5
  b = ((x3 - x1) ** 2 + (y3 - y1) ** 2) ** 0.5
  c = ((x2 - x1) ** 2 + (y2 - y1) ** 2) ** 0.5

  cosA = (-a ** 2 + b **2 + c ** 2) / (2 * b * c)
  cosB = (a ** 2 - b **2 + c ** 2) / (2 * a * c)
  cosC = (a ** 2 + b **2 - c ** 2) / (2 * a * b)

  sin2A = sin(2 * acos(cosA))
  sin2B = sin(2 * acos(cosB))
  sin2C = sin(2 * acos(cosC))

  px = (x1 * sin2A + x2 * sin2B + x3 * sin2C) / (sin2A + sin2B + sin2C)
  py = (y1 * sin2A + y2 * sin2B + y3 * sin2C) / (sin2A + sin2B + sin2C)
  r = (((px - x1) ** 2 + (py - y1) ** 2) ** 0.5)

  puts "%.3f %.3f %.3f" % [px, py, r]
end
