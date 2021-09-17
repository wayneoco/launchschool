# frozen_string_literal: true

=begin

# Problem

input: float
output: string

Rules:
-Explicit:
  - floating point input represents an angle between 0 and 360 degrees
  - output is a string that represents the angle in degrees, minutes and seconds
  - a degree has 60 minutes
  - a minute has 60 seconds

=end

DEGREE = "\xC2\xB0"

def convert(input)
  (input.divmod(1)[1] * 60).round(2)
end

def dms(angle)
  angle.negative? || angle > 360 ? degree = angle.modulo(360) : degree = angle
  minute = convert(degree)
  second = convert(minute)
  format(%(#{degree.truncate}#{DEGREE}%02d'%02d"), minute, second)
end

puts dms(30)        == %(30°00'00")
puts dms(76.73)     == %(76°43'48")
puts dms(254.6)     == %(254°36'00")
puts dms(93.034773) == %(93°02'05")
puts dms(0)         == %(0°00'00")
puts dms(360)       == %(360°00'00") || dms(360) == %(0°00'00")
puts dms(400) == %(40°00'00")
puts dms(-40) == %(320°00'00")
puts dms(-420) == %(300°00'00")
