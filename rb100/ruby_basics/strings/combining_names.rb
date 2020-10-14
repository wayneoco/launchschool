first_name = 'John'
last_name = 'Doe'

full_name = "#{first_name} #{last_name}"

puts full_name

# Additional methods to combine first and last names.
puts "------"

first_name = 'John'
last_name = 'Doe'

full_name = String.new("#{first_name} #{last_name}")

puts full_name

puts "------"

first_name = 'John'
last_name = 'Doe'

full_name = [first_name, last_name].join(" ")

puts full_name