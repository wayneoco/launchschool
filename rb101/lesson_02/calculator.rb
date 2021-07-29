# frozen_string_literal: false

require 'yaml'
MESSAGES = YAML.load_file('calc_config.yml')

puts MESSAGES.inspect

def prompt(message)
  puts("=> #{message}")
end

def valid_number?(num)
  num.to_i.to_s == num || num.to_f.to_s == num
end

def operation_to_message(op)
  var = case op
        when '+'
          'Adding'
        when '-'
          'Subtracting'
        when '*'
          'Multiplying'
        when '/'
          'Dividing'
        end
  puts var
  var
end

prompt("Welcome to Calculator! Please enter your first name:")

name = ''
loop do
  name = gets.chomp
  if name.empty?()
    prompt("Please be sure to enter a valid name.")
  else
    break
  end
end

loop do
  number1 = ''
  loop do
    prompt("What's the first number?")
    number1 = gets.chomp
    if valid_number?(number1)
      break
    else
      prompt("Hmmm.... that doesn't look like a valid number.")
    end
  end

  number2 = ''
  loop do
    prompt("What's the second number?")
    number2 = gets.chomp
    if valid_number?(number2)
      break
    else
      prompt("Hmmm... that doesn't look like a valid number.")
    end
  end

  operator_prompt = <<-MSG
    What mathematical operation would you like to perform?
    + (add)
    - (subtract)
    * (multiply)
    / (divide)
  MSG

  prompt(operator_prompt)

  operator = ''
  loop do
    operator = gets.chomp

    if %w(+ - * /).include?(operator)
      break
    else
      prompt("Sorry, but you must choose +, -, * or /.")
    end
  end

  prompt("#{operation_to_message(operator)} the two numbers...")

  sleep 1

  result =
    case operator
    when '+'
      number1.to_f + number2.to_f
    when '-'
      number1.to_f - number2.to_f
    when '*'
      number1.to_f * number2.to_f
    when '/'
      number1.to_f / number2.to_f
    end

  prompt("#{number1} #{operator} #{number2} = #{result}")

  prompt("Would you like to perform another calculation? [y/n]")
  answer = gets.chomp

  break unless answer.start_with?('y')
end

prompt("Thank you for using Calculator!")
