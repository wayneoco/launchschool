=begin

# Problem
- input: 3 integers
- output: symbol
- rules:
  - Valid triangle:
    - sum of angles = 180
    - all angles > 0
  - Triangle types:
    - right: one angle is 90
    - acute: all angles < 90
    - obtuse: one angle > 90

# Algorithm
Approach:
  - Validate input degrees for valid triangle
  - Determine triangle type

1. Write a method that takes three integers as arguments
2. Initialize a local variable `angles` to an array with input integers as elements.
3. Return :invalid if:
  3.1. sum of `angles` is != 180 or any angles are <= 0
4.

=end

def triangle(angle1, angle2, angle3)
  angles = [angle1, angle2, angle3]
  case
  when angles.sum != 180, angles.include?(0)
    :invalid
  when angles.any? { |angle| angle > 90 }
    :obtuse
  when angles.any? { |angle| angle == 90 }
    :right
  when angles.all? { |angle| angle < 90 }
    :acute
  end
end

p triangle(60, 70, 50) #== :acute
p triangle(30, 90, 60) #== :right
p triangle(120, 50, 10) #== :obtuse
p triangle(0, 90, 90) #== :invalid
p triangle(50, 50, 50) #== :invalid
