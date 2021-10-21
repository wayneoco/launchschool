# frozen_string_literal: false

=begin

# Problem

Rules
-explicit:
  - string as input
  - return string with same values except:
    - word numbers replaced with digits as strings
-implicit:
  - maintain spaces between converted digits
  - no dashes between digits

# Data Structures
- input: string
- code: array for numerical values
- output: string

# Algorithm
Given a string STRING as input:
- initialize constant NUMBERS to array of word numbers
- define WORD_TO_DIGIT method
  - split STRING into an array of words
  - iterate over array of words using #each
    - if NUMBERS includes word, substitute numerical value for word
  - return array with substitutions
  - convert array to string

=end

require 'pry'

NUMBERS = %w[zero one two three four five six seven eight nine].freeze

def find_phone_number(string)
  phone = string[/(\d\s){9}\d/]
  format('(%d%d%d) %d%d%d-%d%d%d%d', phone[0], phone[1], phone[2], phone[3], phone[4], phone[5], phone[6], phone[7], phone[8], phone[9])
end

def replace_phone_number(string, phone_number)
  string.gsub!(/(\d\s){9}\d/, phone_number)
end

def replace_numbers(string)
  NUMBERS.each do |number|
    string.gsub!(/\b#{number}\b/, NUMBERS.index(number).to_s)
  end
end

def word_to_digit(string)
  string = replace_numbers(string)
  phone_number = find_phone_number(string)
  string = replace_phone_number(string, phone_number) unless phone_number.empty?
  string
end

p word_to_digit('Please call me at five zero three five five five one two three four. Thanks.') #== 'Please call me at 5 5 5 1 2 3 4. Thanks.'
