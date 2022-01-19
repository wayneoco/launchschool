=begin

# Problem
- Overview:
  - create a class that creates Date objects that take a month and a year as arguments.
  - this class will have a method that takes a day of the week and a numerical identifier such as first or last, from which the method can determine the exact day of the month on which this day occurs.

# Examples / Test Cases
- has a class MeetUp
- has an `initialize` method that takes a year and a month as arguments
- has an instance method `day` that takes two strings as arguments, a day of the week and a numerical indicator (e.g., first, second, last)
- 'teenth' returns a calendar day between 13-19

# Algorithm
- `initialize` method
  - takes two integers as arguments, a year and a month
- `day` instance method
  - Approach: create a method that takes two strings as arguments, a day of the week and a string indication of which day of the week (first, second, last, etc.). Using these arguments, return the exact calendar day of the week.
  - Method:
    - initialize an array to the days of the week, starting with the day of the week that corresponds to the 1st day of that particular month. Probably need a helper method for this.
    - iterate over the days of the week array
      - for the day of the week that matches the input day of the week, multiple the day's index number times the numerical position (first, second, last, etc.)

=end
require 'date'

class Month
  attr_reader :year, :month, :last_day, :first_week, :last_week, :teenth_week

  DAYS = Date::DAYNAMES

  def initialize(year, month)
    @year = year
    @month = month
    @first_day = Date.new(year, month, 1)
    @last_day = Date.new(year, month, -1)
    @first_week = DAYS.dup.rotate!(@first_day.cwday)
    @last_week = DAYS.dup.rotate!(@last_day.cwday + 1).reverse
    @teenth_week = DAYS.dup.rotate!(DAYS.index(first_week[5]))
  end
end

class Meetup
  def initialize(year, month)
    @month = Month.new(year, month)
  end

  def day(day, position)
    first_day = @month.first_week.index(day.capitalize) + 1
    calendar_day = convert_position(position, first_day, day)
    return nil unless calendar_day <= @month.last_day.day

    Date.civil(@month.year, @month.month, calendar_day)
  end

  private

  def convert_position(position, first_day, day)
    case position.downcase
    when 'first'  then first_day
    when 'second' then first_day + 7
    when 'third'  then first_day + 14
    when 'fourth' then first_day + 21
    when 'fifth'  then first_day + 28
    when 'last'   then @month.last_day.day - @month.last_week.index(day.capitalize)
    when 'teenth' then @month.teenth_week.index(day.capitalize) + 13
    end
  end
end
