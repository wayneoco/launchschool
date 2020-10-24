require 'yaml'
MESSAGES = YAML.load_file('mortgage_calc_config.yaml')

purchase_price = ''
down_payment = ''
loan_amount = ''
interest_rate_monthly = ''
term_months = ''
calculate_total_monthly_payment = ''
property_taxes = ''
insurance = ''
hoa = ''
hoa_dues = ''
hoa_frequency = ''
hoa_monthly_payment = ''

def prompt(message)
  puts "=> #{message}"
end

def valid_currency?(input)
  # Uses regex to check for valid number combinations, with or without
  #   commas, decimals and dollar signs. Excludes 0 or answers that begin
  #   with 0, as well as negative numbers.
  input.match?(
    %r{
      (
        (^\$?\d+(\.?\d{2})?$)|
        (^\$?\d{1,3}(\.?\d{2})?$)|
        (^\$?\d{1,3}(\,\d{3})*(\.?\d{2})?$)
      )
    }x
  ) &&
    !input.match?(/^\$?[0]\.?\d*?$/)
end

def valid_down_payment?(input)
  # Nearly identical to the valid_currency? method above except that it
  #   alows for 0 as input, as well as percentages in lieu of specific
  #   dollar amounts.
  input.match?(
    %r{
      (
        (^\$?\d+(\.?\d{2})?$)|
        (^\$?\d{1,3}(\.?\d{2})?$)|
        (^\$?\d{1,3}(\,\d{3})*(\.?\d{2})?$)
      )
    }x
  ) &&
    !input.match?(/^\$?(00)\.?\d+$/) ||
    input.match?(/^\d{1,2}(\.\d{1,2})?\%?$/)
end

def valid_apr?(input)
  # Uses regex to check for valid APR configurations, with or without
  #   the percent sign or a decimal.
  input.match?(/^\d{1,2}(\.\d{1,3})?\%?$/)
end

def valid_term?(input)
  # Uses regex to check for valid single or two digit positive numbers.
  input.match?(/^\d{1,2}\.?\d+?$/)
end

def remove_punct(num)
  # Removes non-letter and non-numeric characters and symbols, such as a
  #   dollar sign or comma, so that numeric strings can be converted to floats.
  #   This method is called only after numbers have been validated using
  #   the methods defined above.
  num.each_char do |x|
    if /^[[:punct:]]$/ =~ x
      num.delete!(x) unless x == '.'
    end
  end
end

prompt(MESSAGES['welcome_01'])
prompt(MESSAGES['welcome_02'])

loop do
  prompt(MESSAGES['purchase_or_refi?'])
  purchase_or_refi = gets.chomp
  if purchase_or_refi.downcase == "purchase" ||
     purchase_or_refi.downcase == "p"
    loop do
      prompt(MESSAGES['purchase_amount?'])
      purchase_price = gets.chomp
      if valid_currency?(purchase_price)
        purchase_price = remove_punct(purchase_price).to_f
        break
      else
        prompt(MESSAGES['error_valid_number'])
      end
    end
    loop do
      prompt(MESSAGES['down_payment_amount?'])
      down_payment = gets.chomp
      if valid_down_payment?(down_payment)
        if (/^\d{1,2}(\.\d{1,2})?\%?$/).match?(down_payment)
          down_payment.delete!("%")
          down_payment = (
            (remove_punct(down_payment).to_f / 100) * purchase_price
          )
        else
          down_payment = remove_punct(down_payment).to_f
        end
        loan_amount = (purchase_price - down_payment)
        break
      else
        prompt(MESSAGES['error_valid_number'])
      end
    end
    break
  elsif purchase_or_refi.downcase == "refinance" ||
        purchase_or_refi.downcase == "r"
    loop do
      prompt(MESSAGES['refi_amount?'])
      loan_amount = gets.chomp
      if valid_currency?(loan_amount)
        loan_amount = remove_punct(loan_amount).to_f
        break
      else
        prompt(MESSAGES['error_valid_number'])
      end
    end
    break
  else
    prompt(MESSAGES['error_valid_choice'])
  end
end
loop do
  prompt(MESSAGES['apr'])
  apr = gets.chomp
  if valid_apr?(apr)
    apr = remove_punct(apr).to_f
    interest_rate_monthly = (apr / 12) / 100
    break
  else
    prompt(MESSAGES['error_valid_apr'])
  end
end
loop do
  prompt(MESSAGES['term'])
  term_years = gets.chomp
  if valid_term?(term_years)
    term_months = remove_punct(term_years).to_f * 12
    break
  else
    prompt(MESSAGES['error_valid_number'])
  end
end
p_and_i =
  loan_amount * (
    interest_rate_monthly / (
      1 - (1 + interest_rate_monthly)**(-term_months)
    )
  )

prompt(MESSAGES['result_p_and_i'])
puts "$" + p_and_i.round(2).to_s

loop do
  prompt(MESSAGES['calculate_total_monthly_payment?'])
  calculate_total_monthly_payment = gets.chomp
  if calculate_total_monthly_payment == "yes" ||
     calculate_total_monthly_payment == "y"
    break
  elsif calculate_total_monthly_payment == "no" ||
        calculate_total_monthly_payment == "n"
    prompt(MESSAGES['goodbye'])
    exit!
  else
    prompt(MESSAGES['error_valid_choice'])
  end
end

loop do
  prompt(MESSAGES['property_taxes?'])
  property_taxes = gets.chomp
  if valid_currency?(property_taxes)
    property_taxes = remove_punct(property_taxes).to_f
    break
  else
    prompt(MESSAGES['error_valid_number'])
  end
end
loop do
  prompt(MESSAGES['insurance?'])
  insurance = gets.chomp
  if valid_currency?(insurance)
    insurance = remove_punct(insurance).to_f
    break
  else
    prompt(MESSAGES['error_valid_number'])
  end
end
loop do
  prompt(MESSAGES['hoa?'])
  hoa = gets.chomp
  if hoa == "yes" || hoa == "y"
    hoa = "y"
    loop do
      prompt(MESSAGES['hoa_dues?'])
      hoa_dues = gets.chomp
      if valid_currency?(hoa_dues)
        hoa_dues = remove_punct(hoa_dues).to_f
        break
      else
        prompt(MESSAGES['error_valid_number'])
      end
    end
    break
  elsif hoa == "no" || hoa == "n"
    hoa = "n"
    break
  else
    prompt(MESSSAGES['error_valid_choice'])
  end
end
if hoa == "y"
  loop do
    prompt(MESSAGES['hoa_frequency?'])
    hoa_frequency = gets.chomp
    if ['1', '2', '3'].include?(hoa_frequency)
      case hoa_frequency
      when '1'
        hoa_monthly_payment = hoa_dues
      when '2'
        hoa_monthly_payment = hoa_dues / 3
      when '3'
        hoa_monthly_payment = hoa_dues / 12
      end
      break
    else
      prompt(MESSAGES['error_valid_choice'])
    end
  end
end
if hoa == "y"
  prompt(MESSAGES['result_total_monthly_payment_hoa'])
  result_total_monthly_payment =
    "$" + (
      p_and_i +
      (property_taxes / 12) +
      (insurance / 12) +
      hoa_monthly_payment
    ).round(2).to_s
  puts result_total_monthly_payment
else
  prompt(MESSAGES['result_total_monthly_payment_no_hoa'])
  result_total_monthly_payment_no_hoa =
    "$" + (
      p_and_i +
      (property_taxes / 12) +
      (insurance / 12)
    ).round(2).to_s
  puts result_total_monthly_payment_no_hoa
end
