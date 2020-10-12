def car(make, model)
	puts "#{make} #{model}"
end

car("Toyota", "Corolla")

puts "------"

def car(make, model)
	make + " " + model
end

puts car("Toyota", "Corolla")