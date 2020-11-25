def stringy(int)
  string = '1'
  until string.size == int
    string << '0' unless string.size == int
    string << '1' unless string.size == int
  end
  string
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'
puts stringy(1) == '1'
puts stringy(12) == '101010101010'
puts

def stringy_alt1(size)
  numbers = []
  size.times do |index|
  number = index.even? ? 1 : 0
  numbers << number
  end
  numbers.join
end

puts stringy_alt1(6) == '101010'
puts stringy_alt1(9) == '101010101'
puts stringy_alt1(4) == '1010'
puts stringy_alt1(7) == '1010101'
puts stringy_alt1(1) == '1'
puts stringy_alt1(12) == '101010101010'
puts

def stringy_alt2(size, start=1)
  numbers = []
  size.times do |index|
    if start == 1
      number = index.even? ? 1 : 0
    elsif start == 0
      number = index.even? ? 0 : 1
    end
  numbers << number
  end
  numbers.join
end

puts stringy_alt2(6, 0) == '010101'
puts stringy_alt2(9) == '101010101'
puts stringy_alt2(4) == '1010'
puts stringy_alt2(7, 0) == '0101010'
puts stringy_alt2(1) == '1'
puts stringy_alt2(12) == '101010101010'
puts

def stringy_alt3(int)
  int % 2 == 1 ? "10" * (int/2) + "1" : "10" * (int/2)
end

puts stringy_alt3(6) == '101010'
puts stringy_alt3(9) == '101010101'
puts stringy_alt3(4) == '1010'
puts stringy_alt3(7) == '1010101'
puts stringy_alt3(1) == '1'
puts stringy_alt3(12) == '101010101010'
puts