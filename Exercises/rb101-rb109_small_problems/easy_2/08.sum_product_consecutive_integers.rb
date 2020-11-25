def valid_number?(int)
  int > 0
end

def valid_operator?(operator)
  operator == 's' || operator == 'p'
end

def get_integer
  loop do
    puts "Please enter an integer greater than 0:"
    answer = gets.chomp.to_i
    return answer if valid_number?(answer)
    puts "Sorry, that's not a valid number."
  end
end

def get_operator
  loop do
    puts "Enter 's' to compute the sum, 'p' to compute the product."
    answer = gets.chomp
    return answer if valid_operator?(answer)
    puts "Sorry, that's not a valid input."
  end
end

def calc_sum(int)
  (1..int).reduce(:+)
end

def display_sum(int, sum)
  puts "The sum of the integers between 1 and #{int} is #{sum}."
end

def calc_product(int)
  (1..int).reduce(:*)
end

def display_product(int, product)
  puts "The product of the integers between 1 and #{int} is #{product}."
end

# <--- START PROGRAM --->
int = get_integer
operator = get_operator
sum = calc_sum(int)
product = calc_product(int)

display_sum(int, sum) if operator == 's'

display_product(int, product) if operator == 'p'
