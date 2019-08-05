class Queue
  def initialize
    @data = Array.new
  end

  def enqueue(el)
    data+push(el)
    el
  end

  def dequeue
    data.shift
  end

  def peek
    data.first
  end

  private 

  attr_accessor

end

