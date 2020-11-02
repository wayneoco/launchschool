require 'yaml'
MESSAGES = YAML.load_file('rps_messages.yml')

USER_CHOICES =
  ['rock (r)', 'paper (p)', 'scissors (sc)', 'lizard (l)', 'spock (sp)']
VALID_CHOICES =
  %w(rock r paper p scissors sc lizard l spock sp)

def clear
  system('clear') || system('cls')
end

def prompt(message)
  puts "=> #{message}"
end

def ready_to_play
  answer = ''
  loop do
    answer = gets.chomp.downcase
    break if %w(yes y exit e).include?(answer)
    prompt(MESSAGES['invalid_response'])
  end
  prompt(MESSAGES['lets_play']) if %w(yes y).include?(answer)
  if %w(exit e).include?(answer)
    prompt(MESSAGES['abort'])
    exit!
  end
end

def get_choice
  prompt("Choose one: #{USER_CHOICES.join(', ')}")
  choice = gets.chomp.downcase
end

def valid_choice?(response)
  loop do
    if VALID_CHOICES.include?(response)
      return expand_abbr_choice(response) if %w(r p l sc sp).include?(response)
      response
    else
      prompt(MESSAGES['invalid_response'])
      response = gets.chomp.downcase
    end
  end
end

def expand_abbr_choice(choice)
  case choice
  when 'r'
    'rock'
  when 'p'
    'paper'
  when 'l'
    'lizard'
  when 'sc'
    'scissors'
  when 'sp'
    'spock'
  end
end

def display_getting_close(player_win_count, computer_win_count)
  if player_win_count == 4
    prompt(MESSAGES['player_4_wins'])
  elsif computer_win_count == 4
    prompt(MESSAGES['computer_4_wins'])
  elsif player_win_count == 4 && computer_win_count == 4
    prompt(MESSAGES['tied_4_wins'])
  end
end

def display_moves(choice, computer_choice)
  puts(
    "You chose: #{choice.upcase}. Computer chose: #{computer_choice.upcase}"
  )
end

win_rules = {
  'rock' => ['scissors', 'lizard'],
  'paper' => ['rock', 'spock'],
  'scissors' => ['paper', 'lizard'],
  'lizard' => ['paper', 'spock'],
  'spock' => ['rock', 'scissors']
}

def who_wins(win_rules, choice, computer_choice)
  if win_rules.fetch(choice).include?(computer_choice)
    'player'
  elsif win_rules.fetch(computer_choice).include?(choice)
    'computer'
  end
end

def display_results(win_rules, choice, computer_choice)
  if who_wins(win_rules, choice, computer_choice) == 'player'
    prompt("#{choice.upcase} beats #{computer_choice.upcase}")
    sleep(1)
    prompt(MESSAGES['player_won'])
  elsif who_wins(win_rules, choice, computer_choice) == 'computer'
    prompt("#{computer_choice.upcase} beats #{choice.upcase}")
    sleep(1)
    prompt(MESSAGES['player_lost'])
  else
    prompt(MESSAGES['tie'])
  end
end

def display_score(player_win_count, computer_win_count)
  prompt("Score: You: #{player_win_count}, Computer: #{computer_win_count}")
end

def display_final_score(player_win_count, computer_win_count)
  prompt(
    "Final Score: You: #{player_win_count}, Computer: #{computer_win_count}"
  )
end

def display_grand_winner(player_win_count, computer_win_count)
  if player_win_count == 5
    prompt(MESSAGES['player_grand_winner'])
  elsif computer_win_count == 5
    prompt(MESSAGES['computer_grand_winner'])
  end
end

def play_again
  loop do
    prompt(MESSAGES['play_again'])
    response = gets.chomp.downcase
    return response if %w(yes y no n).include?(response)
    prompt(MESSAGES['invalid_response'])
  end
end

loop do
  clear

  round_count = 0
  player_win_count = 0
  computer_win_count = 0

  prompt(MESSAGES['welcome'])

  ready_to_play

  sleep(2)

  loop do
    clear

    prompt("Match # #{round_count += 1}")

    display_score(player_win_count, computer_win_count) if round_count > 1

    unless player_win_count < 4 && computer_win_count < 4
      sleep(1)
      display_getting_close(player_win_count, computer_win_count)
    end

    sleep(1)

    choice = valid_choice?(get_choice)

    computer_choice = %w(rock paper scissors lizard spock).sample

    display_moves(choice, computer_choice)

    display_results(win_rules, choice, computer_choice)

    player_win_count += 1 if who_wins(
      win_rules, choice, computer_choice
    ) == 'player'
    computer_win_count += 1 if who_wins(
      win_rules, choice, computer_choice
    ) == 'computer'

    break if player_win_count == 5
    break if computer_win_count == 5

    sleep(3)

    clear
  end

  display_final_score(player_win_count, computer_win_count)

  sleep(1)

  display_grand_winner(player_win_count, computer_win_count)

  sleep(1)

  repeat = play_again

  break unless ['yes', 'y'].include?(repeat)
end

prompt(MESSAGES['goodbye'])
