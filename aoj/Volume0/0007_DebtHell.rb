# Debt Hell
#
# ----------------------------------
# Question
#
# Your friend who lives in undisclosed country is involved in debt.
# He is borrowing 100,000-yen from a loan shark.
# The loan shark adds 5% interest of the debt and rounds it to the nearest 1,000 above week by week.
#
# Write a program which computes the amount of the debt in n weeks.
#
# -----------------------------------
# Input
#
# An integer n (0 ≤ n ≤ 100) is given in a line.
#
# -----------------------------------
# Output
#
# Print the amout of the debt in a line.
#
# -----------------------------------

debt = 100000.0
gets.to_i.times { debt += (debt * 0.05).ceil(-3) }
puts debt.to_i
