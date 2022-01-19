class Octal
  def initialize(octal)
    @octal = octal
  end

  def to_decimal
    return 0 if /[^0-7]/.match?(@octal)

    digits = @octal.to_i.digits
    digits.map.with_index { |digit, index| digit * (8**index) }.sum
  end
end

p Octal.new('1234567').to_decimal == 342_391
p Octal.new('2047').to_decimal == 1063
p Octal.new('234abc').to_decimal
