def multisum(int)
  (1..int).select { |num| num if num % 3 == 0 || num % 5 == 0 }.sum
end

puts multisum(3) == 3
puts multisum(5) == 8
puts multisum(10) == 33
puts multisum(1000) == 234168
puts ''

# Further exploration

def multisum_alt1(num)
  (1..num).select { |x| x if x % 3 == 0 || x % 5 == 0 }.reduce(:+)
end

puts '### Multisum Alt 1 ###'
puts multisum_alt1(3) == 3
puts multisum_alt1(5) == 8
puts multisum_alt1(10) == 33
puts multisum_alt1(1000) == 234168