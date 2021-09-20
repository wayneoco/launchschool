def uppercase?(string)
  string.chars.all? do |char|
    (/[A-Z]/).match?(char) || (/[^a-zA-Z]/).match?(char)
  end
end

puts uppercase?('t') == false
puts uppercase?('T') == true
puts uppercase?('Four Score') == false
puts uppercase?('FOUR SCORE') == true
puts uppercase?('4SCORE!') == true
puts uppercase?('') == true
