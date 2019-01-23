require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class LRUCache
  attr_reader :count
  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  def get(key)
    node = @map[key]
    p node.nil?
    p @map[1]
    if node.nil?
      p node.nil?
      eject!
      new_node = calc!(key)
      return new_node
    else
      update_node!(node)
      node
    end
  end

  def to_s
    "Map: " + @map.to_s + "\n" + "Store: " + @store.to_s
  end

  private

  def calc!(key)
    # suggested helper method; insert an (un-cached) key
    val = @prc.call(key)
    @map[key] = val
    @store.append(key, val)
    @map[key]
  end

  def update_node!(node)
    # suggested helper method; move a node to the end of the list
    @store.remove(node)
    @store.append(node)
  end

  def eject!
    @store.remove(@store.first.key) if @max == count && count > 0
  end
end