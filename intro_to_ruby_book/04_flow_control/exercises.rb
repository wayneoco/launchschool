# exercises.rb

# Exercise 02

def all_caps(string)
	if string.length > 10
		string.upcase!
	else
		string
	end
end

puts all_caps("Hello, world!")
puts all_caps("Hi there!")
puts all_caps("What's for dinner tonight?")

# Exercise 03

puts "Pick a number between 0 and 100, please."
number = gets.chomp.to_i

if number >= 0 && number <= 50
	puts "#{number} is between 0 and 50."
elsif number >= 51 && number <= 100
	puts "#{number} is between 51 and 100."
elsif number > 100
	puts "#{number} is greater than 100."
else " "
end