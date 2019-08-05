class Map
  def initialize
    @data = Array.new
  end

  def set(key, value)
    if include?(key)
      data << [key, value]
    else
      data[find_idx(key)] = [key, value]
    end
  end

  def get(key)
    data.each_with_index { |pair, i| return pair[1] if pair[0] == key }
  end

  def delete(key)
    key_idx = find_idx(key)
    data = data[0...key_idx] + data[key_idx + 1..-1]
  end

  

  private

  attr_accessor :data

  def find_idx(key)
    data.each_with_index { |pair, i| return i if pair[0] == key }
  end

  def include?(key)
    data.any? { |pair| pair[0] == key }
  end
end
