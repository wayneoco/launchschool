/* eslint-disable */

/*

### Problem Description ###

Write a function that takes a string and returns an object containing the following three properties:

- the percentage of characters in the string that are lowercase letters
- the percentage of characters that are uppercase letters
- the percentage of characters that are neither

You may assume that the string will always contain at least one character.

# Problem
- input: string
- output: object (with 3 properties)
- rules:
  - explicit:
    - given a string as input, return an object with three properties:
      1. percentage of lowercase characters
      2. percentage of uppercase characters
      3. percentage of non-letter characters
    - object values are percentages, with two decimal places, as strings
    - string will always contain at least 1 character
  - implicit:
    - spaces count as non-letter characters

# Data Structures
- input: string
- working with input:
  - string
  - numbers (for percentages)
- output: object

# Algorithm
Approach:
  - create an object with three properties: lowercase, uppercase, neither, with initial values of 0.
  - iterate over the input string:
    - for each character, incremenet the appropriate object property count depending on the type of character: lowercase, uppercase, neither
  - once all characters have been counted, iterate over the object properties, converting each property's value to a percentage as a string
  - return the object

*/

/* eslint-enable */

function letterPercentages(string) {
  let percentages = { lowercase: 0, uppercase: 0, neither: 0 };

  letterCount(string, percentages);

  Object.keys(percentages).forEach(key => {
    percentages[key] = String(
      ((percentages[key] / string.length) * 100).toFixed(2)
    );
  });

  return console.log(percentages);
}

function letterCount(string, percentagesObject) {
  const lowercase = /[a-z]/;
  const uppercase = /[A-Z]/;

  for (let index = 0; index < string.length; index += 1) {
    let char = string[index];

    switch (true) {
      case lowercase.test(char):
        percentagesObject.lowercase += 1;
        break;
      case uppercase.test(char):
        percentagesObject.uppercase += 1;
        break;
      default:
        percentagesObject.neither += 1;
        break;
    }
  }
}

letterPercentages('abCdef 123');
// { lowercase: "50.00", uppercase: "10.00", neither: "40.00" }

letterPercentages('AbCd +Ef');
// { lowercase: "37.50", uppercase: "37.50", neither: "25.00" }

letterPercentages('123');
// { lowercase: "0.00", uppercase: "0.00", neither: "100.00" }
