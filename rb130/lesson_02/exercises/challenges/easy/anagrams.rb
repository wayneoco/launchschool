class Anagram
  def initialize(word)
    @word = word.downcase
  end

  def match(test_words)
    test_words.select do |word|
      next if @word == word.downcase

      @word.chars.sort == word.downcase.chars.sort
    end
  end
end
