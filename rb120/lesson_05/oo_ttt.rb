# frozen_string_literal:true

# rubocop:disable Style/Documentation

require 'pry'

module Display
  def display_welcome_message
    puts 'Welcome to Tic Tac Toe!'
    puts
  end

  def display_player_names
    clear
    puts "Hi, #{human.name}!"
    puts "Today you'll be playing against the computer, #{computer.name}."
    sleep 1
  end

  def display_first_player
    case first_player
    when human      then puts 'You move first.'
    when computer   then puts "#{computer.name} moves first."
    end
    sleep 1
  end

  def display_goodbye_message
    clear
    puts 'Thanks for playing Tic Tac Toe! Goodbye!'
  end

  def display_markers
    puts "You're a #{human.marker}. #{computer.name} is a #{computer.marker}."
    sleep 1
  end

  def display_round
    puts "#{human.name} vs. #{computer.name} - Round #{round.count}"
  end

  def display_board
    display_round
    puts
    board.draw
    puts
  end

  def clear_screen_and_display_board
    clear
    display_round
    puts
    board.draw
    puts
  end

  def display_result
    clear_screen_and_display_board

    case board.winning_marker
    when human.marker     then puts 'You won!'
    when computer.marker  then puts "#{computer.name} won!"
    else                       puts 'It\'s a tie!'
    end
  end

  def display_score
    puts "Your score: #{Win.human_wins}.\
         #{computer.name}'s score: #{Win.computer_wins}."
    sleep 2
  end

  def display_grand_winner
    case grand_winner
    when human     then puts 'You\'re the Grand Winner!'
    when computer  then puts "#{computer.name} is the Grand Winner!"
    end
    sleep 1
  end

  def display_play_again_message
    puts 'Let\'s play again!'
  end
end

module Format
  def joinor(array)
    case array.size
    when 0 then ''
    when 1 then array.first
    when 2 then "#{array[0]} or #{array[1]}"
    else
      array[-1] = "or #{array.last}"
      array.join(', ')
    end
  end
end

module Moves
  def player_move
    loop do
      current_player_moves
      break if board.someone_won? || board.full?

      clear_screen_and_display_board
    end
  end

  def current_player_moves
    case @current_marker
    when human.marker
      human_moves
      @current_marker = computer.marker
    when computer.marker
      computer_moves
      @current_marker = human.marker
    end
  end

  def human_moves
    puts "Choose a square: #{joinor(board.unmarked_keys)}"
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)

      puts 'Sorry, that\'s not a valid choice.'
    end

    board[square] = human.marker
  end

  def computer_moves
    winning_square = board.find_winning_square(computer.marker)
    at_risk_square = board.find_at_risk_square(human.marker)
    computer_choose_move(winning_square, at_risk_square)
  end

  def computer_choose_move(winning_square, at_risk_square)
    return computer_make_offensive_move(winning_square) unless winning_square.nil?
    return computer_make_defensive_move(at_risk_square) unless at_risk_square.nil?
    return computer_choose_center_square if board.squares[5].marker == ' '

    computer_make_random_move
  end

  def computer_make_offensive_move(winning_square)
    board[winning_square] = computer.marker
  end

  def computer_make_defensive_move(at_risk_square)
    board[at_risk_square] = computer.marker
  end

  def computer_choose_center_square
    board[5] = computer.marker
  end

  def computer_make_random_move
    board[board.unmarked_keys.sample] = computer.marker
  end
end

module Reset
  def reset_board
    board.reset
    @current_marker = first_player.marker
    clear
  end

  def reset_game
    display_play_again_message
    round.reset
    Win.reset_count
    reset_marker
    reset_first_player
  end

  def reset_marker
    choice = nil
    puts 'Would you like to switch your marker? (y/n)'
    loop do
      choice = gets.chomp.downcase
      break if %w[y n].include?(choice)

      puts 'Sorry, please enter \'y\' or \'n\'.'
    end
    swap_markers if choice == 'y'
    puts "You're a #{human.marker}. #{computer.name} is a #{computer.marker}."
    sleep 1
  end

  def reset_first_player
    choice = nil
    puts 'Would you like to change which player moves first too? (y/n)'
    loop do
      choice = gets.chomp.downcase
      break if %w[y n].include?(choice)

      puts 'Sorry, please enter \'y\' or \'n\'.'
    end
    return initialize_first_player if choice == 'y'

    puts "Okay, #{first_player.name} will move first again."
  end
end

class Board
  attr_reader :squares

  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                  [[1, 5, 9], [3, 5, 7]]              # diagnols

  def initialize
    @squares = {}
    reset
  end

  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/MethodLength
  def draw
    puts '     |     |'
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}"
    puts '     |     |'
    puts '-----+-----+-----'
    puts '     |     |'
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}"
    puts '     |     |'
    puts '-----+-----+-----'
    puts '     |     |'
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}"
    puts '     |     |'
  end
  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Metrics/MethodLength

  def []=(key, marker)
    @squares[key].marker = marker
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  # return winning marker or nil
  def winning_marker
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      return squares.first.marker if three_identical_markers?(squares)
    end
    nil
  end

  # return key for at risk square or nil
  def find_at_risk_square(human_marker)
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      marked_squares = squares.select(&:marked?)
      if marked_squares.size == 2 &&
         marked_squares.all? { |square| square.marker == human_marker }
        return @squares.key(@squares.values_at(*line).select(&:unmarked?).first)
      end
    end
    nil
  end

  # return key for winning square or nil
  def find_winning_square(computer_marker)
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      marked_squares = squares.select(&:marked?)
      if marked_squares.size == 2 &&
         marked_squares.all? { |square| square.marker == computer_marker }
        return @squares.key(@squares.values_at(*line).select(&:unmarked?).first)
      end
    end
    nil
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end

  private

  def three_identical_markers?(squares)
    markers = squares.select(&:marked?).map(&:marker)
    return false if markers.size != 3

    markers.min == markers.max
  end
end

class Square
  INITIAL_MARKER = ' '

  attr_accessor :marker

  def initialize(marker = INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    @marker
  end

  def marked?
    marker != INITIAL_MARKER
  end

  def unmarked?
    marker == INITIAL_MARKER
  end
end

class Player
  attr_reader :name, :player_type
  attr_accessor :marker

  COMPUTER_NAMES = %w[Ralph Madeline Benji Domino Banger Betsy].freeze

  def initialize(player_type)
    @player_type = player_type
    set_name
  end

  def human_choose_marker
    marker = nil
    puts 'Please choose your marker: X or O'
    loop do
      marker = gets.chomp.upcase
      break if %w[X O].include?(marker)

      puts 'Sorry, please choose either X or O.'
    end
    self.marker = marker
  end

  private

  attr_writer :name

  def set_name
    case player_type
    when :human     then self.name = set_human_name
    when :computer  then self.name = set_computer_name
    end
  end

  def set_human_name
    name = nil
    puts 'What\'s your name?'
    loop do
      name = gets.chomp
      break if /[\w+]/.match?(name)

      'Please enter your name.'
    end
    name.strip
  end

  def set_computer_name
    COMPUTER_NAMES.sample
  end
end

# create an object to track the current round number
class Round
  attr_reader :count

  def initialize
    @count = 0
  end

  def increment
    self.count += 1
  end

  def reset
    self.count = 0
  end

  private

  attr_writer :count
end

# create an object to track each 'win' and who the winner was
class Win
  attr_reader :winner

  @@win_count = []

  def initialize(winner)
    @winner = winner
    @@win_count << winner
  end

  def self.human_wins
    @@win_count.count { |winner| winner == :human }
  end

  def self.computer_wins
    @@win_count.count { |winner| winner == :computer }
  end

  def self.reset_count
    @@win_count = []
  end
end

# orchestration engine
class TTTGame
  include Display
  include Format
  include Moves
  include Reset

  attr_reader :board, :round, :human, :computer
  attr_accessor :first_player

  GRAND_WINNER_GOAL = 5

  def initialize
    @board = Board.new
    @round = Round.new
    @first_player = nil
  end

  def play
    clear
    display_welcome_message
    initialize_players
    initialize_markers
    initialize_first_player
    main_game
    display_goodbye_message
  end

  private

  def clear
    system 'clear'
  end

  def initialize_players
    set_players
    display_player_names
  end

  def initialize_markers
    choose_markers
    display_markers
  end

  def initialize_first_player
    choose_first_player
    display_first_player
    set_first_player_marker
  end

  def set_players
    @human = Player.new(:human)
    @computer = Player.new(:computer)
  end

  def choose_markers
    human.human_choose_marker
    computer.marker = if human.marker == 'X'
                        'O'
                      else
                        'X'
                      end
  end

  def choose_first_player
    choice = nil
    loop do
      puts "Which player will move first? (1: you, 2: #{computer.name} , 3: #{computer.name} decides)"
      choice = gets.chomp
      break if %w[1 2 3].include?(choice)

      puts "Sorry, please enter 1 (you), 2 (#{computer.name}) or 3 (to let #{computer.name} decide)."
    end
    self.first_player = player_choice(choice)
  end

  def player_choice(choice)
    case choice
    when '1'  then human
    when '2'  then computer
    when '3'  then [human, computer].sample
    end
  end

  def set_first_player_marker
    @current_marker = first_player.marker
  end

  def main_game
    loop do
      loop do
        play_round
        reset_board
        break if Win.human_wins == GRAND_WINNER_GOAL || Win.computer_wins == GRAND_WINNER_GOAL
      end
      display_grand_winner
      break unless play_again?

      reset_game
    end
  end

  def play_round
    clear
    round.increment
    display_board
    player_move
    display_result
    log_win
    display_score
  end

  def play_again?
    answer = nil
    loop do
      puts 'Would you like to play again? (y/n)'
      answer = gets.chomp.downcase
      break if %w[y n].include?(answer)

      puts 'Sorry, must be y or n.'
    end
    answer == 'y'
  end

  def log_win
    case board.winning_marker
    when human.marker    then winner = :human
    when computer.marker then winner = :computer
    end
    Win.new(winner)
  end

  def grand_winner
    Win.human_wins == GRAND_WINNER_GOAL ? human : computer
  end

  def swap_markers
    human.marker, computer.marker = computer.marker, human.marker
  end
end
# rubocop:enable Style/Documentation

game = TTTGame.new
game.play
