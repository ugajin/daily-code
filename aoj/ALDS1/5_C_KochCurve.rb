class Solver
  attr_reader :lines, :n

  def initialize(line, n)
    @lines = [line]
    @n = n
  end

  def exec
    n.times do |i|
      cur_lines = @lines.dup
      cur_lines.each_with_index do |line, i|
        koch(line, i)
      end
    end

    puts_result
  end

  def puts_result
    lines.each(&:puts_result)
  end

  def koch(line, idx)
    p1 = line.start_point
    p2 = line.end_point

    length = p2.x - p1.x
    length_devide3 = length / 3

    s = Point.new(length_devide3, 0)
    t = Point.new(length_devide3 * 2, 0)
    u = Point.new(length / 2, Math.sqrt((length_devide3 ** 2) - (length_devide3 / 2) ** 2))

    line1 = Line.new(p1, s)
    line2 = Line.new(s, u)
    line3 = Line.new(u, t)
    line4 = Line.new(t, p2)

    lines.delete_at(idx)
    lines.insert(idx, line1, line2, line3, line4)
  end
end

class Line
  attr_accessor :start_point, :end_point

  def initialize(start_point, end_point)
    @start_point = start_point
    @end_point = end_point
  end

  def puts_result
    puts "#{@start_point.x.floor(8)} #{@start_point.y.floor(8)}"
    puts "#{@end_point.x.floor(8)} #{@end_point.y.floor(8)}"
  end
end

class Point
  attr_reader :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end
end

n = gets.to_i

start_point = Point.new(0, 0)
end_point = Point.new(100.to_f, 0)
line = Line.new(start_point, end_point)

Solver.new(line, n).exec
