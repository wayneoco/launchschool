def double_consonants(string)
  new_str = ''
  string.each_char do |char|
    (/[^aeiouAEIOU\s\d\W]/).match?(char) ? new_str << char * 2 : new_str << char
  end
  new_str
end

puts double_consonants('String') == "SSttrrinngg"
puts double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
puts double_consonants("July 4th") == "JJullyy 4tthh"
puts double_consonants('') == ""
