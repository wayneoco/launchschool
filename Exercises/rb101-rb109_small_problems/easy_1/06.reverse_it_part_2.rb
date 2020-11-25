def reverse_words(string)
  string.split.map do |word|
    word.reverse! if word.length > 4
    word
  end.join(' ')
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS