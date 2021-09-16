# frozen_string_literal: true

require 'pry'

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3, 4, 5], [6, 7, 8, 9, 10], [11, 12, 13, 14, 15]] + # rows
                [[16, 17, 18, 19, 20], [21, 22, 23, 24, 25]] + # rows
                [[1, 6, 11, 21, 26], [2, 7, 12, 17, 22], [3, 8, 13, 18, 23]] + # cols
                [[4, 9, 14, 19, 24], [5, 10, 15, 20, 25]] + # cols
                [[1, 7, 13, 19, 25], [5, 9, 13, 17, 26]] # diagonals

def prompt(msg)
  puts "=> #{msg}"
end

def who_goes_first
  system 'clear'
  answer = ''
  loop do
    prompt <<-MSG
    Please choose who will make the first move:
    1) Player
    2) Computer
    3) Let Computer decide
    MSG
    answer = gets.chomp.to_i
    break if [1, 2, 3].include?(answer)

    prompt "Sorry, that's not a valid choice. Please select 1, 2, or 3."
  end
  convert_first_player_choices(answer)
end

def convert_first_player_choices(input)
  case input
  when 1 then 'Player'
  when 2 then 'Computer'
  else        'comp_choice'
  end
end

# rubocop: disable Metrics/MethodLength, Metrics/AbcSize
def display_board(brd)
  system 'clear'
  puts ''
  puts '     |     |     |     |'
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}  |  #{brd[4]}  |  #{brd[5]}"
  puts '     |     |     |     |'
  puts '-----+-----+-----+-----+-----'
  puts '     |     |     |     |'
  puts "  #{brd[6]}  |  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}  |  #{brd[10]}"
  puts '     |     |     |     |'
  puts '-----+-----+-----+-----+-----'
  puts '     |     |     |     |'
  puts "  #{brd[11]}  |  #{brd[12]}  |  #{brd[13]}  |  #{brd[14]}  |  #{brd[15]}"
  puts '     |     |     |     |'
  puts '-----+-----+-----+-----+-----'
  puts '     |     |     |     |'
  puts "  #{brd[16]}  |  #{brd[17]}  |  #{brd[18]}  |  #{brd[19]}  |  #{brd[20]}"
  puts '     |     |     |     |'
  puts '-----+-----+-----+-----+-----'
  puts '     |     |     |     |'
  puts "  #{brd[21]}  |  #{brd[22]}  |  #{brd[23]}  |  #{brd[24]}  |  #{brd[25]}"
  puts '     |     |     |     |'
  puts ''
end
# rubocop: enable Metrics/MethodLength, Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..25).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def joinor(squares, separator = ', ', conjunction = 'or')
  case squares.size
  when 1 then squares.first
  when 2 then squares.join(" #{conjunction} ")
  else
    squares[-1] = "#{conjunction} #{squares.last}"
    squares.join(separator)
  end
end

def place_piece!(brd, player)
  player_places_piece!(brd) if player == 'Player'
  computer_places_piece!(brd) if player == 'Computer'
end

def alternate_player(player)
  return 'Player' if player == 'Computer'
  return 'Computer' if player == 'Player'
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square: #{joinor(empty_squares(brd))}"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)

    prompt "Sorry, that's not a valid choice."
  end
  brd[square] = PLAYER_MARKER
end

def find_at_risk_square(line, board, marker)
  if board.values_at(*line).count(marker) == 4
    board.select { |k, v| line.include?(k) && v == INITIAL_MARKER }.keys.first
  end
end

def computer_places_piece!(brd)
  square = nil

  # offense
  WINNING_LINES.each do |line|
    square = find_at_risk_square(line, brd, COMPUTER_MARKER)
    break if square
  end

  # defense
  unless square
    WINNING_LINES.each do |line|
      square = find_at_risk_square(line, brd, PLAYER_MARKER)
      break if square
    end
  end

  # pick the center square
  square = 13 if brd[13] == ' '

  # just pick a square
  square ||= empty_squares(brd).sample

  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def winner?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    return 'Player' if brd.values_at(*line).count(PLAYER_MARKER) == 5
    return 'Computer' if brd.values_at(*line).count(COMPUTER_MARKER) == 5
  end
  nil
end

def display_winner(brd)
  if winner?(brd)
    prompt "#{detect_winner(brd)} won!"
  else
    prompt "It's a tie!"
  end
end

def display_score(player_score, computer_score)
  prompt "The score is: Player: #{player_score}, Computer: #{computer_score}"
  sleep(1)
end

def display_grand_winner(player_scr, computer_scr)
  return prompt 'Player is the Grand Winner!' if player_scr == 5
  return prompt 'Computer is the Grand Winner!' if computer_scr == 5
end

# Begin program

loop do
  first_player = who_goes_first
  first_player = %w[Player Computer].sample if first_player == 'comp_choice'

  prompt "#{first_player} will go first."
  sleep(1)

  player_score = 0
  computer_score = 0
  loop do
    board = initialize_board
    current_player = first_player
    display_board(board)
    loop do
      place_piece!(board, current_player)
      display_board(board)
      current_player = alternate_player(current_player)
      break if winner?(board) || board_full?(board)
    end

    display_winner(board)
    sleep(1)

    player_score += 1 if detect_winner(board) == 'Player'
    computer_score += 1 if detect_winner(board) == 'Computer'

    display_score(player_score, computer_score)

    if player_score == 5 || computer_score == 5
      display_grand_winner(player_score, computer_score)
      sleep(1)
      break
    end
  end
  prompt 'Play again? (y/n)'
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt 'Thanks for playing Tic Tac Toe. Goodbye!'
