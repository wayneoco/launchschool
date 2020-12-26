NUMBER_CONVERSION = {
  '0' => 0,
  '1' => 1,
  '2' => 2,
  '3' => 3,
  '4' => 4,
  '5' => 5,
  '6' => 6,
  '7' => 7,
  '8' => 8,
  '9' => 9
}

def string_to_integer(string)
  number = string.chars.map { |char| NUMBER_CONVERSION[char] }

  converted_integer = 0
  number.each { |num| converted_integer = 10 * converted_integer + num }
  converted_integer
end

puts string_to_integer('4321') == 4321
puts string_to_integer('570') == 570
puts ''

puts "### FURTHER EXPLORATION ###"

HEX_CONVERSION = {
  '0' => 0,
  '1' => 1,
  '2' => 2,
  '3' => 3,
  '4' => 4,
  '5' => 5,
  '6' => 6,
  '7' => 7,
  '8' => 8,
  '9' => 9,
  'A' => 10,
  'B' => 11,
  'C' => 12,
  'D' => 13,
  'E' => 14,
  'F' => 15
}

def hexadecimal_to_integer(string)
  number = 0
  string.upcase.chars.reverse.each_with_index do |char, index|
    number += HEX_CONVERSION[char] * 16**index
  end
  number
end

puts hexadecimal_to_integer('4D9f') == 19871
puts hexadecimal_to_integer('90Fc8e') == 9501838
puts hexadecimal_to_integer('0aE5C12') == 11426834