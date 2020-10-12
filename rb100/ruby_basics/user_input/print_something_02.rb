loop do
	puts "Would you like me to print something? (y/n)"
	ans = gets.chomp.downcase
	if ans == "y" || ans == "yes"
		puts "...something..."
		break
	elsif ans != "y" || ans != "yes" || ans != "n" || ans != "no"
		puts "Whoops! You have to answer \"y\" or \"n\". Let's try this again."
	end
end