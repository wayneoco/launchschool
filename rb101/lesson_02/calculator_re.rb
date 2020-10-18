def prompt(message)
  puts "=> #{message}"
end

def valid_number?(num)
  num.to_i != 0
end

def valid_operator?(op)
  ['+', '-', '/', '*'].include?(op)
end

numbers = []

prompt('Welcome to Calculator!')
prompt('What two numbers would you like to calculate?')
answer = gets.chomp.split

answer.each do |num|
  numbers << num.to_i
end

loop do
  break if numbers.size == 2
  if numbers.size < 2
    prompt('Whoops! You didn\'t enter enough numbers.')
    prompt('Please enter two numbers')
  elsif numbers.size > 2
    prompt('Whoops! You entered too many numbers.')
    prompt('Please enter only two numbers.')
  end
  answer = gets.chomp.split
  numbers.clear
  answer.each do |num|
    numbers << num.to_i
  end
end

loop do
  break if valid_number?(numbers[0]) && valid_number?(numbers[1])
  if !valid_number?(numbers[0]) && valid_number?(numbers[1])
    prompt("Sorry, but '#{numbers[0]}' is not a valid number.")
    prompt('Please enter a valid number.')
    answer = gets.chomp
    loop do
      break if valid_number?(answer)
      prompt('That still isn\'t a valid number. Please try again.')
      answer = gets.chomp
    end
    numbers.delete_at(0)
    numbers[0] = answer.to_i
  elsif !valid_number?(numbers[1]) && valid_number?(numbers[0])
    prompt("Sorry, but '#{numbers[1]}' is not a valid number.")
    prompt('Please enter a valid number.')
    answer = gets.chomp
    loop do
      break if valid_number?(answer)
      prompt('That still isn\'t a valid number. Please try again.')
      answer = gets.chomp
    end
    numbers.delete_at(1)
    numbers[1] = answer.to_i
  elsif !valid_number?(numbers[0]) && !valid_number?(numbers[1])
    prompt('Sorry!')
    prompt("'#{number[0]}' and '#{number[1]}' are not valid numbers.")
    prompt('Please enter two valid numbers.')
    answer = gets.chomp.split
    numbers.clear
    answer.each do |num|
      numbers << num.to_i
    end
  end
end

prompt('Thanks! Now, what mathematical operator would you like to use?')
prompt('You can choose from +, -, / or *.')
operator = gets.chomp

loop do
  break if valid_operator?(operator)
  prompt('Whoops! Please enter a valid operator.')
  prompt('You can choose from +, -, / or *.')
  operator = gets.chomp
end

result =
  case operator
  when '+'
    numbers[0] + numbers[1]
  when '-'
    numbers[0] - numbers[1]
  when '/'
    numbers[0].to_f / numbers[1]
  when '*'
    numbers[0] * numbers[1]
  end

prompt("#{numbers[0]} #{operator} #{numbers[1]} = #{result}")
