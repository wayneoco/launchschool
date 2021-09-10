=begin

Specific items to note when evaluating code:

1. The type of ACTION being performed (method call, block, conditional, etc.)
2. The OBJECT the action is being performed on
3. The SIDE-EFFECT of that action (e.g., output or destructive action)
4. The RETURN VALUE of that action
5. Whether or not the RETURN VALUE IS USED by whatever instigated the action

# Example 3 Problem

line 1
Action: map
Object: the outer array [[1, 2], [3, 4]]
Side-Effects: none
Return value: a new array [1, 3]
Return value used? No

line 1-4
Action: block execution
Object: each sub array
Side-Effects: no
Return value: integer at index 0 of each subarray
Return value used? No

line 2
Action: method call (puts)
Object: element at 0 index of the sub array assigned to `arr`
Side-Effects: outputs a string representation of each element at index 0 for each sub array
Return value: nil
Return value used? no

line 2
Action: method call (first)
Object: each subarray
Side-Effects: no
Return value: element at index 0 for each subarray
Return value used? Yes, used by `puts`

line 3
Action: method call (first)
Object: each subarray
Side-Effects: no
Return value: element at index 0 for each subarray
Return value used? Yes, used by `map` to determine the return value of the block

# Example 4 Problem

line 1
Action: variable assignment
Object: [[18, 7], [3, 12]]
Side-effects: no
Return value: [[18, 7], [3, 12]]
Return value used: no

line 1
Action: method call (each)
Object: [[18, 7], [3, 12]]
Side-Effects: no
Return value: original object (outer array)
Return value used? Yes, used for variable assignment to `my_arr`

line 1-7
Action: block execution
Object: each subarray as assigned to `arr`
Side-Effects: no
Return value: outer array (original object)
Return value used: no

line 2
Action: method call (each)
Object: each subarray as assigned to `arr`
Side-effects: no
Return value: subarray
Return value used: no

line 2-6
Action: block execution
Objection: each subarray as assigned to `arr`
Side-effects: no
Return value: `nil`
Return value used: no

line 3-5
Action: conditional
Object: each integer of each subarray
Side-effects: no
Return value: `nil`
Return value used: no

line 4
Action: method call (puts)
Object: num (integer element of subarray)
Side-effects: output of string representation of integer element of subarray
Return value: `nil`
Return value used: no

# Example 5 Problem

line 1
Action: method call (map)
Object: outer array [[1, 2], [3, 4]]
Side-effects: no
Return value: new array [[2, 4], [6, 8]]
Return value used: no

Line 1-5
Action: outer block execution
Object: each subarray
Side-effects: no
Return value: new subarray from the return value of the inner map method call
Return value used: Yes, by the map method call

line 2
Action: method call (map)
Object: subarray assigned to `arr`
Side-effects: yes, `num` is multiplied by 2
Return value: [2, 4] & [6, 8]
Return value used: yes, to determine the outer block execution's return value

line 2-4
Action: inner block execution
Object: element of the subarray assigned to `num`
Side-effects: no
Return value: an integer (2, 4, 6 & 8)
Return value used: Yes, by map

line 3
Action: * operator
Object: integer assigned to `num`
Side-effects: no
Return value: 2, 4, 6, 8
Return value used: yes, by the block execution in lines 2-4

# Example 6 Problem

line 1
Action: method call (select)
Object: array
Side-effects: no
Return value: a new array with selected objects
Return value used: no

line 1-5
Action: block execution
Object: sub-hash of the array
Side-effects: no
Return value: [{:c => 'car'}]
Return value used: no

line 2
Action: method call (all?)
Object: hash assigned to `hash`
Side-effects: no
Return value: boolean
Return value used: yes, by select

line 2-4
Action: block execution
Object: key-value pair of `hash`
Side-effects: no
Return value: boolean
Return value used: yes, by `all?`

line 3
Action: method call ([])
Object: `value` variable of the hash
Side-effects: no
Return value: the indexed character of the `value` string
Return value used: yes, by the comparison operator

line 3
Action: method call (comparison operator (==))
Object: the first character of the `value` string
Side-effects: no
Return value: boolean
Return value used: yes, by the block execution

line 3
Action: method call (to_s)
Object: the `key` symbol
Side-effects: no
Return value: `key` as a string
Return value used: yes, as an argument to the comparison operator

# Example 7 Problem

arr = [['1', '8', '11'], ['2', '6', '13'], ['2', '12', '15'], ['1', '8', '9']]

arr.sort_by do |sub_arr|
  sub_arr.map do |num|
    num.to_i
  end
end

# => [['1', '8', '9'], ['1', '8', '11'], ['2', '6', '13'], ['2', '12', '15']]

line 1
Action: method call (sort_by)
Object: outer array
Side-effects: no
Return value: original array
Return value used: no

line 1-5
Action: outer block execution
Object: subarray
Side-effects: no
Return value: subarray of integers (converted from strings)
Return value used: yes, by sort_by to sort the outer array

line 2
Action: method call (map)
Object: subarray
Side-effects: no
Return value: subarray of integers
Return value used: yes, by the outer block execution

line 2-4
Action: inner block execution
Object: string assigned to `num`
Side-effects: no
Return value: integer
Return value used: yes, by map method call

line 3
Action: method call (to_i)
Object: string assigned to `num`
Side-effects: no
Return value: integer
Return value used: yes, by the inner block execution

# Example 10 Problem

line 1
Action: outer method call (map)
Object: outer array
Side-effects: no
Return value: [[[2, 3], [4, 5]], [6, 7]]
Return value used: no

line 1-11
Action: outer block execution
Object: subarray [[1, 2], [3, 4]] & [5, 6]
Side-effects: no
Return value:[[2, 3], [4, 5]], [6, 7]
Return value used: yes, by the outer method call map

line 2
Action: 1st inner method call (map)
Object: subarray as assigned to `arr`
Side-effects: no
Return value: [[2, 3], [3, 4]], [6, 7]
Return value used: yes, by the outer execution block

line 2-10
Action: 1st inner execution block
Object: subarrays [1, 2], [3, 4] and integers 5, 6
Side-effects: no
Return value: [2, 3], [4, 5], 6, 7
Return value used: yes, by 1st inner method call (map)

line 3-8
Action: conditional if statement
Object: the result of the `el.to_s.size == 1` expression
Side-effects: no
Return value: an integer, incremented by 1
Return value used: yes, by the 1st inner block execution

line 3
Action: method call (to_s)
Object: [1, 2], [3, 4], 5, 6
Side-effects: no
Return value: "[1, 2]", "[3, 4]", "5", "6"
Return value used: yes, by `size`

line 3
Action: method call (size)
Object: return value of `to_s` - "[1, 2]", "[3, 4]", "5", "6"
Side-effects: no
Return value: integer
Return value used: yes, by the comparison operator `==`

line 3
Action: method call (==)
Object: an integer (the return value of `size`)
Side-effects: no
Return value: boolean
Return value used: yes, by the `if` conditional statement

line 4
Action: method call (+)
Object: integer
Side-effects: no
Return value: integer
Return value used: yes, by the first inner block execution

line 6
Action: 2nd inner method call (map)
Object: subarray
Side-effects: no
Return value: [2, 3], [4, 5]
Return value used: yes, by the 1st inner block execution

line 6-8
Action: 2nd inner block execution
Object: integer
Side-effects: no
Return value: integer
Return value used: yes, by map

line 7
Action: method call (+)
Object: integer
Side-effects: no
Return value: integer
Return value used: yes, by the block execution


=end
