/* eslint-disable */

/*

Write a function that takes any two version numbers in this format and compares them, with the result of this comparison showing whether the first is less than, equal to, or greater than the second version:

If version1 > version2, we should return 1.
If version1 < version2, we should return -1.
If version1 === version2, we should return 0.
If either version number contains characters other than digits and the . character, we should return null.

# Problem
- input
  - numeric digits and decimal points only
  - can be just a single digit with no decimal point
  - can be multiple parts with multiple decimal points
- output
  - 1, -1, or 0 depending on whether the first input is less than, greater than or equal to the second input
  - null if either input contains a character other than a digit or decimal point

- rules
  - explicit
    - ${number} without a decimal is equal to ${number}.0
  - implicit
    - 

# DS
- input: strings
- algorithm: array
- output: integer

# Algorithm
Approach: create a function that iterates over one array of string digits and compares each string digit with the string digits of a second array. If all the digits are equal, then return 0. Otherwise return -1 if the first input is less than the second input and 1 if it is greater.

Function:
- Create a function that takes two input strings.
- If either string contains a character other than digits and a decimal point, return `null`.
- Split each input string into an array of characters.
- If one array is shorter than the other, increase the length of that array to match the array of the other.
  - Fill the additional array indices with `.` and `0` as needed
- Iterate over the first array, comparing each character with the character at the same index in the second array.
  - The comparions will be <, > and equal to.
  - If any character is less than or greater than the other character, return -1 or 1, respectively.
  - If a character is equal to the other equal character, continue iterating through the array of characters.
- If iteration continues through the entire array without returning -1 or 1, return 0.

*/

/* eslint-enable */

'use strict';

function compareVersions(version1, version2) {
  if (invalidVersionNumber(version1) ||
    invalidVersionNumber(version2)) return null;

  let version1Numbers = version1.split('.');
  let version2Numbers = version2.split('.');

  if (version1Numbers.length < version2Numbers.length) {
    version1Numbers = lengthenArray(version1Numbers, version2Numbers.length);
  }

  return compareArrays(version1Numbers, version2Numbers);
}

function invalidVersionNumber(versionNumber) {
  const invalidChars = /[^0-9.]/;
  const noDigitAfterDecimal = /\d\.$/;
  const noDigitBeforeDecimal = /^\./;
  const twoDecimalsInARow = /\.\./;

  return invalidChars.test(versionNumber) ||
    noDigitAfterDecimal.test(versionNumber) ||
    noDigitBeforeDecimal.test(versionNumber) ||
      twoDecimalsInARow.test(versionNumber);
}

function lengthenArray(array, newLength) {
  const startIndex = array.length;
  array.length = newLength;

  return array.fill('0', startIndex);
}

function compareArrays(array1, array2) {
  for (let index = 0; index < array1.length; index += 1) {
    if (Number(array1[index]) < Number(array2[index])) {
      return -1;
    } else if (Number(array1[index]) > Number(array2[index])) {
      return 1;
    }
  }

  return 0;
}

console.log(compareVersions('1', '1'));            // 0
console.log(compareVersions('1.1', '1.0'));        // 1
console.log(compareVersions('2.3.4', '2.3.5'));    // -1
console.log(compareVersions('1.a', '1'));          // null
console.log(compareVersions('.1', '1'));           // null
console.log(compareVersions('1.', '2'));           // null
console.log(compareVersions('1..0', '2.0'));       // null
console.log(compareVersions('1.0', '1.0.0'));      // 0
console.log(compareVersions('1.0.0', '1.1'));      // -1
console.log(compareVersions('1.0', '1.0.5'));      // -1
