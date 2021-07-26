MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

def after_midnight(time)
  return 0 if time == '24:00'
  hours, minutes = time.split(':')
  hours = hours.to_i * MINUTES_PER_HOUR
  hours + minutes.to_i
end

def before_midnight(time)
  return 0 if time == '24:00' || time == '00:00'
  hours, minutes = time.split(':')
  hours = (23 - hours.to_i) * MINUTES_PER_HOUR
  minutes = 60 - minutes.to_i
  hours + minutes
end

puts after_midnight('00:00') == 0
puts before_midnight('00:00') == 0
puts after_midnight('12:34') == 754
puts before_midnight('12:34') == 686
puts after_midnight('24:00') == 0
puts before_midnight('24:00') == 0
puts

### LS Solution ###

def after_midnightLS(time_str)
  hours, minutes = time.str.split(':').map(&:to_i)
  (hours * MINUTES_PER_HOUR + minutes) % MINUTES_PER_DAY
end

def before_midnightLS(time_str)
  delta_minutes = MINUTES_PER_DAY - after_midnight(time_str)
  delta_minutes = 0 if delta_minutes == MINUTES_PER_DAY
  delta_minutes
end

puts after_midnight('00:00') == 0
puts before_midnight('00:00') == 0
puts after_midnight('12:34') == 754
puts before_midnight('12:34') == 686
puts after_midnight('24:00') == 0
puts before_midnight('24:00') == 0