age = (20..200).to_a.sample
puts "Teddy is #{age} years old!"

# Better

age_alt1 = rand(20..200)
puts "Teddy is #{age_alt1} years old!"

# Further exploration

puts "What's your name?"
name = gets.chomp
name = 'Teddy' if name == ''

puts "What's your age?"
age_alt2 = gets.chomp

def name_and_age(name, age_alt2)
  puts "Your name is #{name}, and your age is #{age_alt2}."
end

name_and_age(name, age_alt2)
