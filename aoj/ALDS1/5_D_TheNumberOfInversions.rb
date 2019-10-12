class Solver
  @@count = 0
  @@a

  def self.init_a(a)
    @@a = a
  end

  def self.merge(left, mid, right)
    n1 = mid - left
    n2 = right - mid
    l = @@a[left..mid]
    r = []

    (0..n2-1).each do |i|
      r[i] = @@a[mid + i]
    end
  
    l[n1] = Float::INFINITY
    r[n2] = Float::INFINITY
    i = 0
    j = 0
    (left..right-1).each do |k|
      if l[i] <= r[j]
        @@a[k] = l[i]
        i = i + 1
      else
        @@count += l.size - (i+1)
        @@a[k] = r[j]
        j = j + 1
      end
    end
  end
  
  def self.mergeSort(left, right)
    if left+1 < right
      mid = (left + right)/2
      mergeSort(left, mid)
      mergeSort(mid, right)
      merge(left, mid, right)
    end
  end

  def self.puts_result
    puts @@count
  end
end

n = gets.to_i
a = gets.split(' ').map(&:to_i)
Solver.init_a(a)
Solver.mergeSort(0, n)
Solver.puts_result
