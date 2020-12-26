# 1. Create an empty 'rows' array to contain all of the rows.
# 2. Create a 'row' array and add it to the overall 'rows' array.
#   1. do this...
#   2. do that...
# 3. Repeat step 2 until all the necessary rows have been created.
# 4. Sum final row.
# 5. Return sum of final row.

def sum_even_number_row(row_number)
  rows = []
  start_integer = 2
  (1..row_number).each do |current_row_number|
    rows << create_row(start_integer, current_row_number)
    start_integer = rows.last.last + 2
  end 
  rows.last.sum
end

# 1. Create an empty 'row' array to contain the integers
# 2. Add the starting integer
# 3. Increment the starting integer by 2 to get the next integer in the sequence
# 4. Repeat steps 2 & 3 until the array has reached the correct length
# 5. Return the 'row' array

# Start loop
# - Add the start integer to the row
# - Increment the start integer by 2
# - Break out of the loop if length of the row == row length

def create_row(start_integer, row_length)
  row = []
  current_integer = start_integer
  loop do
    row << current_integer
    current_integer += 2
    break if row.length == row_length
  end
  row
end

p sum_even_number_row(1) == 2
p sum_even_number_row(2) == 10
p sum_even_number_row(4) == 68

p create_row(2, 1) == [2]
p create_row(4, 2) == [4, 6]
p create_row(8, 3) == [8, 10, 12]