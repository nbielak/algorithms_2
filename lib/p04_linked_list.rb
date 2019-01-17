class Node
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous node to next node
    # and removes self from list.
    self.prev.next = self.next if self.prev
    self.next.prev = self.prev if self.next
    self.next = nil 
    self.prev = nil
    self
  end
end

class LinkedList
  include Enumerable
  def initialize
    @head = Node.new
    @tail = Node.new

    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |node, j| return node if i == j }
    nil
  end

  def first
    empty? ? nil : @head.next
  end

  def last
    empty? ? nil : @tail.prev
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    node = @head
    until node.next.nil?
      return node.val if node.key == key
      node = node.next
    end
    nil
  end

  def include?(key)
    !!get(key)
  end

  def append(key, val)
    node = Node.new(key, val)
    node.prev, @tail.prev.next = last, node
    @tail.prev, node.next = node, @tail
  end

  def update(key, val)
    node = @head
    target = nil
    until node.next.nil?
      if node.key == key
        node.val = val 
        return node
      end
      node = node.next
    end
    nil
  end

  def remove(key)
    each do |node|
      if node.key == key
        node.remove
        return node
      end
    end
    nil
  end

  def each
    node = first
    until node.next.nil?
      yield node
      node = node.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, node| acc << "[#{node.key}, #{node.val}]" }.join(", ")
  end
end