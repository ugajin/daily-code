def stackable(pack, tmp_p, k):
  cur_w = 0
  trucks = 1
  for i in range(len(pack)):
    if tmp_p < pack[i]:
      return False

    if cur_w + pack[i] <= tmp_p:
      cur_w += pack[i]
    else:
      cur_w = pack[i]
      trucks += 1

      if k < trucks:
        return False

  return True

n, k = map(int, input().split())
pack = []

for i in range(n):
  pack.append(int(input()))

left = int(sum(pack) / k)
right = max(pack) * n

while left < right - 1:
  tmp_p = int((left + right) / 2)
  if stackable(pack, tmp_p, k):
    right = tmp_p
  else:
    left = tmp_p

if stackable(pack, left, k):
  print(left)
else:
  print(right)
