class LawFirm
  attr_reader :name, :address, :phone, :employees

  def initialize(name, address, phone)
    @name = name
    @address = address
    @phone = phone
    @employees = []
  end

  def <<(input)
    employees << input
  end
end

class Employee
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

class Partner < Employee
  def initialize(name)
  end
end

class Associate < Employee; end

class Paralegal < Employee; end

firm = LawFirm.new('The Firm', '123 Main St., Disneyland, USA', '123-456-7890')
partner = Partner.new('Jane')
associate = Associate.new('Jim')
paralegal = Paralegal.new('Joe')

p partner

firm << partner
firm << associate
firm << paralegal
