require 'minitest/autorun'
require 'minitest/reporters'
MiniTest::Reporters.use!

class Assertions < MiniTest::Test
  def test_equality
    value = nil
    assert_nil(value)
  end
end
