##Adapted from linked list implementation provided by https://www.rubyguides.com/2017/08/ruby-linked-list/

class Node
  attr_accessor :next
  attr_reader :value
  def initialize(val)
    @val = val
    @next = nil
  end

  def to_s
    "#{@val}"
  end
end

class LinkedList
  def initialize
    @head = nil
  end

  def append(value)
    if @head
      find_tail.next = Node.new(value)
    else
      @head = Node.new(value)
    end
  end

  def <<(value)
    append(value)
  end

  def first
    @head
  end

  def find_tail
    node = @head

    return node unless node.next
    return node unless node.next while (node = node.next)
  end

  def find(value)
    node = @head
    return false unless node
    return false if !node.next
    return node if node.value == value

    while (node = node.next)
      return node if node.value == value
    end
  end

  def length
    node = @head

    return 0 unless node
    return 1 unless node.next

    count = 1
    count += 1 while (node = node.next)
    count
  end

  def display
    node = @head
    print node.to_s

    while (node = node.next)
      print ", #{node.to_s}"
    end
  end

  def delete(value)
    if @head.value == value
      @head = @head.next
      return
    end

    node = find_before(value)
    #raise "value not found" unless node
    return if node.nil?
    node.next = node.next.next
  end

  def pop
    tail = find_tail
    delete(tail)
    tail
  end

  def find_before(value)
    node = @head
    return false if node.nil?

    return false if !node.next
    return node if node.next.value == value

    while (node = node.next)
      return node if node.next && node.next.value == value
    end
  end

  def append_after(target, value)
    node = find(target)

    return unless node

    old_next = node.next
    node.next = Node.new(value)
    node.next.next = old_next
  end

end
