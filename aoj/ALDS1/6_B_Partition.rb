class Solver
  attr_reader :a, :p, :r

  def initialize(a, p, r)
    @a = a
    @p = p
    @r = r
  end

  def exec
    x = a.pop
    i = p-1

    (p..r-1).each do |j|
      if a[j] <= x
        i += 1
        a[i], a[j] = a[j], a[i]
      end
    end

    a[i+1], a[r] = a[r], a[i+1]
    a[i+1] = "[#{x}]"
    puts_result
  end

  def puts_result
    puts a.join(' ')
  end
end

r = gets.to_i
a = gets.split(' ').map(&:to_i)

Solver.new(a, 0, r-1).exec
