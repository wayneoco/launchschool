class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def each
    todos.each { |todo| yield(todo) }
    self
  end

  def select
    new_list = TodoList.new('New List')
    each do |todo|
      new_list << todo if yield(todo)
    end
    new_list
  end

  def find_by_title(title)
    select { |todo| todo.title == title }.first
  end

  def all_done
    select { |todo| todo.done? }
  end

  def all_not_done
    select { |todo| !todo.done? }
  end

  def mark_done(title)
    find_by_title(title) && find_by_title(title).done!
  end

  def mark_all_done
    each { |todo| todo.done! }
  end

  def mark_all_undone
    each { |todo| todo.undone! }
  end

  def <<(object)
    raise TypeError, "Can only add Todo objects" unless valid_todo?(object)

    @todos << object #if valid_todo?(object)
    todos
  end
  alias add <<

  def valid_todo?(object)
    object.instance_of?(Todo)
  end

  def size
    todos.size
  end

  def first
    todos.first.title
  end

  def last
    todos.last.title
  end

  def to_a
    todos.map(&:title)
  end

  def done?
    todos.all?(&:done?)
  end

  def item_at(index)
    todos.fetch(index).title
  end

  def mark_done_at(index)
    item_at(index).done!
  end

  def mark_undone_at(index)
    item_at(index).undone!
  end

  def done!
    todos.each(&:done!)
  end

  def shift
    removed_item = todos.shift
    removed_item.title
  end

  def pop
    removed_item = todos.pop
    removed_item.title
  end

  def remove_at(index)
    removed_item = todos.delete_at(item_at(index))
    removed_item.title
  end

  def to_s
    puts "---- Today's Todos ----"
    each { |todo| puts todo }
  end

  protected

  attr_reader :todos
end

class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(otherTodo)
    title == otherTodo.title &&
      description == otherTodo.description &&
      done == otherTodo.done
  end
end


# given
todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)

# p list.find_by_title('Go to gym')
# p list.find_by_title('Go to gy')
# p list.all_done
# p list.all_not_done
# list.mark_done('Go to gym')
list.mark_all_done
puts list
