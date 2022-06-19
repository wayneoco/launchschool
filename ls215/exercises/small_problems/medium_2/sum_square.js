/* eslint-disable */

/*
### Problem Description ###
Write a function that computes the difference between the square of the sum of the first n positive integers and the sum of the squares of the first n positive integers.

# Problem
- input: integer
- output: integer
- rules:
  - explicit:
    - compute the difference between two values:
      1. the square of the sum of the first n positive integers
      2. the sum of the squares of the first n positive integers

# Data Structures
- input: integer
- working with input:
  - integer (to compute sums and squares)
  - array to contain numbers 1 to n
- output: integer

# Algorithm
Function: square of sums
- takes array of integers 1 to n as input
- reduce the array to a single sum
- return the square of the sum

Function: sum of squares
- takes array of integers 1 to n as input
- iterate over the array, transforming each element to the square of itself
- reduce the array of squares to a single sum

Function (main):
- initialize an array of numbers from 1 to n
- initialize a variable to the return value of the square of sums function
- initialize a variable to the return value of the sum of squares function
- return the difference between the square of sums variable and the sum of squares variable


*/

/* eslint-enable */

function sumSquareDifference(number) {
  const numbers = Array.from({length: number}, (_, index) => index + 1);

  return squareOfSums(numbers) - sumOfSquares(numbers);
}

function squareOfSums(numbers) {
  let sum = numbers.reduce((sum, num) => sum + num);

  return sum ** 2;
}

function sumOfSquares(numbers) {
  let squares = numbers.map(num => num ** 2);

  return squares.reduce((sum, square) => sum + square);
}

console.log(sumSquareDifference(3));      // 22 --> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
console.log(sumSquareDifference(10));     // 2640
console.log(sumSquareDifference(1));      // 0
console.log(sumSquareDifference(100));    // 25164150

