require 'yaml'
MESSAGES = YAML.load_file('mortgage_calc_config.yaml')

def prompt(message)
  puts "=> #{message}"
end

def valid_integer?(input)
  input.each_char { |x| input.delete!(x) if /^[[:punct:]]$/ =~ x }
  input.match?(/^\d+$/)
end

def valid_downpayment?(input)
  if input.include?("%")
    input.match?(/^\d{1,2}\.?\d+?\%$/)
  elsif input.each_char { |x| input.delete!(x) if /^[[:punct:]]$/ =~ x }
    input.match?(/^\d+$/)
  end
end

def valid_apr?(input)
  input =~ /^\d{1,2}\.\d+?\%?$/
end

# initialize block variables

purchase_price = nil
down_payment = nil
loan_amount = nil
interest_rate_monthly = nil
loan_months = nil
property_taxes = nil
insurance = nil
hoa = nil
hoa_dues = nil
hoa_frequency = nil
hoa_monthly_payment = nil

prompt(MESSAGES['welcome'])

loop do
  # get purchase (purchase price & down payment) or refi input
  prompt(MESSAGES['intro_01'])
  prompt(MESSAGES['intro_02'])
  purchase_or_refi = gets.chomp

  if purchase_or_refi.downcase.start_with?("p")
    prompt(MESSAGES['purchase'])
    purchase_price = gets.chomp

    loop do
      if valid_integer?(purchase_price)
        break
      else
        prompt(MESSAGES['error_valid_integer'])
        purchase_price = gets.chomp
      end
    end

    prompt(MESSAGES['down_payment'])
    down_payment = gets.chomp

    loop do
      if valid_integer?(down_payment)
        if down_payment.include?("%")
          down_payment =
            (down_payment.delete("%").to_f / 100) * purchase_price.to_i
        end
        loan_amount = (purchase_price.to_i - down_payment.to_i)
        break
      else
        prompt(MESSAGES['error_valid_integer'])
        down_payment = gets.chomp
      end
    end

    break

  elsif purchase_or_refi.downcase.start_with?("r")
    prompt(MESSAGES['refi'])
    loan_amount = gets.chomp

    loop do
      if valid_integer?(loan_amount)
        break
      else
        prompt(MESSAGES['error_valid_integer'])
        loan_amount = gets.chomp
      end
    end

    break

  else
    prompt(MESSAGES['error_valid_choice'])
  end
end

prompt(MESSAGES['apr'])
apr = gets.chomp

loop do
  if valid_apr?(apr)
    interest_rate_monthly = (apr.to_f / 12) / 100
    break
  else
    prompt(MESSAGES['error_valid_apr'])
    apr = gets.chomp
  end
end

prompt(MESSAGES['duration_years'])
loan_years = gets.chomp

loop do
  if valid_integer?(loan_years)
    loan_months = (loan_years.to_i * 12)
    break
  else
    prompt(MESSAGES['error_valid_integer'])
    loan_years = gets.chomp
  end
end

p_and_i =
  loan_amount.to_i * (
    interest_rate_monthly / (
      1 - (1 + interest_rate_monthly)**(-loan_months.to_i)
    )
  )

prompt(MESSAGES['result_p_and_i'])
puts "$" + p_and_i.round(2).to_s

prompt(MESSAGES['total_monthly_payment?'])
answer = gets.chomp

loop do
  if answer.start_with?("n") || answer.start_with?("y")
    break
  else
    prompt(MESSAGES['error_valid_choice'])
    answer = gets.chomp
  end
end

if answer.start_with?("y")

  loop do
    prompt(MESSAGES['property_taxes'])
    property_taxes = gets.chomp
    if valid_integer?(property_taxes)
      break
    else
      prompt(MESSAGES['error_valid_integer'])
    end
  end

  loop do
    prompt(MESSAGES['insurance'])
    insurance = gets.chomp
    break if valid_integer?(insurance)
    prompt(MESSAGES['error_valid_integer'])
  end

  loop do
    prompt(MESSAGES['hoa?'])
    hoa = gets.chomp
    break if hoa.start_with?("y") || hoa.start_with?("n")
    prompt(MESSSAGES['error_valid_choice'])
  end

  if hoa.start_with?("y")
    prompt(MESSAGES['hoa_dues'])
    hoa_dues = gets.chomp

    loop do
      break if valid_integer?(hoa_dues)
      prompt(MESSAGES['error_valid_integer'])
      hoa_dues = gets.chomp
    end

    prompt(MESSAGES['hoa_frequency'])
    hoa_frequency = gets.chomp

    loop do
      break if ['1', '2', '3'].include?(hoa_frequency)
      prompt(MESSAGES['error_valid_choice'])
      hoa_frequency = gets.chomp
    end

    case hoa_frequency
    when '1'
      hoa_monthly_payment = hoa_dues.to_i
    when '2'
      hoa_monthly_payment = hoa_dues.to_i / 3
    when '3'
      hoa_monthly_payment = hoa_dues.to_i / 12
    end

  end

  if hoa.start_with?("y")
    prompt(MESSAGES['result_total_monthly_payment_hoa'])
    result_total_monthly_payment =
      "$" + (
        p_and_i +
        (property_taxes.to_i / 12) +
        (insurance.to_i / 12) +
        hoa_monthly_payment
      ).round(2).to_s
    puts result_total_monthly_payment
  else
    prompt(MESSAGES['result_total_monthly_payment_no_hoa'])
    result_total_monthly_payment_no_hoa =
      "$" + (
        p_and_i + (property_taxes.to_i / 12) + (insurance.to_i / 12)
      ).round(2).to_s
    puts result_total_monthly_payment_no_hoa
  end

else
  prompt(MESSAGES['goodbye'])
end
