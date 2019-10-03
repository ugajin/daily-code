def mergeSort(count, left, right)
  return [count+1, left] if right.nil?

  result = []
  while true do
    count += 1

    if left[0] < right[0]
      result << left.shift
    else
      result << right.shift
    end

    if left.length == 0
      result.concat right
      return [count, result]
    end

    if right.length == 0
      count += 1
      result.concat left
      return [count, result]
    end
  end
end

n = gets.to_i
s = gets.split(' ').map { |si| [si.to_i] }
count = 0

while true do
  sorted = []
  while true do
    res = mergeSort(count, s.shift, s.shift)
    count = res[0]
    sorted << res[1] unless res[1].nil?

    break if s.length == 0
  end

  s = sorted
  break if s.length == 1
end

puts s[0].join(' ')
puts count
