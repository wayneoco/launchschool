# frozen_string_literal: true

def interleave(arr1, arr2)
  new_arr = []
  loop do
    new_arr << arr1.shift
    new_arr << arr2.shift
    break if arr1.empty? && arr2.empty?
  end
  new_arr
end

puts interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

def interleave_alt1(arr1, arr2)
  arr1.zip(arr2).flatten
end

puts interleave_alt1([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
