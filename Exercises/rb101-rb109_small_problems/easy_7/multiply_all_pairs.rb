# frozen_string_literal: true

def multiply_all_pairs(numbers1, numbers2)
  numbers1.product(numbers2).map { |pair| pair.reduce(:*) }.sort
end

puts multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]
