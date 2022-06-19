/* eslint-disable */

/*
# Problem
- input: array
- output: array
- rules:
  - explicit:
    - sort the input array using a merge sort algorithm
    - merge sort algorithm, using the array [9, 5, 7, 1] as an example:
      - the input array is broken down into nested subarrays
      - the nested subarrays are then merged back together in sorted order
      - [9, 5, 7, 1]
      - [[9, 5], [7, 1]]
      - [[[9], [5]], [[7], [1]]]
      - [[5, 9], [1, 7]]
      - [1, 5, 7, 9]
    - input can be either integers or strings but not both
  - implicit:
    - input array length can be odd or even

- pattern:
  - [9, 5, 7, 1] - 1 tier
  - [[9, 5], [7, 1]] - 2 tiers
  - [[[9], [5]], [[7], [1]]] - 3 tiers (or input.length - 1)
  - [[5, 9], [1, 7]]
  - [1, 5, 7, 9]

  - [6, 2, 7, 1, 4] - 1 tier
  - [[6, 2], [7, 1], [4]] - 2 tiers
  - [[[6], [2]], [[7], [1]], [[4]]] - 3 tiers

  - [5, 3] - 1 tier
  - [[5], [3]] - 2 tiers

  - [5, 3, 4] - 1 tier
  - [[5, 3], [4]] - 2 tiers
  - [[[5], [3]], [4]]

- pattern, taking [9, 5, 7, 1] as input:
  - subArray1 = [9, 5]
    - subArray1 = [9]
      - return [9]
    - SubArray2 = [5]
      - return [5]
    - [9, 5] -> [9], [5]
  - subArray2 = [7, 1]
    - [7, 1] -> [7], [1]

# Algorithm
- initialize a variable to a copy of the input array
- 


*/

/* eslint-enable */

function mergeSort(array) {
  if (array.length === 1) {
    return array;
  }

  let subArray1 = array.slice(0, array.length / 2);
  let subArray2 = array.slice(array.length / 2);

  subArray1 = mergeSort(subArray1);
  subArray2 = mergeSort(subArray2);

  return merge(subArray1, subArray2);
}

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

console.log(mergeSort([9, 5, 7, 1]));           // [1, 5, 7, 9]
//console.log(mergeSort([5, 3]));                 // [3, 5]
//console.log(mergeSort([6, 2, 7, 1, 4]));        // [1, 2, 4, 6, 7]

//console.log(mergeSort(['Sue', 'Pete', 'Alice', 'Tyler', 'Rachel', 'Kim', 'Bonnie']));
// ["Alice", "Bonnie", "Kim", "Pete", "Rachel", "Sue", "Tyler"]

//console.log(mergeSort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]));
// [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]
