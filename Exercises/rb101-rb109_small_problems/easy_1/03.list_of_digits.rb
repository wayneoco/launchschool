# My initial answer

def digit_list(num)
  digits = num.to_s.split('')
  digits.map { |x| x.to_i }
end

puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true
puts

# Condensed version, per LS

def digit_list_ls(num)
  num.to_s.chars.map(&:to_i)
end
  
puts digit_list_ls(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list_ls(7) == [7]                     # => true
puts digit_list_ls(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list_ls(444) == [4, 4, 4]             # => true