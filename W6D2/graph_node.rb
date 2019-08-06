class Graph_node
  attr_reader :value, :neighbors
  def initialize(value)
    @value = value
    @neighbors = []
  end

  def neighbors=(nodes)
    nodes.each do |node|
      add_neighbor(node) 
    end
  end

  def add_neighbor(node)
    return nil if @neighbors.include?(node)
    @neighbors << node
    node.neighbors << self
  end

  def inspect
    { "value" => @value, "neighbors" => @neighbors.map { |node| node.value } }.inspect
  end
end

def bfs(starting_node, target)
  checked_nodes = []
  to_check = [starting_node]

  until to_check.empty?
    current = to_check.shift
    return current if current.value == target
    checked_nodes << current
    to_check += current.neighbors.reject { |node| checked_nodes.include?(node) }
  end

  nil
end

a = Graph_node.new('a')
b = Graph_node.new('b')
c = Graph_node.new('c')
d = Graph_node.new('d')
e = Graph_node.new('e')
f = Graph_node.new('f')
a.neighbors = [b, c, e]
c.neighbors = [b, d]
e.neighbors = [a]
f.neighbors = [e]
#p [a,b,c,d,e,f]
puts "Search for 'b'"
p bfs(a, "b")
puts "Search for 'f'"
p bfs(a, "f")
puts "Search for 'z'"
p bfs(a, "z")
