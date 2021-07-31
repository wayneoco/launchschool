=begin

# Problem
- code a mortgage calculator
- three pieces of information are needed:
  - loan amount
  - APR
  - loan duration
- we could even say 5 pieces of information are needed:
  - purchase price
  - down payment
  - loan amount (purchase price - down payment)
  - APR
  - loan duration
- additionally, the following 3 things must be calculated:
  - monthly interest rate
  - loan duration in months
  - monthly payment

- Mortgage formula
  monthly mortgage payment = loan amount * (monthly interest rate / (1 - (1 + monthly interest rate)**(-loan duration in months)))

=end

require 'YAML'
MESSAGES = YAML.load_file('mortg_calc_messages.yml')

def valid_price?(num)
  num.to_i.to_s == num
end

def format_apr(num)
  /^.+?\%.+?$/.match?(num) ? num.delete!('%') : num
end

def integer?(num)
  num.to_i.to_s == num
end

def float?(num)
  num.to_f.to_s == num
end

def valid_apr?(num)
  integer?(num) || float?(num)
end

def valid_loan_term?(num)
  num.to_i.to_s == num
end

def monthly_payment(loan_amount, monthly_interest, loan_term_months)
  loan_amount * (
    monthly_interest / (
      1 - (1 + monthly_interest) ** (-loan_term_months)
    )
  )
end

puts MESSAGES['welcome']

puts MESSAGES['purchase_price']

purchase_price = ''
loop do
  purchase_price = gets.chomp
  break if valid_price?(purchase_price)
  puts MESSAGES['valid_price']
end

puts MESSAGES['down_payment']

down_payment = ''
loop do
  down_payment = gets.chomp
  break if valid_price?(down_payment)
  puts MESSAGES['valid_price']
end

loan_amount = purchase_price.to_i - down_payment.to_i

puts MESSAGES['apr']

apr = ''
loop do
  apr = format_apr(gets.chomp)
  break if valid_apr?(apr)
  puts MESSAGES['valid_apr']
end

monthly_interest = apr.to_f / 12

puts MESSAGES['loan_term']

loan_term = ''
loop do
  loan_term = gets.chomp
  break if valid_loan_term?(loan_term)
  puts MESSAGES['valid_loan_term']
end

loan_term_months = loan_term.to_i * 12

monthly_payment =
  monthly_payment(loan_amount, monthly_interest, loan_term_months)

puts "Your monthly mortgage payment is #{monthly_payment}."
