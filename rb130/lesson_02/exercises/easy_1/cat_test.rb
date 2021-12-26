require 'minitest/autorun'

require_relative 'cat'

class CatTest < MiniTest::Test
  def setup
    @kitty = Cat.new('Kitty')
  end

  def test_miaow
    assert_match(/ is miaowing\./, @kitty.miaow)
  end
end
