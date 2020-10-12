USERNAME = "wayneoco"
PASSWORD = "password"

loop do
	puts "Enter username: "
	username = gets.chomp
	puts "Enter password: "
	password = gets.chomp
	break if username == USERNAME && password == PASSWORD
	puts "Authorization failed!"
end

puts "Welcome back!"