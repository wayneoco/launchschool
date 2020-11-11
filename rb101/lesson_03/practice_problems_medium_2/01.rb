def fun_with_ids
    a_outer = 42
    b_outer = "forty two"
    c_outer = [42]          # array with numeric element 42
    d_outer = c_outer[0]    # => element at c_outer index 0, which is 42
  
    a_outer_id = a_outer.object_id      # => 85
    b_outer_id = b_outer.object_id      # => 180
    c_outer_id = c_outer.object_id      # => 200
    d_outer_id = d_outer.object_id      # => 85
  
    puts "a_outer is #{a_outer} with an id of: #{a_outer_id} before the block."     # => 'a_outer is 42 with an id of: 85 before the block.'
    puts "b_outer is #{b_outer} with an id of: #{b_outer_id} before the block."     # => 'b_outer is 'forty-two' with an id of: 180 before the block.'
    puts "c_outer is #{c_outer} with an id of: #{c_outer_id} before the block."     # => 'c_outer is [42] with an id of: 200 before the block.'
    puts "d_outer is #{d_outer} with an id of: #{d_outer_id} before the block."     # => 'd_outer is [42] with an id of: 85 before the block.'
    puts
  
    1.times do
      a_outer_inner_id = a_outer.object_id    # => 85
      b_outer_inner_id = b_outer.object_id    # => 180
      c_outer_inner_id = c_outer.object_id    # => 200
      d_outer_inner_id = d_outer.object_id    # => 85
  
      puts "a_outer id was #{a_outer_id} before the block and is: #{a_outer_inner_id} inside the block."    # => 'a_outer id was 85 before the block and is: 85 inside the block.'
      puts "b_outer id was #{b_outer_id} before the block and is: #{b_outer_inner_id} inside the block."    # => 'b_outer id was 180 before the block and is: 180 inside the block.'
      puts "c_outer id was #{c_outer_id} before the block and is: #{c_outer_inner_id} inside the block."    # => 'c_outer id was 200 before the block and is: 200 inside the block.'
      puts "d_outer id was #{d_outer_id} before the block and is: #{d_outer_inner_id} inside the block."    # => 'd_outer id was 85 before the block and is: 85 inside the block.'
      puts
  
      a_outer = 22
      b_outer = "thirty three"
      c_outer = [44]
      d_outer = c_outer[0]
  
      puts "a_outer inside after reassignment is #{a_outer} with an id of: #{a_outer_id} before and: #{a_outer.object_id} after."   # => 'a_outer inside after reassignment is 22 with an id of 85 before and: 45 after.'
      puts "b_outer inside after reassignment is #{b_outer} with an id of: #{b_outer_id} before and: #{b_outer.object_id} after."   # => 'b_outer inside after reassignment is 'thirty three' with an id of 180 before and: 240 after.'
      puts "c_outer inside after reassignment is #{c_outer} with an id of: #{c_outer_id} before and: #{c_outer.object_id} after."   # => 'c_outer inside after reassignment is [44] with an id of 200 before and: 260 after.'
      puts "d_outer inside after reassignment is #{d_outer} with an id of: #{d_outer_id} before and: #{d_outer.object_id} after."   # => 'd_outer inside after reassingment is 44 with an id of 85 before and: 89 after.'
      puts
  
  
      a_inner = a_outer       # => 22
      b_inner = b_outer       # => 'thirty three'
      c_inner = c_outer       # => [44]
      d_inner = c_inner[0]    # => 44
  
      a_inner_id = a_inner.object_id    # => 45
      b_inner_id = b_inner.object_id    # => 240
      c_inner_id = c_inner.object_id    # => 260
      d_inner_id = d_inner.object_id    # => 89
  
      puts "a_inner is #{a_inner} with an id of: #{a_inner_id} inside the block (compared to #{a_outer.object_id} for outer)."    # => 'a_inner is 22 with an id of: 45 inside the block (compared to 45 for outer).'
      puts "b_inner is #{b_inner} with an id of: #{b_inner_id} inside the block (compared to #{b_outer.object_id} for outer)."    # => 'b_inner is 'thirty three' with an id of: 240 inside the block (compared to 240 for outer).'
      puts "c_inner is #{c_inner} with an id of: #{c_inner_id} inside the block (compared to #{c_outer.object_id} for outer)."    # => 'c_inner is [44] with an id of: 260 inside the block (compared to 260 for outer).'
      puts "d_inner is #{d_inner} with an id of: #{d_inner_id} inside the block (compared to #{d_outer.object_id} for outer)."    # => 'd_inner' is [44] with an id of: 89 inside the block (compared to 89 for outer).''
      puts
    end
  
    puts "a_outer is #{a_outer} with an id of: #{a_outer_id} BEFORE and: #{a_outer.object_id} AFTER the block."
    puts "b_outer is #{b_outer} with an id of: #{b_outer_id} BEFORE and: #{b_outer.object_id} AFTER the block."
    puts "c_outer is #{c_outer} with an id of: #{c_outer_id} BEFORE and: #{c_outer.object_id} AFTER the block."
    puts "d_outer is #{d_outer} with an id of: #{d_outer_id} BEFORE and: #{d_outer.object_id} AFTER the block."
    puts
  
    puts "a_inner is #{a_inner} with an id of: #{a_inner_id} INSIDE and: #{a_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh"
    puts "b_inner is #{b_inner} with an id of: #{b_inner_id} INSIDE and: #{b_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh"
    puts "c_inner is #{c_inner} with an id of: #{c_inner_id} INSIDE and: #{c_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh"
    puts "d_inner is #{d_inner} with an id of: #{d_inner_id} INSIDE and: #{d_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh"
  end