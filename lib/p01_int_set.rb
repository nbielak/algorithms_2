class MaxIntSet
  def initialize(max)
    @max = max
    @store = Array.new(max + 1)
  end

  def insert(num)
    validate!(num)

    @store[num] = true
  end

  def remove(num)
    validate!(num)

    @store[num] = false
  end

  def include?(num)
    validate!(num)

    !!@store[num]
  end

  private

  def is_valid?(num)
    num >= 0 && num <= @max
  end

  def validate!(num)
    raise "Out of bounds" unless is_valid?(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    bucket = self[num]
    bucket << num
  end

  def remove(num)
    bucket = self[num]
    bucket.delete(num)
  end

  def include?(num)
    bucket = self[num]
    bucket.include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    resize! if @count == num_buckets
    bucket = self[num]
    bucket << num
    @count += 1
  end

  def remove(num)
    bucket = self[num]
    bucket.delete(num)
    @count -= 1
  end

  def include?(num)
    bucket = self[num]
    bucket.include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
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