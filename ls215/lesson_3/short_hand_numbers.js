/* eslint-disable */

/*

### Problem Description ###
You are given a list of numbers in a "short-hand" range where only the significant part of the next number is written because we know the numbers are always increasing (ex. "1, 3, 7, 2, 4, 1" represents [1, 3, 7, 12, 14, 21]). Some people use different separators for their ranges (ex. "1-3, 1-2", "1:3, 1:2", "1..3, 1..2" represent the same numbers [1, 2, 3, 11, 12]). Range limits are always inclusive.

Your job is to return a list of complete numbers.

The possible separators are: ["-", ":", ".."]

"1, 3, 7, 2, 4, 1" --> 1, 3, 7, 12, 14, 21
"1-3, 1-2" --> 1, 2, 3, 11, 12
"1:5:2" --> 1, 2, 3, 4, 5, 6, ... 12
"104-2" --> 104, 105, ... 112
"104-02" --> 104, 105, ... 202
"545, 64:11" --> 545, 564, 565, .. 611

### Problem ###
- input: string
- output: array
- rules:
  - explicit:
    - input is a string comprised of:
      - digits
      - commas
      - zero or more range separators:
        - '-'
        - ':'
        - '..'
    - a range should be expanded to a range of sequentially incremented numbers, starting at the first number and ending at the second number
  - implicit:
    - rules for expanding a single number:
      - if the previous number is greater than the current number, the current number is shorthand and should be expanded
      - to expand a number, the number is the next number (after the previous number) that ends in the number that must be expanded
       - e.g., 
          - 7, 4 -> 14
          - 12, 1 -> 21
          - 37, 4 -> 44
          - 44, 32 -> 132

### Data Structures ###
- input: string
  - array
- output: array of integers

### Algorithm ###
- split input string in an array of numbers and number ranges
  - comma as delimiter
- transform the array as follows:
  - first digit is always returned as is
  - for all other single digits:
    - if previous number is greater than current number:
      - current number is the last digit of the next number after the previous number that ends in the current number


*/

/* eslint-enable */

// function shortHand(string) {
//   let numbers = string.split(',');
//   let expandedNumbers = [];
// 
//   numbers.forEach((currentNumber, index) => {
//     let previousNumber = expandedNumbers[index - 1];
// 
//     if (Number(currentNumber) < Number(previousNumber)) {
//       let expandedNumber = expandNumber(previousNumber, currentNumber);
//       expandedNumbers.push(expandedNumber);
//     } else {
//       expandedNumbers.push(currentNumber);
//     }
//   });
// 
//   return expandedNumbers.map(Number);
// }

function shortHand(string) {
  let numbers = string.split(',');
  let finalNumbers = [];

  for (let index = 0; index < numbers.length; index += 1) {
    let currentNumber = numbers[index];
    let previousNumber = finalNumbers[index - 1];

    if (/[-.:]/.test(currentNumber)) {
      let [ start, end ] = currentNumber.split(/[.:-]/);

      if (Number(start) < Number(previousNumber)) {
        start = expandNumber(previousNumber, start);
      }

      if (Number(end) < Number(start)) {
        end = expandNumber(start, end);
      }

      finalNumbers.push(expandRange(start, end, 1));
      continue;
    }

    if (Number(currentNumber) < Number(previousNumber)) {
      finalNumbers.push(expandNumber(previousNumber, currentNumber));
    } else {
      finalNumbers.push(currentNumber);
    }
  };

  return finalNumbers.flatMap(el => el).map(Number);
}

function expandRange(start, end, step) {
  start = Number(start);
  end = Number(end);
  step = Number(step);

  return Array.from(
    { length: (end - start) + 1 }, (_, index) => start + (index * step)
  );
}

function expandNumber(previousNumber, currentNumber) {
  let lastDigit = Number(currentNumber);
  currentNumber = Number(previousNumber);
  let power = String(currentNumber).length;

  while (currentNumber % (10 ** power) !== lastDigit) {
    currentNumber += 1;
    power = String(currentNumber).length - 1;
  }

  return currentNumber;
}

console.log(shortHand('1, 3, 7, 2, 4, 1'));                // [1, 3, 7, 12, 14, 21]
console.log(shortHand('104, 02'));                         // [104, 202]
console.log(shortHand('1-5'));                            // [1, 2, 3, 4, 5]
console.log(shortHand('1-3, 1-2'));                        // [1, 2, 3, 11, 12]
