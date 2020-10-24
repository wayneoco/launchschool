require 'yaml'

MESSAGE = YAML.load_file('mortgage_calculator_messages.yml')

# Method definitions
def clear_screen
  system('clear') || system('cls')
end

def prompt(text)
  puts "=> #{text}"
end

def welcome_user
  prompt(MESSAGE['welcome'])
end

def valid_number?(num)
  num.delete!(',') if num.include?(',')
  num.to_i.to_s == num
end

def above_zero?(num)
  num.to_f > 0
end

def valid_apr?(num)
  # Is the APR input an integer > 0?
  if valid_number?(num) && above_zero?(num) && num.to_f < 100
    true
  # Is the APR input a float that looks suspect (converted perhaps)?
  elsif num.to_f.to_s == num && num.to_f < 1
    low_apr(num)
  # Probably a float, correct only if valid and > 0
  else
    num.to_f.to_s == num && num.to_f > 0
  end
end

# You can test this check by entering an APR like 0.05 (wrong version of 5%)
def low_apr(num)
  loop do
    prompt(MESSAGE['low_apr'])
    prompt("Your APR is #{num}%? (Confirm Y/N)")
    response = gets.chomp.downcase
    if response == 'y' || response == 'yes'
      return num.to_f.to_s == num && num.to_f > 0
    elsif response == 'n' || response == 'no'
      return false
    else
      prompt(MESSAGE['invalid_response'])
    end
  end
end

def get_principal
  loop do
    prompt(MESSAGE['get_loan_amount'])
    principal = gets.chomp
    if valid_number?(principal) && above_zero?(principal)
      return principal.to_i
    else
      prompt(MESSAGE['invalid_loan'])
    end
  end
end

def get_apr
  loop do
    prompt(MESSAGE['get_apr'])
    apr = gets.chomp
    if valid_apr?(apr)
      return (apr.to_f) / 100
    else
      prompt(MESSAGE['invalid_apr'])
    end
  end
end

def get_years
  loop do
    prompt(MESSAGE['get_years'])
    years = gets.chomp
    if valid_number?(years) && years.to_i < 99 && years.to_i >= 0
      return years.to_i
    else
      prompt(MESSAGE['invalid_years'])
    end
  end
end

def get_months
  loop do
    prompt(MESSAGE['get_months'])
    months = gets.chomp
    if valid_number?(months) && months.to_i < 13 && months.to_i >= 0
      return months.to_i
    else
      prompt(MESSAGE['invalid_months'])
    end
  end
end

def calculate_loan_months(loan_years, loan_months)
  (loan_years * 12) + loan_months
end

def get_duration
  prompt(MESSAGE['get_duration'])
  loop do
    loan_years = get_years
    loan_months = get_months

    if loan_years + loan_months > 0
      return calculate_loan_months(loan_years, loan_months)
    else
      prompt(MESSAGE['invalid_loan_duration'])
    end
  end
end

def calculate_payment(loan_amount, apr, loan_months)
  monthly_rate = apr / 12

  loan_amount * (monthly_rate / (1 - (1 + monthly_rate)**(-loan_months)))
end

def display_result(result)
  prompt(format("Your monthly payment is $%.2f", result))
end

def calculate_again?
  loop do
    prompt(MESSAGE['again?'])
    response = gets.chomp.downcase
    if response == 'y' || response == 'yes'
      break true
    elsif response == 'n' || response == 'no'
      break false
    else
      prompt(MESSAGE['invalid_response'])
    end
  end
end

# ---PROGRAM START--- #

clear_screen

welcome_user

loop do
  loan_amount = get_principal
  apr = get_apr
  loan_months = get_duration

  monthly_payment = calculate_payment(loan_amount, apr, loan_months)

  display_result(monthly_payment)

  break unless calculate_again?

  clear_screen
end

clear_screen

return prompt(MESSAGE['goodbye'])
