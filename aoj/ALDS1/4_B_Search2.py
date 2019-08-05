# Search 2
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
# - Elements in S is sorted in ascending order
# - n ≤ 100000
# - q ≤ 50000
# - 0 ≤ an element in S ≤ 10**9
# - 0 ≤ an element in T ≤ 10**9
#
# -------------------------------------

n = int(input())
s = list(map(int, input().split()))
q = input()
t = list(map(int, input().split()))

center = int(n / 2)
result = 0

for ti in t:
  if s[center] < ti:
    left = int(n / 2)
    right = n - 1
  elif ti < s[center]:
    left = 0
    right = int(n / 2)
  else:
    result += 1
    continue

  while True:
    tmp = int(left + int((right - left) / 2))
    if 'current' in locals() and current == tmp:
      if right == (n - 1):
        current += 1
      else:
        current -= 1
    else:
      current = tmp

    if s[current] < ti:
      if current < left:
        break
      left = current
    elif ti < s[current]:
      if right < current:
        break
      right = current
    elif ti == s[current]:
      result += 1
      break

print(result)
