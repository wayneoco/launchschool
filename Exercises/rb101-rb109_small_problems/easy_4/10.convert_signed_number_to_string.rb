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

def signed_integer_to_string(integer)
  case integer <=> 0
  when +1 then "+#{integer_to_string(integer)}"
  when -1 then "-#{integer_to_string(-integer)}"
  else integer_to_string(integer)
  end
end

puts signed_integer_to_string(4321) == '+4321'
puts signed_integer_to_string(-123) == '-123'
puts signed_integer_to_string(0) == '0'
puts ''

puts "### Further Exploration ###"
puts ''

def signed_integer_to_string_alt1(integer)
  return '0' if integer == 0
  integer.positive? ? sign = '+' : sign = '-'
  sign + integer_to_string(integer.abs)
end

puts signed_integer_to_string_alt1(4321) == '+4321'
puts signed_integer_to_string_alt1(-123) == '-123'
puts signed_integer_to_string_alt1(0) == '0'
puts ''