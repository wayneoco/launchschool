# frozen_string_literal: true

def leading_substrings(string)
  arr = []
  0.upto(string.size - 1) do |num|
    arr << string[0..num]
  end
  arr
end

puts leading_substrings('abc') == ['a', 'ab', 'abc']
puts leading_substrings('a') == ['a']
puts leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
