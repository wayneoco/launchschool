require 'pry'

def print_row(diamond_size, number_of_stars)
  stars = '*' * number_of_stars
  puts stars.center(diamond_size)
end

def diamond(diamond_size)
  1.step(by: 2, to: diamond_size) { |num| print_row(diamond_size, num) }
  (diamond_size - 2).step(by: -2, to: 0) { |num| print_row(diamond_size, num) }
  nil
end

puts diamond(1)
puts diamond(3)
puts diamond(9)
puts diamond(21)

def print_row_alt1(diamond_size, row_size)
  row_size == 1 ? line = '*' : line = "*#{'*'.rjust(row_size - 1)}"
  puts line.center(diamond_size)
end

def diamond_alt1(diamond_size)
  1.step(by: 2, to: diamond_size) { |row_size| print_row_alt1(diamond_size, row_size) }
  (diamond_size - 2).step(by: -2, to: 0) { |row_size| print_row_alt1(diamond_size, row_size) }
  nil
end

puts diamond_alt1(1)
puts diamond_alt1(3)
puts diamond_alt1(9)
puts diamond_alt1(21)
