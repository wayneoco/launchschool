# frozen_string_literal = true

def print_in_box(string)
  string = string.slice(0, 73).concat('...') if string.size > 76
  horizontal_rule = "+-#{'-' * string.size}-+"
  empty_line = "| #{' ' * string.size} |"

  puts horizontal_rule
  puts empty_line
  puts "| #{string} |"
  puts empty_line
  puts horizontal_rule
end

print_in_box('To boldly go where no one has gone before.')
print_in_box('To code or not to code, that is the question.')
print_in_box("To boldly go where no one has gone before. Unless it's a stinky bathroom that one would date not to enter.")
print_in_box('')

def print_in_box_alt1(string)
  partition_string(string) if string.size > 76
  horizontal_rule = "+-#{'-' * string.size}-+"
  empty_line = "| #{' ' * string.size} |"

  puts horizontal_rule
  puts empty_line
  puts "| #{string} |"
  puts empty_line
  puts horizontal_rule
end

def partition_string(string)
  separator = string[79]
  string, separator, string_overflow = string.partition(separator)
end

print_in_box_alt1('To boldly go where no one has gone before.')
print_in_box_alt1('To code or not to code, that is the question.')
print_in_box_alt1("To boldly go where no one has gone before. Unless it's a stinky bathroom that one would date not to enter.")
print_in_box_alt1('')
