flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.push('Dino', 'Hoppy')   # => ['Fred', 'Barney', 'Wilma', 'Betty', 'BamBam', 'Pebbles', 'Dino', 'Hoppy']

or 

flintstones.concat(%w(Dino Hoppy))  # => ['Fred', 'Barney', 'Wilma', 'Betty', 'BamBam', 'Pebbles', 'Dino', 'Hoppy']