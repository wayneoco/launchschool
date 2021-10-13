def rotate_array(arr)
  new_array = arr.dup
  new_array << new_array.shift
end

puts rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
puts rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
puts rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
puts rotate_array(x) == [2, 3, 4, 1]   # => true
puts x == [1, 2, 3, 4]                 # => true

def rotate_string(str)
  str.chars.rotate.join
end

puts rotate_string('test') == 'estt'
puts rotate_string('a') == 'a'

def rotate_integers(int)
  int.to_s.chars.rotate.join.to_i
end

puts rotate_integers(1234) == 2341
puts rotate_integers(0) == 0
