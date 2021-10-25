=begin
# Problem
- input: string
- output: hash
- rules:
  - input can contain lowercase and uppercase letters, spaces, numbers, non-letter characters
  - spaces count as 'neither'
  - output is a hash with three keys:
    - lowercase percentage
    - uppercase percentage
    - neither percentage
  - output values are floats

# Algorithm
- Initialize a local variable `results` as a hash with default value 0
- Split input string into an array of characters with parameter `char` and iterate over the characters:
  - results[:lowercase] += 1 if `char` is lowercase
  - results[:uppercase] += 1 if `char` is uppercase
  - results[:neither] += 1 if `char` is neither
- Convert values to percentages
- Return `results`

=end

def letter_percentages(string)
  results = {}
  characters = string.chars

  results[:lowercase] = characters.count { |char| char =~ /[a-z]/ }
  results[:uppercase] = characters.count { |char| char =~ /[A-Z]/ }
  results[:neither] = characters.count { |char| char =~ /[^a-zA-Z]/ }

  results[:lowercase] = ((results[:lowercase] / string.size.to_f) * 100).round(2)
  results[:uppercase] = ((results[:uppercase] / string.size.to_f) * 100).round(2)
  results[:neither] = ((results[:neither] / string.size.to_f) * 100).round(2)

  results
end

p letter_percentages('abCdef 123') #== { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
p letter_percentages('AbCd +Ef') #== { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
p letter_percentages('123') #== { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }
p letter_percentages('abcdefGHI')
