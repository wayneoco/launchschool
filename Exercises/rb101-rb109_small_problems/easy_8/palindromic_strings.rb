

def leading_substrings(string)
  arr = []
  0.upto(string.size - 1) do |num|
    arr << string[0..num]
  end
  arr
end

def substrings(string)
  arr = []
  count = 0
  loop do
    arr.concat(leading_substrings(string[count..(string.size - 1)]))
    break if count == string.size - 1

    count += 1
  end
  arr
end

def palindromes(string)
  string.delete!("^a-zA-Z0-9")
  string.downcase!
  substrings(string).select do |substring|
    substring.size > 1 && substring == substring.reverse
  end
end

p palindromes('abcd') #== []
p palindromes('madam') #== ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') #== [
#  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
#  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
#  '-madam-', 'madam', 'ada', 'oo'
#]
p palindromes('knitting cassettes') #== [
#  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
#]
