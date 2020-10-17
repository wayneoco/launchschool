# calculator.rb

puts "What two numbers would you like to calculate?"
numbers = gets.chomp.split

puts "Thanks! Now, what mathematical operator would you like to use? You can choose from +, -, / or *."
operator = gets.chomp

if operator == "+"
	result = numbers[0].to_i + numbers[1].to_i
	elsif operator == "-"
		result = numbers[0].to_i - numbers[1].to_i
	elsif operator == "/"
		result = numbers[0].to_f / numbers[1].to_f
	else
		result = numbers[0].to_i * numbers[1].to_i
end

puts "#{numbers[0]} #{operator} #{numbers[1]} = #{result}."