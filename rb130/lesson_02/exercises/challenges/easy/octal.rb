class Octal
  def initialize(number)
    @number = number
  end

  def to_decimal
    return 0 if @number.match?(/[^0-7]/)

    digits = @number.to_i.digits
    digits.map.with_index do |digit, power|
      digit * (8**power)
    end.sum
  end
end
