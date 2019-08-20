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

# def find_range(l, s):
#   i = 0
#   while True:
#     j = (2 ** i) - 1
#     if len(l) <= j:
#       return [(2 ** (i-1) -1), len(l)]
#     if l[j] <= s:
#       i += 1
#     else:
#       return [(2 ** (i-1) -1), j]
#
# def search(l, s):
#   n = len(l)
#   if n == 0 or s < l[0]:
#     return 0
#   if l[n-1] < s:
#     return n
#
#   range_i = find_range(l, s)
#   center = int((range_i[1] - range_i[0]) / 2) + range_i[0]
#
#   if l[center] < s:
#     left = center
#     right = range_i[1]
#   elif s < l[center]:
#     left = range_i[0]
#     right = center
#   else:
#     return center
#   
#   while True:
#     tmp = left + int((right - left) / 2)
#     if 'current' in locals() and current == tmp:
#       if right == (range_i[1] - 1):
#         current += 1
#       else:
#         current -= 1
#     else:
#       current = tmp
#   
#     if current < left:
#       return left+1
#     elif right <= current:
#       return current
#
#     if l[current] < s:
#       left = current
#     elif s < l[current]:
#       right = current
#     else:
#       return current
#
# def find(l, s):
#   i = search(l, s)
#   if len(l)-1 < i:
#     return False
#
#   return l[i] == s
#
# def insert(l, s):
#   i = search(l, s)
#   l.insert(i, s)
#   return l
#
# dic = []
#
# for i in range(int(input())):
#   call = input().split()
#   if call[0] == 'insert':
#     dic = insert(dic, call[1])
#   elif find(dic, call[1]):
#     print('yes')
#   else:
#     print('no')


d={}
for _ in range(int(input())):
    a,b=input().split()
    if a=='find':
        if b in d:print('yes')
        else:print('no')
    else:d[b]=0
