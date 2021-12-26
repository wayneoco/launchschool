require 'minitest/autorun'

class Boolean < MiniTest::Test
  def test_boolean
    value = 2
    assert(value.odd?, 'value is not odd')
  end
end
