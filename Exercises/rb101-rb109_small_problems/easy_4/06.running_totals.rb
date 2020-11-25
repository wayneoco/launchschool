def running_total(array)
  total = 0
  array.map { |num| total += num }
end

puts running_total([2, 5, 13]) == [2, 7, 20]
puts running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
puts running_total([3]) == [3]
puts running_total([]) == []
puts ''

def running_total_alt1(array)
  total = 0
  array.each_with_object([]) do |num, a|
    a << num + total
    total = num + total
  end
end

puts '### Running Total Alt 1 ###'
puts running_total_alt1([2, 5, 13]) == [2, 7, 20]
puts running_total_alt1([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
puts running_total_alt1([3]) == [3]
puts running_total_alt1([]) == []
puts ''

def running_total_alt2(array)
  new_array = []
  array.reduce do |num, a|
    sum = num + a
    puts sum
  end
  new_array
end

puts '### Running Total Alt 2 ###'
puts running_total_alt2([2, 5, 13]) == [2, 7, 20]
puts running_total_alt2([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
puts running_total_alt2([3]) == [3]
puts running_total_alt2([]) == []
puts ''
