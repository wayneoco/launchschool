/* eslint-disable */

/*
### Problem Description ###
Write a function that rotates the last n digits of a number. For the rotation, rotate by one digit to the left, moving the first digit to the end.

### Problem ###
- input:
  - integer (number to be rotated)
  - integer (number of digits to rotate)
- output:
  - integer (rotated number)
- rules:
  - explicit:
    - n represents the number of digits to rotate
    - the group of digits to be rotated starts at the end of the word
    - the first digit of the rotation group will be moved to the end of the number
  - implicit:
    - the rotation sequence is as follows:
      - for a rotation factor of, e.g., 3, for number 735291:
        - the last 3 numbers must be rotated: 291
        - first rotation: 291 -> 921
        - second rotation: 912
      - for a rotation factor of, e.g, 5, for number 735291:
        - the last 5 numbers must be rotated: 35291
        - first rotation: 53291
        - second rotation: 52391
        - third rotation: 52931
        - fourth rotation: 52913
      - pattern:
        - number of rotation rounds is n - 1

### Data Structures ###
- input: integers
- working with input:
  - string (convert input number to be rotated to a string)
  - array (to rotate required digits)
- output: integer

### Algorithm ###
Approach: write a function that takes two integers as arguments: one as the number to be rotated, and another as the rotation factor (i.e, the number of digits in the input number to be rotated). Convert the input number to a string, slice the rotation factor number of digits, rotate these digits and then replace the original digits with the rotated digits.

Function:
- convert the input number to be rotated to a string
- create a variable and slice (rotation factor) number of digits to be rotated
- split digits to be rotated into an array
- iterate over the array to rotate the digits from left to right:
  - for each iteration, swap digits at position [index] and position [index + 1]
  - number of iterations will be (rotation factor) - 1
- replace original digits with rotated digits
- return string input number converted to a Number

*/

/* eslint-enable */

function rotateRightmostDigits(number, digits) {
  let numberString = String(number);
  let digitsToBeRotated = numberString.slice(-digits);
  let rotatedDigits = digitsToBeRotated.split('');
  rotatedDigits = rotateArray(rotatedDigits).join('');
  let rotatedNumber = numberString.replace(digitsToBeRotated, rotatedDigits);

  return Number(rotatedNumber);
}

function rotateArray(input) {
  if (!Array.isArray(input)) return undefined;
  if (input.length === 0) return [];

  let arrayCopy = input.slice(1);
  arrayCopy.push(input[0]);

  return arrayCopy;
}

console.log(rotateRightmostDigits(735291, 1));      // 735291
console.log(rotateRightmostDigits(735291, 2));      // 735219
console.log(rotateRightmostDigits(735291, 3));      // 735912
console.log(rotateRightmostDigits(735291, 4));      // 732915
console.log(rotateRightmostDigits(735291, 5));      // 752913
console.log(rotateRightmostDigits(735291, 6));      // 352917
