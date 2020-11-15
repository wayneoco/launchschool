=begin
### THE PROBLEM
- Consider a character set consisting of letters, a space, and a point.
- Words consist of one or more, but not more than 20, letters.
- An input text consists of one or more words separated from each other
by one or more spaces and terminated by 0 or more spaces followed by a point.
- Input should be read from, and including, the first letter of the first word,
up to and including the terminating point.
- The output text is to be produced such that successive words are separated
by a single space with the last word being terminated by a single point.
- Odd words are copied in reverse order while even words are merely echoed.

### INPUT/OUTPUT
- Input: string
- Output: string

### RULES
- Words
  - A word is between 1 - 20 letters
  - A word can be separated by one or more spaces
- String
  - A string consists only of: letters, spaces and a single terminating point
  - A string consists of at least 1 word
- Output String
  - Successive words are separated only by a single point
  - Final word is followed by a single terminating point, with no space in
  between.
  - Odd words are reversed
  - Even words stay the same

### ALGORITHM
- Take a string as input
- Delete the terminating point from the string
- Split the string into an array
- Take the array, reverse the odd-indexed strings and return the new or modified
string
- Join the string elements of the array into a string using a single space as a
delimiter.
- Append a single terminating point to the end of the new string.
=end

=begin
def reverse_odd_words(string)
  arr = string.delete('.').split(' ')
  arr.map do |word|
    if arr.index(word).odd?
      word.reverse
    else
      word
    end
  end.join(' ') << '.'
end
=end

def reverse_odd_words(string)
  arr = string.delete('.').split(' ')
  arr.each_index do |index|
    arr[index] = arr.fetch(index).reverse if index.odd?
  end.join(' ') << ('.')
end

puts reverse_odd_words("hello.") == "hello."
puts reverse_odd_words("hello .") == "hello."
puts reverse_odd_words("hello world.") == "hello dlrow."
puts reverse_odd_words("hello world .") == "hello dlrow."
puts reverse_odd_words("hello  world  .") == "hello dlrow."
puts reverse_odd_words("hello  hello world.") == "hello olleh world."
