=begin

# Problem
- Take two string inputs and compare
- Strings are comprised of uppercase alphabetic characters only
- Count number of occurences where characters at the same index differ
- If strings are of unequal length, count up to the length of the shorter string

# Data Structures
- strings as input
- integer as output

# Algorithm


=end

class DNA
  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(distance)
    count = 0
    @strand.chars.each_index do |index|
      count += 1 unless @strand[index] == distance[index]
      break if distance.size == index + 1
    end
    count
  end
end

