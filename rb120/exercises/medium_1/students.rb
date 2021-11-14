class Student
  def initialize(name, year)
    @name = name
    @year = year
  end
end

class Graduate < Student
  def initialize(name, year, parking)
    super(name, year)
    @parking = parking
  end
end

class Undergraduate < Student
end

bob = Graduate.new('Bob', '2022', :yes)
stacy = Undergraduate.new('Stacy', '2023')
p bob
p stacy
