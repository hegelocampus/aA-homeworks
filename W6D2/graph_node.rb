require 'set'
require 'byebug'

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
  end

  def inspect
    { "value" => @value, "neighbors" => @neighbors.map { |node| node.value } }.inspect
  end

  def bfs(target, checked_nodes = Set.new())
    to_check = [self]

    until to_check.empty?
      current = to_check.shift
      return current if current.value == target
      checked_nodes.add(current) 
      to_check += current.neighbors.reject { |node| checked_nodes.include?(node) }
    end

    nil
  end
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
graph = [a, b, c, d, e, f]
print "{\n"
print  "  'a' : #{ a.neighbors.map { |node| node.value }.join(', ') };\n"
print  "  'b' : #{ b.neighbors.map { |node| node.value }.join(', ') };\n"
print  "  'c' : #{ c.neighbors.map { |node| node.value }.join(', ') };\n"
print  "  'd' : #{ d.neighbors.map { |node| node.value }.join(', ') };\n"
print  "  'e' : #{ e.neighbors.map { |node| node.value }.join(', ') };\n"
print  "  'f' : #{ f.neighbors.map { |node| node.value }.join(', ') }\n"
print "}\n"
puts "Search for 'b'"
p a.bfs("b")
puts "Search for 'f'"
p a.bfs("f")
puts "Iterative search for 'f'"
print graph.map { |node| node.bfs("f") }
print "\n"
puts "Search for 'z'"
p a.bfs("z")
