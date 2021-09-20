# frozen_string_literal: true

require 'pry'

def buy_fruit(list)
  list.map { |fruit, quantity| [fruit] * quantity }.flatten
end

puts buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
["apples", "apples", "apples", "orange", "bananas","bananas"]
