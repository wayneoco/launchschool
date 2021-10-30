class Animal
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def walk
    puts "#{name} #{gait} forward"
  end
end

class Person < Animal
  private

  def gait
    "strolls"
  end
end

class Noble < Person
  attr_reader :title

  def initialize(name, title)
    @name = "#{title} #{name}"
    super(@name)
    @title = title
  end

  private

  def gait
    "struts"
  end
end

class Cat < Animal
  private

  def gait
    "saunters"
  end
end

class Cheetah < Cat
  private

  def gait
    "runs"
  end
end

mike = Person.new('Mike')
mike.walk
# => 'Mike strolls forward'

byron = Noble.new('Byron', 'Lord')
byron.walk

kitty = Cat.new('Kitty')
kitty.walk
# => 'Kitty saunters forward'

flash = Cheetah.new('Flash')
flash.walk
# => 'Flash runs forward'
