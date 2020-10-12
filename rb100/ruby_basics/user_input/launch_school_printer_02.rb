loop do
	puts "How many times would you like me to print \"Launch School is the best!\"? Please enter a number >= 3."
	ans = gets.chomp
	if ans.to_i >= 3
		ans.to_i.times { puts "Launch School is the best!" }
	elsif ans.downcase == 'q'
		break
	elsif ans.to_i < 3
		puts "Sorry, that's not enough lines. Let's try this again."
	end
end