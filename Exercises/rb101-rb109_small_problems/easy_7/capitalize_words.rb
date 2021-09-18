def word_cap(string)
  string.split.map(&:capitalize).join(' ')
end

puts word_cap('four score and seven')     == 'Four Score And Seven'
puts word_cap('the javaScript language')  == 'The Javascript Language'
puts word_cap('this is a "quoted" word')  == 'This Is A "quoted" Word'

def word_cap_alt1(string)
  string.split.map do |word|
    word.downcase.sub!(word[0], word[0].upcase)
  end.join(' ')
end

puts word_cap_alt1('four score and seven')     == 'Four Score And Seven'
puts word_cap_alt1('the javaScript language')  == 'The Javascript Language'
puts word_cap_alt1('this is a "quoted" word')  == 'This Is A "quoted" Word'

def word_cap_alt2(string)
  string.split.map do |word|
    word.downcase.chars.map do |char|
      word.index(char) == 0 ? char.upcase : char
    end.join('')
  end.join(' ')
end

puts word_cap_alt2('four score and seven')     == 'Four Score And Seven'
puts word_cap_alt2('the javaScript language')  == 'The Javascript Language'
puts word_cap_alt2('this is a "quoted" word')  == 'This Is A "quoted" Word'

def word_cap_alt3(string)
  last = nil
  words = ''

  string.each_char do |char|
    last == ' ' || last == nil ? words << char.upcase : words << char.downcase
    last = char
  end

  words
end

puts word_cap_alt3('four score and seven')     == 'Four Score And Seven'
puts word_cap_alt3('the javaScript language')  == 'The Javascript Language'
puts word_cap_alt3('this is a "quoted" word')  == 'This Is A "quoted" Word'
