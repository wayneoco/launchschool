/* eslint-disable */

/*
### Problem Description ###

A triangle is classified as follows:

Equilateral: All three sides are of equal length.
Isosceles: Two sides are of equal length, while the third is different.
Scalene: All three sides are of different lengths.

To be a valid triangle, the sum of the lengths of the two shortest sides must be greater than the length of the longest side, and every side must have a length greater than 0. If either of these conditions is not satisfied, the triangle is invalid.

Write a function that takes the lengths of the three sides of a triangle as arguments and returns one of the following four strings representing the triangle's classification: 'equilateral', 'isosceles', 'scalene', or 'invalid'.

# Problem
- input: integer (3)
- output: string
- rules:
  - explicit:
    - triangle definitions:
      - equilateral: all sides are equal
      - isosceles: two sides are equal
      - scalene: 0 sides are equal 
    - valid triangle:
      - sum of lengths of the two shorter sides must be greater than the longest
      - length of every side must be greater than 0

# Data Structures
- input: integer
- working with input:
  - array (to hold sides)
- output: string

# Algorithm
- sort array from smallest to longest length;
- validate input for valid triangle; return 'invalid' or continue
- conditional flow:
  - if all sides are equal to one side, return 'equilateral'
  - if the first and second or second and third elements are equal, return 'isosceles'
  - else return 'scalene'

*/

/* eslint-enable */

function triangle(...sides) {
  sides.sort((a, b) => a - b);

  if (!isValidTriangle(sides)) return 'invalid';

  if (sides.every(side => side === sides[0])) {
    return 'equilateral';
  } else if (sides[0] === sides[1] || sides[1] === sides[2]) {
    return 'isosceles';
  } else {
    return 'scalene';
  }
}

function isValidTriangle(sides) {
  return sides[0] + sides[1] > sides[2] &&
    sides.every(side => side > 0);
}

triangle(3, 3, 3);        // "equilateral"
triangle(3, 3, 1.5);      // "isosceles"
triangle(3, 4, 5);        // "scalene"
triangle(0, 3, 3);        // "invalid"
triangle(3, 1, 1);        // "invalid"
