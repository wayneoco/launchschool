def sum(num)
  num.to_s.chars.map(&:to_i).reduce(:+)
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45

def sum_alt1(number)
  number.to_s.chars.map(&:to_i).reduce(:+)
end

puts sum_alt1(23) == 5
puts sum_alt1(496) == 19
puts sum_alt1(123_456_789) == 45