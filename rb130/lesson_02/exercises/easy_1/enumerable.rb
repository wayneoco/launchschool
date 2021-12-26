class Tree
  include Enumerable

  def initialize
    @leaves = []
  end

  def each
    @leaves.each { |leaf| yield(leaf) }
  end
end

