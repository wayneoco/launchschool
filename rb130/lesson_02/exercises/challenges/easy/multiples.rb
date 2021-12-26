class SumOfMultiples
  def initialize(*numbers)
    @numbers = numbers.empty? ? [3, 5] : numbers
  end

  def to(limit)
    (1..limit - 1).select do |number|
      multiple?(number, @numbers)
    end.sum
  end

  def self.to(limit)
    new.to(limit)
  end

  private

  def multiple?(limit, numbers)
    numbers.any? { |number| (limit % number).zero? }
  end
end
