# frozen_string_literal: true

require 'pry'

puts '### Practice Problem 1 ###'
print "\n"

arr = ['10', '11', '9', '7', '8']

puts arr.sort { |a, b| b.to_i <=> a.to_i } == ['11', '10', '9', '8', '7']
print "\n"

puts '### Practice Problem 2 ###'
print "\n"

def sort_books(list)
  list.sort_by do |hash|
    hash[:published].to_i
  end
end

books = [
  { title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967' },
  { title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925' },
  { title: 'War and Peace', author: 'Leo Tolstoy', published: '1869' },
  { title: 'Ulysses', author: 'James Joyce', published: '1922' }
]

books_sorted = [
  { :title=>"War and Peace", :author=>"Leo Tolstoy", :published=>"1869" },
  { :title=>"Ulysses", :author=>"James Joyce", :published=>"1922" },
  { :title=>"The Great Gatsby", :author=>"F. Scott Fitzgerald", :published=>"1925" },
  { :title=>"One Hundred Years of Solitude", :author=>"Gabriel Garcia Marquez", :published=>"1967" }
]

puts sort_books(books) == books_sorted
print "\n"

puts '### Practice Problem 3 ###'
print "\n"

arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]
puts arr1[2][1][3] == 'g'

arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]
puts arr2[1][:third][0] == 'g'

arr3 = [['abc'], ['def'], {third: ['ghi']}]
puts arr3[2][:third][0][0] == 'g'

hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}
puts hsh1['b'][1] == 'g'

hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}
puts hsh2[:third].key(0) == 'g'
print "\n"

puts '### Practice Problem 4 ###'
print "\n"

arr1 = [1, [2, 3], 4]
arr1[1][1] = 4
puts arr1[1][1] == 4

arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]
arr2[-1] = 4
puts arr2[-1] == 4

hsh1 = {first: [1, 2, [3]]}
hsh1[:first][2][0] = 4
puts hsh1[:first][2][0] == 4

hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}
hsh2[['a']][:a][2] = 4
puts hsh2[['a']][:a][2] == 4
print "\n"

puts '### Practice Problem 5 ###'
print "\n"

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

ages = []

munsters.each do |_, details|
  ages << details['age'] if details['gender'] == 'male'
end

puts ages.sum
print "\n"

puts '### Practice Problem 6'
print "\n"

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each_pair do |name, details|
  puts "#{name} is a #{details['age']}-year-old #{details['gender']}."
end
print "\n"

puts '### Practice Problem 7 ###'
print "\n"

a = 2
b = [5, 8]
arr = [a, b]      # => arr = [2, [5, 8]]

arr[0] += 2       # => arr = [4, [5, 8]]
arr[1][0] -= a    # => arr = [4, [1, 8]]

puts a == 2
puts b == [3, 8]
print "\n"

puts '### Practice Problem 8 ###'
print "\n"

hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

hsh.each_value do |strings|
  strings.each do |string|
    string.chars.each { |char| puts char if (/[aeiou]/).match?(char) }
  end
end
print "\n"

puts '### Practice Problem 9 ###'
print "\n"

arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

new_arr = arr.map do |sub_arr|
  sub_arr.sort do |a, b|
    b <=> a
  end
end

puts new_arr == [['c', 'b', 'a'], [3, 2, 1], ['green', 'blue', 'black']]
print "\n"

puts '### Practice Problem 10 ###'
print "\n"

arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

new_arr = arr.map do |hash|
  incremented_hash = {}
  hash.each do |k, v|
    incremented_hash[k] = v + 1
  end
  incremented_hash
end

puts new_arr == [{a: 2}, {b: 3, c: 4}, {d: 5, e: 6, f: 7}]
print "\n"

puts '### Practice Problem 11 ###'
print "\n"

arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

new_arr = arr.map do |sub_arr|
  sub_arr.select do |num|
    num % 3 == 0
  end
end

puts new_arr == [[], [3], [9], [15]]
print "\n"

puts '### Practice Problem 12 ###'
print "\n"

arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]

hsh = {}
arr.each do |sub_arr|
  hsh[sub_arr[0]] = sub_arr[1]
end

puts hsh == {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}
print "\n"

puts '### Practice Problem 13 ###'
print "\n"

arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]

new_arr = arr.sort_by do |sub_arr|
  sub_arr.map { |num| num.even? ? num = 0 : num }
end

puts new_arr == [[1, 8, 3], [1, 6, 7], [1, 4, 9]]
print "\n"

puts '### Practice Problem 14 ###'
print "\n"

hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

arr = []
hsh.each_value do |details|
  if details[:type] == 'fruit'
    arr << details[:colors].map { |color| color.capitalize }
  elsif details[:type] == 'vegetable'
    arr << details[:size].upcase
  end
end

puts arr == [["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]
print "\n"

puts '### Practice Problem 15 ###'
print "\n"

arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

new_arr = arr.select do |hash|
  hash.values.flatten.all? { |num| num.even? }
end

puts new_arr == [{e: [8], f: [6, 10]}]
