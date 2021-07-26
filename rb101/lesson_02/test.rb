=begin

Write a function with the signature shown below:

def is_int_array(arr)
	true
end

- returns true if every element in an array is an integer or a float with no decimals.
- returns true if array is empty.
- returns false for every other input.

### Problem

- explicit requirements:
	- input: an array that contains one or more elements
	- output: boolean (true or false)
	- returns true if:
		- an array is an integer or float with no decimals
		- an array is empty
	- returns false for every other input

### Examples and Test Cases

- see below

### Data Structure

- array (input)
- boolean (output)

### Algorithm

- given an array of one or more elements:
  - iterate over each element of the array
  - if the first element is empty, return true
  - if the first element is an integer or float without decimals
    - return true
    - otherwise, return false

=end

def int_array(arr)
  return true if arr.empty? == true
  arr.each do |x|
    if x.integer? != true
      return false
    elsif x != x.to_i
      return false
    end
  end
end

# test cases
p int_array([]) == true
p int_array([1, 2, 3, 4]) == true
p int_array([-11, -12, -13, -14]) == true
p int_array([1.0, 2.0, 3.0]) == true
p int_array([1, 2, nil]) == false
p int_array(nil) == false
p int_array("") == false
p int_array([nil]) == false
p int_array([1.0, 2.0, 3.0001]) == false
p int_array(["-1"]) == false
