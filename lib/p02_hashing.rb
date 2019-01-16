class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    sum = 0
    sum = self.map.with_index {|el, idx| el * idx}.reduce(:+)
    sum.hash
  end
end

class String
  def hash
    self.split("").map{|el| el.ord}.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    self.to_a.map{|sub| sub.map{|el| el.to_s}.hash}.hash
  end
end