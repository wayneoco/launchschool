loop do
	puts "How many times would you like me to print \"Launch School is the best!\"? Please enter a number >= 3."
	ans = gets.chomp.to_i
	if ans >= 3
		ans.times { puts "Launch School is the best!" }
		break
	elsif ans < 3
		puts "Sorry, that's not enough lines. Let's try this again."
	end
end