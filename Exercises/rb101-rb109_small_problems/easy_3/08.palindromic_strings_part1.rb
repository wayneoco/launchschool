def palindrome?(string)
  string.reverse == string
end

puts palindrome?('madam') == true
puts palindrome?('Madam') == false          # (case matters)
puts palindrome?("madam i'm adam") == false # (all characters matter)
puts palindrome?('356653') == true
puts ''

# Further exploration

def palindrome_alt1?(array)
  array.reverse == array
end

puts %(### Palindrome Alt1 ###)
puts palindrome_alt1?([1, 2, 3, 2, 1]) == true
puts palindrome_alt1?([2, 3, 4, 0, 4, 3, 2]) == true
puts palindrome_alt1?([0, 1, 2, 1]) == false
puts palindrome_alt1?([123, 234, 0, 234, 123]) == true
puts ''

def palindrome_alt2?(input)
  input.reverse == input    # Trick question, as both String and Array use the #reverse method, and the method will know whether or not the parameter that is passed into the method is a String or an Array.
end

puts %(### Pallindrome Alt2 ###)
puts palindrome_alt2?('madam') == true
puts palindrome_alt2?('Madam') == false
puts palindrome_alt2?("madam i'm adam") == false
puts palindrome?('356653') == true
puts ''
puts palindrome_alt2?([1, 2, 3, 2, 1]) == true
puts palindrome_alt2?([2, 3, 4, 0, 4, 3, 2]) == true
puts palindrome_alt2?([0, 1, 2, 1]) == false
puts palindrome_alt2?([123, 234, 0, 234, 123]) == true
puts ''