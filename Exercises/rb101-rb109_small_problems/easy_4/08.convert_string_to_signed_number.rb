NUMBERS = {
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

def string_to_signed_integer(string)
  number = string.chars.map do |char|
    NUMBERS[char] unless char == /[^0-9]/
  end.compact

  converted_integer = 0
  number.each { |num| converted_integer = 10 * converted_integer + num }
  string[0] == '-' ? converted_integer * -1 : converted_integer
end

puts string_to_signed_integer('4321') #== 4321
puts string_to_signed_integer('-570') #== -570
puts string_to_signed_integer('+100') #== 100
puts ''

puts "### LS Exercise ###"
puts ''

DIGITS = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9
}

def string_to_integer1(string)
  digits = string.chars.map { |char| DIGITS[char] }

  value = 0
  digits.each { |digit| value = 10 * value + digit }
  value
end

def string_to_signed_integer1(string)
  sign = string[0] == '-' ? -1 : 1
  string = case string[0]
    when /(\-|\+)/ then string[1..-1]
    else string
    end
  string_to_integer1(string) * sign
end

puts string_to_signed_integer1('4321') == 4321
puts string_to_signed_integer1('-570') == -570
puts string_to_signed_integer1('+100') == 100