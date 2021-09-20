# frozen_string_literal: true

require 'pry'

def fizzbuzz(first, last)
  first.upto(last) do |num|
    if (num % 3).zero? && (num % 5).zero?
      p 'FizzBuzz'
    elsif (num % 3).zero?
      p 'Fizz'
    elsif (num % 5).zero?
      p 'Buzz'
    else
      p num
    end
  end
end

fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz
