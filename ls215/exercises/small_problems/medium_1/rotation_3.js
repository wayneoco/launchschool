/* eslint-disable */

/*
### Problem Description ###
Take the number 735291 and rotate it by one digit to the left, getting 352917. Next, keep the first digit fixed in place and rotate the remaining digits to get 329175. Keep the first two digits fixed in place and rotate again to get 321759. Keep the first three digits fixed in place and rotate again to get 321597. Finally, keep the first four digits fixed in place and rotate the final two digits to get 321579. The resulting number is called the maximum rotation of the original number.

Write a function that takes an integer as an argument and returns the maximum rotation of that integer. You can (and probably should) use the rotateRightmostDigits function from the previous exercise.

### Problem ###
- input: integer
- output: integer
- rules:
  - explicit:
    - starting with the first digit:
      - rotate the digit one position to the left
          - e.g., 735291 -> 352917
    - continuing from left to right, rotate all digits one position to the left, leaving all digits to the left of the current digit in place
    - leading zeros get dropped from rotated number
    - pattern for, e.g., 735291 as input:
      - first rotation: 352917
      - second rotation: 329175
      - third rotation: 321759
      - fourth rotation: 321597
      - fifth rotation: 321579
    - use rotateRightmostDigits function from previous exercises
  - implicit:
    - number of rotations: number of digits - 1 (5)

### Data Structures ###
- input: integer
- working with input:
  - string
- output: integer

### Algorithm ###
- note: rotateRightmostDigits function takes two arguments: a number, and the number of digits to be rotated

- convert input number to a string
- create a rotated number variable as an empty string
- create a loop that iterates (number length - 1) times
  - index starts at 0
  - for each index:
    - create a substring starting at index
    - call rotateRightmostDigits function, passing the string and the string length as arguments
    - append return value of rotateRightmostDigits function to the rotated number string
- return the rotated number string as a Number

*/

/* eslint-enable */

function maxRotation(number) {
  let negative;

  if (isNegative(number)) {
    number *= -1;
    negative = true;
  }

  let rotatedNumber = number;

  for (let index = String(number).length; index > 1; index -= 1) {
    rotatedNumber = rotateRightmostDigits(rotatedNumber, index);
  }

  if (negative) {
    rotatedNumber *= -1;
  }

  return rotatedNumber;
}

function isNegative(number) {
  return number * -1 > 0;
}

function rotateRightmostDigits(number, digits) {
  let numberString = String(number);
  let digitsToBeRotated = numberString.slice(-digits);
  let rotatedDigits = digitsToBeRotated.split('');
  rotatedDigits = rotateArray(rotatedDigits).join('');
  let rotatedNumber = numberString.replace(digitsToBeRotated, rotatedDigits);

  return Number(rotatedNumber);
}

function rotateArray(input) {
  let arrayCopy = input.slice(1);
  arrayCopy.push(input[0]);

  return arrayCopy;
}

console.log(maxRotation(735291));          // 321579
console.log(maxRotation(3));               // 3
console.log(maxRotation(35));              // 53
console.log(maxRotation(105));             // 15 -- the leading zero gets dropped
console.log(maxRotation(8703529146));      // 7321609845
console.log(maxRotation(-123));            // -213
