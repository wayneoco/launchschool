# frozen_string_literal: true

SUITS = %w[Hearts Diamonds Clubs Spades].freeze
VALUES = %w[2 3 4 5 6 7 8 9 10 Jack Queen King Ace].freeze

def prompt(message)
  puts "=> #{message}"
end

def welcome
  prompt 'Welcome to 21!'
end

def display_card(cards)
  prompt "#{cards[-1]} was drawn."
  sleep(1)
end

def display_player_cards(cards)
  prompt "Your hand is #{cards} for a total of #{total(cards)}."
  sleep(1)
end

def display_dealer_cards(cards, display = :display_all)
  display == :display_one ? hand = [cards[0]] : hand = cards
  prompt "Dealer hand is #{hand} for a total of #{total(hand)}."
  sleep(1)
end

def player_hit_or_stay(deck, cards)
  loop do
    answer = nil
    loop do
      prompt 'Would you like to (h)it or (s)tay?'
      answer = gets.chomp
      break if answer.downcase.start_with?('h', 's')

      prompt "Sorry, please enter 'h' or 's'."
    end
    break if answer.downcase.start_with?('s')

    cards << deck.pop
    display_card(cards)
    display_player_cards(cards)
    break if busted?(cards)
  end
end

def display_player_results(cards)
  prompt "That's a bust. You lose!" if busted?(cards)
  prompt 'You chose to stay.' unless busted?(cards)
  sleep(1)
end

def dealer_hit_or_stay(deck, cards)
  display_dealer_cards(cards)
  loop do
    break if total(cards) == 21

    break prompt 'Dealer must stay.' if total(cards) > 17

    dealer_cards << deck.pop
    display_card(cards)
    display_dealer_cards(cards)
    break if busted?(cards)
  end
end

def return_dealer_results(dealer_cards, player_cards)
  return :draw if total(dealer_cards) == total(player_cards)
  return :dealer if dealer_winner?(dealer_cards, player_cards)
  return :player unless dealer_winner?(dealer_cards, player_cards)
end

def display_final_score(dealer_cards, player_cards)
  prompt "Player: #{total(player_cards)}. Dealer: #{total(dealer_cards)}."
end

def display_winner(dealer_cards, player_cards)
  case return_dealer_results(dealer_cards, player_cards)
  when :dealer then prompt 'Dealer wins!'
  when :player then prompt 'You win!'
  when :draw   then prompt "It's a draw!"
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

def play_again?
  answer = nil
  loop do
    prompt 'Play again? (y)es or (n)o'
    answer = gets.chomp
    break if answer.downcase.start_with?('y', 'n')

    prompt 'Sorry, please answer (y)es or (n)o.'
  end
  answer
end

# Begin program

loop do
  welcome

  deck = SUITS.produce(VALUES).shuffle

  player_cards = 2.times { hand << deck.pop }
  dealer_cards = 2.times { hand << deck.pop }

  display_player_cards(player_cards)

  display_dealer_cards(dealer_cards, :display_one)

  player_hit_or_stay(deck, player_cards)

  display_player_results(player_cards)

  unless busted?(player_cards)
    dealer_hit_or_stay(deck, dealer_cards)
    display_final_score(dealer_cards, player_cards)
    display_winner(dealer_cards, player_cards)
  end

  break if play_again?.start_with?('n')
end

prompt 'Thanks for playing! Goodbye!'
