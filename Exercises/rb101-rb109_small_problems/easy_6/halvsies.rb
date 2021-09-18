# frozen_string_literal: true

def halvsies(arr)
  arr1 = arr.shift((arr.size.to_f / 2).round)
  arr2 = arr
  [arr1, arr2]
end

p halvsies([1, 2, 3, 4])    == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5])             == [[5], []]
p halvsies([])              == [[], []]
