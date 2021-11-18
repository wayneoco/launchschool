title = "the flintstones rock"

title.each_char do |char|
  puts char.object_id
end

puts "====="
puts "ROUND 2"
puts "====="

title.each_char do |char|
  puts char.object_id
end
