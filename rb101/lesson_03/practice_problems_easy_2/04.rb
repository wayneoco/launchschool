advice = "Few things in life are as important as house training your pet dinosaur."

advice.include?('Dino')     # => false

# Note: can also use #match?

advice.match?('Dino')       # => false

# Note, however, that this is not a perfect solution as it would match any word that contains 'Dino' as a substring, e.g., 'Dinosaur'.