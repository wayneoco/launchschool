/* eslint-disable */

/*
# Problem
- input: number
- output: boolean

- rules:
  - explicit:
    - sum the square of each digit of the input number
    - continue until the resulting number is either 1 or 4
    - if result is 1: true
    - if result is 4: false
  - pattern
    - to get a single digit: number % 10
    - to drop the last digit: number / 10 rounded down 

# Data Structures
- input: number
- working with input:
  - numbers
- output: boolean

# Algorithm
- initialize a results variable to 0

- create an outer loop that iterates over each starting number (starting number being a number where the square of its digits are summed)
  - create an inner loop
    - loop breaks once the square of all digits have been added to the results variable
      - breaking condition will be: number / 10 < 1
    - square the result of number % 10
      - add result to results variable
    - number = number / 10 rounded down
  - break out of loop when results variable = 1 or 4

return true if number = 1, false otherwise
*/

/* eslint-enable */

function isHappy(number) {
  let results;

  do {
    results = 0;

    while (number > 0) {
      results += (number % 10) ** 2;
      number = Math.floor(number / 10);
    }

    number = results;
  } while (results !== 1 && results !== 4);

  return results === 1;
}

console.log(isHappy(67)); // ➞ false
console.log(isHappy(89)); // ➞ false
console.log(isHappy(139)); // ➞ true
console.log(isHappy(1327)); // ➞ false
console.log(isHappy(2871)); // ➞ false
console.log(isHappy(3970)); // ➞ true
