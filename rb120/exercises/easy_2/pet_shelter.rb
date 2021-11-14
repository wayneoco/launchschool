class Pet
  attr_reader :type, :name, :shelter

  def initialize(type, name, shelter)
    @type = type
    @name = name
    @shelter = shelter
    shelter.add_pet(self)
  end
end

class Owner
  attr_reader :name, :pets

  def initialize(name)
    @name = name
    @pets = []
  end

  def add_pet(pet)
    pets << pet
  end

  def number_of_pets
    pets.size
  end

  def print_pets
    pets.each { |pet| puts "a #{pet.type} named #{pet.name}" }
  end
end

class Shelter
  attr_reader :pets, :adoptions

  def initialize
    @pets = []
    @adoptions = {}
  end

  def add_pet(pet)
    pets << pet
  end

  def adopt(owner, pet)
    owner.add_pet(pet)
    adoptions[owner] ||= owner.pets
    pets.delete(pet)
  end

  def print_adoptions
    adoptions.each do |owner, pets|
      puts "#{owner.name} has adopted the following pets:"
      owner.print_pets
      puts ''
    end
  end

  def print_unadopted_pets
    puts 'The Animal Shelter has the following unadopted pets:'
    pets.each do |pet|
      puts "a #{pet.type} named #{pet.name}"
    end
    puts
  end
end

shelter = Shelter.new

butterscotch = Pet.new('cat', 'Butterscotch', shelter)
pudding      = Pet.new('cat', 'Pudding', shelter)
darwin       = Pet.new('bearded dragon', 'Darwin', shelter)
kennedy      = Pet.new('dog', 'Kennedy', shelter)
sweetie      = Pet.new('parakeet', 'Sweetie Pie', shelter)
molly        = Pet.new('dog', 'Molly', shelter)
chester      = Pet.new('fish', 'Chester', shelter)
vanessa      = Pet.new('cat', 'Vanessa', shelter)

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')
wolson  = Owner.new('W Olson')

shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(wolson, vanessa)
shelter.print_adoptions
shelter.print_unadopted_pets
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."
puts "#{wolson.name} has #{wolson.number_of_pets} adopted pets."
puts "The Animal Shelter has #{shelter.pets.size} unadopted pets."
