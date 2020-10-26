require 'yaml'
MESSAGES = YAML.load_file('mortgage_calc_messages.yml')

def clear
  system('clear') || system('cls')
end

def prompt(message)
  puts "=> #{message}"
end

def valid_price?(input)
  input.match?(
    %r{
      (
        (^\$?\d+(\.\d{2})?$)|
        (^\$?\d{1,3}(\.?\d{2})?$)|
        (^\$?\d{1,3}(\,\d{3})*(\.\d{2})?$)
      )
    }x
  ) &&
    !input.match?(/^\$?[0]\.?\d*?$/)
end

def valid_down_payment?(input)
  # Checks for valid down payment expressed either as a dollar amount
  #   or a percentage of the purchase price.
  input.match?(
    %r{
      (
        (^\$?\d+(\.\d{2})?$)|
        (^\$?\d{1,3}(\.?\d{2})?$)|
        (^\$?\d{1,3}(\,\d{3})*(\.\d{2})?$)
      )
    }x
  ) &&
    !input.match?(/^\$?(00)\.?\d+$/) ||
    input.match?(/^\d{1,2}(\.\d{1,2})?\%?$/)
end

def valid_apr?(input)
  input.match?(/^\d{1,2}(\.\d{1,3})?\%?$/)
end

def valid_term?(input)
  input.match?(/^\d{1,2}\.?\d+?$/)
end

def remove_symbols(num)
  # Removes '$' and ',' if present, so that the string
  #   can be converted to a float.
  num.each_char do |x|
    if x == '$' || x == ','
      num.delete!(x)
    end
  end
end

def get_purchase_price
  loop do
    prompt(MESSAGES['purchase_amount?'])
    purchase_price = gets.chomp
    if valid_price?(purchase_price)
      return remove_symbols(purchase_price).to_f
    else
      prompt(MESSAGES['error_invalid_number'])
    end
  end
end

def get_down_payment
  loop do
    prompt(MESSAGES['down_payment_amount?'])
    down_payment = gets.chomp
    if valid_down_payment?(down_payment)
      return down_payment
    else
      prompt(MESSAGES['error_invalid_number'])
    end
  end
end

def check_down_payment(down_payment)
  # This gets triggered if the down payment entered is under $1,000 but not $0.
  #   Down payments are rarely sub-four figures (but can often be $0), so this
  #   method asks the user to confirm if a sub-four figure down payment is entered.
  loop do
    puts <<~MSG
      => Hmmm. That looks unusually low.
      => Are you sure you meant to enter $#{down_payment}?
      MSG
    response = gets.chomp
    if response == 'yes' || response == 'y'
      return 'y'
    elsif response == 'no' || response == 'n'
      return 'n'
    else
      prompt(MESSAGES['error_invalid_choice'])
    end
  end
end

def convert_down_payment(down_payment, purchase_price)
  # Because this program allows the user to enter the down payment as either
  #   a dollar amount or a percentage, this method converts the
  #   down payment to a dollar amount if entered as a percentage, or leaves it
  #   as is if entered as a dollar amount.
  if (/^\d{1,2}(\.\d{1,2})?\%?$/).match?(down_payment)
    (down_payment.delete!('%').to_f / 100) * purchase_price
  else
    remove_symbols(down_payment).to_f
  end
end

def calc_loan_amount(purchase_price, down_payment_formatted)
  purchase_price - down_payment_formatted
end

def get_apr
  loop do
    prompt(MESSAGES['apr'])
    apr = gets.chomp
    if valid_apr?(apr)
      return remove_symbols(apr).to_f / 100
    else
      prompt(MESSAGES['error_invalid_apr'])
    end
  end
end

def get_term
  loop do
    prompt(MESSAGES['term'])
    term_years = gets.chomp
    if valid_term?(term_years)
      return remove_symbols(term_years).to_f * 12
    else
      prompt(MESSAGES['error_invalid_number'])
    end
  end
end

def get_property_taxes
  loop do
    prompt(MESSAGES['property_taxes?'])
    property_taxes = gets.chomp
    if valid_price?(property_taxes)
      return remove_symbols(property_taxes).to_f / 12
    else
      prompt(MESSAGES['error_invalid_number'])
    end
  end
end

def get_insurance
  loop do
    prompt(MESSAGES['insurance?'])
    insurance = gets.chomp
    if valid_price?(insurance)
      return remove_symbols(insurance).to_f / 12
    else
      prompt(MESSAGES['error_invalid_number'])
    end
  end
end

def get_hoa
  loop do
    prompt(MESSAGES['hoa?'])
    hoa = gets.chomp.downcase
    if hoa == 'yes' || hoa == 'y'
      return 'y'
    elsif hoa == 'no' || hoa == 'n'
      return 'n'
    else
      prompt(MESSAGES['error_invalid_choice'])
    end
  end
end

def get_hoa_dues
  loop do
    prompt(MESSAGES['hoa_dues?'])
    hoa_dues = gets.chomp
    if valid_price?(hoa_dues)
      return remove_symbols(hoa_dues).to_f
    else
      prompt(MESSAGES['error_invalid_number'])
    end
  end
end

def get_hoa_frequency
  loop do
    prompt(MESSAGES['hoa_frequency?'])
    hoa_frequency = gets.chomp
    if ['1', '2', '3'].include?(hoa_frequency)
      return hoa_frequency
    else
      prompt(MESSAGES['error_invalid_choice'])
    end
  end
end

def calc_hoa_monthly(hoa_frequency, hoa_dues)
  case hoa_frequency
  when '1'
    hoa_dues
  when '2'
    hoa_dues / 3
  when '3'
    hoa_dues / 12
  end
end

def calc_monthly_p_and_i(loan_amount, apr, term_months)
  rate_monthly = apr / 12
  loan_amount * (rate_monthly / (1 - (1 + rate_monthly)**(-term_months)))
end

def display_p_and_i(p_and_i)
  prompt("Your monthly principal and interest payment is $#{p_and_i.round(2)}.")
end

def calc_monthly_total(p_and_i, property_taxes, insurance, hoa_monthly)
  p_and_i + property_taxes + insurance + hoa_monthly
end

def display_monthly_total(total_monthly)
  prompt("Your total monthly payment is $#{total_monthly.round(2)}.")
end

def use_again
  loop do
    prompt(MESSAGES['use_again?'])
    response = gets.chomp
    if response == 'yes' || response == 'y'
      return 'y'
    elsif response == 'no' || response == 'n'
      return 'n'
    else
      prompt(MESSAGES['error_invalid_choice'])
    end
  end
end

# START PROGRAM

clear

loop do
  prompt(MESSAGES['welcome_01'])
  prompt(MESSAGES['welcome_02'])

  purchase_price = get_purchase_price

  down_payment = ''

  loop do
    down_payment = get_down_payment
    break if /^.+\%$/.match?(down_payment)
    remove_symbols(down_payment)
    if down_payment.to_i < 1000 || down_payment.to_i != 0
      checked_down_payment = check_down_payment(down_payment)
      if checked_down_payment == 'y'
        prompt(MESSAGES['down_payment_check'])
        break
      elsif checked_down_payment == 'n'
        prompt(MESSAGES['down_payment_again'])
      end
    else
      break
    end
  end

  down_payment_formatted = convert_down_payment(down_payment, purchase_price)
  loan_amount = calc_loan_amount(purchase_price, down_payment_formatted)
  apr = get_apr
  term_months = get_term

  p_and_i = calc_monthly_p_and_i(loan_amount, apr, term_months)

  display_p_and_i(p_and_i)

  sleep(1)

  prompt(MESSAGES['calc_total_monthly_payment'])

  property_taxes = get_property_taxes
  insurance = get_insurance
  hoa = get_hoa

  if hoa == 'y'
    hoa_dues = get_hoa_dues
    hoa_frequency = get_hoa_frequency
    hoa_monthly = calc_hoa_monthly(hoa_frequency, hoa_dues)
  else
    hoa_monthly = 0
  end

  total_monthly = calc_monthly_total(
    p_and_i, property_taxes, insurance, hoa_monthly
  )

  display_monthly_total(total_monthly)

  start_over = use_again

  if start_over == 'y'
    next
  else
    prompt(MESSAGES['goodbye'])
    exit!
  end
end
