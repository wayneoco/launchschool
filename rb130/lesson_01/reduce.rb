class Employee
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def work
    "My name is #{name}, and I #{self.class::WORK}."
  end
end

class Manager < Employee
  WORK = 'mange employees'
end

class Server < Employee
  WORK = 'server guests'
end

class Host < Employee
  WORK = 'seat guests'
end

employees = [Manager.new('Jane'), Server.new('Steve'), Host.new('Benji')]
employees.each { |employee| puts employee.work }
