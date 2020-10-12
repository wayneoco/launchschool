# Chapter 09 Exercises

# Exercise 01

arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

arr.each do |num|
	puts num
end

# Exercise 02

arr.each do |num|
	if num > 5
		puts num
	end
end

# Exercise 03

new_arr = arr.select do |num|
	num.odd? == true
end

p new_arr

# Exercises 04

arr << 11
arr.unshift(0)

p arr

# Exercise 05

arr.delete(11)
arr << 3

p arr

# Exercise 06 

p arr.uniq!

# Exercise 08

hash01 = {:x => "Bob"}
hash02 = {x: "Bob"}

# Exercise 09

h = {a:1, b:2, c:3, d:4}

h[:b]
h[:e] = 5
h.delete_if {|k,v| v < 3.5}

# Exercise 10

h = {pets: ['evie', 'buck', 'chuckie']}
a = [{pet: 'evie'}, {pet: 'buck'}, {pet: 'chuckie'}]

# Exercise 11

contact_data = [["joe@email.com", "123 Main St.", "555-123-4567"], ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]

contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}

contacts["Joe Smith"] = {"email" => contact_data[0][0], "address" => contact_data[0][1], "phone" => contact_data[0][2]}
contacts["Sally Johnson"] = {"email" => contact_data[1][0], "address" => contact_data[1][1], "phone" => contact_data[1][2]}

puts contacts

# Exercise 12

contacts["Joe Smith"].fetch("email")
contacts["Sally Johnson"].fetch("phone")

# Exercise 13

arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']

arr.delete_if do |word|
	word.start_with?("s") == true
end

p arr

arr << "snow, slippery, salted roads"

p arr

arr.delete_if do |word|
	word.start_with?("s") == true || word.start_with?("w") == true
end

p arr

# Exercise 14

a = ['white snow', 'winter wonderland', 'melting ice', 'slippery sidewalk', 'salted roads', 'white trees']

new_arr = a.map do |arr|
	arr.split(" ")
end

p new_arr.flatten