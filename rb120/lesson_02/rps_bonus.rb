class Player
  attr_accessor :move, :name, :score

  def initialize
    set_name
  end
end

class Human < Player
  def set_name
    n = nil
    loop do
      puts "What's your name?"
      n = gets.chomp
      break unless n.empty?

      puts 'Sorry, must enter a value.'
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      puts 'Please choose rock, paper, scissors, spock or lizard:'
      choice = gets.chomp
      break if Move::VALUES.include? choice

      puts 'Sorry, invalid choice.'
    end
    self.move = Move.new(choice)
  end
end

class Computer < Player
  def set_name
    self.name = %w[R2D2 Hal Chappie Sonny Number_5].sample
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
  end
end

class Move
  VALUES = %w[rock paper scissors spock lizard].freeze

  def initialize(value)
    @value = value
  end

  def scissors?
    @value == 'scissors'
  end

  def rock?
    @value == 'rock'
  end

  def paper?
    @value == 'paper'
  end

  def spock?
    @value == 'spock'
  end

  def lizard?
    @value == 'lizard'
  end

  def >(other_move)
    rock? && other_move.scissors? ||
      rock? && other_move.lizard? ||
      paper? && other_move.rock? ||
      paper? && other_move.spock? ||
      scissors? && other_move.paper? ||
      scissors? && other_move.lizard? ||
      spock? && other_move.scissors? ||
      spock? && other_move.rock? ||
      lizard? && other_move.paper? ||
      lizard? && other_move.spock?

  end

  def <(other_move)
    rock? && other_move.paper? ||
      rock? && other_move.spock? ||
      paper? && other_move.scissors? ||
      paper? && other_move.lizard? ||
      scissors? && other_move.rock? ||
      scissors? && other_move.spock? ||
      spock? && other_move.paper? ||
      spock? && other_move.lizard? ||
      lizard? && other_move.rock? ||
      lizard? && other_move.scissors?
  end

  def to_s
    @value
  end
end

class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts 'Welcome to Rock, Paper, Scissors, Spock, Lizard!'
  end

  def display_goodbye_message
    puts 'Thanks for playing Rock, Paper, Scissors, Spock, Lizard. Good bye!'
  end

  def display_moves
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."
  end

  def display_winner
    if human.move > computer.move
      puts "#{human.name} won!"
    elsif human.move < computer.move
      puts "#{computer.name} won!"
    else
      puts "It's a tie!"
    end
  end

  def calculate_score
    if human.move > computer.move
      human.score += 1
    elsif human.move < computer.move
      computer.score += 1
    end
  end

  def display_score
    puts "The score is: #{human.name}: #{human.score}, #{computer.name}: #{computer.score}"
  end

  def calculate_grand_winner
    human.score > computer.score ? human.name : computer.name
  end

  def display_grand_winner
    puts "#{calculate_grand_winner} is the grand winner!"
  end

  def play_again?
    answer = nil
    loop do
      puts 'Would you like to play again? (y/n)'
      answer = gets.chomp
      break if %w[y n].include? answer.downcase

      puts 'Sorry, must be y or n.'
    end

    return true if answer == 'y'

    false
  end

  def play
    display_welcome_message

    loop do
      human.score = 0
      computer.score = 0
      loop do
        human.choose
        computer.choose
        display_moves
        display_winner
        calculate_score
        display_score
        break if human.score == 2 || computer.score == 2
      end
      calculate_grand_winner
      display_grand_winner
      break unless play_again?
    end
    display_goodbye_message
  end
end

RPSGame.new.play
