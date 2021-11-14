# frozen_string_literal:true

# rubocop:disable Style/Documentation

require 'pry'

module Clear
  def clear
    system 'clear'
  end
end

module Hand
  # 'hand' is an array of Card objects

  def show_hand(number_of_cards_to_show = hand.size)
    1.upto(number_of_cards_to_show) do |index|
      puts "=> #{hand[index - 1]}"
    end
  end

  def total
    faces = hand.map(&:face)
    total = faces.map do |face|
      case face
      when '2', '3', '4', '5', '6', '7', '8', '9', '10' then face.to_i
      when 'Jack', 'Queen', 'King'                      then 10
      when 'Ace'                                        then 11
      end
    end.sum
    adjust_total(faces, total)
  end

  def adjust_total(faces, total)
    faces.count('Ace').times do
      break if total <= 21

      total -= 10
    end
    total
  end

  def busted?
    total > 21
  end

  def twenty_one?
    total == 21
  end

  def tie?(other_partcipant)
    total == other_partcipant.total
  end

  def winning_total?(other_partcipant)
    total > other_partcipant.total && total < 21
  end
end

class Participant
  attr_accessor :name, :hand

  include Clear
  include Hand

  def initialize
    @hand = []
    set_name
  end

  def reset_hand
    self.hand = []
  end
end

class Player < Participant
  def set_name
    name = nil
    puts 'What\'s your name?'
    loop do
      name = gets.chomp
      break if /[\w+]/.match?(name)

      puts 'Sorry, please enter your name.'
    end
    self.name = name.strip
  end

  def choose_hit_or_stay
    puts 'Would you like to (h)it or (s)tay?'
    choice = nil
    loop do
      choice = gets.chomp.downcase
      break if %w[h s].include?(choice)

      puts 'Sorry, that\'s not a valid choice. Please choose to (h)it or (s)tay.'
    end
    choice
  end

  def choose_hit(deck)
    clear
    puts 'You chose to hit!'
    hand << deck.deal_card
    puts "You were dealt #{hand.last}. Your new total is #{total}."
    puts
    sleep 0.5
  end
end

class Dealer < Participant
  DEALER_NAMES = %w[Ralph Betty Ringo Betsy].freeze

  def set_name
    self.name = DEALER_NAMES.sample
  end

  def choose_hit_or_stay(deck)
    loop do
      choose_hit(deck)
      sleep 0.5
      break if busted? || twenty_one? || choose_stay?
    end
  end

  def choose_hit(deck)
    puts "#{name} hits..."
    hand << deck.deal_card
    puts "#{name} was dealt #{hand.last} for a new total of #{total}."
    sleep 0.5
  end

  def choose_stay?
    !busted? && !twenty_one? && total >= 17
  end
end

class Deck
  attr_accessor :cards

  def initialize
    @cards = []
    Card::SUITS.each do |suit|
      Card::FACES.each do |face|
        cards << Card.new(suit, face)
      end
    end
    scramble!
  end

  def scramble!
    cards.shuffle!
  end

  def deal_card
    cards.shift
  end

  def reset
    initialize
  end
end

class Card
  SUITS = %w[D H C S].freeze
  FACES = %w[2 3 4 5 6 7 8 9 10 J Q K A].freeze

  def initialize(suit, face)
    @suit = suit
    @face = face
  end

  def suit
    case @suit
    when 'D' then 'Diamonds'
    when 'H' then 'Hearts'
    when 'S' then 'Spades'
    when 'C' then 'Clubs'
    end
  end

  def face
    case @face
    when 'J' then 'Jack'
    when 'Q' then 'Queen'
    when 'K' then 'King'
    when 'A' then 'Ace'
    else          @face
    end
  end

  def to_s
    "the #{face} of #{suit}"
  end
end

class TwentyOne
  attr_reader :deck, :player, :dealer, :player_name, :dealer_name

  include Clear

  def initialize
    @deck = Deck.new
  end

  def display_welcome_message
    puts 'Welcome to Twenty One!'
    puts 'The player who gets closest to 21 without going over is the winner.'
    puts
  end

  def add_participants
    @player = Player.new
    @dealer = Dealer.new
    @player_name = player.name
    @dealer_name = dealer.name
  end

  def display_names
    clear
    puts "Hi, #{player_name}! Today you'll be playing against the dealer, #{dealer_name}."
    sleep 0.5
  end

  def deal_cards
    puts
    puts 'Dealing cards...'
    sleep 0.5
    2.times do
      player.hand << deck.deal_card
      dealer.hand << deck.deal_card
    end
  end

  def show_hands
    # 'show_hand' method takes an optional argument for number of cards to be shown
    # this enables the ability to show only 1 dealer card when the initial cards are revealed

    clear
    show_player_cards
    puts
    show_dealer_cards(1)
    puts
  end

  def show_player_cards
    puts "=== #{player_name}'s cards ==="
    player.show_hand
    puts "Total: #{player.total}"
  end

  def show_dealer_cards(number_of_cards_to_show = dealer.hand.size)
    puts "=== #{dealer_name}'s cards ==="
    dealer.show_hand(number_of_cards_to_show)
    puts number_of_cards_to_show == 1 ? 'and...?' : "Total: #{dealer.total}"
  end

  def player_turn
    choice = nil
    loop do
      choice = player.choose_hit_or_stay
      break if choice == 's'

      player.choose_hit(deck)
      break if player.twenty_one? || player.busted?

      show_player_cards
    end
    puts 'You chose to stay.' if choice == 's'
    sleep 0.5
  end

  def dealer_turn
    return if player_already_lost?

    clear
    puts "#{dealer_name}'s turn..."
    sleep 1
    loop do
      break if dealer.choose_stay? || dealer.busted? || dealer.twenty_one?

      dealer.choose_hit_or_stay(deck)
    end
    puts "#{dealer_name} stays..." if dealer.choose_stay?
  end

  def player_already_lost?
    player.busted? || player.twenty_one?
  end

  def display_result
    player_wins_messages if player_wins?
    dealer_wins_messages if dealer_wins?
    if player.tie?(dealer)
      puts
      show_player_cards
      puts
      show_dealer_cards
      puts
      puts 'It\'s a tie!'
    end
  end

  def player_wins?
    dealer.busted? ||
      player.twenty_one? ||
      player.winning_total?(dealer)
  end

  def player_wins_messages
    if dealer.busted?
      puts "#{dealer_name} busted! You win!"
    elsif player.twenty_one?
      puts 'You hit 21! You win!'
    elsif player.winning_total?(dealer)
      puts
      show_player_cards
      puts
      show_dealer_cards
      puts
      puts 'You win!'
    end
  end

  def dealer_wins?
    player.busted? ||
      dealer.twenty_one? ||
      dealer.winning_total?(player)
  end

  def dealer_wins_messages
    if player.busted?
      puts 'You busted! You lose!'
    elsif dealer.twenty_one?
      puts "#{dealer_name} hit 21! #{dealer_name} wins!"
    elsif dealer.winning_total?(player)
      puts
      show_player_cards
      puts
      show_dealer_cards
      puts
      puts "#{dealer_name} wins!"
    end
  end

  def play_again?
    choice = nil
    puts 'Would you like to play again? (y/n)'
    loop do
      choice = gets.chomp.downcase
      break if %w[y n].include?(choice)

      puts 'Sorry, please enter \'y\' or \'n\'.'
    end
    true unless choice == 'n'
  end

  def display_goodbye_message
    puts 'Thanks for playing 21! Goodbye!'
  end

  def reset_game
    deck.reset
    player.reset_hand
    dealer.reset_hand
  end

  def main_game_loop
    loop do
      deal_cards
      clear
      show_hands
      player_turn
      dealer_turn
      display_result
      break unless play_again?

      reset_game
    end
  end

  def start
    clear
    display_welcome_message
    add_participants
    display_names
    main_game_loop
    display_goodbye_message
  end
end

# rubocop:enable Style/Documentation

game = TwentyOne.new
game.start
