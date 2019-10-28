class Solver
  attr_reader :n, :cost, :baggages, :dup_bags

  def initialize(n, baggages)
    @n = n
    @baggages = baggages
    @dup_bags = baggages.dup
    @cost = 0
  end

  def exec
    @baggages.sort!
    calc_cost
    puts_result
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
