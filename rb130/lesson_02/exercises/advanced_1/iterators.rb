factorials = Enumerator.new do |yielder|
  num = 0
  accumulator = 1
  loop do
    accumulator = num.zero? ? 1 : accumulator * num
    yielder << accumulator
    num += 1
  end
end

6.times { |number| puts "#{number}! == #{factorials.next}" }
puts "=========================="
6.times { |number| puts "#{number}! == #{factorials.next}" }
puts "=========================="
factorials.rewind
6.times { |number| puts "#{number}! == #{factorials.next}" }
puts "=========================="
factorials.rewind

factorials.each_with_index do |value, number|
  puts "#{number}! == #{value}"
  break if number >= 10
end
