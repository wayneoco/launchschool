class Triangle
  def initialize(side1, side2, side3)
    @sides = [side1, side2, side3]
    raise ArgumentError unless valid_triangle?
  end

  def kind
    case @sides.uniq.size
    when 1 then 'equilateral'
    when 2 then 'isosceles'
    else        'scalene'
    end
  end

  private

  def valid_triangle?
    valid_sides? && valid_two_lengths?
  end

  def valid_sides?
    @sides.all?(&:positive?)
  end

  def valid_two_lengths?
    @sides[0] + @sides[1] > @sides[2] &&
      @sides[0] + @sides[2] > @sides[1] &&
      @sides[1] + @sides[2] > @sides[0]
  end
end
