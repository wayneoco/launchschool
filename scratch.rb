#def substring_test(str1, str2)
#  str1_chars = str1.downcase.chars
#  str2_chars = str2.downcase.chars
#  str1_chars.each_with_index do |char1, index1|
#    str2_chars.each_with_index do |char2, index2|
#      return true if char1 == char2 && str1_chars[index1 + 1] == str2_chars[index2 + 1] && index1 != str1_chars.size - 1
#    end
#  end
#  false
#end
#
#p substring_test('Something', 'Fun') == false
#p substring_test('Something', 'Home') == true
#p substring_test('Something', '') == false
#p substring_test('', 'Something') == false
#p substring_test('BANANA', 'banana') == true
#p  substring_test('test', 'lllt') == false
#p substring_test('', '') == false
#p substring_test('1234567', '541265') == true
#p substring_test('supcalifragilisticexpialidocious', 'SoundOfItIsAtrociou') == true

#def scramble(str1, str2)
#  str2.each_char do |char2|
#    return false if str2.count(char2) > str1.count(char2)
#  end
#  true
#end
#
#p scramble('javaass', 'jjss') == false
#p scramble('rkqodlw', 'world') == true
#p scramble('cedewaraaossoqqyt', 'codewars') == true
#p scramble('katas', 'steak') == false
#p scramble('scriptjava', 'javascript') == true
#p scramble('scriptingjava', 'javascript') == true

# def longest_palindrome(str)
#   palindrome_lengths = 0
#   str.chars.each_index do |index|
#     index.upto(str.size - 1) do |end_index|
#       substring = str[index..end_index]
#       if substring == substring.reverse &&
#          substring.size > palindrome_lengths
#         palindrome_lengths = substring.size
#       end
#     end
#   end
#   palindrome_lengths
# end
#
# p longest_palindrome('') == 0
# p longest_palindrome('a') == 1
# p longest_palindrome('aa') == 2
# p longest_palindrome('baa') == 2
# p longest_palindrome('aab') == 2
# p longest_palindrome('baabcd') == 4
# p longest_palindrome('I like racecars that go fast') == 7
# p longest_palindrome('baablkj12345432133d') == 9

def solution(number)
  numbers = (0..number).to_a
  selects = numbers.select do |n|
    n % 3 == 0 || n % 5 == 0
  end
  selects
end

p solution(10)
