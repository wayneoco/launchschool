/* eslint-disable */

/*
# Problem
- input: two arrays
- output: one array
- rules:
  - both input arrays are sorted from lowest to highest
  - either input array can be empty
  - create a new array from all elements in both arrays
  - new array must be in sorted order
  - result array cannot be sorted; i.e., sorted array must be built one sorted element at a time

# Data Structures
- input: array
- working with input: array
- output: array

# Algorithm
- if either array is empty, return the non-empty array
- initialize a new variable to an empty array
- initialize a new variable to the array whose first element has the lowest value
- iterate over the starting array
  - initialize a new variable to a copy of the other array (all elements except the element at the current index - 1)
  - if the current element is greater than the current element of the other array, add the element of the other array to the results array
  - if the current element is less than all elements of the other array, add the current element to the results array

- return the results array



*/

/* eslint-enable */

function merge(arr1, arr2) {
  let mergedArray = [];
  let arr1Copy = [...arr1];
  let arr2Copy = [...arr2];

  while (arr1Copy.length > 0 && arr2Copy.length > 0) {
    if (arr1Copy[0] < arr2Copy[0]) {
      mergedArray.push(arr1Copy.shift());
    } else {
      mergedArray.push(arr2Copy.shift());
    }
  }

  return [...mergedArray, ...arr1Copy, ...arr2Copy];
}

console.log(merge([1, 5, 9], [2, 6, 8]));      // [1, 2, 5, 6, 8, 9]
console.log(merge([2, 6, 8], [1, 5, 9]));      // [1, 2, 5, 6, 8, 9]
console.log(merge([1, 5, 9], [2, 6, 8, 10]));  // [1, 2, 5, 6, 8, 9, 10]
console.log(merge([2, 6, 8, 10], [1, 5, 9]));  // [1, 2, 5, 6, 8, 9, 10]
console.log(merge([1, 1, 3], [2, 2]));         // [1, 1, 2, 2, 3]
console.log(merge([2, 2], [1, 1, 3]));         // [1, 1, 2, 2, 3]
console.log(merge([], [1, 4, 5]));             // [1, 4, 5]
console.log(merge([1, 4, 5], []));             // [1, 4, 5]
