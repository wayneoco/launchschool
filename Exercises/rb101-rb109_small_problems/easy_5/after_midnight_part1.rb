=begin
### P ###
Input:
  - Integer
    - 0
    - positive
    - negative
Output:
  - string
    - string represents time in 24 hour format
    - hour is represented by two digits
    - minute is represented by two digits
    - hour and minute is separated by a colon (:)
Explicit rules:
  - time to be displayed in 24 hour format
  - base time is 0 (00:00 / midnight)
  - positive minutes = time is after midnight
  - negative minutes = time is before midnight
  - method should work with any integer input
  - may not use Ruby's `Date` and `Time` classes
  
### Examples / Test Cases ###
  time_of_day(0) == "00:00"
  time_of_day(-3) == "23:57"
  time_of_day(35) == "00:35"
  time_of_day(-1437) == "00:03"
  time_of_day(3000) == "02:00"
  time_of_day(800) == "13:20"
  time_of_day(-4231) == "01:29"
  
### Data Structure ###
Input: integer
Output: t.string :

### Algorithm ###
- Given an integer that represents the number of minutes
  - determine number of whole hours + remainder minutes represented by the minutes input (`Integer#divmod`)
=end

def calc_positive(minutes)
  hours, minutes = minutes.divmod(60)
  hours = hours.divmod(24)[1] if hours > 24
  format('%02d%s%02d', hours, ':', minutes)
end

def calc_negative(minutes)
  hours, minutes = minutes.divmod(60)
  hours = hours.divmod(24)[1] if hours < -24
  hours = 24 + hours if hours.negative?
  format('%02d%s%02d', hours, ':', minutes)
end

def time_of_day(minutes)
  if minutes.positive?
    calc_positive(minutes)
  elsif minutes.negative?
    calc_negative(minutes)
  else
    "00:00"
  end
end

puts time_of_day(0) == "00:00"
puts time_of_day(-3) == "23:57"
puts time_of_day(35) == "00:35"
puts time_of_day(-1437) == "00:03"
puts time_of_day(3000) == "02:00"
puts time_of_day(800) == "13:20"
puts time_of_day(-4231) == "01:29"
puts ''

puts "### LS Solution ###"
puts ''

MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

def time_of_day_LS(delta_minutes)
  delta_minutes =  delta_minutes % MINUTES_PER_DAY
  hours, minutes = delta_minutes.divmod(MINUTES_PER_HOUR)
  format('%02d:%02d', hours, minutes)
end

puts time_of_day_LS(0) == "00:00"
puts time_of_day_LS(-3) == "23:57"
puts time_of_day_LS(35) == "00:35"
puts time_of_day_LS(-1437) == "00:03"
puts time_of_day_LS(3000) == "02:00"
puts time_of_day_LS(800) == "13:20"
puts time_of_day_LS(-4231) == "01:29"
puts ''

puts "### Alt 1 ###"
puts ''

=begin

=end

puts time_of_day_LS(0) == "00:00"
puts time_of_day_LS(-3) == "23:57"
puts time_of_day_LS(35) == "00:35"
puts time_of_day_LS(-1437) == "00:03"
puts time_of_day_LS(3000) == "02:00"
puts time_of_day_LS(800) == "13:20"
puts time_of_day_LS(-4231) == "01:29"
puts ''