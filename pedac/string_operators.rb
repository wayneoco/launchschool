=begin
### INPUT / OUTPUT
Input = String (word problem)
Output = Integer (result of mathematical operation)

### RULES
- Two operands
- Operands are either positive or negative integers
- Four possible operators: plus, minus, multiplied by, divided by
- Operators must be converted from Strings to arithmetic operators

### EXAMPLES / TEST CASES
- What is 5 plus 13?               => 18
- What is 7 minus 5?               => 2
- What is 33 divided by -3?        => -11
- What is -3 multiplied by 25?     => -75

### DATA STRUCTURE
- Input: String
- Output: Integer
- DS needed to get to result:
  - possibly a hash to convert arithmetic operators as string expressions
  to actual operators

### ALGORITHM
- Given a mathematical expression expressed as a String
- Match 3 expressions and assign to variables: first_operand, second_operand
and operator

=end

def match_variables(string)
  string.match(
    /\D+\s(-?\d+)\s(plus|minus|multiplied by|divided by)\s(-?\d+)/
  ).captures
end

def plus(variables)
  variables[0].to_i + variables[2].to_i
end

def minus(variables)
  variables[0].to_i - variables[2].to_i
end

def multiply(variables)
  variables[0].to_i * variables[2].to_i
end

def divide(variables)
  variables[0].to_i / variables[2].to_i
end

def fetch_equation(variables)
  case variables[1]
  when 'plus'
    plus(variables)
  when 'minus'
    minus(variables)
  when 'multiplied by'
    multiply(variables)
  else
    divide(variables)
  end
end

def calc_string(string)
  variables = match_variables(string)
  fetch_equation(variables)
end

puts calc_string('What is 5 plus 13?') == 18
puts calc_string('What is 7 minus 5?') == 2
puts calc_string('What is 33 divided by -3?') == -11
puts calc_string('What is -3 multiplied by 25?') == -75
