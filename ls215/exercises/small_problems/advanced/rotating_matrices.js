/* eslint-disable */

/*
# Problem
- input: array
- output: array
- rules:
  - similar to 3x3 transpose, except roate each row 90 degrees
  - pattern:
    - 1 5 8
      4 7 2
      3 9 6

    becomes

      3 4 1
      9 7 5
      6 2 8

   - array[0][0] -> array[0][2]
   - array[0][1] -> array[1][2]
   - array[0][2] -> array[2][2]

   - array[1][0] -> array[0][1]
   - array[1][1] -> array[1][1]
   - array[1][2] -> array[2][1]

   - array[2][0] -> array[0][0]
   - array[2][1] -> array[1][0]
   - array[2][2] -> array[2][0]

      3 4 1
      9 7 5

    becomes

      9 3
      7 4
      5 1

   - array[0][0] -> array[0][1]
   - array[0][1] -> array[1][1]
   - array[0][2] -> array[2][1]

# Algorithm
- initialize a new variable to an empty array
- create an outer loop
  - breaks at length of the input array
  - create an inner loop
    - if 


*/

/* eslint-enable */

function rotate90(matrix) {
  let newMatrix = initializeNewArray([], matrix[0].length);

  newMatrix = newMatrix.map((subarray, outerIndex) => {
    expandAndFillSubarray(subarray, matrix.length);

    return subarray.map((_, innerIndex) => {
      return matrix[(subarray.length - 1) - innerIndex][outerIndex];
    });
  });

  return newMatrix;
}

function initializeNewArray(newArray, length) {
  newArray.length = length;
  return newArray.fill([]);
}

function expandAndFillSubarray(subarray, length) {
  subarray.length = length;
  return subarray.fill('');
}

const matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6],
];

const matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8],
];

const newMatrix1 = rotate90(matrix1);
const newMatrix2 = rotate90(matrix2);
const newMatrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))));

console.log(newMatrix1);      // [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
console.log(newMatrix2);      // [[5, 3], [1, 7], [0, 4], [8, 2]]
console.log(newMatrix3);      // `matrix2` --> [[3, 7, 4, 2], [5, 1, 0, 8]]
