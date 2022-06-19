/* eslint-disable */

/*
### Problem Description ###
A triangle is classified as follows:

Right: One angle is a right angle (exactly 90 degrees).
Acute: All three angles are less than 90 degrees.
Obtuse: One angle is greater than 90 degrees.

To be a valid triangle, the sum of the angles must be exactly 180 degrees, and every angle must be greater than 0. If either of these conditions is not satisfied, the triangle is invalid.

Write a function that takes the three angles of a triangle as arguments and returns one of the following four strings representing the triangle's classification: 'right', 'acute', 'obtuse', or 'invalid'.

You may assume that all angles have integer values, so you do not have to worry about floating point errors. You may also assume that the arguments are in degrees.

# Problem
- input: integer (3)
- output: string
- rules:
  - explicit:
    - valid triangle:
      - sum of all angles = 180
      - every angle > 0
    - three types of triangles:
      - right: one angle is 90 
      - acute: all angles are < 90
      - obtuse: one angle is > 90
    - all angles have integer values
    - integer arguments represent degrees

# Data Structures
- input: integer
- working with input:
  - array to hold angle values
- output: string

# Algorithm
- validate input for valid triangle:
  - total of all angles = 180
  - all angles > 0
- conditional flow:
  - if one angle = 90, return 'right'
  - if one angle < 90, return 'obtuse'
  - else, return 'acute'

*/

/* eslint-enable */

function triangle(...angles) {
  if (isInvalidTriangle(angles)) return 'invalid';

  switch (true) {
    case angles.some(angle => angle === 90):
      return 'right';
    case angles.every(angle => angle < 90):
      return 'acute';
    case angles.some(angle => angle < 90):
      return 'obtuse';
  }

  return angles;
}

function isInvalidTriangle(angles) {
  return angles.some(angle => angle <= 0) ||
    angles.reduce((sum, angle) => sum + angle) !== 180;
}

console.log(triangle(60, 70, 50));       // "acute"
console.log(triangle(30, 90, 60));       // "right"
console.log(triangle(120, 50, 10));      // "obtuse"
console.log(triangle(0, 90, 90));        // "invalid"
console.log(triangle(50, 50, 50));       // "invalid"
