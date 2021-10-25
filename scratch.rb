class Vehicle
  def self.gas_mileage(gallons, miles)
    puts "#{miles / gallons} miles per gallon of gas"
  end

  def speed_up(number)
    @current_speed += number
    puts "You pushed the gas pedal and accelerated #{number} mph."
  end

  def brake(number)
    @current_speed -= number
    puts "You pushed the brake and decelerated #{number} mph."
  end

  def current_speed
    puts "Your current speed is #{@current_speed}."
  end

  def shut_down
    @current_speed = 0
    puts "Let's park this bad boy!"
  end

  def spray_paint
    puts "Hello. Thank you for visiting the Portland Body Shop."
    puts "What color would you like to paint your car?"
    new_color = gets.chomp

    self.color = new_color
    puts "Thank you! Your new car color is #{color}."
  end

  def to_s
    puts "Your car is a #{year} #{color} #{model}."
  end
end

class MyCar < Vehicle
  attr_accessor :color
  attr_reader :year, :model

  def initialize(year, color, model)
    super
    @year = year
    @color = color
    @model = model
    @current_speed = 0
  end
end

i3 = MyCar.new(2015, 'grey', 'i3')
puts i3
