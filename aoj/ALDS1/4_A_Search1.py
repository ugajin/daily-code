# Search 1
#
# -------------------------------------
# Question
#
# You are given a sequence of n integers S and a sequence of different q integers T.
# Write a program which outputs C, the number of integers in T which are also in the set S.
#
# -------------------------------------
# Input
#
# In the first line n is given. In the second line, n integers are given.
# In the third line q is given. Then, in the fourth line, q integers are given.
#
# -------------------------------------
# Output
#
# Print C in a line.
#
# -------------------------------------
# Constraints
#
# - n ≤ 10000
# - q ≤ 500
# - 0 ≤ an element in S ≤ 109
# - 0 ≤ an element in T ≤ 109
#
# -------------------------------------

n = input()
s = list(map(int, input().split()))
q = input()
t = list(map(int, input().split()))
result = 0

for ti in t:
  if ti in s:
    result += 1

print(result)
