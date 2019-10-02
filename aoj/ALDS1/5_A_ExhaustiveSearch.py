import itertools

def hash_map(l, n):
  l_pairs = []
  for i in range(2, n+1):
    l_pairs += list(itertools.combinations(l, i))

  mapping = l
  for pair in l_pairs:
    mapping.append(sum(pair))

  return mapping

n = int(input())
list_a = list(map(int, input().split()))
q = int(input())
list_m = list(map(int, input().split()))

mapping = hash_map(list_a, n)

for m in list_m:
  if m in mapping: 
    print('yes')
  else:
    print('no')
