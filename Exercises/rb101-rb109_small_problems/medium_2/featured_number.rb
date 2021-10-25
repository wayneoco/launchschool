=begin

# Problem
- input: integer
- output: integer
- rules:
  - Valid featured number:
    - odd
    - multiple of 7
    - has only unique digits
    - greater than the input integer
  - Return an error message if no valid featured number is found

# Algorithm
Approach:
  - Iterate over a range of numbers, starting at the input integer `number`
  - Return number of current iteration when number meets Valid Featured Number criteria

1. Write a method that takes an integer `start` as an argument.
2. Call the `upto` method on `start + 1` with (9_999_999_999) as an argument and parameter `current_number`.
  2.1. return 'Error: there is no possible featured number.' if:
    2.1.1. current_number is even
    2.1.2. current_number is not a multiple of 7
    2.1.3. size of current number, converted to a string, is not equal to size of current number,
           converted to a string, split into characters, unique.

=end

ERROR_MESSAGE = 'Error: there is no possible featured number.'

def featured(number)
  return "#{ERROR_MESSAGE}" if number >= 9_999_999_999

  (number + 1).upto(9_999_999_998) do |current_number|
    if current_number.odd? &&
       (current_number % 7).zero? &&
       current_number.to_s.size == current_number.to_s.chars.uniq.size
      return current_number
    end
  end
end

p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987
p featured(9_999_999_999) # -> There is no possible number that fulfills those requirements
