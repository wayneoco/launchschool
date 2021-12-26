require 'minitest/autorun'
require 'minitest/reporters'
MiniTest::Reporters.use!

require_relative 'swap_letters'

class TextTest < MiniTest::Test
  def setup
    @file = File.open('sample.txt')
  end

  def test_swap
    @text = Text.new(@file.read)
    expected_output = File.read('sample.txt').gsub('a', 'e')
    assert_equal(expected_output, @text.swap('a', 'e'))
  end

  def test_word_count
    @text = Text.new(@file.read)
    expected_output = File.read('sample.txt').split.count
    assert_equal(72, @text.word_count)
  end

  def teardown
    @file.close
  end
end
