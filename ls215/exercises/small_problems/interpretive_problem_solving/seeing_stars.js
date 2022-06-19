/* eslint-disable */

/*
### Problem Description ###
Write a function that displays an 8-pointed star in an nxn grid, where n is an odd integer that is supplied as an argument to the function. The smallest such star you need to handle is a 7x7 grid (i.e., when n is 7).

### Problem ###
- input: integer
- output: strings (in the shape of a star)
- rules:
  - explicit:
    - star is n wide and n high
    - minimum width is 7
    - width is always odd
  - implicit:
    - pattern:
      - stars:
        - center row: n stars
        - all other rows: 3 stars + m spaces
      - spaces:
        - top and bottom rows: m = n - 3
          - each section of spaces is m / 2
        - each inner row is previous row - 1
      - e.g., if width is 9
        - * 3 * 3 *
        - * 2 * 2 *
        - * 1 * 1 *
        - ***
        - *********
        - ***
        - * 1 * 1 *
        - * 2 * 2 *
        - * 3 * 3 *
      - e.g., if width is 7
        - * 2 * 2 *
        - * 1 * 1 *
        - ***
        - *******
        - ***
        - * 1 * 1 *
        - * 2 * 2 *

### Data Structures
- strings

### Algorithm ###
- create a function that takes an integer N as input
- create a max_spaces variable, where MS = N - 3 / 2

- create a helper function to create the top half of the star:
  - takes N and MS as input
  - create a loop that breaks after n / 2 iterations (rounded down)
    - inner spaces count starts at MS
    - outer spaces count starts at MS - inner spaces count
    - create a line variable:
      - * + space count + * + space count + *
    - log line to console
    - decrement space count variable by 1


*/

/* eslint-enable */

function star(width) {
  const STARS_PER_TOP_AND_BOTTOM_ROWS = 3;
  const MAX_SPACES = (width - STARS_PER_TOP_AND_BOTTOM_ROWS) / 2;

  starTop(width, MAX_SPACES);
  console.log('*'.repeat(width));
  starBottom(width, MAX_SPACES);

  return width;
}

function starTop(width, maxSpaces) {
  for (let spaceCount = maxSpaces; spaceCount >= 0; spaceCount -= 1) {
    let innerSpaces = ' '.repeat(spaceCount);
    let outerSpaces = ' '.repeat(maxSpaces - spaceCount);
    let line = outerSpaces + '*' + innerSpaces + '*' + innerSpaces + '*';
    console.log(line);
  }

  return width;
}

function starBottom(width, maxSpaces) {
  for (let spaceCount = 0; spaceCount <= maxSpaces; spaceCount += 1) {
    let innerSpaces = ' '.repeat(spaceCount);
    let outerSpaces = ' '.repeat(maxSpaces - spaceCount);
    let line = outerSpaces + '*' + innerSpaces + '*' + innerSpaces + '*';
    console.log(line);
  }

  return width;
}

star(7);
star(9);
