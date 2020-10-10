# exercises.rb

# Exercise 02

puts "Should we keep going?"
x = gets.chomp
x.upcase!

while x != "STOP" do
	puts "Okay. Keep going still?"
	x = gets.chomp
	x.upcase!
end

# Exercise 03

def countdown(num)
	if num <= 0
		puts num
	else
		puts num
		countdown(num - 1)
	end
end

countdown(8)
countdown(-20)