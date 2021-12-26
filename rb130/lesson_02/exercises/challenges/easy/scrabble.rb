class Scrabble
  def initialize(tiles)
    @tiles = tiles
  end

  def score
    total_score = 0
    return total_score if @tiles.nil? || @tiles.empty? || @tiles.include?(' ')

    @tiles.chars.each do |char|
      total_score += tile_score(char.upcase)
    end
    total_score
  end

  def self.score(tiles)
    new(tiles).score
  end

  private

  def tile_score(tile)
    case tile
    when 'A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T' then 1
    when 'D', 'G'                                         then 2
    when 'B', 'C', 'M', 'P'                               then 3
    when 'F', 'H', 'V', 'W', 'Y'                          then 4
    when 'K'                                              then 5
    when 'J', 'X'                                         then 8
    else                                                       10
    end
  end
end
