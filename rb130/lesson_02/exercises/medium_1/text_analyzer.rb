class TextAnalyzer
  def process
    file = File.open('Lecture_Minitest.md')
    yield(file.read)
    file.close
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |file| puts "#{file.split(/\n\n/).size} paragraphs" }
analyzer.process { |file| puts "#{file.split(/\n/).size} lines" }
analyzer.process { |file| puts "#{file.split(' ').size} words" }

