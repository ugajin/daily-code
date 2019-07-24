# Stack
#
# -------------------------------------
# Question
#
# Write a program which reads an expression in the Reverse Polish notation and prints the computational result.
#
# -------------------------------------
# Input
#
# An expression is given in a line. Two consequtive symbols (operand or operator) are separated by a space character.
#
# You can assume that +, - and * are given as the operator and an operand is a positive integer less than 10**6
#
# -------------------------------------
# Output
#
# Print the computational result in a line.
#
# -------------------------------------
# Constraints
#
# - 2 ≤ the number of operands in the expression ≤ 100
# - 1 ≤ the number of operators in the expression ≤ 99
# - -1 × 10**9 ≤ values in the stack ≤ 10**9
#
# -------------------------------------

def operand?(e)
  %w[+ - *].include?(e)
end

list = gets.split(' ').map { |g| operand?(g) ? g : g.to_i }

stack = []

list.each do |l|
  unless operand?(l)
    stack << l
  else
    a = stack.pop
    b = stack.pop

    stack << b.send(l, a)
  end
end

puts stack.first
