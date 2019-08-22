import math

def check(w, p, k):
  cur_k = 1
  cur_w = 0
  for wi in w:
    if cur_w + wi <= p:
      cur_w += wi
    else:
      cur_k += 1
      cur_w = wi
      if k < cur_k:
        return False

  return True


n, k = map(int, input().split())
w = []

for i in range(n):
  w.append(int(input()))

max_w = max(w)
sum_w = sum(w)
tmp_p = math.ceil(sum_w / k)
avg_n = n / k

print('max_w: {0}'.format(max_w))
print('sum_w: {0}'.format(sum_w))
print('tmp_p: {0}'.format(tmp_p))
print('avg_n: {0}'.format(avg_n))

cur_w = 0
cur_n = 0
cur_k = 1
cur_point = 0
for i, wi in enumerate(w):
  if cur_w + wi <= tmp_p:
    cur_w += wi
    cur_n += 1

    if i == len(w)-1 and cur_w <= tmp_p:
      cur_point += avg_n - cur_n
  else:
    cur_point += avg_n - cur_n
    cur_n = 1
    cur_k += 1
    cur_w = wi

  print('cur_w: {0}'.format(cur_w))
  print('cur_n: {0}'.format(cur_n))
  print('cur_k: {0}'.format(cur_k))
  print('cur_point: {0}'.format(cur_point))
  print('----------------------')

p = tmp_p
if 0 < cur_point and k < cur_k:
  p += math.ceil(cur_point)

if p < max_w:
  p = max_w

while check(w, p, k) == False:
  p += 1

print(p)
