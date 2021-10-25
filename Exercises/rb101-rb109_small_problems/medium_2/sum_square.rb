=begin

# Problem
- input: positive integer
- output: positive integer
- rules:
  - numbers = 1..input integer
  - calculate three numbers:
    - square of the sum of numbers 1..n
    - sum of the squares of numbers 1..n
    - difference between the two

# Algorithm
Approach:
  - Calculate the square of the sums of numbers 1..n
  - Calculate the sum of the squares of numbers 1..n
  - Calculate the difference between the two

1. Write a method that takes a positive integer `n` as an argument.
2. Write a method that calculates the square of the sums of 1..n:
  2.1. (1..n).sum**2
3. Write a method that calculates the sum of the squares of 1..n:
  3.1. (1..n).map { |num| num * num }.sum
4.

=end

def sum_square_difference(number)
  square_of_sums = (1..number).sum**2
  sum_of_squares = (1..number).map { |num| num * num }.sum
  square_of_sums - sum_of_squares
end

p sum_square_difference(3) == 22
 # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150
