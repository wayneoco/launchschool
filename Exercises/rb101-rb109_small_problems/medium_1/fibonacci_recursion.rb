# frozen_string_literal: true

=begin
F1: 1
F2: 2
F3: 3
F4: 5
F5: 8

=end

def fibonacci(n)
  return n if n < 2

  fibonacci(n - 1) + fibonacci(n - 2)
end

p fibonacci(1) == 1
p fibonacci(2) == 1
p fibonacci(3) == 2
p fibonacci(4) == 3
p fibonacci(5) == 5
p fibonacci(12) == 144
p fibonacci(20) == 6765
