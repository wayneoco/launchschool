=begin

# PEDAC

## Problem

-input: integer (number to be rotated), integer (number of digits to be rotated)
-output: integer

- explicit rules:
  - rotate the last n digits of a number
  - n is always a positive integer
-implicit rules:
  - when the problem says to 'rotate the last n digits of a number', the second integer refers to the negative index number of the number to be placed at the end of the number.

## Data Structure
- integer
- string
- array

## Algorithm
- Given an integer and a second integer that represents the number of digits to be rotated:
  - Take the input integer and convert into a string
  - Take the string and split all characters into an array
  - Take the second input integer to indicate the negative index of the number to be rotated
  - m

=end

# frozen_string_literal: true

def rotate_rightmost_digits(number, index)
  number = number.to_s.chars
  number << number.delete_at(-index)
  number.join.to_i
end

puts rotate_rightmost_digits(735291, 1) #== 735291
puts rotate_rightmost_digits(735291, 2) #== 735219
puts rotate_rightmost_digits(735291, 3) #== 735912
puts rotate_rightmost_digits(735291, 4) #== 732915
puts rotate_rightmost_digits(735291, 5) #== 752913
puts rotate_rightmost_digits(735291, 6) #== 352917
