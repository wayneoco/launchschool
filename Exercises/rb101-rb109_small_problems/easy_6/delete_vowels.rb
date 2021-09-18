# frozen_string_literal: true

def remove_vowels(array)
  array.map { |string| string.delete('aeiouAEIOU') }
end

puts remove_vowels(%w(abcdefghijklmnopqrstuvwxyz))  == %w(bcdfghjklmnpqrstvwxyz)
puts remove_vowels(%w(green YELLOW black white))    == %w(grn YLLW blck wht)
puts remove_vowels(%w(ABC AEIOU XYZ))               == ['BC', '', 'XYZ']
