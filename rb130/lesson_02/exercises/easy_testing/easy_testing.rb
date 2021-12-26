require 'minitest/autorun'
require 'minitest/reporters'
MiniTest::Reporters.use!

class NoExperienceError < StandardError; end

class Employee
  def hire
    raise NoExperienceError
  end
end

class Assertions < MiniTest::Test
  def test_boolean
    value = 1
    assert(value.odd?, 'Value is not odd')
  end

  def test_equality
    value = 'XYZ'
    assert_equal('xyz', value.downcase)
  end

  def test_nil
    value = nil
    assert_nil(value)
  end

  def test_empty
    list = []
    assert_empty(list)
  end

  def test_includes
    list = [1, 2, 3]
    assert_includes(list, 2)
  end

  def test_exception
    employee = Employee.new
    assert_raises(NoExperienceError) { employee.hire }
  end

  def test_instance_of
    a = Numeric.new
    assert_instance_of(Numeric, a)
  end

  def test_kind_of
    assert_kind_of(Numeric, 1)
  end

  def test_same_object

end
