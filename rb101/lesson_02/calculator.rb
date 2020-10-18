# frozen_string_literal: false

puts 'What two numbers would you like to calculate?'
numbers = gets.chomp.split

puts 'Thanks! Now, what mathematical operator would you like to use? You can choose from +, -, / or *.'
operator = gets.chomp

result =
  if operator == '+'
    numbers[0].to_i + numbers[1].to_i
  elsif operator == '-'
    numbers[0].to_i - numbers[1].to_i
  elsif operator == '/'
    numbers[0].to_f / numbers[1].to_i
  else
    numbers[0].to_i * numbers[1].to_i
  end

puts "#{numbers[0]} #{operator} #{numbers[1]} = #{result}"
