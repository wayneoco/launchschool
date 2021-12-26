=begin
# Problem
- Create a clock that is independent of date
- You can add and subtract minutes to this clock
- Two clocks that represent the same time are equal to each other
- Cannot use any built-in time or date functionality

# Examples
- We have a class Clock
- Clock uses 24-hour time
- This class has the following methods:
  - class method `at`
  - class method `+`
  - class method `-`
  - instance method `to_s`
- The class method `at` takes between 1 and 2 arguments
  - First argument represents the hour
  - Second argument represents the minutes
    - this argument is optional
    - this argument has a default value of `00'

# Data Structures
- input: integers
- output: string representation of time

# Algorithm
- class Clock
  - has three class methods and one instance method

- `at` class method
  - takes between 1 and 2 integer arguments
  - 1st argument represents the hour
  - 2nd argument represents the minutes
    - default value is `00`
  - create a new `Clock` object
  - initialize two instance variables
    - hour
    - minutes

=end

class Clock
  def initialize(hour, minutes)
    @hour = hour
    @minutes = minutes
  end

  def self.at(hour, minutes = 0)
    new(hour, minutes)
  end

  def +(other)
    total_minutes = ((@hour * 60) + @minutes) + other
    total_hours, minutes = total_minutes.divmod(60)
    hour = total_hours.divmod(24)[1]
    Clock.new(hour, minutes)
  end

  def -(other)
    total_minutes = ((@hour * 60) + @minutes) - other
    total_hours, minutes = total_minutes.divmod(60)
    hour = total_hours.divmod(24)[1]
    Clock.new(hour, minutes)
  end

  def ==(other)
    to_s == other.to_s
  end

  def to_s
    hour = format_number(@hour)
    minutes = format_number(@minutes)
    "#{hour}:#{minutes}"
  end

  def format_number(number)
    number.to_s.size == 1 ? "0#{number}" : "#{number}"
  end
end

p (Clock.at(10) + 3).to_s
