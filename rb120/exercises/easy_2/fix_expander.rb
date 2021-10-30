class Expander
  attr_reader :number

  def initialize(string, number)
    @string = string
    @number = number
  end

  def to_s
    expand(number)
  end

  private

  def expand(n)
    @string * n
  end
end

expander = Expander.new('xyz', 3)
puts expander
