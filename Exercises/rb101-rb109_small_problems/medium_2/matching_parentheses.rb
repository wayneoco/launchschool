=begin

# Problem
- input: string
- output: boolean
-rules:
  - input string may contain both alphabetic and non-alphabetic characters
  - balanced parentheses = a matching pair... (), not )(.
  - Conditions for returning true:
    - string is empty
    - string size is even
    - string[0] = '(' & string[-1] = ')', etc.

# Algorithm
Approach:
  - delete all characters that are neither '(' nor ')'
  - match the remaining string against the qualifying pattern

1. Write a method that takes a string `string` as an argument.
2. Call `delete_if` method on `string` with parameter `char`.
  2.1. `char` is not equal to `'('`, nor `')'`.
3. Using a regex match, return true if string has one or more matching patterns
  3.1 Matching pattern is '()'.

=end

def balanced?(string)
  parens = 0
  string.each_char do |char|
    parens += 1 if char == '('
    parens -= 1 if char == ')'
    break if parens.negative?
  end
  parens.zero?
end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false
