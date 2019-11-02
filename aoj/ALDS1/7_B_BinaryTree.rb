class Solver
  attr_reader :nodes

  def initialize(n)
    @nodes = (0..n-1).map { |i| Node.new(i) }
  end

  def exec
    calc_height(nodes.find(&:root?))
    nodes.each { |node| node.depth = calc_depth(node); }
    puts_result
  end

  def add_node(input)
    id = input[0]

    nodes[id].left_child = input[1]
    nodes[id].right_child = input[2]

    if nodes[id].has_left_child?
      nodes[input[1]].parent = id
      nodes[input[1]].sibling = input[2]
    end

    if nodes[id].has_right_child?
      nodes[input[2]].parent = id
      nodes[input[2]].sibling = input[1]
    end
  end

  def calc_depth(node)
    return 0 unless node.has_parent?

    node2 = nodes[node.parent]
    cnt = 1
    while node2.has_parent?
      node2 = nodes[node2.parent]
      cnt += 1
    end

    return cnt
  end

  def calc_height(node)
    return node.height = 0 unless node.has_children?

    if node.has_left_child?
      left_child = nodes[node.left_child]
      calc_height(left_child)
    end

    if node.has_right_child?
      right_child = nodes[node.right_child]
      calc_height(right_child)
    end

    node.height = [left_child&.height || 0, right_child&.height || 0].max + 1
  end

  def puts_result
    nodes.each do |node|
      puts "node #{node.id}: parent = #{node.parent}, sibling = #{node.sibling}, degree = #{node.degree}, depth = #{node.depth}, height = #{node.height}, #{node.type}"
    end
  end
end

class Node
  attr_accessor :id, :parent, :left_child, :right_child, :sibling, :depth, :height

  def initialize(id)
    @id = id
    @left_child = -1
    @right_child = -1
    @parent = -1
    @sibling = -1
    @height = 0
  end

  def root?
    !has_parent?
  end

  def children
    [@left_child, @right_child]
  end

  def has_left_child?
    left_child != -1
  end

  def has_right_child?
    right_child != -1
  end

  def has_children?
    has_left_child? || has_right_child?
  end

  def has_parent?
    parent != -1
  end

  def type
    return 'root' if root?
    return 'leaf' unless has_children?
    'internal node'
  end

  def degree
    children.count { |c| c != -1 }
  end
end

n = gets.to_i
solver = Solver.new(n)
n.times do |i|
  input = gets.split(' ').map(&:to_i)
  solver.add_node(input)
end

solver.exec
