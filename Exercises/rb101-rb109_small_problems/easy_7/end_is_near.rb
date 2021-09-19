# frozen_string_literal: true

def penultimate(string)
  string.split[-2]
end

puts penultimate('last word') == 'last'
puts penultimate('Launch School is great!') == 'is'

def middle(string)
  return nil if string.split.size < 3 || string.split.size.even?
  middle = string.split.size / 2.0
  string.split[middle]
end

puts middle('last word') == nil
puts middle('Launch School is really great!') == 'is'
puts middle('') == nil
