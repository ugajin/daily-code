def search(m, list_a, n):
  for i in range(0, n-1): 
    j = i
    while j == n:
      if list_a[i] + list_a[j] == m:
        return True
      else:
        j += 1

  return False

n = int(input())
list_a = list(map(int, input().split()))
q = int(input())
list_m = list(map(int, input().split()))

for m in list_m:
  if search(m, list_a, n):
    print('yes')
  else:
    print('no')
