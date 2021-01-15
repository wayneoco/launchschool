def ascii_value(string)
  values = []
  string.split('').each do |char|
    values << char.ord
  end
  values.sum
end

puts ascii_value('Four score') == 984
puts ascii_value('Launch School') == 1251
puts ascii_value('a') == 97
puts ascii_value('') == 0
puts ''

puts "### LS Solution ###"
puts ''

def ascii_valueLS(string)
  sum = 0
  string.each_char { |char| sum += char.ord }
  sum
end

puts ascii_value('Four score') == 984
puts ascii_value('Launch School') == 1251
puts ascii_value('a') == 97
puts ascii_value('') == 0