module Describable
  def describe_shape
    "I am a #{self.class} and have #{self.class::SIDES} sides."
  end
end

class Shape
  include Describable
  SIDES = 4
  def self.sides
    self::SIDES
  end

  def sides
    self.class::SIDES
    # SIDES
  end
end

class Quadrilateral < Shape
  def sides
    SIDES
  end
end

class Square < Quadrilateral; end

# What is output and why? What does this demonstrate about constant scope? What does `self` refer to in
# each of the 3 methods above?

# p Square.sides #=> 4
p Square.new.sides #=> 4
p Square.new.describe_shape #=> Error

p Describable.ancestors
