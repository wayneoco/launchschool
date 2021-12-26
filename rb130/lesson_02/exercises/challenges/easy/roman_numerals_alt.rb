class RomanNumeral
  attr_accessor :number

ROMAN_NUMERALS = {
  "I" => 1,
  "IV" => 4,
  "V" => 5,
  "IX" => 9,
  "X" => 10,
  "XL" => 40,
  "L" => 50,
  "XC" => 90,
  "C" => 100,
  "CD" => 400,
  "D" => 500,
  "CM" => 900,
  "M" => 1000,
}

  def initialize(number)
    @number = number
    @numeral_sorted_values = ROMAN_NUMERALS.values.sort { |a, b| b <=> }
  end

  def to_roman
    roman_version = ''
    to_convert = number

    @numeral_sorted_values.each do |value|
      multiplier, remainder = to_convert.divmod(value)
      if multiplier > 0
        roman_version += (ROMAN_NUMERALS.key(value) * multiplier)
      end
      to_convert = remainder
    end
    roman_version
  end
end
