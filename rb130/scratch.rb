a = 'hello'
b = a
c = 'goodbye'
d = b

a = a.upcase!
b += ', world!'
d = c.upcase

puts a
puts b
puts c
puts d
