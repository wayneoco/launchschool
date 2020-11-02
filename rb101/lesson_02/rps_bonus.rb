USER_CHOICES =
  ['rock (r)', 'paper (p)', 'scissors (sc)', 'lizard (l)', 'spock (sp)']
VALID_CHOICES =
  %w(rock r paper p scissors sc lizard l spock sp)

def clear
  system('clear') || system('cls')
end

def prompt(message)
  puts("=> #{message}")
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

def valid_choice?(response)
  loop do
    response = gets.chomp.downcase
    if VALID_CHOICES.include?(response)
      return expand_abbr_choice(response) if %w(r p l sc sp).include?(response)
      return response
    else
      prompt("That's not a valid choice.")
    end
  end
end

def display_getting_close(player_win_count, computer_win_count)
  if player_win_count == 4
    prompt("You have 4 wins- one more and you could be the grand winner!")
  elsif computer_win_count == 4
    prompt(
      "Computer has 4 wins and could soon be the grand winner. Hang in there!"
    )
  elsif player_win_count == 4 && computer_win_count == 4
    prompt("Tie score! The next round could determine the grand winner.")
  end
end

def player_choice(response)
  prompt("Choose one: #{USER_CHOICES.join(', ')}")
  valid_choice?(response)
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
    prompt("You won!")
  elsif who_wins(win_rules, choice, computer_choice) == 'computer'
    prompt("You lose!")
  else
    prompt("It's a tie!")
  end
end

def display_score(player_win_count, computer_win_count)
  prompt("Score: You: #{player_win_count}, Computer: #{computer_win_count}")
end

def display_final_score(player_win_count, computer_win_count)
  prompt(
    "Final Score:\n=> You: #{player_win_count}, Computer: #{computer_win_count}"
  )
end

def display_grand_winner(player_win_count, computer_win_count)
  if player_win_count == 5
    prompt("You're the first to reach 5 wins. You're the grand winner!")
  elsif computer_win_count == 5
    prompt("Computer reached 5 wins first. Computer is the grand winner!")
  end
end

def play_again
  loop do
    prompt("Would you like to play again?")
    response = gets.chomp.downcase
    return response if %w(yes y no n).include?(response)
    prompt("That's not a valid answer.")
  end
end

loop do
  clear

  response = ''
  match_count = 0
  player_win_count = 0
  computer_win_count = 0

  prompt("Welcome to Rock, Paper, Scissors!")
  prompt("First player to win 5 matches will be declared the grand winner.")

  loop do
    prompt("Match # #{match_count += 1}")

    display_score(player_win_count, computer_win_count) if match_count > 1

    display_getting_close(player_win_count, computer_win_count)

    choice = player_choice(response)

    computer_choice = %w(rock paper scissors lizard spock).sample

    puts("You chose: #{choice}; Computer chose: #{computer_choice}")

    display_results(win_rules, choice, computer_choice)

    player_win_count += 1 if who_wins(
      win_rules, choice, computer_choice
    ) == 'player'
    computer_win_count += 1 if who_wins(
      win_rules, choice, computer_choice
    ) == 'computer'

    break if player_win_count == 5
    break if computer_win_count == 5

    display_score(player_win_count, computer_win_count)

    sleep(4)

    clear
  end

  display_final_score(player_win_count, computer_win_count)

  sleep(1)

  display_grand_winner(player_win_count, computer_win_count)

  repeat = play_again

  break unless ['yes', 'y'].include?(repeat)
end

prompt("Thanks for playing!")
