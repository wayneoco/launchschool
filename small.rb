# frozen_string_literal = true

def count_occurrences(input)
	inventory = {}

  input.each do |vehicle|
		inventory.key?(vehicle) ? inventory[vehicle] += 1 : inventory[vehicle] = 1
	end

	inventory.each_pair { |k, v| puts "#{k} => #{v}" }
end

vehicles = [
	  'car', 'car', 'truck', 'car', 'SUV', 'truck',
	  'motorcycle', 'motorcycle', 'car', 'truck'
	]

count_occurrences(vehicles)