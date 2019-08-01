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

max_s = max(s)
min_s = min(s)

center_i = int(n / 2)
result = 0

for ti in t:
  if max_s is ti or min_s is ti:
    result += 1
    continue

  devided_i = center_i
  if s[center_i] < ti:
    while ti < s[int(devided_i+devided_i/2)] or ti == s[int(devided_i+devided_i/2)]:
      devided_i += int(devided_i/2)
      if s[devided_i] == ti:
        break
  elif ti < s[center_i]:
    while s[int(devided_i-devided_i/2)] < ti or ti == s[int(devided_i-devided_i/2)]:
      devided_i -= int(devided_i/2)
      if s[devided_i] == ti or int(devided_i+devided_i/2) > n:
        break
  else:
    result += 1
    continue

  start_i = devided_i

  devided_i = center_i
  if ti < s[center_i]:
    while ti < s[int(devided_i-devided_i/2)] or ti == s[int(devided_i-devided_i/2)]:
      devided_i -= int(devided_i/2)
      if s[devided_i] == ti:
        break
  elif s[center_i] < ti:
    while s[int(devided_i+devided_i/2)] < ti or ti == s[int(devided_i+devided_i/2)]:
      devided_i += int(devided_i/2)
      if s[devided_i] == ti or n > devided_i+devided_i/2:
        break

  end_i = devided_i
  target_list = s[start_i:end_i]

  print(ti)
  print(start_i)
  print(end_i)
  print(target_list)

  if ti in target_list:
    result += 1

print(result)
