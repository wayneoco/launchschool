puts "Please write a word or multiple words."
string = gets.chomp

character_count = string.delete(' ').size

puts "There are #{character_count} characters in '#{string}'."