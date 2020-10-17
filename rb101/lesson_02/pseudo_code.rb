# pseudo_code.rb

# PRACTICE PROBLEM #1

# Given two integers
#		- add the two integers
# 	- return the result of adding the two integers

# START

# SET num01 = value of the first integer
# SET num02 = value of the second integer

# PRINT num01 + num02

# END

puts "What two numbers would you like to add together?"
numbers = gets.chomp.split

puts "#{numbers[0]} + #{numbers[1]} = #{numbers[0].to_i + numbers[1].to_i}"

puts("------")

# PRACTICE PROBLEM #2

# Given a collection of strings
# Assign the collection to a variable strings.
# For variable _strings_
#		- join all strings into a single string
#		- assign the new string to variable new_str

# START

# SET strings = collection of strings
# PRINT new_str = each string in variable strings combined into a single string

# END

strings = ["hello", "my", "name", "is", "Wayne"]
p new_str = strings.join

puts("------")

# PRACTICE PROBLEM #3

# Given a collection of integers

# Assign variable numbers = collection of variables
# Assign variable count = 1
# Assign variable new_arr = nil

# Iterate over each integer in collection numbers
#		- until count is greater than the number of integers in collection numbers
#			- if count is even
#				- save the current number to variable new_arr
#			- increase count by 1
# Return new_arr

# START

# SET numbers = collection of variables
# SET count = 1
# SET new_arr = []

# UNTIL count > the number of integers in numbers
#		IF count is even
#			SET new_arr = current integer in numbers
#		SET count = count + 1
#	END

# PRINT new_arr

numbers = [1, 4, 7, 3, 9, 10, 45, 10, 23, 551, 8]
new_arr = []

numbers.each do |num|
	new_arr << num if numbers.index(num).odd?
end

p new_arr