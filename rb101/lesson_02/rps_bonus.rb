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

def valid_choice?(choice)
  VALID_CHOICES.include?(choice) ||
    %w(r p l sc sp).include?(choice)
end

def display_getting_close(player_wins, computer_wins)
  if player_wins == 4
    prompt("You have 4 wins- one more and you could be the winner!")
  elsif computer_wins == 4
    prompt("Computer has 4 wins and could soon be the winner. Hang in there!")
  end
end

def win?(first, second)
  (first == 'rock' && second == 'scissors') ||
    (first == 'rock' && second == 'lizard') ||
    (first == 'paper' && second == 'rock') ||
    (first == 'paper' && second == 'spock') ||
    (first == 'scissors' && second == 'paper') ||
    (first == 'scissors' && second == 'lizard') ||
    (first == 'lizard' && second == 'paper') ||
    (first == 'lizard' && second == 'spock') ||
    (first == 'spock' && second == 'rock') ||
    (first == 'spock' && second == 'scissors')
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("You lose!")
  else
    prompt("It's a tie!")
  end
end

def display_score(player_wins, computer_wins)
  prompt("Score: You: #{player_wins}, Computer: #{computer_wins}")
end

def display_final_score(player_wins, computer_wins)
  prompt("Final Score:\n=> You: #{player_wins}, Computer: #{computer_wins}")
end

def play_again
  loop do
    prompt("Would you like to play again?")
    response = gets.chomp.downcase
    return response if %w(yes y no n).include?(response)
    prompt("That's not a valid answer.")
  end
end

choice = ''
player_wins = 0
computer_wins = 0

loop do

  match_count = 0

  clear

  prompt("Welcome to Rock, Paper, Scissors!")
  prompt("First player to win 5 matches will be declared the winner!")

  loop do

    prompt("Match # #{match_count += 1}")

    display_score(player_wins, computer_wins) if match_count > 1

    display_getting_close(player_wins, computer_wins)

    prompt("Choose one: #{USER_CHOICES.join(', ')}")
    loop do
      choice = gets.chomp.downcase
      if valid_choice?(choice)
        choice = expand_abbr_choice(choice) if %w(r p l sc sp).include?(choice)
        break
      else
        prompt("That's not a valid choice.")
      end
    end

    computer_choice = %w(rock paper scissors lizard spock).sample

    puts("You chose: #{choice}; Computer chose: #{computer_choice}")

    display_results(choice, computer_choice)

    player_wins += 1 if win?(choice, computer_choice)
    computer_wins += 1 if win?(computer_choice, choice)

    break if player_wins == 5
    break if computer_wins == 5

    display_score(player_wins, computer_wins)

    sleep(4)

    clear

  end

  display_final_score(player_wins, computer_wins)

  sleep(1)

  prompt("You're the first to reach 5 wins. You win!") if player_wins == 5
  prompt("Computer reached 5 wins first. You lose!") if computer_wins == 5

  repeat = play_again

  break unless ['yes', 'y'].include?(repeat)
end

prompt("Thanks for playing!")
