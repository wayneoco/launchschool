=begin
Given a string, produce a new string with every other word removed."

P 

input: string
output: new string

requirements (explicit): 
    - produce a new string from the original string
    - new string is comprised only of every other word from the original string

requirements (implicit):
    - original string is comprised of two or more words
    - new string must be a minimum of one word

questions:
    - do we keep punctuation?

E 

Input: "Today is a great day"
Output: "Today a day"

D 

Array

A 

Given a string:
    - assign variable str
    - split the string into an Array
    - assign variable count = 1

=end

string = "Today is Wednesday, but tomorrow is Thursday"

def every_other(string)
    arr = []
    split_str = string.split
    split_str.each do |word|
        arr << word if split_str.index(word).even?
    end
    arr.join(" ").to_s
end

puts every_other(string)
