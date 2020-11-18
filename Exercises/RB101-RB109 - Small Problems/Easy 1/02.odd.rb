def is_odd?(num)
	num % 2 == 1
end

puts is_odd?(2)
puts is_odd?(5)
puts is_odd?(-17)
puts is_odd?(-8)
puts is_odd?(0)
puts is_odd?(7)

# Alternative method using Integer#remainder method instead of modulo.

def is_odd_alternate?(num)
	num.remainder(2) != 0
end

puts is_odd_alternate?(2)
puts is_odd_alternate?(5)
puts is_odd_alternate?(-17)
puts is_odd_alternate?(-8)
puts is_odd_alternate?(0)
puts is_odd_alternate?(7)