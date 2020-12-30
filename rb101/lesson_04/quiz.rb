puts "### Question 4 ###"
puts ''

def change_case(sentence, new_case)
  case new_case
  when :snake
    snake(sentence)
  when :camel
    camel(sentence)
  when :upper_snake
    upper_snake(sentence)
  else
    puts 'Invalid case type'
  end
end

def snake(str)
  words = str.split
  current_word = 0 # ERROR: was current_word = 1

  loop do
    words[current_word].downcase!

    current_word += 1
    break if current_word >= words.size
  end

  words.join('_')
end

sentence = 'The sky was blue'
puts snake(sentence) # => 'the_sky_was_blue'
puts ''

puts "### Question 5 ###"
puts ''

def camel(str)
  words = str.split(' ')
  counter = 0

  while counter < words.size # ERROR: was while counter > words.size
    words[counter] = words[counter].capitalize

    counter = counter + 1
  end

  words.join
end

sentence = 'The sky was blue'
puts camel(sentence) # => 'TheSkyWasBlue'
puts ''

puts "### Question 6 ###"
puts ''

def upper_snake(str)
  words = str.split
  current_word = 0

  loop do
    break if current_word == words.size

    words[current_word].upcase!
    current_word += 1
  end

  words.join('_')
end

sentence = 'The sky was blue'
puts upper_snake(sentence) # => 'THE_SKY_WAS_BLUE'
puts ''

puts "### Question 11 ###"
puts ''

def star_method(stars)
  arr = []
  counter = 0

  until counter == stars.size do
    arr << stars[counter][0, 3]

    counter += 1
  end
  arr
end

stars_1 = ['Sirius', 'Rigel', 'Vega', 'Polaris', 'Altair']
stars_2 = star_method(stars_1)
puts ''

puts "### Question 20 ###"
puts ''

mailing_campaign_leads = [
  {name: 'Emma Lopez', email: 'emma.lopez@some_mail.com', days_since_login: 423, mailing_list: true},
  {name: 'mike richards', email: 'michael.richards@some_mail.com', days_since_login: 23, mailing_list: false},
  {name: 'JANE WILLIAMS', email: 'jane_w95@my_mail.com', days_since_login: 16, mailing_list: true},
  {name: 'Ash Patel', email: 'ash_patel@my_mail.com', days_since_login: 22, mailing_list: true}
]

counter = 0

loop do
  break if counter == mailing_campaign_leads.size
  full_name = mailing_campaign_leads[counter][:name]
  names = full_name.split # Array with first and last name as elements

  names_counter = 0
  loop do
    break if names_counter == names.size
    name = names[names_counter]
    names[names_counter] = name.capitalize

    names_counter += 1
  end

  capitalized_full_name = names.join(' ')
  mailing_campaign_leads[counter][:name] = capitalized_full_name

  counter += 1
end

usable_leads = []
counter = 0

loop do
  break if counter == mailing_campaign_leads.size
  last_login = mailing_campaign_leads[counter][:days_since_login]
  subscribed_to_list = mailing_campaign_leads[counter][:mailing_list]

  if last_login < 60 && subscribed_to_list
    usable_leads << mailing_campaign_leads[counter]
  end

  counter += 1
end