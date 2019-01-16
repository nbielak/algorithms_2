class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    str = ""
    self.each_with_index do |num, idx|
      num = num.hash
      str += (num ^ idx).to_s
    end 
    str.to_i
  end
end

class String
  def hash
    self.chars.map{|el| el.ord}.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    self.to_a.sort_by{|el| el[0]}.flatten.map{|el| el.to_s.hash}.hash
  end
end