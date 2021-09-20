# frozen_string_literal: true

def double_number?(number)
  return false if number.size.odd?

  limit = number.size / 2
  number[0, limit] == number[limit, limit]
end

def twice(number)
  number = number.to_s
  double_number?(number) ? number.to_i : number.to_i * 2
end

puts twice(37) == 74
puts twice(44) == 44
puts twice(334433) == 668866
puts twice(444) == 888
puts twice(107) == 214
puts twice(103103) == 103103
puts twice(3333) == 3333
puts twice(7676) == 7676
puts twice(123_456_789_123_456_789) == 123_456_789_123_456_789
puts twice(5) == 10
