class InvalidToken < StandardError; end

class EmptyStack < StandardError; end

class Minilang
  VALID_COMMANDS = %w[PUSH ADD SUB MULT DIV MOD POP PRINT].freeze

  def initialize(program)
    @stack = []
    @register = 0
    @program = Program.new(program)
  end

  def eval
    program.send(:parse_string, self)
  end

  private

  attr_reader :program, :stack
  attr_accessor :register

  def validate_command(command)
    raise InvalidToken, "Invalid token: #{command}" unless
      VALID_COMMANDS.include?(command) || command == command.to_i.to_s
  end

  def validate_stack
    raise EmptyStack, 'Empty stack!' if stack.empty?
  end

  def n(value)
    self.register = value
  end

  def push
    stack << register
  end

  def add
    self.register += pop
  end

  def sub
    self.register -= pop
  end

  def mult
    self.register *= pop
  end

  def div
    self.register /= pop
  end

  def mod
    self.register %= pop
  end

  def pop
    validate_stack
    self.register = stack.pop
  rescue EmptyStack => e
    puts e
  end

  def print
    puts register
  end
end

class Program
  attr_reader :command_string

  def initialize(command_string)
    @command_string = command_string
  end

  def parse_string(minilang)
    command_string.split.each do |input|
      begin
        minilang.send(:validate_command, input)
      rescue InvalidToken => e
        puts e.message
      end
      send_command(minilang, input)
    end
  end

  def send_command(minilang, input)
    case input
    when /\A[-+]?\d+\z/          then minilang.send(:n, input.to_i)
    when 'PUSH'                  then minilang.send(:push)
    when 'ADD'                   then minilang.send(:add)
    when 'SUB'                   then minilang.send(:sub)
    when 'MULT'                  then minilang.send(:mult)
    when 'DIV'                   then minilang.send(:div)
    when 'MOD'                   then minilang.send(:mod)
    when 'POP'                   then minilang.send(:pop)
    when 'PRINT'                 then minilang.send(:print)
    end
  end
end

Minilang.new('PRINT').eval
# 0

Minilang.new('5 PUSH 3 MULT PRINT').eval
# 15

Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# 5
# 3
# 8

Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# 10
# 5

Minilang.new('5 PUSH POP POP PRINT').eval
# Empty stack!

Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# 6

Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# 12

Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# Invalid token: XSUB

Minilang.new('-3 PUSH 5 SUB PRINT').eval
# 8

Minilang.new('6 PUSH').eval
# (nothing printed; no PRINT commands)

Minilang.new('6 PUSH -+ TE-ST PRINT').eval
