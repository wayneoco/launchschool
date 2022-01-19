# =begin

# # Problem

# # Examples / Test Cases
# - Class and Method Structure
#   - class: `Element`
#     - instance methods:
#       - `initialize`
#         - arguments:
#           - integer
#           - object (next element)
#       - `datum`
#         - returns integer
#       - `tail?`
#       - `next`
#   - class: `SimpleLinkedList`
#     - instance methods:
#       - `initialize`
#         - no arguments
#       - `size`
#       - `empty?`
#       - `push`
#         - arguments:
#           - integer
#       - `peek`
#       - `head`
#       - `pop`
#       - `reverse`
#       - `to_a`
#     - class methods:
#       - `from_a`
#         - arguments: array

# =end


# class Element
#   attr_accessor :next
#   attr_reader :datum

#   def initialize(datum, next_el = nil)
#     @datum = datum
#     @next = next_el
#   end

#   def tail?
#     @next.nil?
#   end
# end

# class SimpleLinkedList
#   attr_reader :list

#   def initialize(data = [])
#     @list = data.nil? ? [] : data
#   end

#   def size
#     list.size
#   end

#   def empty?
#     list.empty?
#   end

#   def push(datum)
#     list.unshift(Element.new(datum))
#     list[0].next = list[1] unless list[0] == list[1]
#     list[-1].next = nil
#   end

#   def peek
#     return nil if list.empty?

#     e = list.to_enum
#     e.peek.datum
#   end

#   def head
#     list[0]
#   end

#   def pop
#     list.shift.datum
#   end

#   def to_a
#     list.each_with_object([]) { |el, array| array << el.datum }
#   end

#   def reverse
#     self.class.from_a(to_a.reverse)
#   end

#   def self.from_a(data)
#     return new(nil) if data.nil?

#     new_list = new
#     data.reverse.each { |el| new_list.push(el) }
#     new_list
#   end
# end

class Element
  attr_reader :datum, :next

  def initialize(datum, next_el = nil)
    @datum = datum
    @next = next_el
  end

  def tail?
    @next.nil?
  end
end

class SimpleLinkedList
  attr_accessor :head

  def size
    size = 0
    current_element = head
    while current_element
      size += 1
      current_element = current_element.next
    end
    size
  end

  def empty?
    head.nil?
  end

  def push(datum)
    element = Element.new(datum, head)
    self.head = element
  end

  def peek
    head.nil? ? nil : head.datum
  end

  def pop
    previous_head_datum = head.datum
    new_head = head.next
    self.head = new_head
    previous_head_datum
  end

  def self.from_a(data)
    return new if data.nil?

    list = new
    data.reverse.each { |el| list.push(el) }
    list
  end

  def to_a
    current_element = head
    array = []
    while current_element
      array << current_element.datum
      current_element = current_element.next
    end
    array
  end

  def reverse
    new_list = self.class.new
    current_element = head
    while current_element
      new_list.push(current_element.datum)
      current_element = current_element.next
    end
    new_list
  end
end

