munsters_description = "The Munsters are creepy in a good way."

arr = munsters_description.split

arr.each do | word |
  word.swapcase! if arr.index(word) <= 1
  word.upcase! if arr.index(word) >= 2
end

puts munsters_description = arr.join(' ').to_s

######

munsters_description = "The Munsters are creepy in a good way."
