require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    resize! if @count == num_buckets
    bucket = self[key]
    bucket << key
    @count += 1
  end

  def include?(key)
    bucket = self[key]
    bucket.include?(key)
  end

  def remove(key)
    bucket = self[key]
    bucket.delete(key)
    @count -= 1
  end


  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num.hash % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    old_store = @store
    @store = Array.new(@count * 2) { Array.new }
    @count = 0
    old_store.flatten.each {|num| self.insert(num)}
  end
end