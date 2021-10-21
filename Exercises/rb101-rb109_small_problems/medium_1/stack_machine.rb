# frozen_string_literal: true

=begin

# PROBLEM
- input: string
- output: two arrays of integers

- explicit rules
  - n

# DATA STRUCTURES
- arrays

# ALGORITHM

- Given a string that contains both string commands and numerical values:
  - initialize register with value 0
  - extract COMMAND words and assign to a variable
  - extract NUMERICAL values and assign to a variable
  - execute command
  -return
=end

require 'pry'

def minilang(string)
  stack = []
  register = 0
  string.split.each do |str|
    case str
    when 'PUSH'   then stack << register
    when 'ADD'    then register += stack.pop
    when 'SUB'    then register -= stack.pop
    when 'MULT'   then register *= stack.pop
    when 'DIV'    then register /= stack.pop
    when 'MOD'    then register = register % stack.pop
    when 'POP'    then register = stack.pop
    when 'PRINT'  then puts register
    else               register = str.to_i
    end
  end
end

minilang('PRINT')
# 0

minilang('5 PUSH 3 MULT PRINT')
# 15

minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# 5
# 3
# 8

minilang('5 PUSH POP PRINT')
# 5

minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# 5
# 10
# 4
# 7

minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# 6

minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# 12

minilang('-3 PUSH 5 SUB PRINT')
# 8

minilang('6 PUSH')
# (nothing printed; no PRINT commands)
