class Diamond
  def self.make_diamond(center_letter)
    letters = ('A'..center_letter).to_a
    rows = make_rows(letters)
    rows += rows[0..-2].reverse
    rows.map { |row| row.center(rows.size) }.join("\n") + "\n"
  end

  class << self
    private

    def make_rows(letters)
      spaces = 1
      letters.map do |letter|
        case letter
        when 'A' then row = 'A'
        else
          row = "#{letter}#{' ' * spaces}#{letter}"
          spaces += 2
        end
        row
      end
    end
  end
end

puts Diamond.make_diamond('A')
puts Diamond.make_diamond('B')
puts Diamond.make_diamond('C')
puts Diamond.make_diamond('E')
puts Diamond.make_diamond('Z')
