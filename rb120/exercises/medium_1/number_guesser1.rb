class Player
  def guess_number(valid_numbers)
    guess = nil
    loop do
      print "Enter a number between #{valid_numbers.first} and #{valid_numbers.last}: "
      guess = gets.chomp.to_i
      break if valid_numbers.include?(guess)

      puts 'Invalid guess. Enter a number between 1 and 100.'
    end
    guess
  end
end

class GuessingGame
  VALID_NUMBERS = (1..100)
  MAX_GUESSES = 7

  def initialize
    @player = Player.new
  end

  def play
    new_game
    loop do
      display_remaining_guesses
      player_guess
      display_result
      adjust_remaining_guesses
      break if result == :win || remaining_guesses.zero?
    end
    display_end_of_game_message
  end

  private

  attr_reader :player, :number
  attr_accessor :remaining_guesses, :guess, :result

  def new_game
    @number = rand(VALID_NUMBERS)
    @remaining_guesses = MAX_GUESSES
    @result = nil
  end

  def display_remaining_guesses
    guesses = remaining_guesses > 1 ? "#{remaining_guesses} guesses" : "1 guess"
    puts "You have #{guesses} remaining."
  end

  def player_guess
    self.guess = player.guess_number(VALID_NUMBERS)
  end

  def display_result
    case guess <=> number
    when -1
      puts "Your guess is too low.\n\n"
      self.result = :lose
    when 1
      puts "Your guess is too high.\n\n"
      self.result = :lose
    else
      puts 'That\'s the number!'
      self.result = :win
    end
  end

  def adjust_remaining_guesses
    self.remaining_guesses -= 1
  end

  def display_end_of_game_message
    case result
    when :lose
      puts 'You have no more guesses. You lost!'
      puts "The winning number was... #{number}!"
    when :win
      puts 'You won!'
    end
  end
end

game = GuessingGame.new
game.play
