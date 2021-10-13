=begin
Given an array of n positive integers and a positive integer s,
find the minimal length of a contiguous subarray of which the sum ≥ s.
If there isn't one, return 0 instead.

# Problem

input:
- array of positive integers
- a positive integer

output:
- positive integer

rules:
- explicit:
  - find subarrays
  - find sum of each subarray
  - return subarray size when sum of subarray >= `s`
  - return `0` if sum of each subarray is < `s`
  -

# DS
- array

# Algorithm
-Higher Level Algorithm
  - Find all subarrays
  - Select subarrays where the subarray's sum >= `s`
  - From selected subarrays, find subarray with smallest size

- Detailed Algorithm
  - initialize array SUBARRAYS to return value of FIND_SUBARRAYS method
    - define FIND_SUBARRAYS method:
      - initialize empty array SUBARRAYS
      - iterate over the input array NUMBERS
        - for each iteration, push each subarray to SUBARRAYS. Probably use #times method to create subarrays
      - return SUBARRAYS
  - initialize array SELECTED_SUBS to return value of calling #select on SUBARRAYS
    - select subarrays where the subarray's sum >= `s`
  - sort SELECTED_SUBS by size
  - return size of first element from SELECTED_SUBS or `0` if SELECTED_SUBS is empty

=end

def find_subarrays(numbers)
  subarrays = []
  numbers.each_index do |index|
    (numbers.size - index).times do |i|
      subarrays << numbers[index..(i + index)]
    end
  end
  subarrays
end

def minSubLength(numbers, sum)
  subarrays = find_subarrays(numbers)
  selected_subs = subarrays.select { |sub| sub.sum >= sum }.sort_by!(&:size)
  selected_subs.empty? ? 0 : selected_subs[0].size
end

p minSubLength([2,3,1,2,4,3], 7) == 2
p minSubLength([1, 10, 5, 2, 7], 9) == 1
p minSubLength([1, 11, 100, 1, 0, 200, 3, 2, 1, 250], 280) == 4
p minSubLength([1, 2, 4], 8) == 0
