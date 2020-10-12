PASSWORD = "password"

loop do
	puts "Enter password: "
	ans = gets.chomp
	if ans == PASSWORD
		puts "Welcome Back!"
		break
	elsif 
		puts "Incorrect password! Please try again."
	end
end