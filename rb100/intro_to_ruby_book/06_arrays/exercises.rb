# exercises.rb

# Exercise 01

arr = [1, 3, 5, 7, 9, 11]
puts "I'm thinking of a series of 6 numbers. Can you guess one of the numbers I'm thinking of?"
number = gets.chomp.to_i

loop do
	if arr.include?(number)
		puts "Amazing! You guessed it: #{number} is one of the numbers I'm thinking of."
		break
	else
		puts "Nope! Would you like to try again?"
		ans = gets.chomp
		ans.upcase!
		if ans == "YES"
			puts "Okay. Let's try this again. Please guess one of the numbers I'm thinking of."
			number = gets.chomp.to_i
		elsif ans == "Y"
			puts "Okay. Let's try this again. Please guess one of the numbers I'm thinking of."
			number = gets.chomp.to_i
		elsif ans == "NO"
			puts "No worries. Have a great day!"
			break
		elsif ans == "N"
			puts "No worries. Have a great day!"
			break
		end
	end
end

# Exercise 03

arr = [["test", "hello", "world"], ["example", "men"]]
arr.last.first

# Exercise 07

arr = ["tacos", "cheese", "tomatoes", "tortillas"]

for.each_with_index in |i| do
	i = arr
	puts i + ": index = " + arr.index
end