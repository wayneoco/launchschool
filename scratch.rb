class Scrabble
  def initialize(word)
    @word = word
    @score = 0
  end

  def score
    return 0 if @word.nil?

    @word.upcase.chars.each do |letter|
      case letter
      when 'A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T' then @score += 1
      when 'D', 'G'                                         then @score += 2
      when 'B', 'C', 'M', 'P'                               then @score += 3
      when 'F', 'H', 'V', 'W', 'Y'                          then @score += 4
      when 'K'                                              then @score += 5
      when 'J', 'X'                                         then @score += 8
      when 'Q', 'Z'                                         then @score += 10
      end
    end
    @score
  end

  def self.score(word)
    new(word).score
  end
end
