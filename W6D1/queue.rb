class Queue
  def initialize
    @data = Array.new
  end

  def enqueue(el)
    data << el
  end

  def dequeue
    data.shift
  end

  def peek
    data[-1]
  end

  private 

  attr_accessor

end

