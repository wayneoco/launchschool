def oddities(array)
  new_arr = []
  array.each_index { |x| new_arr << array.fetch(x) if x.even? }
  new_arr
end

puts %(### Oddities ###)
puts oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
puts oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
puts oddities([1, 2, 3, 5, 3, 7, 7]) == [1, 3, 3, 7]
puts oddities(['abc', 'def']) == ['abc']
puts oddities([123]) == [123]
puts oddities([]) == []
puts ''

# LS's solution

def oddities_alt1(array)
  odd_elements = []
  index = 0
  while index < array.size
    odd_elements << array[index]
    index += 2
  end
  odd_elements
end

puts %(### Oddities Alt1 ###)
puts oddities_alt1([2, 3, 4, 5, 6]) == [2, 4, 6]
puts oddities_alt1([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
puts oddities_alt1([1, 2, 3, 5, 3, 7, 7]) == [1, 3, 3, 7]
puts oddities_alt1(['abc', 'def']) == ['abc']
puts oddities_alt1([123]) == [123]
puts oddities_alt1([]) == []
puts ''

# Further exploration

def even(array)
  new_arr = []
  array.each_index { |x| new_arr << array.fetch(x) if x.odd? }
  new_arr
end

puts %(### Even ###)
puts even([2, 3, 4, 5, 6, 7]) == [3, 5, 7]
puts even([1, 2, 3, 4, 5, 6]) == [2, 4, 6]
puts even([1, 1, 2, 3, 4, 3, 7]) == [1, 3, 3]
puts even(['abc', 'def']) == ['def']
puts even([123, 456, 789]) == [456]
puts even([]) == []
puts ''

def even_alt1(array)
  array.select { |x| }
end

puts %(### Even Alt1 ###)
puts even_alt1([2, 3, 4, 5, 6, 7]) == [3, 5, 7]
puts even_alt1([1, 2, 3, 4, 5, 6]) == [2, 4, 6]
puts even_alt1([1, 1, 2, 3, 4, 3, 7]) == [1, 3, 3]
puts even_alt1(['abc', 'def']) == ['def']
puts even_alt1([123, 456, 789]) == [456]
puts even_alt1([]) == []
puts ''

def even_alt2(array)
  array.keep_if { |x| array.index(x).odd? }
  array
end

puts %(### Even Alt2 ###)
puts even_alt2([2, 3, 4, 5, 6, 7]) == [3, 5, 7]
puts even_alt2([1, 2, 3, 4, 5, 6]) == [2, 4, 6]
puts even_alt2([1, 1, 2, 3, 4, 3, 7]) == [1, 3, 3]
puts even_alt2(['abc', 'def']) == ['def']
puts even_alt2([123, 456, 789]) == [456]
puts even_alt2([]) == []
puts ''