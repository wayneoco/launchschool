# frozen_string_literal: true

require 'pry'

SUITS = %w[Hearts Diamonds Clubs Spades].freeze
VALUES = %w[2 3 4 5 6 7 8 9 10 Jack Queen King Ace].freeze

def prompt(message)
  puts "=> #{message}"
end

def initialize_deck(suits, values)
  deck = []
  suits.each do |suit|
    values.each do |value|
      deck << [suit, value]
    end
  end
  deck
end

def deal_card(deck)
  card = deck.sample
  update_deck(card, deck)
  card
end

def update_deck(card, deck)
  deck.delete(card)
end

def deal_first_hand(deck)
  hand = []
  2.times { hand << deal_card(deck) }
  hand
end

def display_card(cards)
  prompt "The #{cards[-1][1]} of #{cards[-1][0]} was drawn.\r\n "
  sleep(1)
end

def display_player_cards(cards)
  prompt "Your hand is:\r\n "
  cards.each do |card|
    puts "   #{card[1]} of #{card[0]}"
  end
  print "\n"
  sleep(1)
end

def display_dealer_cards(cards, display = 'display_all')
  prompt "Dealer hand is:\r\n "
  cards.each_index do |index|
    puts "   #{cards[index][1]} of #{cards[index][0]}"
    break if display == 'display_one'
  end
  print "\n"
end

def player_hit_or_stay(deck, cards)
  loop do
    break if player_winner?(cards)

    prompt 'Please choose to Hit or stay?'
    answer = gets.chomp
    break if answer.downcase.start_with?('s')

    cards << deal_card(deck)
    display_card(cards)
    display_player_cards(cards)
    break if busted?(cards)
  end
end

def return_player_results(cards)
  return 'player' if player_winner?(cards)

  return 'dealer' if busted?(cards)

  'stay'
end

def display_player_results(cards)
  prompt "You hit 21. You win!\r\n " if return_player_results(cards) == 'player'
  prompt "That's a bust. You lose!\r\n " if return_player_results(cards) == 'dealer'
  prompt "You chose to stay.\r\n " if return_player_results(cards) == 'stay'
  sleep(1)
end

def dealer_hit_or_stay(deck, dealer_cards)
  display_dealer_cards(dealer_cards)
  loop do
    break if total(dealer_cards) == 21

    break prompt 'Dealer must stay.' if total(dealer_cards) > 17

    dealer_cards << deal_card(deck)
    display_card(dealer_cards)
    display_dealer_cards(dealer_cards)
    break if busted?(dealer_cards)
  end
end

def return_dealer_results(dealer_cards, player_cards)
  return 'dealer' if dealer_winner?(dealer_cards, player_cards)
  return 'player' unless dealer_winner?(dealer_cards, player_cards)
  return 'draw' if total(dealer_cards) == total(player_cards)
end

def display_final_score(dealer_cards, player_cards)
  prompt "Player: #{total(player_cards)}. Dealer: #{total(dealer_cards)}."
end

def display_winner(dealer_cards, player_cards)
  case return_dealer_results(dealer_cards, player_cards)
  when 'dealer' then prompt 'Dealer wins!'
  when 'player' then prompt 'You win!'
  when 'draw'   then prompt "It's a draw!"
  end
end

def busted?(cards)
  total(cards) > 21
end

def player_winner?(cards)
  total(cards) == 21
end

def dealer_winner?(dealer_cards, player_cards)
  (total(dealer_cards) > total(player_cards)) &&
    total(dealer_cards) <= 21 &&
    total(dealer_cards) != total(player_cards)
end

def total(cards)
  values = cards.map { |card| card[1] }

  sum = 0
  values.each do |value|
    next sum += 11 if value == 'Ace'

    next sum += 10 if value.to_i.zero?

    sum += value.to_i
  end
  sum = correct_total_for_aces(values, sum)
end

def correct_total_for_aces(values, sum)
  values.select { |value| value == 'Ace' }.count.times do
    sum -= 10 if sum > 21
  end
  sum
end

# Begin program

loop do
  deck = initialize_deck(SUITS, VALUES)

  player_cards = deal_first_hand(deck)
  dealer_cards = deal_first_hand(deck)

  display_player_cards(player_cards)

  display_dealer_cards(dealer_cards, 'display_one')

  player_hit_or_stay(deck, player_cards)

  display_player_results(player_cards)

  if return_player_results(player_cards) == 'stay'
    dealer_hit_or_stay(deck, dealer_cards)
    display_final_score(dealer_cards, player_cards)
    display_winner(dealer_cards, player_cards)
  end

  prompt 'Play again? (y/n)'
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end
