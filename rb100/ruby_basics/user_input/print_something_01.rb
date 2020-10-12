puts "Would you like me to print something? (y/n)"
ans = gets.chomp.downcase

puts "something" if ans == "y" || ans == "yes"