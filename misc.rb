WIN_RULES = {
  'rock' => %w(scissors lizard),
  'paper' => %w(rock spock),
  'scissors' => %w(paper lizard),
  'spock' => %w(scissors rock),
  'lizard' => %w(spock paper)
}
VALID_CHOICES = WIN_RULES.keys

def prompt(message)
  puts ("=> #{message}")
end

def player_chooses
  prompt("Choose one: #{VALID_CHOICES.join(', ')}")
  gets.chomp
end

def valid_choice?(input)
  return true if VALID_CHOICES.include?(input)
  prompt("That's not a valid choice.")
end

def display_results(player, computer)
  if WIN_RULES[player].include?(computer)
    prompt("You win!")
  elsif WIN_RULES[computer].include?(player)
    prompt("You lose!")
  else
    prompt("It's a tie!")
  end
end

def return_winner(player, computer)
  if WIN_RULES[player].include?(computer)
    return 'player'
  elsif WIN_RULES[computer].include?(player)
    return 'computer'
  else
    return 'tie'
  end
end

def display_grand_winner(player_wins, computer_wins)
  prompt("Congratulations! You're the grand winner!") if player_wins == 3
  prompt("Sorry! Computer wins!") if computer_wins == 3
end

# Program start

player_win_count = 0
computer_win_count = 0

loop do
  prompt("Welcome to Rock, Paper, Scissors, Spock, Lizard!")
  prompt("The first player to win 3 rounds is the grand winner!")
  loop do
    choice = ''
    loop do
      choice = player_chooses
      break if valid_choice?(choice)
    end
    
    computer_choice = WIN_RULES.keys.sample
      
    prompt("You chose: #{choice}. Computer chose: #{computer_choice}")
    
    display_results(choice, computer_choice)
    
    winner = return_winner(choice, computer_choice)
    
    player_win_count += 1 if winner == 'player'
    computer_win_count += 1 if winner == 'computer'
    
    prompt("Your score: #{player_win_count}. Computer's score: #{computer_win_count}.")
    print "\n"
    
    display_grand_winner(player_win_count, computer_win_count)
    
    break if player_win_count == 3 || computer_win_count == 3
    
  end
  
  prompt("Would you like to play again?")
  answer = gets.chomp
  
  break if answer.downcase.start_with?('n')
end

prompt("Goodbye!")