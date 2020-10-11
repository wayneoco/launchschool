# exercises.rb

# Exercise 01

family = {
	uncles: ["bob", "joe", "steve"],
	sisters: ["jane", "jill", "beth"],
	brothers: ["frank", "rob", "david"],
	aunts: ["mary", "sally", "susan"]
}
	
immediate_family = family.select do |k,v|
	k == :sisters || k == :brothers
end

arr = immediate_family.values.flatten

p arr

# Exercise 02

hash_01 = {name: 'Bob', age: 42, city: 'Portland'}
hash_02 = {father: 'Wayne', grandfather: "Steve", mother: 'Mary'}

p hash_01.merge(hash_02)
p hash_01

p hash_01.merge!(hash_02)
p hash_01

# Exercise 03

capitals = {Oregon: "Salem", Washington: "Olympia", California: "Sacramento", Idaho: "Boise"}

puts capitals.keys
puts capitals.values

capitals.each do |k,v|
	puts "The capital of #{k} is #{v}."
end

# Exercise 04

person = {name: 'Bob', occupation: 'web developer', hobbies: 'painting'}

puts person[:name]

# Exercise 05

capitals = {Oregon: "Salem", Washington: "Olympia", California: "Sacramento", Idaho: "Boise"}

puts "There are fifty capital cities in the United States. We have listed four of them. Can you guess one of the four we've listed?"
cc = gets.chomp.capitalize!

if capitals.has_value?(cc) == true
	puts "Correct! #{cc} is one of the capital cities we've listed."
else
	puts "Sorry! #{cc} is not one of the cities we've listed."
end

# Exercise 08

words = ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live', 'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide', 'flow', 'neon']

group_01 = []
group_02 = []
group_03 = []
group_04 = []
group_05 = []

words.select do |a|
	if a == "demo" || a == "dome" || a == "mode"
		group_01 << a
	elsif a == "neon" || a == "none"
		group_02 << a
	elsif a == "tied" || a == "diet" || a == "edit" || a == "tide"
		group_03 << a
	elsif a == "evil" || a == "live" || a == "veil" || a == "vile"
		group_04 << a
	elsif a == "fowl" || a == "wolf" || a == "flow"
		group_05 << a
	end
end

p group_01
p group_02
p group_03
p group_04
p group_05

# Exercise 08 Solution

result = {}

words.each do |word|
	key = word.split('').sort.join
	if result.has_key?(key)
		result[key].push(word)
	else
		result[key] = [word]
	end
end

result.each_value do |v|
	puts "------"
	p v
end