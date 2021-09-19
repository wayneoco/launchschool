# frozen_string_literal: true

def leading_substrings(string)
  arr = []
  0.upto(string.size - 1) do |num|
    arr << string[0..num]
  end
  arr
end

def substrings(string)
  arr = []
  count = 0
  loop do
    arr.concat(leading_substrings(string[count..(string.size - 1)]))
    break if count == string.size - 1

    count += 1
  end
  arr
end

puts substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]
