=begin

# Problem
- input: integer
- output: integer
- rules:
  - explicit:
    - year is always greater than 1752

# Algorithm
Approach:
  - Look at the 13th of each month of the year
  - Determine if the 13th for the given month is a friday

1. Write a method that takes an integer `year` as an argument.
2. Initialize a local variable `counts` to 0
3. Initialize a local variable `month` to 1
4. Create a loop to cycle through the months of the year, checking if the 13th
   for the given month is a Friday.
   4.1. date = Date.new(year, month, 13)
   4.2. Call `friday?` on `date`
   4.3 If true, increment `counts` by 1
5. Return `counts`

=end

require 'date'
require 'pry'

def five_fridays(year)
  fridays = {}
  from_date = Date.new(year, 01, 01)
  to_date = Date.new(year, 12, 31)
  1.upto(12) do |month|
    fridays[month] = from_date.upto(to_date).select do |date|
      date.friday? && date.mon == month
    end.count
  end
  fridays.values.count(5)
end

p five_fridays(2015) #== 3
p five_fridays(1986) #== 1
p five_fridays(2019) #== 2
p five_fridays(2021)
p five_fridays(2000)
