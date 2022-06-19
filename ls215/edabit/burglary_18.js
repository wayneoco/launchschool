/* eslint-disable */

/*
# PROBLEM
- input:
  - array
    - strings
    - arrays
- output:
  - object
    - nested object

- rules:
  - explicit:
    - 1st level subarray: room
      - 2nd level subararray(s): items and values
        - element indexes in the items subarray are associated with the values at the same indexes in the values subarray
          - e.g., ['piano, 'tv'], [1000, 50]
            -> piano: 1000, tv: 50
        - the number of items always matches the number of values
    - return an object where:
      - each room is a property
      - the value of each room is an object
        - properties of the room object are the items with the item value as values

    - index0: room
      - index1: items array
        - index0: 1st item
        - index1: 2nd item
      - index2: values array
        - index0: 1st value
        - index1: 2nd value


- questions / edge cases:
  - input:
    - empty string for either room or item? 
    - duplicate items? likely add even if duplicate
    - numbers:
      - negative values?
      - string representations of numbers?
    - null, undefined? 
    - room given but no items or values? do I still create the room as a property of the object?

# DATA STRUCTURES
- input:
  - outer array
    - subarray(s)
      - strings
      - numbers
- working with input:
  - object
  - array (in order to iterate over items in the array)
- output: object

# ALGORITHM
Approach:
- create a function that takes an array of nested arrays as input, where:
  - the first element of each subarray is a room in a house
  - and subsequent elements, which are additional subarrays, represent items and their values, respectively
- for each nested array:
  - use the first element as a property of the object to be returned
    - the value of this property will be an object, where:
      - the items subarray will be its properties and the values subarray will be its values
- return the object

Function (main):
- ARGUMENTS: an array
- example input: [["kitchen", ["piano", "tv"], [1000, 50]]]
- structure of input:
  - outer array
    - element: array
      - 1st element: string
      - 2nd, 3rd elements: arrays

- initialize a variable to an empty object
- iterate over the input (outer) array:
  - for each element (which is itself an array):
    - add the 1st element as a property of the results object, with an empty object as its value
    - create a loop that iterates N times where N is equal to the length of the items array:
      - for each iteration:
        - add the item at index I to the room object, with the value at index I as its value

- RETURN: results object

results = {}

[["kitchen", ["piano", "tv"], [1000, 50]]]

1st loop: ["kitchen", ["piano", "tv"], [1000, 50]]
  - {kitchen: {}}
  - 2nd loop: terminates at size of the items array
    {kitchen: {piano: 1000}}
    {ktichen: {piano: 1000, tv: 50}}
  


*/

/* eslint-enable */

function makeDetailedList(array) {
  let stolenItems = {};

  array.forEach(room => {
    let roomName = room[0];
    stolenItems[roomName] = {};

    for (let index = 0; index < room[1].length; index += 1) {
      let item = room[1][index];
      let value = room[2][index];

      stolenItems[roomName][item] = value;
    }
  });

  return stolenItems;
}


console.log(makeDetailedList([["kitchen", ["piano", "tv"], [1000, 50]]]));
console.log(makeDetailedList([["basement", ["baseball bat"], [500] ],
  ["garage", ["horses", "cadillac", "flowers"], [110, 2000, 30]]]));
