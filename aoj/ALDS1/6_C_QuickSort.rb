class Solver
  def initialize(n, cards)
    @n = n-1
    @cards = cards
  end

  def exec
    quicksort(0, @n)
    puts_stable
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
    pivot = @cards[right]
    @cards[right] = nil
    i = left-1

    (left..right-1).each do |j|
      if @cards[j].num <= pivot.num
        i += 1
        @cards[i], @cards[j] = @cards[j], @cards[i]
      end
    end

    @cards[i+1], @cards[right] = @cards[right], @cards[i+1]
    @cards[i+1] = pivot

    return i+1
  end

  def puts_result
    @cards.each { |card| puts "#{card.mark} #{card.num}" }
  end

  def puts_stable
    @cards.each_with_index do |card, i|
      next_card = @cards[i+1]
      next unless card.num == next_card&.num

      return puts 'Not stable' if next_card&.id < card.id
    end

    puts 'Stable'
  end
end

class Card
  attr_reader :id, :mark, :num

  def initialize(id, mark, num)
    @id = id
    @mark = mark
    @num = num
  end
end

n = gets.to_i
cards = []
n.times do |i|
  card = gets.split(' ')
  cards << Card.new(i, card[0], card[1].to_i)
end

Solver.new(n, cards).exec
