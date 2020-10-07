puts "Exercse 01"
puts "Wayne" + " " + "Olson"

puts "Exercise 02"
thousands = 5678 / 1000
puts "thousands: #{thousands}"

hundreds = 5678 % 1000 / 100
puts "hundreds: #{hundreds}"

tens = 5678 % 100 / 10
puts "tens: #{tens}"

ones = 5678 % 10
puts "ones: #{ones}"

puts "Exercise 03"
movies = {
	"Goonies" => "1985",
	"Karate Kid" => "1984",
	"Last Samurai" => "2003"
}

movies.each do |name, year|
	puts "#{year}"
end