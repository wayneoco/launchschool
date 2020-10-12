def valid_number?(number_string)
	number_string.to_i.to_s == number_string && number_string.to_i != 0
end

num01 = nil
num02 = nil

loop do
	puts "Please enter a positive or negative integer: "
	num01 = gets.chomp
	puts "Please enter a second positive or negative integer: "
	num02 = gets.chomp
	break if num01.to_i * num02.to_i < 0 && valid_number?(num01) && valid_number?(num02)
	if !(valid_number?(num01)) || !(valid_number?(num02))
		puts "Invalid input. Only non-zero integers are allowed."
	elsif num01.to_i * num02.to_i > 0
		puts "Invalid input. One integer must be positive, and one integer must be negative."
	end
end

result = num01.to_i + num02.to_i
puts "#{num01.to_i} + #{num02.to_i} = #{result}"

puts "------"

def valid_number?(number_string)
	number_string.to_i.to_s == number_string && number_string.to_i != 0
end

def get_number
	loop do
		puts "Please enter a positive or negative integer."
		number = gets.chomp
		return number.to_i if valid_number?(number)
		puts "Invalid input. Only non-zero integers are allowed."
	end
end

num01 = nil
num02 = nil

loop do
	num01 = get_number
	num02 = get_number
	break if num01 * num02 < 0
	puts "Sorry, one integer must positive, and one integer must be negative. Let's try this again."
end

sum = num01 + num02
puts "#{num01} + #{num02} = #{sum}"