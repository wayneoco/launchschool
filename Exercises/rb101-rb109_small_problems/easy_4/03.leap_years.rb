=begin

Input: integer (year)
Output: boolean

Rules:
- input year > 0
- leap year rules:
  - divisible by 4 && NOT divisible by 100
  - divisible by 4 && divisible by 100 && divisible by 400

Data Structure:
- integers (integer division)

Algorithm:
- Given input integer (YEAR)
- if year is not divisible by 4 with no remainder:
  - YES: year is not a leap year
- if year is divisible by 4 with no remainder:
  - YES:
    - if year is divisible by 100 with no remainder:
      - NO: year is not a leap year
      - YES:
        - if year is divisible by 400 with no remainder:
          - NO: year is not a leap year
          - YES: year is a leap year

=end

def leap_year?(year)
  (year % 4 == 0 && year % 100 != 0) ||
    (year % 4 == 0 && year % 100 == 0 && year % 400 == 0)
end

puts leap_year?(2016) == true
puts leap_year?(2015) == false
puts leap_year?(2100) == false
puts leap_year?(2400) == true
puts leap_year?(240000) == true
puts leap_year?(240001) == false
puts leap_year?(2000) == true
puts leap_year?(1900) == false
puts leap_year?(1752) == true
puts leap_year?(1700) == false
puts leap_year?(1) == false
puts leap_year?(100) == false
puts leap_year?(400) == true