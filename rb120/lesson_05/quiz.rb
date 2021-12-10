class Car
  WHEELS = 4

  def wheels
    self.class::WHEELS
  end
end

class Motorcycle < Car
  WHEELS = 2
end

civic = Car.new
puts civic.wheels # => 4

bullet = Motorcycle.new
puts bullet.wheels # => 2
