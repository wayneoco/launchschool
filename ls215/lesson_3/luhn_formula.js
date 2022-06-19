/* eslint-disable */

/*
### Problem Description ###
Write a program that, given a number in string format, checks if it is valid per the Luhn formula.
This should treat, for example, "2323 2005 7766 3554" as valid.
You can ignore all non-numeric characters in the input string.

### Problem ###
- input: string
- output: "valid"
  - ***what is "valid"? boolean?
- rules:
  - explicit:
    - input may contain digits and non-digit characters
    - counting from right to left, double every second digit
    - for any digit that becomes 10 or greater, subtract 9
    - add all digits together to get a single checksum
    - valid checksum is a number that ends in 0 (i.e., remainder 10 === 0)
  - implicit:
  - questions
    - how to handle an empty string?
    - how to handle no input?

### Data Structures ###
- input:
  - original input is a string
  - use an array to iterate over digits
- output: boolean

### Algorithm ###
Approach: Create a function that takes a string as input, reduces the string to digits only, then starting from right to left sums the digits according to the Luhn Formula. If the sum is even divisible by 10, return true; otherwise return false.

Function:
- return false if:
  - string is empty
  - input is not a string
  - input is undefined
- remove all non-digit characters from the string
- split the string into an array of string digits
- convert each string digit to a Number
- iterate over the array of digits, transforming each digit as follows:
  - if the length of the array is even:
    - for every even indexed element, return the element * 2 // probably want a helper function
      - if the resulting number is >= 10, subtract 9
    - for every odd indexed element, return the element
  - if the length of the array is odd:
    - for every even indexed element, return the element
    - for every odd indexed element, return the element * 2 // probably want a helper function
      - if the resulting number is >=10, subtract 9
- sum the resulting array
- if the sum if evenly divided by 10, return true; otherwise, return false

### Check Digit Problem Description ###
Write a function that can add a check digit to make the number valid per the Luhn formula
and return the original number plus that digit. This should give '2323 2005 7766 3554' in response
to '2323 2005 7766 355'.

### Problem ###
- input: a string of digits
- output: a string of digits
- rules:
  - the function finds the last digit that will make the input string of digits a valid Luhn checksum

### Data Structure ###
- input: string
- output: string

### Algorithm ###
Approach:
- loop through string digits 0-9
- for each iteration, append the current string digit to the input string
- invoke isValidChecksum function on the concatenated string:
  - if true, return the concatenated string
  - if false, continue to the next iteration

 */

/* eslint-enable */

function checkDigit(string) {
  if (validChecksum(string)) return string;

  for (let index = 0; index <= 9; index += 1) {
    let testString = string + String(index);

    if (validChecksum(testString)) {
      return testString;
    }
  }

  return 'invalid';
}

console.log(checkDigit('2323 2005 7766 355'));         // '2323 2005 7766 3554'
console.log(checkDigit('1111'));                       // '11114'
console.log(checkDigit('876'));                        // '8763'
console.log(checkDigit('8763'));                       // '8763'

function validChecksum(string) {
  if (isInvalidInput(string)) return false;

  let digits = string.replace(/[^0-9]/g, '')
                     .split('')
                     .reverse()
                     .map(digit => Number(digit));

  digits = digits.map((digit, index) => {
    if (index % 2 === 0) {
      return digit;
    } else {
      return doubleDigit(digit);
    }
  });

  const checksum = digits.reduce((sum, digit) => sum + digit);
  return isValidChecksum(checksum);
}

function isInvalidInput(string) {
  const noDigits = /^[^0-9]+$/;

  return typeof string !== 'string' || !string || noDigits.test(string);
}

function doubleDigit(digit) {
  digit *= 2;

  if (digit >= 10) {
    digit -= 9;
  }

  return digit;
}

function isValidChecksum(checksum) {
  return checksum % 10 === 0;
}

console.log(validChecksum('2323 2005 7766 3554'));                   // true
console.log(validChecksum('2 3 2 3 2 0 0 5 7 7 6 6 3 5 5 4'));       // true
console.log(validChecksum('2..323 2+)005 7766 3554'));               // true
console.log(validChecksum('1111'));                                  // false
console.log(validChecksum('11114'));                                 // true
console.log(validChecksum('1111.+1111   '));                         // false
console.log(validChecksum('8763'));                                  // true
console.log(validChecksum(''));                                      // false
console.log(validChecksum());                                        // false
console.log(validChecksum(8763));                                    // false
console.log(validChecksum('...'));                                   // false
