statement = "The Flintstones Rock"

char_count = Hash.new(0)
letters = statement.scan(/[a-zA-Z]/)
letters.each { |letter| char_count[letter] += 1 }

puts char_count