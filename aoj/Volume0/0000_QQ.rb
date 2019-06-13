# Question
#
# Write a program which prints multiplication tables in the following format:
# 1x1=1
# 1x2=2
# .
# .
# 9x8=72
# 9x9=81
#
# -------------------
# Input
#
# No input.
#
# -------------------
# Output
#
# 1x1=1
# 1x2=2
# .
# .
# 9x8=72
# 9x9=81
#

1.upto(9) do |i|
  1.upto(9) do |j|
    puts "#{i}x#{j}=#{i*j}"
  end
end
