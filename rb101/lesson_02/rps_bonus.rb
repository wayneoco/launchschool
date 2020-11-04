require 'yaml'
MESSAGES = YAML.load_file('rps_messages.yml')

USER_CHOICES =
  ['rock (r)', 'paper (p)', 'scissors (sc)', 'lizard (l)', 'spock (sp)']
VALID_CHOICES = %w(rock r paper p scissors sc lizard l spock sp)
ABBR_CHOICES = {
  'r' => 'rock',
  'p' => 'paper',
  'sc' => 'scissors',
  'l' => 'lizard',
  'sp' => 'spock'
}
WIN_RULES = {
  'rock' => ['scissors', 'lizard'],
  'paper' => ['rock', 'spock'],
  'scissors' => ['paper', 'lizard'],
  'lizard' => ['paper', 'spock'],
  'spock' => ['rock', 'scissors']
}
GOAL_WINS = 5

def clear
  system('clear') || system('cls')
end

def prompt(message)
  puts "=> #{message}"
end

def display_welcome
  clear
  prompt(MESSAGES['welcome'])
end

def ready_to_play
  answer = ''
  loop do
    prompt(MESSAGES['ready_to_play'])
    answer = gets.chomp.downcase
    break if %w(yes y exit e).include?(answer)
    prompt(MESSAGES['invalid_response'])
  end
  lets_play if %w(yes y).include?(answer)
  abort if %w(exit e).include?(answer)
end

def lets_play
  prompt(MESSAGES['lets_play'])
  sleep(2)
  clear
end

def abort
  prompt(MESSAGES['abort'])
  exit!
end

def display_round_count(round_count)
  clear
  prompt("Round # #{round_count}")
end

def get_choice
  loop do
    prompt("Choose one: #{USER_CHOICES.join(', ')}")
    choice = gets.chomp.downcase
    if valid_choice?(choice)
      if %w(r p l sc sp).include?(choice)
        return convert_abbr_choice(choice)
      end
      return choice
    else
      prompt(MESSAGES['invalid_response'])
    end
  end
end

def valid_choice?(choice)
  VALID_CHOICES.include?(choice)
end

def convert_abbr_choice(choice)
  ABBR_CHOICES.fetch(choice)
end

def random_move
  %w(rock paper scissors lizard spock).sample
end

def display_getting_close(score)
  sleep(1)
  player_almost_winner(score)
  computer_almost_winner(score)
  tie_almost_winner(score)
  sleep(1)
end

def player_almost_winner(score)
  if score.fetch(:player) == 4 && score.fetch(:computer) != 4
    prompt(MESSAGES['player_4_wins'])
  end
end

def computer_almost_winner(score)
  if score.fetch(:computer) == 4 && score.fetch(:player) != 4
    prompt(MESSAGES['computer_4_wins'])
  end
end

def tie_almost_winner(score)
  if score.fetch(:player) == 4 && score.fetch(:computer) == 4
    prompt(MESSAGES['tied_4_wins'])
  end
end

def display_moves(player_choice, computer_choice)
  prompt("You chose: #{player_choice.upcase}. \
    Computer chose: #{computer_choice.upcase}")
end

def who_wins(player_choice, computer_choice)
  if WIN_RULES.fetch(player_choice).include?(computer_choice)
    'player'
  elsif WIN_RULES.fetch(computer_choice).include?(player_choice)
    'computer'
  end
end

def display_results(player_choice, computer_choice)
  if who_wins(player_choice, computer_choice) == 'player'
    prompt("#{player_choice.upcase} beats #{computer_choice.upcase}")
    sleep(1)
    prompt(MESSAGES['player_won'])
  elsif who_wins(player_choice, computer_choice) == 'computer'
    prompt("#{computer_choice.upcase} beats #{player_choice.upcase}")
    sleep(1)
    prompt(MESSAGES['player_lost'])
  else
    prompt(MESSAGES['tie'])
  end
  sleep(3)
end

def adjust_score(player_choice, computer_choice, score)
  if who_wins(player_choice, computer_choice) == 'player'
    score[:player] += 1
  elsif who_wins(player_choice, computer_choice) == 'computer'
    score[:computer] += 1
  end
end

def display_score(score)
  prompt("Score: You: #{score[:player]}, Computer: #{score[:computer]}")
end

def goal_wins_reached?(score)
  score.value?(GOAL_WINS)
end

def display_final_score(score)
  prompt(
    "Final Score: You: #{score[:player]}, Computer: #{score[:computer]}"
  )
  sleep(1)
end

def display_grand_winner(score)
  if score[:player] == GOAL_WINS
    prompt(MESSAGES['player_grand_winner'])
  elsif score[:computer] == GOAL_WINS
    prompt(MESSAGES['computer_grand_winner'])
  end
  sleep(1)
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
  count = 0
  score = { player: 0, computer: 0 }
  winner = ''

  display_welcome

  ready_to_play

  loop do
    round_count = (count += 1)

    display_round_count(round_count)

    display_score(score)

    if score.value?(4)
      display_getting_close(score)
    end

    player_choice = get_choice

    computer_choice = random_move

    display_moves(player_choice, computer_choice)

    display_results(player_choice, computer_choice)

    winner = who_wins(player_choice, computer_choice)

    adjust_score(player_choice, computer_choice, score)

    break if goal_wins_reached?(score)

    clear
  end

  display_final_score(score)

  display_grand_winner(score)

  break unless ['yes', 'y'].include?(play_again)
end

prompt(MESSAGES['goodbye'])
