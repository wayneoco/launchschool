# case_statement.rb

a = 5

case a
when 5
	puts "a is 5"
when 6
	puts "a is 6"
else
	puts "a is neither 5, nor 6"
end

# The above code is roughly equivalent to the following if/elsif/else statement:

a = 5

if a == 5
	puts "a is 5"
	elsif a == 6
		puts "a is 6"
		else
		puts "a is neither 5, nor 6"
end

# Refactored case statement that saves the result as a variable:

a = 5

answer = case a 
	when 5
		"a is 5"
	when 6
		"a is 6"
	else
		"a is neither 5, nor 6"
	end
	
puts answer