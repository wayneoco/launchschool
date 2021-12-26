require 'minitest/autorun'
require 'minitest/reporters'
MiniTest::Reporters.use!

class Assertions < MiniTest::Test
  def test_equality
    value = 'XYZ'
    assert_equal('xyz', value.downcase)
  end
end
