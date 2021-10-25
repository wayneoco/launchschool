=begin

# Problem
- input: 3 numerics
- output symbol
- rules:
  - Valid triangle:
    - sum of the lengths of the two shortest sides must be greater than the length
      of the longest side
    - all sides must have lengths > 0
  - equilateral:
    - all sides are equal lengths
  - isosceles:
    - 2 sides are equal lengths
  - scalene:
    - 0 sides are equal lengths
  - input lengths can be an integer or a float

# Algorithm
Approach:
  - Verify if the input lengths create a valid triangle
  - Determine which type of triangle

1. Write a method that verifies if a valid triangle:
  1.1. Initialize a local variable `lengths` to an array with each length as an element.
  1.2. Return `true` if the sum of the two smallest lengths are greater than the
       sum of the greatest length. (Use `min` and `max`).
2. Write a method that determines the type of triangle:
  2.1.

=end

def triangle(side1, side2, side3)
  lengths = [side1, side2, side3]
  return :invalid unless lengths.min(2).sum > lengths.max

  case lengths.uniq.size
  when 1  then :equilateral
  when 2  then :isosceles
  else         :scalene
  end
end

p triangle(3, 3, 3) #== :equilateral
p triangle(3, 3, 1.5) #== :isosceles
p triangle(3, 4, 5) #== :scalene
p triangle(0, 3, 3) #== :invalid
p triangle(3, 1, 1) #== :invalid
