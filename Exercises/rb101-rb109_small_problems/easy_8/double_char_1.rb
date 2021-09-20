def repeater(string)
  new_str = ''
  string.each_char { |char| new_str << char * 2 }
  new_str
end

puts repeater('Hello') == "HHeelllloo"
puts repeater("Good job!") == "GGoooodd  jjoobb!!"
puts repeater('') == ''
