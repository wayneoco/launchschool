=begin

# Problem
- input: string
- output: boolean
- rules:
  - case does not matter
  - if one letter of a block is used, the other letter cannot be used
  - a block can only be used once
  - return true if a string can be spelled from the given set of blocks

# Algorithm
Approach:
  - Initialize a local variable `blocks` to an array of subarrays, where each
    subarray represents a single block.
  - Split the input string in an array of characters and iterate over the collection
    of characters.
    - For each character, check if the character is included in any of the subarrays.
    - If the character is included in the subarray, push the character to a results
      string and delete the entire subarray.

=end

def block_word?(string)
  blocks = [['B', 'O'],['X', 'K'],['D', 'Q'],['C', 'P'],['N', 'A'],['G', 'T'],['R', 'E'],['F', 'S'],['J', 'W'],['H', 'U'],['V', 'I'],['L', 'Y'],['Z', 'M']]
  string.upcase.each_char do |char|
    return false unless blocks.flatten.include?(char)

    blocks.each_with_index do |block, index|
      next unless block.include?(char)

      break blocks.delete_at(index)
    end
  end
  true
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true
