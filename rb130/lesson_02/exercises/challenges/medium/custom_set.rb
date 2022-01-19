require 'benchmark'

class CustomSetArray
  attr_reader :set

  def initialize(set = [])
    @set = set.uniq
  end

  def empty?
    set.empty?
  end

  def contains?(el)
    set.include?(el)
  end

  def subset?(other)
    set.all? { |el| other.contains?(el) }
  end

  def disjoint?(other)
    set.none? { |el| other.contains?(el) }
  end

  def eql?(other)
    set.uniq.sort.eql?(other.set.uniq.sort)
  end

  def add(el)
    set << el unless set.include?(el)
    self
  end

  def intersection(other)
    #self.class.new(set.intersection(other.set).sort)
    same_elements = set.select { |el| other.contains?(el) }
    self.class.new(same_elements)
  end

  def difference(other)
    #self.class.new(set.difference(other.set).sort)
    different_elements = set.select { |el| !other.contains?(el) }
    self.class.new(different_elements)
  end

  def union(other)
    #self.class.new(set.union(other.set).sort)
    union_set = self.class.new(set)
    other.set.each { |el| union_set.add(el) }
    union_set.set.sort!
    union_set
  end

  def ==(other)
    set == other.set
  end
end

class CustomSetHash
  attr_reader :set, :keys

  def initialize(set = {})
    @set = set.uniq.to_h { |el| [el, nil] }
  end

  def empty?
    set.empty?
  end

  def contains?(el)
    set.key?(el)
  end

  def subset?(other)
    other.set >= set
  end

  def disjoint?(other)
    set.none? { |el, _| other.contains?(el) }
  end

  def eql?(other)
    set.sort.eql?(other.set.sort)
  end

  def add(el)
    set[el] = nil unless set.key?(el)
    self
  end

  def intersection(other)
    new_set = self.class.new
    set.each { |k, _| new_set.add(k) if other.contains?(k) }
    new_set
  end

  def difference(other)
    new_set = self.class.new
    set.each { |k, _| new_set.add(k) unless other.contains?(k) }
    new_set
  end

  def union(other)
    new_set = self.class.new
    set.each { |k, _| new_set.add(k) }
    other.set.each { |k, _| new_set.add(k) unless new_set.contains?(k) }
    new_set
  end

  def ==(other)
    set.eql?(other.set)
  end
end

set_array = CustomSetArray.new((1..9_999_999).to_a)
set_hash = CustomSetHash.new((1..9_999_999).to_a)

Benchmark.bm do |x|
  x.report("a_sbs?") { set_array.subset?(CustomSetArray.new((10..999).to_a)); }
  x.report("h_sbs?") { set_hash.subset?(CustomSetHash.new((10..999).to_a)); }
  x.report("a_cnt?") { set_array.contains?(9_999_998); }
  x.report("h_cnt?") { set_hash.contains?(9_999_998); }
  x.report("a_intr") { set_array.intersection(CustomSetArray.new((10..999).to_a)); }
  x.report("h_intr") { set_hash.intersection(CustomSetHash.new((10..999).to_a)); }
  x.report("a_diff") { set_array.difference(CustomSetArray.new((10..999).to_a)); }
  x.report("h_diff") { set_hash.difference(CustomSetHash.new((10..999).to_a)); }
  x.report("a_unio") { set_array.union(CustomSetArray.new((10_000_000..10_100_000).to_a)); }
  x.report("h_unio") { set_hash.union(CustomSetHash.new((10_000_000..10_100_000).to_a)); }
end
