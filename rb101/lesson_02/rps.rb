VALID_CHOICES = ['rock', 'paper', 'scissors']

def prompt(message)
  puts("=> #{message}")
end

def win?(first, second)
  (first == 'rock' && second == 'scissors') ||
    (first == 'paper' && second == 'rock') ||
    (first == 'scissors' && second == 'paper')
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

loop do
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = gets.chomp.downcase

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = ['rock', 'paper', 'scissors'].sample.downcase

  puts("You chose: #{choice}; Computer chose: #{computer_choice}")

  display_results(choice, computer_choice)

  play_again = ''
  loop do
    prompt("Would you like to play again?")
    play_again = gets.chomp.downcase
    break unless !['yes', 'y', 'no', 'n'].include?(play_again)
    prompt("That's not a valid choice.")
  end

  break unless ['yes', 'y'].include?(play_again)
end

prompt("Thanks for playing!")
