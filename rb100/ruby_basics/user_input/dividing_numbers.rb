def valid_number?(number_string)
	number_string.to_i.to_s == number_string
end

num = nil
denom = nil

puts "Let's divide some numbers!"

loop do
	puts "Please enter the numerator: "
	num = gets.chomp
	break if valid_number?(num)
	puts "Invalid input. Only integers are allowed."
end

loop do
	puts "Please enter the denominator: "
	denom = gets.chomp
	break if valid_number?(denom) && denom != "0"
	if valid_number?(denom) == false
		puts "Invalid input. Only integers are allowed."
	elsif denom == "0"
		puts "Invalid input. A denominator of 0 is not allowed."
	end
end

quotient = num.to_i / denom.to_i

puts "#{num} / #{denom} is #{quotient}"