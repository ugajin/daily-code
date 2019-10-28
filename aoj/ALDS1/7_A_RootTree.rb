class Solver
  attr_reader :nodes

  def initialize(n)
    @nodes = (0..n-1).map { |i| Node.new(i) }
  end

  def exec
    puts_result
  end

  def add_node(input)
    input[2..-1].each do |child|
      nodes[child].parent = input[0]
      nodes[input[0]].children << child
    end
  end

  def depth(node)
    return 0 if node.parent == -1

    node2 = nodes[node.parent]
    cnt = 1
    while node2.parent != -1
      node2 = nodes[node2.parent]
      cnt += 1
    end

    cnt
  end

  def puts_result
    nodes.each do |node|
      puts "node #{node.id}: parent = #{node.parent}, depth = #{depth(node)}, #{node.type}, [#{node.children.join(', ')}]"
    end
  end
end

class Node
  attr_accessor :id, :parent, :children

  def initialize(id)
    @id = id
    @children = []
    @parent = -1
  end

  def type
    return 'root' if parent == -1
    return 'leaf' if children == []
    'internal node'
  end
end

n = gets.to_i
solver = Solver.new(n)
n.times do |i|
  input = gets.split(' ').map(&:to_i)
  solver.add_node(input)
end

solver.exec
