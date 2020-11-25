def add_ordinal(cent)
  case cent
  when /(^\d*[0]$|^\d*[4-9]$|^\d*[1][1-3]$)/
    'th'
  when /^\d*[1]$/
    'st'
  when /^\d*[2]$/
    'nd'
  when /^\d*[3]$/
    'rd'
  else
    'no match'
  end
end

def century(year)
  year = year.to_s
  if year.end_with?('00')
    cent = (year.slice(0, year.size - 2))
  else
    cent = (((year.slice(0, year.size - 2)).to_i) + 1).to_s
  end
  cent.to_s + add_ordinal(cent)
end

puts century(2000) == '20th'
puts century(2001) == '21st'
puts century(1965) == '20th'
puts century(256) == '3rd'
puts century(5) == '1st'
puts century(10103) == '102nd'
puts century(1052) == '11th'
puts century(1127) == '12th'
puts century(11201) == '113th'

# LS answer

def century(year)
  century = year / 100 + 1
  century -= 1 if year % 100 == 0
  century.to_s + century_suffix(century)
end

def century_suffix(century)
  return 'th' if [11, 12, 13].include?(century % 100)
  last_digit = century % 10

  case last_digit
  when 1 then 'st'
  when 2 then 'nd'
  when 3 then 'rd'
  else 'th'
  end
end

puts century(2000) == '20th'
puts century(2001) == '21st'
puts century(1965) == '20th'
puts century(256) == '3rd'
puts century(5) == '1st'
puts century(10103) == '102nd'
puts century(1052) == '11th'
puts century(1127) == '12th'
puts century(11201) == '113th'