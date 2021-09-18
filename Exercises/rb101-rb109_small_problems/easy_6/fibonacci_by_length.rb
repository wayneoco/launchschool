# frozen_string_literal: true

=begin

input: integer
output: array of integers

starting array = [1, 1]

next_number = array[-1] + array[-2]

=end

def find_fibonacci_index_by_length(digits)
  numbers = [1, 1]
  loop do
    numbers << numbers[-1] + numbers[-2]
    break if numbers[-1].to_s.size >= digits
  end
  numbers.index(numbers[-1]) + 1
end

puts find_fibonacci_index_by_length(2)      == 7          # 1 1 2 3 5 8 13
puts find_fibonacci_index_by_length(3)      == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
puts find_fibonacci_index_by_length(10)     == 45
puts find_fibonacci_index_by_length(100)    == 476
puts find_fibonacci_index_by_length(1000)   == 4782
puts find_fibonacci_index_by_length(10000)  == 47847
