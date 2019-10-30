class Solver
  attr_reader :nodes

  def initialize(n)
    @nodes = (0..n-1).map { |i| Node.new(i) }
  end

  def exec
    nodes.each { |node| node.depth = calc_depth(node); node.height = calc_height(node) }
    puts_result
  end

  def add_node(input)
    id = input[0]
    nodes[input[1]].parent = id
    nodes[input[1]].sibiling = input[2]
    nodes[input[2]].sibiling = input[1]
    nodes[id].left_child = input[1]
    nodes[id].right_child = input[2]
  end

  def calc_depth(node)
    return 0 if node.parent == -1

    node2 = nodes[node.parent]
    cnt = 1
    while node2.parent != -1
      node2 = nodes[node2.parent]
      cnt += 1
    end
  end

  def puts_result
    nodes.each do |node|
      puts "node #{node.id}: parent = #{node.parent}, sibiling = #{node.sibiling}, degree = #{node.degree}, depth = #{node.depth}, height = #{node.height}, #{node.type}"
    end
  end
end

class Node
  attr_accessor :id, :parent, :left_child, :right_child, :sibiling, :depth, :height

  def initialize(id)
    @id = id
    @left_child = -1
    @right_child = -1
    @parent = -1
    @sibiling = -1
  end

  def children
    [@left_child, @right_child]
  end

  def type
    return 'root' if parent == -1
    return 'leaf' if children == []
    'internal node'
  end

  def degree
    children.size
  end
end

n = gets.to_i
solver = Solver.new(n)
n.times do |i|
  input = gets.split(' ').map(&:to_i)
  solver.add_node(input)
end

solver.exec
