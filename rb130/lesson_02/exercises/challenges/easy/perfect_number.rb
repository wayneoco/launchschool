=begin

# Problem
- Aliquot Sum is the sum of all positive divisors for a given number
- Perfect numbers have an Aliquot Sum that is equal to the input number
- Abundant numbers have an Aliquot Sum that is greater than the input number
- Deficient numbers have an Aliquot Sum that is less than the input number
- For a given input number, determine whether it is a Perfect, Abundant or Deficient number

# Data Structures
- input: positive integer
- output: string
- possibly need an array to hold the divisors, then iterate over the divisors

# Algorithm
- Method: initialize
  - assign input number to an instance variable

- Method: classify
  - initialize empty array to hold positive divisors
  - find positive divisors and push to array
  - sum array
  - input <=> sum of array

=end

class PerfectNumber
  def self.classify(number)
    raise StandardError unless number.positive?

    case divisors_sum(number) <=> number
    when 0  then 'perfect'
    when 1  then 'abundant'
    else         'deficient'
    end
  end

  class << self
    private

    def divisors_sum(number)
      sum = 0
      1.upto(number - 1) do |num|
        sum += num if (number % num).zero?
      end
      sum
    end
  end
end
