def xor?(x, y)
  return true if x == true && y == false
  return true if x == false && y == true
  false
end

puts xor?(5.even?, 4.even?)
puts xor?(5.odd?, 4.odd?)
puts xor?(5.odd?, 4.even?)
puts xor?(5.even?, 4.odd?)

# LS's answer

def xor_alt1?(x, y)
  return true if x && !y
  return true if y && !x
  false
end

puts xor_alt1?(5.even?, 4.even?)
puts xor_alt1?(5.odd?, 4.odd?)
puts xor_alt1?(5.odd?, 4.even?)
puts xor_alt1?(5.even?, 4.odd?)

# LS alt answer

def xor_alt2?(x, y)
  !!((x && !y) || (y && !x))  # the double bang (!!) is needed to turn the expression into a boolean
end

puts xor_alt2?(5.even?, 4.even?)
puts xor_alt2?(5.odd?, 4.odd?)
puts xor_alt2?(5.odd?, 4.even?)
puts xor_alt2?(5.even?, 4.odd?)