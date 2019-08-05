require 'concurrent-ruby'

class Stack
  def initialize
    @data = Concurrent::Ivar.new
  end

  def push(el)
    data << el
  end

  def pop
    data.pop
  end

  def peek
    data[-1]
  end

  private

  attr_accessor :data
end
