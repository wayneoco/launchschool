require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'todolist'

class TodoListTest < MiniTest::Test
  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todo4 = Todo.new("Do dishes")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(3, @list.size)
  end

  def test_first
    assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    assert_equal(@todo1, @list.shift)
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_pop
    assert_equal(@todo3, @list.pop)
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  def test_done?
    assert_equal(false, @list.done?)
  end

  def test_type_error
    assert_raises(TypeError) { @list.add(1) }
    assert_raises(TypeError) { @list.add('hello') }
    assert_raises(TypeError) { @list.add([]) }
    assert_raises(TypeError) { @list.add({}) }
  end

  def test_add
    @list.add(@todo4)
    assert_equal(@todo4, @list.last)
  end

  def test_add_alias
    @list.<<(@todo4)
    assert_equal(@todo4, @list.last)
  end

  def test_item_at
    assert_equal(@todo1, @list.item_at(0))
    assert_equal(@todo3, @list.item_at(2))
    assert_raises(IndexError) { @list.item_at(3) }
  end

  def test_mark_done_at
    assert_equal(@todo1.done!, @list.mark_done_at(0))
    assert_equal(@todo3.done!, @list.mark_done_at(2))
    assert_raises(IndexError) { @list.mark_done_at(100) }
  end

  def test_mark_undone_at
    assert_raises(IndexError) { @list.mark_undone_at(100) }
    @list.mark_done_at(0)
    @list.mark_undone_at(0)
    assert_equal(false, @todo1.done?)
    @list.mark_done_at(1)
    @list.mark_undone_at(1)
    assert_equal(false, @todo2.done?)
  end

  def test_done!
    @list.done!
    assert_equal(true, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
    assert_equal(true, @list.done?)
  end

  def test_remove_at
    assert_raises(IndexError) { @list.remove_at(100) }
    assert_equal(@todo1, @list.remove_at(0))
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_to_s
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_to_s_done
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    @list.mark_done_at(0)
    assert_equal(output, @list.to_s)
  end

  def test_to_s_all_done
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT

    @list.done!
    assert_equal(output, @list.to_s)
  end

  def test_each
    result = []
    @list.each { |todo| result << todo }
    assert_equal(@todos, result)
  end

  def test_each_return_value
    assert_equal(@list, @list.each { |todo| nil })
  end

  def test_select
    assert_equal([], @list.select(&:done?).to_a)
    @list.done!
    assert_equal(@list.done!.to_a, @list.select(&:done?).to_a)
  end

  def test_find_by_title
    assert_equal(@todo1, @list.find_by_title('Buy milk'))
    assert_nil(@list.find_by_title('Go home'))
  end

  def test_all_done
    @list.done!
    assert_equal(@list.to_a, @list.all_done.to_a)
  end

  def test_all_not_done
    assert_equal(@list.to_a, @list.all_not_done.to_a)
  end

  def mark_done
    assert_equal(true, @list.mark_done('Buy milk'))
  end

  def test_mark_all_done
    @list.mark_all_done
    @todo1.done!
    @todo2.done!
    @todo3.done!
    assert_equal([@todo1, @todo2, @todo3], @list.to_a)
  end

  def test_mark_all_undone
    @list.mark_all_done
    @list.mark_all_undone
    assert_equal([@todo1, @todo2, @todo3], @list.to_a)
  end
end

class TodoTest < MiniTest::Test
  def setup
    @todo1 = Todo.new('Buy milk')
    @todo2 = Todo.new('Clean room')
    @todo3 = Todo.new('Buy milk')
  end

  def test_done!
    @todo1.done!
    assert_equal(true, @todo1.done)
    assert_equal(false, @todo2.done)
  end

  def test_done?
    assert_equal(false, @todo1.done?)
    @todo2.done!
    assert_equal(true, @todo2.done)
  end

  def test_undone!
    @todo1.done!
    assert_equal(true, @todo1.done)
    @todo1.undone!
    assert_equal(false, @todo1.done)
  end

  def test_to_s
    output1 = "[X] Buy milk"
    @todo1.done!
    assert_equal(output1, @todo1.to_s)

    output2 = "[ ] Clean room"
    assert_equal(output2, @todo2.to_s)
  end

  def test_equality
    assert_equal(true, @todo1 == @todo3)
  end
end
