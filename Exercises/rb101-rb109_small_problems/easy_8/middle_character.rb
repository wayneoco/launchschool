# frozen_string_literal: true

def center_of(string)
  middle = string.size / 2
  string.size.odd? ? string[middle] : string[middle - 1, 2]
end

puts center_of('I love ruby')   == 'e'
puts center_of('Launch School') == ' '
puts center_of('Launch')        == 'un'
puts center_of('Launchschool')  == 'hs'
puts center_of('x')             == 'x'
