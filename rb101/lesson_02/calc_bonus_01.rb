def prompt(message)
  puts "=> #{message}"
end

def valid_number?(num)
  num.match?(/\d+/)
end

def valid_operator?(op)
  ['+', '-', '/', '*'].include?(op)
end

numbers = []

prompt('Welcome to Calculator!')
prompt('This calculator performs operations on two numbers.')
prompt('Please enter your first integer.')
num01 = gets.chomp

loop do
  break if valid_number?(num01)
  prompt("Whoops! '#{num01}' is not a valid number.")
  prompt('Please enter your first integer again.')
  num01 = gets.chomp
end

numbers << num01.to_i

prompt('Please enter a mathematical operator.')
prompt('You can choose from +, -, / or *.')
operator = gets.chomp

loop do
  break if valid_operator?(operator)
  prompt("Whoops! '#{operator}'' is not a valid operator.")
  prompt('Please enter a valid operator again.')
  prompt('You can choose from +, -, / or *.')
  operator = gets.chomp
end

prompt('Please enter your second integer.')
num02 = gets.chomp

loop do
  break if valid_number?(num02)
  prompt("Whoops! '#{num02}' is not a valid number.")
  prompt('Please enter your second integer again.')
  num02 = gets.chomp
end

numbers << num02.to_i

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
