# frozen_string_literal: true

def max_rotation(number)
  number = number.to_s.chars
  number.each_index do |index|
    number << number.delete_at(index)
  end
  number.join.to_i
end

puts max_rotation(735291)         == 321579
puts max_rotation(3)              == 3
puts max_rotation(35)             == 53
puts max_rotation(105)            == 15 # the leading zero gets dropped
puts max_rotation(8_703_529_146)  == 7_321_609_845
puts max_rotation(8001242)
puts max_rotation(81400)
puts max_rotation(700)

# 8001242
# 0012428
# 0124280
# 0142802
# 0148020
# 0148200
# 0148200
# 0148200
