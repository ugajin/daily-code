# Doubly Linked List
#
# -------------------------------------
# Question
#
# Your task is to implement a double linked list.
#
# -------------------------------------
# Input
#
# In the first line, the number of operations n is given.
# In the following n lines, the above mentioned operations are given in the following format:
#
# - insert x
# - delete x
# - deleteFirst
# - deleteLast
#
# -------------------------------------
# Output
#
# Print all the element (key) in the list after the given operations.
# Two consequtive keys should be separated by a single space.
#
# -------------------------------------
# Constraints
#
# The number of operations ≤ 2,000,000
# The number of delete operations ≤ 20
# 0 ≤ value of a key ≤ 10**9
# The number of elements in the list does not exceed 10**6
# For a delete, deleteFirst or deleteLast operation, there is at least one element in the list.
# -------------------------------------

def insert(num, list)
  list.unshift num
end

def delete(num, list)
  list.delete_at(list.index(num)) if list.include?(num)
  list
end

def deleteFirst(list)
  list.shift
  list
end

def deleteLast(list)
  list.pop
  list
end

def exec_commmand(input, list)
  if input.include?('First') || input.include?('Last')
    send(input, list)
  else
    command, num = input.split(' ')
    send(command, num, list)
  end
end

n = gets.to_i
list = []
n.times do
  list = exec_commmand(gets.chomp, list)
end

puts list.join(' ')
