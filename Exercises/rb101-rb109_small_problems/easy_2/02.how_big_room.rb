SQMETERS_TO_SQFEET = 10.7639

puts "Enter the length of the room in meters:"
length = gets.chomp.to_f

puts "Enter the width of the room in meters:"
width = gets.chomp.to_f

area_meters = (length * width).round(2)
area_feet = (area_meters * SQMETERS_TO_SQFEET).round(2)

puts "The area of the room is #{area_meters} square meters (#{area_feet} square feet}."

# Further exploration

SQFEET_TO_SQINCHES = 144
SQFEET_TO_SQCENTIMETERS = 929.03

puts "Enter the length of the room in feet:"
length_feet = gets.chomp.to_f

puts "Enter the width of the room in feet:"
width_feet = gets.chomp.to_f

area_feet = (length_feet * width_feet).round(2)
area_inches = (area_feet * SQFEET_TO_SQINCHES).round(2)
area_centimeters = (area_feet * SQFEET_TO_SQCENTIMETERS).round(2)

puts "The area of the room is #{area_feet} square feet " + \
     "(#{area_inches} square inches, #{area_centimeters} square centimeters)."