=begin

### Problem
Given an array, count the number of times each element occurs in the array.

### Rules
- Input: array of strings
- Output: hash ({element: occurrences})

- Words are case-sensitive

### Examples/Test Cases
car => 4
truck => 3
SUV => 1
motorcycle => 2

### Algorithm
- Given an array of strings
- SET occurrences to an empty hash
- START loop
  - Match 0 index element with 0+1 index element
  - If 0 index element matches 0+1 index element
    - Add 1


=end

vehicles = %w(car car truck car SUV suv truck motorcycle motorcycle car truck)

def count_occurrences(vehicles)
  vehicle_count = Hash.new
  vehicles.map!(&:downcase)
  vehicles.uniq.each do |x|
    vehicle_count[x] = vehicles.count(x)
  end
  vehicle_count.each {|v, num| puts "#{v} => #{num}"}
end

count_occurrences(vehicles)