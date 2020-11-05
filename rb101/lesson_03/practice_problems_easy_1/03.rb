advice = "Few things in life are as important as house training your pet dinosaur."

def sub(sentence, pattern, new_word)
  sentence.gsub(pattern, new_word)
end

puts sub(advice, 'important', 'urgent')