/* eslint-disable */

/*
# Problem
- input: array (of arrays)
- output array (of arrays)
- rules:
  - each input element is a 3-element subarray
  - each subarray element represents a row
  - each index represents a column
  - each subarray element can be identified by its row number and column number
  - for each input array, swap the 'rows' and 'columns'
    - pattern:
      - 1 5 8
        4 7 2
        3 9 6

      becomes...

        1 4 3
        5 7 9
        8 2 6

      - array[0][0] -> newArray[0][0]
      - array[0][1] -> newArray[1][0]
      - array[0][2] -> newArray[2][0]

      - array[1][0] -> newArray[0[1]
      - array[1][1] -> newArray[1][1]
      - array[1][2] -> newArray[2][1]

      - overall pattern:
        each swap requires two indexes: one for the outer array, and one for the subarray element
        each swap is simply a matter of switching the indexes

# Data Structures
- input: array
- working with input:
  - array
- output: array

# Algorithm
- initialize a new variable to an empty array
- create an outer loop to iterate over each element (subarray):
  - create an inner loop to iterate over each subarray element:
    - at this point we have two indexes, an outer and inner index
    - if a subarray does not exist at the outer index, create an empty array at the outer index
    - push the following element to the new array: inner index, outer index

return new array


*/

/* eslint-enable */

function transpose(matrix) {
  let newMatrix = [];

  for (let outerIndex = 0; outerIndex < matrix.length; ++outerIndex) {
    for (let innerIndex = 0; innerIndex < matrix[outerIndex].length; ++innerIndex) {
      newMatrix[innerIndex] = newMatrix[innerIndex] || [];

      newMatrix[innerIndex][outerIndex] = matrix[outerIndex][innerIndex];
    }
  }

  return newMatrix;
}

console.log(transpose([[1, 2, 3, 4]]));            // [[1], [2], [3], [4]]
console.log(transpose([[1], [2], [3], [4]]));      // [[1, 2, 3, 4]]
console.log(transpose([[1]]));                     // [[1]]

console.log(transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]));
// [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
