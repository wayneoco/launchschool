puts "What is your name?"
name = gets.chomp

puts "HELLO #{name.chop.upcase}. " + \
     "WHY ARE WE SCREAMING?" if name.end_with?('!')
puts "Hello #{name}." if !name.end_with?('!')

# Alt

print 'What is your name? '
name = gets.chomp

if name[-1] == '!'
  name = name.chop
  puts "HELLO #{name.upcase}. WHY ARE WE SCREAMING?"
else
  puts "Hello #{name}."
end