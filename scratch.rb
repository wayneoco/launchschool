=begin

# Problem

- Three classes: Pet, Owner, Shelter
- No inheritance
- Create Pet object with two arguments, animal and color.
- Create Owner object with one argument, name.
- Create Shelter object with no arguments.
- Shelter class has two methods:
  - `adopt` that takes two arguments:
    - owner, pet
  - `print_adoptions` with no arguments that outputs the following:
    - {Owner} has adopted:
      - {animal} named {name}
      - {animal} named {name}


=end

class Pet
  attr_reader :animal, :name

  def initialize(animal, name)
    @animal = animal
    @name = name
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
end

class Shelter
  def initialize
    @owners = {}
  end

  def adopt(owner, pet)
    owner.add_pet(pet)
    @owners[owner.name] ||= owner
end

butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter = Shelter.new

puts "#{butterscotch.name} is a #{butterscotch.animal}."
puts phanson.name
