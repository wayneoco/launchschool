# frozen_string_literal: false

# rubocop:disable Style/Documentation

module ComputerPersonality
  class Personalities
    attr_reader :name

    def initialize(name)
      @name = name
    end
  end

  class R2d2 < Personalities
    def choice
      %w[rock].sample
    end
  end

  class Hal < Personalities
    def choice
      %w[scissors scissors scissors scissors scissors rock spock spock spock lizard lizard lizard].sample
    end
  end

  class Chappie < Personalities
    def choice
      %w[rock paper scissors].sample
    end
  end

  class Sonny < Personalities
    def choice
      %w[paper paper paper paper paper rock rock scissors scissors spock spock lizard lizard].sample
    end
  end

  class Number5 < Personalities
    def choice
      %w[paper spock].sample
    end
  end
end

module Move
  VALUES = %w[rock paper scissors spock lizard].freeze

  class Moves
    attr_reader :name, :winning_moves

    def initialize(choice)
      @name = choice
    end

    def winner?(opponent)
      winning_moves.include?(opponent.name)
    end

    def to_s
      @name
    end
  end

  class Rock < Moves
    def initialize(choice)
      super
      @winning_moves = %w[scissors lizard]
    end
  end

  class Paper < Moves
    def initialize(choice)
      super
      @winning_moves = %w[rock spock]
    end
  end

  class Scissors < Moves
    def initialize(choice)
      super
      @winning_moves = %w[paper lizard]
    end
  end

  class Spock < Moves
    def initialize(choice)
      super
      @winning_moves = %w[rock scissors]
    end
  end

  class Lizard < Moves
    def initialize(choice)
      super
      @winning_moves = %w[spock paper]
    end
  end
end

class Player
  attr_accessor :move, :name, :score, :history

  def initialize
    set_name
    @score = 0
    @history = []
  end

  def set_move(choice)
    case choice
    when 'rock'     then Move::Rock.new(choice)
    when 'paper'    then Move::Paper.new(choice)
    when 'scissors' then Move::Scissors.new(choice)
    when 'spock'    then Move::Spock.new(choice)
    when 'lizard'   then Move::Lizard.new(choice)
    end
  end

  def update_history
    history << move.name
  end
end

class Human < Player
  def set_name
    n = nil
    loop do
      system('clear')
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
    self.move = set_move(choice)
  end
end

class Computer < Player
  attr_accessor :personality

  def initialize
    super
    set_personality
  end

  def set_name
    self.name = %w[R2D2 Hal Chappie Sonny Number5].sample
  end

  # rubocop:disable Metrics/AbcSize
  def set_personality
    case name
    when 'R2D2'     then self.personality = ComputerPersonality::R2d2.new(name)
    when 'Hal'      then self.personality = ComputerPersonality::Hal.new(name)
    when 'Chappie'  then self.personality = ComputerPersonality::Chappie.new(name)
    when 'Sonny'    then self.personality = ComputerPersonality::Sonny.new(name)
    when 'Number5'  then self.personality = ComputerPersonality::Number5.new(name)
    end
  end

  def choose
    case personality.name
    when 'R2D2'     then self.move = set_move(personality.choice)
    when 'Hal'      then self.move = set_move(personality.choice)
    when 'Chappie'  then self.move = set_move(personality.choice)
    when 'Sonny'    then self.move = set_move(personality.choice)
    when 'Number5'  then self.move = set_move(personality.choice)
    end
  end
  # rubocop:enable Metrics/AbcSize
end

class RPSGame
  attr_accessor :game_count, :history, :human_move, :computer_move, :human_history, :computer_history
  attr_reader :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
    @game_count = 1
    @history = []
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors, Spock, Lizard, #{human.name}!"
    puts 'The first player to reach 5 wins will be the Grand Winner!'
  end

  def display_goodbye_message
    puts '====='
    puts 'Thanks for playing Rock, Paper, Scissors, Spock, Lizard. Good bye!'
    puts '====='
  end

  def choose_moves
    self.human_move = human.choose
    self.computer_move = computer.choose
  end

  def display_moves
    puts '====='
    puts "#{human.name} chose #{human_move}."
    puts "#{computer.name} chose #{computer_move}."
  end

  def display_winner
    return puts "=> It's a tie!" if human_move.name == computer_move.name

    winner = human.name if human_move.winner?(computer_move)
    winner = computer.name if computer_move.winner?(human_move)
    puts "=> #{winner} won!"
  end

  def calculate_score
    human.score += 1 if human_move.winner?(computer_move)
    computer.score += 1 if computer_move.winner?(human_move)
  end

  def display_score
    puts '====='
    puts "The score is: #{human.name}: #{human.score}, #{computer.name}: #{computer.score}"
    puts '====='
  end

  def update_move_history
    self.human_history = human.update_history
    self.computer_history = computer.update_history
  end

  def display_move_history
    answer = nil
    loop do
      puts "Would you like to see each player's move history? (y/n)"
      answer = gets.chomp.downcase
      break if %w[y n].include? answer

      puts 'Sorry, must be y or n.'
    end
    return if answer.start_with? 'n'

    puts "#{human.name}'s move history: #{human_history.inspect}"
    puts "#{computer.name}'s move history: #{computer_history.inspect}"
  end

  def determine_grand_winner
    human.score > computer.score ? human.name : computer.name
  end

  def display_grand_winner
    puts "=> #{determine_grand_winner} is the grand winner!"
  end

  def play_again?
    answer = nil
    loop do
      puts 'Would you like to play again? (y/n)'
      answer = gets.chomp
      break if %w[y n].include? answer.downcase

      puts 'Sorry, must be y or n.'
    end
    self.game_count += 1
    return true if answer == 'y'

    false
  end

  def game_loop
    loop do
      choose_moves
      display_moves
      display_winner
      calculate_score
      display_score
      update_move_history
      break if human.score == 3 || computer.score == 3
    end
  end

  def grand_winner
    determine_grand_winner
    display_grand_winner
  end

  def reset_scores
    human.score = 0
    computer.score = 0
  end

  def play
    display_welcome_message
    loop do
      game_loop
      grand_winner
      reset_scores
      break unless play_again?

      system('clear')
    end
    display_move_history
    display_goodbye_message
  end
end
# rubocop:enable Style/Documentation

RPSGame.new.play
