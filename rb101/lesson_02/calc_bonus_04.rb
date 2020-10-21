require 'yaml'
MESSAGES = YAML.load_file('calc_config.yml')

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

prompt(MESSAGES['welcome'])

prompt(MESSAGES['name'])
name = gets.chomp

if name.empty?
  prompt(['no_name'])
else
  prompt("Hi, #{name}!")
end

prompt(MESSAGES['intro'])

loop do # main loop
  prompt(MESSAGES['num01'])
  num01 = gets.chomp

  loop do
    break if valid_number?(num01)
    prompt(MESSAGES['num01_error'])
    num01 = gets.chomp!
  end
  
  prompt(MESSAGES['operator_prompt'])
  operator = gets.chomp

  loop do
    break if ['1', '2', '3', '4'].include?(operator)
    prompt(MESSAGES['operator_error'])
    prompt(MESSAGES['operator_prompt'])
    operator = gets.chomp!
  end

  prompt(MESSAGES['num02'])
  num02 = gets.chomp
  
  loop do
    break if valid_number?(num02)
    prompt(MESSAGES['num02_error'])
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
  
  prompt(MESSAGES['result'])
  prompt(MESSAGES['repeat'])
  answer = gets.chomp.downcase
  break unless answer.start_with?('y')
end

prompt(MESSAGES['bye'])
