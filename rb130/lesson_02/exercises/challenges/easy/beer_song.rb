class BeerSong
  def self.verse(verse)
    generate_verse(verse)
  end

  def self.verses(first, last)
    verses = (last..first).to_a.reverse
    verses.map do |verse|
      generate_verse(verse)
    end.join("\n")
  end

  def self.lyrics
    verses(99, 0)
  end

  class << self
    private

    def generate_verse(verse)
      case verse
      when 0
        "No more bottles of beer on the wall, no more bottles of beer.\n" \
        "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
      when 1
        "1 bottle of beer on the wall, 1 bottle of beer.\n" \
        "Take it down and pass it around, no more bottles of beer on the wall.\n"
      when 2
        "2 bottles of beer on the wall, 2 bottles of beer.\n" \
        "Take one down and pass it around, 1 bottle of beer on the wall.\n"
      else
        "#{verse} bottles of beer on the wall, #{verse} bottles of beer.\n" \
        "Take one down and pass it around, #{verse - 1} bottles of beer on the wall.\n"
      end
    end
  end
end
