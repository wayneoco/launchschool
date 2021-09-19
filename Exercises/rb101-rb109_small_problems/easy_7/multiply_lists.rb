# frozen_string_literal: true

def multiply_list(numbers1, numbers2)
  numbers1.map { |num| num * numbers2[numbers1.index(num)] }
end

puts multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]

def multiply_list_alt1(numbers1, numbers2)
  numbers1.zip(numbers2).map { |numbers| numbers.reduce(:*) }
end

puts multiply_list_alt1([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
