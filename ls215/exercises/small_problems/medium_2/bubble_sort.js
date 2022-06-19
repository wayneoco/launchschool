/* eslint-disable */

/*
# Problem
-input: array
  - array can contain numbers or strings
- output: array
- rules:
  - take an array of elements as input
  - sort array elements using a bubble sort algorithm
  - bubble sort algorithm:
    - iterate through the array from left to right
    - compare element at index and index + 1
    - if element at index + 1 is less than the element at index, swap the elements
    - continue iterating through the array, comparing each element at index with the element at index + 1
    - when the entire array can be iterated without swapping any elements, the array is sorted.

- questions:
  - can the array contain elements of different types?

# Data Structures
- input: array
- working with input: array
- output: array

# Algorithm
- take an array as input
- create a swapCount variable to track the number of swaps
- create an outer loop that iterates until no more elements are swapped 
  - create an inner loop that iterates over the elements of the input array
    - if the element at index is greater than the element at index + 1:
      - swap the elements' positions
      - increment swapCount variable by 1
  - if swapCount is > 0, continue to next iteration
  - if swapCount = 0, break out of the loop
  - return the sorted array

*/

/* eslint-enable */

function bubbleSort(array) {
  let swapCount;

  do {
    swapCount = 0;
    for (let index = 0; index < array.length; index += 1) {
      if (array[index] > array[index + 1]) {
        [ array[index], array[index + 1] ] = [array[index + 1], array[index]];
        swapCount += 1;
      }
    }
  } while (swapCount > 0);

  return array;
}

const array1 = [5, 3];
bubbleSort(array1);
console.log(array1);    // [3, 5]

const array2 = [6, 2, 7, 1, 4];
bubbleSort(array2);
console.log(array2);    // [1, 2, 4, 6, 7]

const array3 = ['Sue', 'Pete', 'Alice', 'Tyler', 'Rachel', 'Kim', 'Bonnie'];
bubbleSort(array3);
console.log(array3);    // ["Alice", "Bonnie", "Kim", "Pete", "Rachel", "Sue", "Tyler"]
