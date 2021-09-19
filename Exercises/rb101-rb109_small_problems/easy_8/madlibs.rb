# frozen_string_literal: true

def prompt(message)
  puts "=> #{message}"
end

prompt 'Enter a noun:'
noun = gets.chomp

prompt 'Enter a verb:'
verb = gets.chomp

prompt 'Enter an adjective:'
adjective = gets.chomp

prompt 'Enter an adverb:'
adverb = gets.chomp

prompt "Today you will #{verb} a #{adjective} #{noun} #{adverb}."
