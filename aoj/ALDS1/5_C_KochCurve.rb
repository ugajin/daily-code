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
        koch
      end
    end

    puts_result
  end

  def puts_result
    lines.each(&:puts_result)
  end

  def koch
    line = lines[0]

    p1 = line.start_point
    p2 = line.end_point
    angle = line.angle

    length_x = p2.x - p1.x
    length_y = p1.y < p2.y ? p2.y - p1.y : p1.y - p2.y
    length_x_devide3 = length_x / 3
    length_y_devide3 = length_y / 3

    length_y_salt = p1.y < p2.y ? 1 : -1

    s = Point.new(length_x_devide3 + p1.x, p1.y + (length_y_devide3 * length_y_salt))
    t = Point.new(length_x_devide3 * 2 + p1.x, p1.y + ((length_y_devide3 * 2) * length_y_salt))

    case angle
    when 0
      if p1.x < p2.x
        ux = p1.x + length_x / 2
        uy = p1.y + Math.sqrt((length_x_devide3 ** 2) - (length_x_devide3 / 2) ** 2)
      else
        ux = p1.x + length_x / 2
        uy = p1.y - Math.sqrt((length_x_devide3 ** 2) - (length_x_devide3 / 2) ** 2)
      end
    when 60
      ux = p1.x
      uy = t.y
    when 120
      ux = p2.x
      uy = s.y
    end

    u = Point.new(ux, uy)

    line1 = Line.new(p1, s, angle)
    line2 = Line.new(s, u, angle + 60)
    line3 = Line.new(u, t, angle + 120)
    line4 = Line.new(t, p2, angle)

    lines.shift
    lines.push(line1, line2, line3, line4)
  end
end

class Line
  attr_accessor :start_point, :end_point, :angle

  def initialize(start_point, end_point, angle)
    @start_point = start_point
    @end_point = end_point
    @angle = cast_angle(angle)
  end

  def cast_angle(angle)
    return angle if angle < 180
    return 0 if angle == 180

    angle - 180
  end

  def puts_result
    puts "#{@start_point.x.floor(8)} #{@start_point.y.floor(8)}"
    puts "#{@end_point.x.floor(8)} #{@end_point.y.floor(8)}" if @end_point.x == 100
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
line = Line.new(start_point, end_point, 0)

Solver.new(line, n).exec
