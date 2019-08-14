require 'byebug'
class LRUCache
  def initialize(n)
    @csize = n
    @cache = []
    @vals = Hash.new
  end

  def count
    # returns number of elements currently in cache
    @cache.length
  end

  def add(el)
    # adds element to cache according to LRU principle
    if cinclude?(el)
      @cache.delete(el) { puts "not found" }
    elsif cfull? 
      x = @cache.pop
      @vals.delete(x)
    end
    @cache.unshift(el)
    @vals[el] = @cache.first
  end

  def show
    print @cache.reverse
    print "\n"
  end

  private
  # helper methods go here!

  def cfull?
    count == @csize
  end

  def cinclude?(value)
    @cache.each do |v|
      return true if v == value
    end
    false
  end
end

johnny_cache = LRUCache.new(4)

johnny_cache.add("I walk the line")
johnny_cache.add(5)

johnny_cache.count # => returns 2

johnny_cache.add([1,2,3])
johnny_cache.add(5)
johnny_cache.add(-5)
johnny_cache.add({a: 1, b: 2, c: 3})
johnny_cache.count
johnny_cache.add([1,2,3,4])
johnny_cache.add("I walk the line")
johnny_cache.add(:ring_of_fire)
johnny_cache.add("I walk the line")
johnny_cache.add({a: 1, b: 2, c: 3})


johnny_cache.show # => prints [[1, 2, 3, 4], :ring_of_fire, "I walk the line", {:a=>1, :b=>2, :c=>3}]
