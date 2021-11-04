=begin

Notes on RPS bonus features:

# Keeping Score

- added setter and getter methods for :score to the Player class
- then added the following methods to the RPSGame class:
  - calculate_score
  - display_score
  - calculate_grand_winner
  - display_grand_winner

# Adding Lizard and Spock

- added the relevant additions to the move choices, in addition to updating the rules

# Add a class for each move

- I don't think it would make sense to add each move as its own class.
- Each move would be a subclass of the Move class.
- However, the move class only has one state— the move name.

=end

class Computer < Player
  def set_name
    self.name = [@R2D2]

class R2d2
  def choose
    'rock'
  end
end

class Hal
  def choose
    %w[scissors scissors scissors scissors scissors rock spock spock spock lizard lizard lizard].sample
  end
end

class Chappie
  def choose
    %w[rock paper scissors].sample
  end
end

class Sonny
  def choose
    %w[paper paper paper paper paper rock rock scissors scissors spock spock lizard lizard].sample
  end
end

class Number5
  def choose
    %w[paper spock].sample
  end
end
