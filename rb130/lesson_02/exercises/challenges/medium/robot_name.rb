class Robot
  @@names = []

  def initialize
    @name
  end

  def name
    loop do
      @name = random_name
      break unless self.class.names.include?(@name)
    end
    self.class.names << @name
    @name
  end

  def reset
    self.class.remove_name(@name)
    name
  end

  def self.names
    @@names
  end

  def self.remove_name(name)
    names.delete(name)
  end

  def random_name
    ('A'..'Z').to_a.sample(2).join + rand(100..999).to_s
  end
end

r2 = Robot.new
r2.name
matthew = Robot.new
matthew.name
p Robot.names
r2.reset
p Robot.names
