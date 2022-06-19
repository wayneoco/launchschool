/* eslint-disable */

/*
### Problem Description ###
Write a function that takes a year as an argument and returns the number of 'Friday the 13ths' in that year. You may assume that the year is greater than 1752 (when the modern Gregorian Calendar was adopted by the United Kingdom). You may also assume that the same calendar will remain in use for the foreseeable future.

# Problem
- input: integer (year)
- output: integer
- rules:
  - explicit:
    - given a year as input:
      - return the number of days where:
        - day of the week is Friday
        - calendar day is 13th
    - year will always be greater than 1752
    - calendar will always be Gregorian 

# Data Structures
- input: integer
- working with input:
  - date object
  - numbers
- output: integer

# Algorithm
- initialize a count variable to 0;
- initialize a date variable to January 13 of the input year
- create a loop that breaks after 12 iterations:
  - get the day of the week for the current date object
  - if Friday, increment count variable by 1
  - increment the month of the date object by 1
- return the count variable

*/

/* eslint-enable */

function fridayThe13ths(year) {
  const monthsPerYear = 12;
  const friday = 5;
  let date = new Date(`01-13-${year}`);
  let count = 0;

  for (let currentMonth = 1; currentMonth <= monthsPerYear; currentMonth += 1) {
    if (date.getDay() === friday) {
      count += 1;
    }

    date.setMonth(currentMonth);
  }

  return count;
}

console.log(fridayThe13ths(1986));      // 1
console.log(fridayThe13ths(2015));      // 3
console.log(fridayThe13ths(2017));      // 2
