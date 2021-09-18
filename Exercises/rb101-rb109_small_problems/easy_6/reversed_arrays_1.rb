# frozen_string_literal: true

=begin

1. receive array as input
2. make copy of array

[5, 4, 3, 2, 1, 1, 2, 3, 4, 5]
[1, 2, 3, 4, 5]

=end

require 'pry'

def reverse!(arr)
  copy = arr.clone
  copy.each { |el| arr.unshift(el) }
  arr.slice!(copy.size, copy.size)
  arr
end

list = [1,2,3,4]
result = reverse!(list)
puts result == [4, 3, 2, 1] # true
puts list == [4, 3, 2, 1] # true
puts list.object_id == result.object_id # true

list = %w(a b e d c)
puts reverse!(list) == ["c", "d", "e", "b", "a"] # true
puts list == ["c", "d", "e", "b", "a"] # true

list = ['abc']
puts reverse!(list) == ["abc"] # true
puts list == ["abc"] # true

list = []
puts reverse!(list) == [] # true
puts list == [] # true
