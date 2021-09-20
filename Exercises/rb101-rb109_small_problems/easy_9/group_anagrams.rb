# frozen_string_literal.rb

require 'pry'

words = %w[demo none tied evil dome mode live fowl veil wolf diet vile edit tide flow neon]

def anagrams(words)
  result = {}

  words.each do |word|
    key = word.split('').sort.join
    if result.key?(key)
      result[key].push(word)
    else
      result[key] = [word]
    end
  end
  binding.pry

  result.each_value do |v|
    puts '-----'
    p v
  end
end

anagrams(words)
