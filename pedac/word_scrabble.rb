=begin

Problem:
Write a program that, given a word, computes the scrabble score for that word.

Letter Values
Letter								            Value
A, E, I, O, U, L, N, R, S, T		  1
D, G								              2
B, C, M, P							          3
F, H, V, W, Y						          4
K									                5
J, X								              8
Q, Z								              10


### ------ UNDERSTANDING THE PROBLEM ------ ###

- Input: a string
	- lower case / upper case? (given the data in the letter values lookup table, it's likely that input should be converted to uppercase)
- Output: an integer (the scrabble score)
- Rules:
	- the score is the sum of the scores of each letter in the string
	- the letter value table is used to loop up letter scores

### ------ EXAMPLES / TEST CASES ------ ###

score('a')			  => 1
score('cabbage')	=> 14
score('Cabbage')	=> 14

### ------ DATA STRUCTURE ------ ###

- input
	- array of chars
- rules
	- look up table for letter numeric values: hash/object
		- mini data structure choice: {a: 1, e: 1 ... z: 10}
			- note the choice between structuring the data as expressed in the rule (so arrays of
				characters for each numeric value, which results in a nested data structure, i.e.,
				arrays within a hash) vs simplifying the data into a flat hash
		- alternatively, you could use code instead of a data structure, for example, 26 conditionals
			(e.g., if char == 'a' then value = 1)

letter_val = {
	1: %W(A E I O U L N R S T),
	2: %w(D G),
	3: %w(B C M P),
	4: %w(F H V W Y),
	5: %w(K),
	8: %w(J X),
	10: %w(Q Z)
	}

=end

LETTER_VAL = {
  1 => %w(a e i o u l n r s t),
  2 => %w(d g),
  3 => %w(b c m p),
  4 => %w(f h v w y),
  5 => %w(k),
  8 => %w(j x),
  10 => %w(q z)
}

def total_scrabble_score(word)
  score = score_single_char_word(word) if word.length == 1
  score = score_multichar_word(word) if word.length > 1
  score.sum
end

def score_single_char_word(word)
  score = []
  LETTER_VAL.each_pair do |key, value|
    score << key if value.include?(word.downcase)
  end
  score
end

def score_multichar_word(word)
  score = []
  word.downcase.split('').each do |char|
    LETTER_VAL.each_pair do |key, value|
      score << key if value.include?(char)
    end
  end
  score
end

puts total_scrabble_score('a') == 1
puts total_scrabble_score('cabbage')	== 14
puts total_scrabble_score('Cabbage')	== 14
puts total_scrabble_score('toMORRow') == 13
