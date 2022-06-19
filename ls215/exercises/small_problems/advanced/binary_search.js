/* eslint-disable */

/*
# Problem
-input: 
  - array (data)
  - integer or string (search term)
- integer (index)
- rules:
  - return the index of the found item or -1 if not found
  - input array is already sorted
  - binary search pattern:
    - find middle index
    - if search term is at middle index, return middle index
    - otherwise:
      - if middle value is less than the search term:
        - discard lower half, including the middle value
        - repeat same proces for upper half
  - if search term is not found, return -1

# Data Structures
- input:
  - array
  - integer or string
- working with input
  - array (no change; an array is best for iterating over the data to be searched)
- output: integer

# Algorithm
- if input array size = 1, return the array
- initialize a variable to the middle index of the input array (array length - 1 / 2, rounded down)
- if searchTerm is equal to middle value, return middle value
- if middle value is less than searchTerm, delete lower half, including middle value
- invoke binarySearch function recursively
*/

/* eslint-enable */

function binarySearch(array, searchTerm) {
  const middleIndex = Math.floor((array.length - 1) / 2);


}

const yellowPages = ['Apple Store', 'Bags Galore', 'Bike Store', 'Donuts R Us', 'Eat a Lot', 'Good Food', 'Pasta Place', 'Pizzeria', 'Tiki Lounge', 'Zooper'];
console.log(binarySearch(yellowPages, 'Pizzeria'));                   // 7
console.log(binarySearch(yellowPages, 'Apple Store'));                // 0

console.log(binarySearch([1, 5, 7, 11, 23, 45, 65, 89, 102], 77));    // -1
console.log(binarySearch([1, 5, 7, 11, 23, 45, 65, 89, 102], 89));    // 7
console.log(binarySearch([1, 5, 7, 11, 23, 45, 65, 89, 102], 5));     // 1

console.log(binarySearch(['Alice', 'Bonnie', 'Kim', 'Pete', 'Rachel', 'Sue', 'Tyler'], 'Peter'));  // -1
console.log(binarySearch(['Alice', 'Bonnie', 'Kim', 'Pete', 'Rachel', 'Sue', 'Tyler'], 'Tyler'));  // 6
