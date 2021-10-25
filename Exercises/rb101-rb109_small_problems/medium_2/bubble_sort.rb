=begin

# Problem
- input: array of integers or strings
- output: array of integers or strings, sorted
- rules:
  - sort is in-place
  - input array contains at least two elements
  - array elements can be integers or strings, but not both

# Algorithm
Approach:
  - Iterate over the input array using `map`
  - Compare the current element of the array with the next element of the array
  - Swap if the first element is greater than the second; otherwise, leave in place.

1. Write a method that takes an array `array` as an argument.
2. Call `map!` and `with_index` on `array` with parameters `el` and `index`.
  2.1. el[index], el[index + 1] = el[index + 1], el[index] if el[index] > el[index + 1]
  2.2 break if el[index + 1] == array.index(array.last)

=end

def bubble_sort!(array)
  loop do
    greater_than = false
    (array.size - 1).times do |index|
      if array[index] > array[index + 1]
        array[index], array[index + 1] = array[index + 1], array[index]
        greater_than = true
      end
    end
    return array if greater_than == false
  end
end

array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
