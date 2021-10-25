=begin
Problem
Input: string
Output: string + integer
Rules:
- explicit:
  - sentences-ending characters = periods, exclamation points or question marks
  - word = any sequence of characters that are not spaces or sentence-ending characters
  - non-letter sequences of characters (that are not sentence-ending) count as a word
  - number of words determines longest sentence

Algorithm
Approach:
  - Split text into an array of strings.
  - Call `max_by` method on array to find the array with the most words

1. Write a method that takes a string as an argument.
2. Initialize a local variable `sentences` to the return value of calling `split`
  on the input string, where each substring is a single sentence from the text.
3. Iterate over `sentences`, creating an array of words.

=end

sentences = File.read('gutenberg.txt').split(/\.|\?|!/)
largest_sentence = sentences.max_by { |sentence| sentence.split.size }
largest_sentence = largest_sentence.strip
number_of_words = largest_sentence.split.size

puts "#{largest_sentence}"
puts "#{number_of_words}"

