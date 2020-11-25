def multiply(a, b)
  a * b
end

def square(num)
  multiply(num, num)
end

puts square(5) == 25
puts square(-8) == 64

# Further exploration

def power_to_n(num)
  result = 1
  num.times { result = multiply(num, result) }
  result
end

puts power_to_n(1)
puts power_to_n(2)
puts power_to_n(3)
puts power_to_n(4)
puts power_to_n(5)