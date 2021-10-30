class Shelter
  attr_reader :pets, :pet

  def initialize
    @owners = {}
    @pets = []
  end

  def add_pet(pet)
    @pets << pet
  end

  def remove_pet(pet)
    @pets.delete(pet)
  end

  def adopt(owner, pet)
    owner.add_pet(pet)
    @owners[owner.name] ||= owner
    remove_pet(pet)
  end

  def print_adoptions
    @owners.each_pair do |name, owner|
      puts "#{name} has adopted the following pets:"
      owner.print_pets
      puts
    end
  end

  def print_pets
    puts "The Animal Shelter has the following unadopted pets:"
    puts pets
    puts
  end
end

class Pet
  attr_reader :animal, :name

  def initialize(animal, name, shelter)
    @animal = animal
    @name = name
    shelter.add_pet(self)
  end

  def to_s
    "a #{animal} named #{name}"
  end
end

class Owner
  attr_reader :name, :pets

  def initialize(name)
    @name = name
    @pets = []
  end

  def add_pet(pet)
    @pets << pet
  end

  def number_of_pets
    pets.size
  end

  def print_pets
    puts pets
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
asta         = Pet.new('dog', 'Asta', shelter)
laddie       = Pet.new('dog', 'Laddie', shelter)
fluffy       = Pet.new('cat', 'Fluffy', shelter)
kat          = Pet.new('cat', 'Kat', shelter)
ben          = Pet.new('cat', 'Ben', shelter)
chatterbox   = Pet.new('parakeet', 'Chatterbox', shelter)
bluebell     = Pet.new('parakeet', 'Bluebell', shelter)
vanessa      = Pet.new('cat', 'Vanessa', shelter)

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')
wolson  = Owner.new('W Olson')

shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)
shelter.adopt(wolson, vanessa)
shelter.print_adoptions
shelter.print_pets
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."
puts "#{wolson.name} has #{wolson.number_of_pets} adopted pets."
