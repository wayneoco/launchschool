def prompt(message)
  puts "=> #{message}"
end

def valid_number?(num)
  integer?(num) || float?(num)
end

def integer?(input)
  input.match?(/^\-?\d+$/)
end

def float?(input)
  input.match?(/\d/) &&
  input.match?(/^\-?\d*\.?\d*$/)
end

def operation_to_message(op)
  case op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Dividing'
  when '4'
    'Multiplying'
  end
end

num01 = nil
num02 = nil

prompt('Welcome to Calculator!')
prompt('What\'s your name?')
name = gets.chomp

if name.empty?
  prompt("Since you didn't enter a name, we'll just call you 'Bob'.")
  prompt('Hi, Bob!')
else
  prompt("Hi, #{name}!")
end

prompt('This calculator performs operations on two numbers.')

loop do # main loop
  prompt('Please enter your first integer.')
  num01 = gets.chomp

  loop do
    break if valid_number?(num01)
    prompt("Whoops! '#{num01}' is not a valid number.")
    prompt('Please enter your first integer again.')
    num01 = gets.chomp!
  end
  
  operator_prompt = <<-MSG
    Please choose a mathemathical operator.
    To add, enter '1'.
    To subtract, enter '2'.
    To divide, enter '3'.
    To multiply, enter '4'.
  MSG

  prompt("#{operator_prompt}")
  operator = gets.chomp

  loop do
    break if ['1', '2', '3', '4'].include?(operator)
    prompt("Whoops! '#{operator}' is not a valid choice.")
    prompt("#{operator_prompt}")
    operator = gets.chomp!
  end

  prompt('Please enter your second integer.')
  num02 = gets.chomp
  
  loop do
    break if valid_number?(num02)
    prompt("Whoops! '#{num02}' is not a valid number.")
    prompt('Please enter your second integer again.')
    num02 = gets.chomp!
  end
  
  num01 = num01.to_f
  num02 = num02.to_f
  
  result =
    case operator
    when '1'
      num01 + num02
    when '2'
      num01 - num02
    when '3'
      num01 / num02
    when '4'
      num01 * num02
    end
  
  prompt("#{operation_to_message(operator)}...")
  
  prompt("The result is #{result.round(2)}")
  prompt('Would you like to use Calculator again? (y/n)')
  answer = gets.chomp.downcase
  break unless answer.start_with?('y')
end

prompt('Thank you for using Calculator. Good-bye!')
