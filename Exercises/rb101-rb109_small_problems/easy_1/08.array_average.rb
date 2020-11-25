def average(array)
  array.sum / array.size
end
  
puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40

def average_alt1(array)
  array.map! {|n| n.to_f}
  array.sum / array.size.to_f
end
