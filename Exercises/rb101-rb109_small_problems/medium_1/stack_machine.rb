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
    binding.pry
    case str
    when 'PUSH'   then stack << register
    when 'ADD'    then register += stack.pop unless stack.empty?
    when 'SUB'    then register -= stack.pop unless stack.empty?
    when 'MULT'   then register *= stack.pop unless stack.empty?
    when 'DIV'    then register /= stack.pop unless stack.empty?
    when 'MOD'    then register = register % stack.pop unless stack.empty?
    when 'POP'    then register = stack.pop unless stack.empty?
    when 'PRINT'  then puts register
    else               register = str.to_i
    end
    break puts 'Error: empty stack!' if stack.empty? && %w[ADD SUB MULT DIV MOD POP].include?(str)
  end
end

minilang('5 ADD PRINT')

minilang('3 PUSH 5 MOD PUSH 7 PUSH 4 PUSH 5 MULT PUSH 3 ADD PUSH POP SUB DIV PRINT')
# 8
