class Solver
  def initialize
    @n = n
    @cards = cards
    @p = 0
  end

  def exec
    if p < @n
      q = partition
      quicksort(@p, q-1)
      quicksort(q+1, @n)

    puts_stable
    puts_result
  end

  def partition
    x = @cards.pop
    i = @p-1

    (@p..@n-1).each do |j|
      if @cards[j].num <= x.num
        i += 1
        @cards[i], @cards[j] = @cards[j], @cards[i]
      end
    end

    @cards[i+1], @cards[r] = @cards[r], @cards[i+1]
    @cards[i+1] = x

    return i+1
  end

  def quicksort(left, right)
    @cards
  end

  def puts_result
    @cards.each { |card| puts "#{card.mark} #{card.num}" }
  end

  def puts_stable
  end
end

class Card
  attr_reader :mark, :num

  def initialize(mark, num)
    @mark = mark
    @num = num
  end
end

n = gets.to_i
cards = []
(0..n).times do |i|
  card = gets.split(' ')
  cards << Card.new(card[0], card[1].to_i)
end

Solver.new(n, cards).exec
