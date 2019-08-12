# Search 3
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
# In the first line n, the number of instructions is given.
# In the following n lines, n instructions are given in the above mentioned format.
#
# -------------------------------------
# Output
#
# Print yes or no for each find instruction in a line.
#
# -------------------------------------
# Constraints
#
# - A string consists of 'A', 'C', 'G', or 'T'
# - 1 ≤ length of a string ≤ 12
# - n ≤ 1000000
#
# -------------------------------------

def include_dic(l, s):
  n = int(len(l))
  if n == 0:
    return False
  if s < l[0] or l[n-1] < s:
    return False

  center = int(n / 2)

  if l[center] < s:
    left = int(n / 2)
    right = n - 1
  elif s < l[center]:
    left = 0
    right = int(n / 2)
  else:
    return True
  
  while True:
    tmp = left + int((right - left) / 2)
    if 'current' in locals() and current == tmp:
      if right == (n - 1):
        current += 1
      else:
        current -= 1
    else:
      current = tmp
  
    if current < left or right < current:
      return False

    if l[current] < s:
      if current <= left:
        return False
      left = current
    elif s < l[current]:
      if right <= current:
        return False
      right = current
    elif s == l[current]:
      return True

def insert_dic(l, s):
  for i in range(len(l)):
    li = l[i]
    if s < l[i]:
      l.insert(i, s)
      return l
  l.append(s)
  return l

n = int(input())
dic_a = []
dic_c = []
dic_g = []
dic_t = []

for i in range(n):
  call = input().split()
  if call[0] == 'insert':
    if call[1][0] == 'A':
      dic_a = insert_dic(dic_a, call[1])
    if call[1][0] == 'C':
      dic_c = insert_dic(dic_c, call[1])
    if call[1][0] == 'G':
      dic_g = insert_dic(dic_g, call[1])
    if call[1][0] == 'T':
      dic_g = insert_dic(dic_t, call[1])
  else:
    if call[1][0] == 'A':
      tar_dic = dic_a
    if call[1][0] == 'C':
      tar_dic = dic_c
    if call[1][0] == 'G':
      tar_dic = dic_g
    if call[1][0] == 'T':
      tar_dic = dic_t

    if include_dic(tar_dic, call[1]):
      print('yes')
    else:
      print('no')
