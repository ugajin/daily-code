class Solver
  attr_accessor :lines

  def initialize
    @lines = []
  end

  def add_lines(line)
    @lines << line
  end

  def clear_lines!
    @lines = []
  end

  def sort_lines!
    @lines.sort! { |line| line[0].x }
  end

  def calc_koch
    tmp_lines = lines.dup
    clear_lines!

    tmp_lines.each do |line|
      line.modify_point_1(Point.new(line.x1, line.x2 / 3))
      line.points[1]
      line.modify_point_2(Point.new(line.x2 - line.x1
    end

    sort_lines!
  end

  def puts_result
    lines.each { |line| line.each { |point| puts point[0].join(' '); puts point[1].join(' ') } }
  end
end

class Line
  attr_reader :x1, :x2, :y1, :y2

  def initialize(point_1, point_2)
    @x1 = point_1.x
    @y1 = point_1.y
    @x2 = point_2.x
    @y2 = point_2.y
  end

  def modify_point_1(point)
    @x1 = point.x
    @y1 = point.y
  end

  def modify_point_2(point)
    @x2 = point.x
    @y2 = point.y
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

point_1 = Point.new(0, 0)
point_2 = Point.new(100.to_f(6), 0)
line = Line.new(point_1, point_2)
solver = Solver.new
solver.add_lines(line)
n.times do |i|
  solver.calc_koch
end

solver.puts_result
