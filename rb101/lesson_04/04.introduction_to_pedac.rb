# PROBLEM:

# Given a string, write a method `palindrome_substrings` which returns
# all the substrings from a given string which are palindromes. Consider
# palindrome words case sensitive.

# Test cases:

# palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
# palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
# palindrome_substrings("palindrome") == []
# palindrome_substrings("") == []

# INPUT
# - string

# Output
# - string, array (i.e., an array of strings)

# Rules
# - Explicit
#    - input is a single string
#    - return every palindrome from the given string
#    - palindrome is case sensitive
#  - Implicit
#    - method returns an array
#    - no input returns an empty array

# Questions
#  - does the input string contain only alpha characters?
#  - can the input string contain numeric or whitespace characters?
#  - if the entire input string is itself a palindrome, should the same string object be returned or a new string object?

# Algorithm:
#  - initialize a result variable to an empty array
#  - create an array named substring_arr that contains all of the
#    substrings of the input string that are at least 2 characters long.
#  - loop through the words in the substring_arr array.
#  - if the word is a palindrome, append it to the result
#    array
#  - return the result array

# Collect all possible substrings:
#  - minimum substring length = 2
#  - substring consists of consecutive characters only
#  - loop through each character, gathering every substring of 2+ characters from left to right
#    - need a counter in order to reference index placement

def palindrome_substrings(str)
  result = []
  sub_strings = get_substrings(str)
  sub_strings.each do |substring|
    result << substring if palindrome?(substring)
  end
  result
end

def get_substrings(str)
  substrings = []
  return substrings if str == ''
  count = 0
  loop do
    sub_count = 1
    ((str.size - count) - 1).times do
      substrings << str[count..(count + sub_count)]
      sub_count += 1
    end
    count += 1
    break if count == str.size
  end
  substrings
end

def palindrome?(str)
  str.reverse == str
end

puts palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
puts palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
puts palindrome_substrings("palindrome") == []
puts palindrome_substrings("dad a dad") == ["dad", "dad a dad", "ad a da", "d a d", " a ", "dad"]
puts palindrome_substrings("") == []