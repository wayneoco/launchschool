STRING_NUMBERS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

def integer_to_string(integer)
  return '0' if integer == 0
  string = ''
  until integer.divmod(10) == [0, 0]
    digit = STRING_NUMBERS[integer.divmod(10)[1]]
    string.prepend(digit)
    integer = integer.divmod(10)[0]
  end
  string
end

puts integer_to_string(4321) == '4321'
puts integer_to_string(0) == '0'
puts integer_to_string(5000) == '5000'
puts ''

puts '### LS Solution ###'
puts ''

DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

def integer_to_stringLS(number)
  result = ''
  loop do
    number, remainder = number.divmod(10)
    result.prepend(DIGITS[remainder])
    break if number == 0
  end
  result
end
