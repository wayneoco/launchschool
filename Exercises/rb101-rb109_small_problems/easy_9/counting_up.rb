# frozen_string_literal: true

def sequence(int)
  (1..int).each_with_object([]) { |n, arr| arr << n }
end

puts sequence(5) == [1, 2, 3, 4, 5]
puts sequence(3) == [1, 2, 3]
puts sequence(1) == [1]
