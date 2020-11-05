famous_words = "seven years ago..."

'Four score and ' + famous_words              # => 'Four score and seven years ago...'
famous_words.insert(0, 'Four score and ')     # => 'Four score and seven years ago...'
famous_words.prepend('Four score and seven ') # => 'Four score and seven years ago...'

# NOTE: both `#insert` and `#prepend` mutate the caller