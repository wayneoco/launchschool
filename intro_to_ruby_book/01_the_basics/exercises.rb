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

movies.each { |name, year| puts "#{year}" }

puts "**LS's solution:"

movies = {
	:jaws => 1975,
	:anchorman => 2004,
	:man_of_steel => 2013,
	:a_beautiful_mind => 2001,
	:the_evil_dead => 1981
	}
	
puts movies[:jaws]
puts movies[:anchorman]
puts movies[:man_of_steel]
puts movies[:a_beautiful_mind]
puts movies[:the_evil_dead]

puts "LS's solution using update hash syntax as of Ruby 1.9:"

movies = {
	jaws: 1975,
	anchorman: 2004,
	man_of_steel: 2013,
	a_beautiful_mind: 2001,
	the_evil_dead: 1981
}

puts movies[:jaws]
puts movies[:anchorman]
puts movies[:man_of_steel]
puts movies[:a_beautiful_mind]
puts movies[:the_evil_dead]

puts "Exercise 04"

dates = ["1985", "1984", "2003"]

dates.each { |year| puts "#{year}" }

puts "LS's solution:"

dates = [1975, 2004, 2013, 2001, 1981]

puts dates[0]
puts dates[1]
puts dates[2]
puts dates[3]
puts dates[4]

puts "Exercise 05"

puts 5 * 4 * 3 * 2 * 1
puts 6 * 5 * 4 * 3 * 2 * 1
puts 7 * 6 * 5 * 4 * 3 * 2 * 1
puts 8 * 7 * 6 * 5 * 4 * 3 * 2 * 1

puts "Exercise 06"

puts 1.27**2
puts 4.5678**2
puts 8.142**2