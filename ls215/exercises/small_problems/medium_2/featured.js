/* eslint-disable */

/*
### Problem Description ###
A featured number (something unique to this exercise) is an odd number that is a multiple of 7, with all of its digits occurring exactly once each. For example, 49 is a featured number, but 98 is not (it is not odd), 97 is not (it is not a multiple of 7), and 133 is not (the digit 3 appears twice).

Write a function that takes an integer as an argument and returns the next featured number greater than the integer. Issue an error message if there is no next featured number.

NOTE: The largest possible featured number is 9876543201.

# Problem
- input: integer
- output: integer or string (error message)
- rules:
  - explicit:
    - featured number requirements:
      - odd number
      - multiple of 7
      - unique digits
    - featured number is greater than the input number
    - highest possible featured number is 9876543201
    - issue error message if there is no featured number
  - questions:
    - account for negative numbers?
    - account for fractional numbers?

# Data Structures
- input: integer
- working with input: 
  - integers
  - string (to assess unique digits requirement)
    - an array (to assess unique digits requirement)
- output: integer or string (error message)

# Algorithm
Approach: starting at the input integer + 1, iterate through all successive integers (incremented by 1), assessing each integer against the featured number requirements. Return the featured number when found or print an error message to console if no featured number is found.

Function (helper function to determine featured number):
- requirements
  - number is odd
  - number is multiple of 7
  - number has all unique digits
    - convert number to a string
    - split string into an array of string digits
    - sort array from lowest to hightest
    - iterate over the sorted array of string digits
      - if the current digit is equal to the next digit, return false
    - otherwise, return true
  - return boolean
- 

Function (main):
- create a loop that iterates up to 9876543201
  - starting index = input + 1
  - for each number:
    - determine if it's a featured number
    - if yes, return the number
    - if no, continue to next iteration
- if the loop exits without finding a featured number, return an error message


*/

/* eslint-enable */

function featured(number) {
  const MAX_FEATURED_NUMBER =9876543201; 
  let currentNumber = number + 1;

  for (; currentNumber <= MAX_FEATURED_NUMBER; currentNumber += 1) {
    if (isFeaturedNumber(currentNumber)) return currentNumber;
  }

  return 'There is no possible number that fulfills those requirements.';
}


function isFeaturedNumber(number) {
  return (number % 2 === 1) &&
    (number % 7 === 0) &&
    hasUniqueDigits(number);
}

function hasUniqueDigits(number) {
  let digits = String(number).split('').sort();

  for (let index = 0; index < digits.length; index += 1) {
    let currentDigit = digits[index];
    let nextDigit = digits[index + 1];

    if (currentDigit === nextDigit) return false;
  }

  return true;
}

console.log(featured(12));           // 21
console.log(featured(20));           // 21
console.log(featured(21));           // 35
console.log(featured(997));          // 1029
console.log(featured(1029));         // 1043
console.log(featured(999999));       // 1023547
console.log(featured(999999987));    // 1023456987
console.log(featured(9876543186));   // 9876543201
console.log(featured(9876543200));   // 9876543201
console.log(featured(9876543201));   // "There is no possible number that fulfills those requirements."
