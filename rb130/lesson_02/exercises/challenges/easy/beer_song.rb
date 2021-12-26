class BeerSong
  def self.verse(verse_num)
    verse_output(verse_num)
  end

  def self.verses(starting_verse, ending_verse)
    verses = verse_output(starting_verse)
    (starting_verse - 1).downto(ending_verse) do |verse_num|
      verses.concat("\n#{verse_output(verse_num)}")
    end
    verses
  end

  def self.lyrics
    verses(99, 0)
  end

  class << self
    private

    def verse_output(verse_num)
      case verse_num
      when 0 then bottles_none
      when 1 then bottles_one
      when 2 then bottles_two
      else        bottles_three_plus(verse_num)
      end
    end

    def bottles_three_plus(verse_num)
      "#{verse_num} bottles of beer on the wall, #{verse_num} bottles of beer.\n" \
      "Take one down and pass it around, #{verse_num - 1} bottles of beer on the wall.\n"
    end

    def bottles_two
      "2 bottles of beer on the wall, 2 bottles of beer.\n" \
      "Take one down and pass it around, 1 bottle of beer on the wall.\n"
    end

    def bottles_one
      "1 bottle of beer on the wall, 1 bottle of beer.\n" \
      "Take it down and pass it around, no more bottles of beer on the wall.\n"
    end

    def bottles_none
      "No more bottles of beer on the wall, no more bottles of beer.\n" \
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    end
  end
end
