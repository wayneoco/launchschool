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

def valid_down_payment?(down_payment, purchase_price)
  (down_payment.match?(
    %r{((^\$?\d+(\.\d{2})?$)|
        (^\$?\d{1,3}(\.\d{2})?$)|
        (^\$?\d{1,3}(\,\d{3})*(\.\d{2})?$))}x
  ) &&
    remove_symbols(down_payment).to_f < purchase_price &&
    !down_payment.match?(/^\$?(00)\.?\d+$/)) ||
    down_payment.match?(/^\d{1,2}(\.\d{1,2})?\%?$/)
end

def percentage_down_payment?(down_payment)
  down_payment.match?(/^\d{1,2}(\.\d{1,2})?\%?$/)
end

def valid_apr?(input)
  input.match?(/^\d{1,2}(\.\d{1,3})?\%?$/) &&
    input != '0'
end

def valid_term?(input)
  input.match?(/^\d{1,2}$/)
end

def remove_symbols(num)
  num.each_char do |x|
    if x == '$' || x == ','
      num.delete!(x)
    end
  end
end

def yes_or_no(response)
  return 'y' if response == 'y' || response == 'yes'
  return 'n' if response == 'n' || response == 'no'
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

def get_down_payment(purchase_price)
  loop do
    prompt(MESSAGES['down_payment_amount?'])
    down_payment = gets.chomp
    if valid_down_payment?(down_payment, purchase_price)
      return down_payment
    else
      prompt(MESSAGES['error_invalid_number'])
    end
  end
end

def check_low_down_payment(down_payment)
  loop do
    return 'y' unless down_payment.to_f < 1000 && down_payment.to_f != 0
    prompt(MESSAGES['down_payment_low'])
    prompt("You entered $#{down_payment}. Is that correct? (y/n)")
    loop do
      response = gets.chomp.downcase
      return 'y' if yes_or_no(response) == 'y'
      return 'n' if yes_or_no(response) == 'n'
      prompt(MESSAGES['error_invalid_choice'])
    end
  end
end

def retrieve_down_payment(purchase_price)
  loop do
    down_payment = get_down_payment(purchase_price)
    return if /^.+\%$/.match?(down_payment)
    remove_symbols(down_payment)
    return if check_low_down_payment(down_payment) == 'y'
  end
end

def convert_down_payment(down_payment, purchase_price)
  (down_payment.delete!('%').to_f / 100) * purchase_price
end

def calc_loan_amount(purchase_price, down_payment)
  purchase_price - down_payment.to_f
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
    response = gets.chomp.downcase
    return 'y' if yes_or_no(response) == 'y'
    return 'n' if yes_or_no(response) == 'n'
    prompt(MESSAGES['error_invalid_choice'])
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

def calc_monthly_principal_and_interest(loan_amount, apr, term_months)
  rate_monthly = apr / 12
  loan_amount * (rate_monthly / (1 - (1 + rate_monthly)**(-term_months)))
end

def display_principal_and_interest(p_and_i)
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
    response = gets.chomp.downcase
    if yes_or_no(response) == 'y'
      break
    elsif yes_or_no(response) == 'n'
      prompt(MESSAGES['goodbye'])
      exit!
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
  down_payment = retrieve_down_payment(purchase_price)

  if (/^\.+\%$/).match?(down_payment)
    down_payment = convert_down_payment(down_payment, purchase_price)
  end

  loan_amount = calc_loan_amount(purchase_price, down_payment)
  apr = get_apr
  term_months = get_term

  p_and_i = calc_monthly_principal_and_interest(loan_amount, apr, term_months)

  display_principal_and_interest(p_and_i)

  sleep(1)

  prompt(MESSAGES['calc_total_monthly_payment'])

  property_taxes = get_property_taxes
  insurance = get_insurance

  if get_hoa() == 'y'
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

  use_again

  clear
end
