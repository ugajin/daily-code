class Solver
  attr_reader :n, :cost, :baggages, :dup_bags

  def initialize(n, baggages)
    @n = n
    @baggages = baggages
    @dup_bags = baggages.dup
    @cost = 0
  end

  def exec
    quicksort(0, @n-1)
    calc_cost
    puts_result
  end

  def quicksort(left, right)
    if left < right
      q = partition(left, right)
      quicksort(left, q-1)
      quicksort(q+1, right)
    end
  end

  def partition(left, right)
    pivot = baggages[right]
    baggages[right] = nil
    i = left-1

    (left..right-1).each do |j|
      if baggages[j] <= pivot
        i += 1
        baggages[i], baggages[j] = baggages[j], baggages[i]
      end
    end

    baggages[i+1], baggages[right] = baggages[right], baggages[i+1]
    baggages[i+1] = pivot

    return i+1
  end

  def calc_cost
    i = 0
    while dup_bags != baggages
      min = dup_bags[i..-1].min
      min_idx = dup_bags.find_index(min)

      while min_idx != baggages.find_index(min)
        correct = baggages[min_idx]
        swap_idx = dup_bags.find_index(correct)
        puts "min: #{min}"
        puts "min_idx: #{min_idx}"
        puts "swap_idx: #{swap_idx}"
        puts "baggage: #{baggages.join(' | ')}"
        puts "dup_bag: #{dup_bags.join(' | ')}"
        puts "cost: #{cost}"
        puts '-----------------------------------'

        @cost += (dup_bags[min_idx] + dup_bags[swap_idx])
        dup_bags[min_idx], dup_bags[swap_idx] = dup_bags[swap_idx], dup_bags[min_idx]
        min_idx = swap_idx
      end

      i += 1
    end
  end

  def puts_result
    puts cost
    puts baggages.join(' ')
  end
end

n = gets.to_i
ws = gets.split(' ').map(&:to_i)

Solver.new(n, ws).exec
