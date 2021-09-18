# frozen_string_literal: true

def swapcase(string)
  string.chars.map do |char|
    next char if (/[^a-zA-Z]/).match?(char)

    (/[a-z]/).match?(char) ? char.upcase : char.downcase
  end.join
end

puts swapcase('CamelCase') == 'cAMELcASE'
puts swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
