/* eslint-disable */

/*
### Problem Description ###
Write a function that displays a four-pointed diamond in an nxn grid, where n is an odd integer supplied as an argument to the function. You may assume that the argument will always be an odd integer.

### Problem ###
- input: integer
- output: diamond-shaped string logged to console
- rules:
  - explicit:
    - input integer n will always be odd
    - output string is a 4-pointed diamond in a n x n grid
    - input integer n represents:
      - width of the diamond
      - height of the diamond
  - implicit:
    - each line is comprised of one or more *, plus 0 or more spaces
    - * pattern, where e.g., n = 5:
      - 1, 3, 5, 3, 1
    - space pattern where n = 5
      - 2, 1, 0, 1, 2
      - max spaces = n / 2 (rounded down)
    - each line = spaces + *

## Data Structure
- input: integer
  - working with input:
    - string
- output: string

### Algorithm ###
Approach: create two functions, one that creates the top half of the diamond and one that creates the bottom half.

- create a max spaces variable (n / 2 rounded down to a whole integer)

Top half
- create a current spaces variable that is equal to the max spaces variable
- create a loop that breaks after after current spaces variable reaches 0
  - create a current star count variable (input n - current spaces * 2)
  - log to console current spaces + number of stars
  - decrement current spaces variable by 1

n = 5
MAX_SPACES = 2
currentSpaces = MAX_SPACES
loop
- currentStars = n - currentSpaces * 2 (1)
- log: '  *'
- currentSpaces - 1 (1)
- currentStars = n - currentSpaces * 2 (3)
- log: '  *'
- log: ' ***'
- currentSpaces - 1 (0)
- currentStars = n - currentSpaces * 2 (5)
- log: '  *'
- log: ' ***'
- log: '*****'

Bottom half
- create a current spaces variable that is equal to 1
- create a loop that breaks after the current spaces variable is greater than the max spaces variable
  - create a current star count variable(input n - current spaces)
  - log to console the current spaces + number of stars
  - increment current spaces variable by 1

*/

/* eslint-enable */

function diamond(width) {
  diamondTop(width);
  diamondBottom(width);

  return width;
}

function diamondTop(width) {
  const MAX_SPACES = Math.floor(width / 2);

  for (let spaceCount = MAX_SPACES; spaceCount >= 0; spaceCount -= 1) {
    let starCount = width - (spaceCount * 2);
    let stars = '*'.repeat(starCount);
    let line = stars.padStart(spaceCount + starCount);
    console.log(line);
  }
}

function diamondBottom(width) {
  const MAX_SPACES = Math.floor(width / 2);

  for (let spaceCount = 1; spaceCount <= MAX_SPACES; spaceCount += 1) {
    let starCount = width - (spaceCount * 2);
    let stars = '*'.repeat(starCount);
    let line = stars.padStart(spaceCount + starCount);
    console.log(line);
  }
}

diamond(1);

diamond(3);

diamond(9);

/* eslint-disable */

/*
### Problem Description ###
Create a hollow diamond.

### Problem ###
- rules:
  - line:
    - either 1 or 2 stars
      - first and last lines have 1 star
      - lines 2 thru (n - 1) have 2 stars
    - spaces:
      - outer:
        - max spaces = n - stars / 2
        - inner: (star count - current spaces) - 2
    - pattern, where n = 5
      - '  *  ' // 2 + 1
      - ' * * ' // 1 + 1 + 1 + 1 + 1
      - '*   *' // 1 + 3 + 1
      - ' * * ' // 1 + 1 + 1 + 1 + 1
      -    *  ' // 2 + 1

      - '    *    ' // 4     + 1     + 4
      - '   * *   ' // 3 + 1 + 1 + 1 + 3
      - '  *   *  ' // 2 + 1 + 3 + 1 + 2
      - ' *     * ' // 1 + 1 + 5 + 1 + 1
      - '*       *' //     1 + 7 + 1
      - ' *     * ' // 1 + 1 + 5 + 1 + 1
      - '  *   *  ' // 2 + 1 + 3 + 1 + 2
      - '   * *   ' // 3 + 1 + 1 + 1 + 3
      - '    *    ' // 4     + 1     + 4

*/

/* eslint-enable */

function diamondHollow(width) {
  if (width === 1) {
    console.log('*');
    return width;
  }

  diamondHollowTop(width);
  diamondHollowBottom(width);

  return width;
}

function diamondHollowTop(width) {
  const MAX_SPACES = Math.floor(width / 2);

  let firstLine = ' '.repeat(MAX_SPACES) + '*';
  console.log(firstLine);

  for (let spaceCount = MAX_SPACES - 1; spaceCount >= 0; spaceCount -= 1) {
    let starLineWidth = width - (spaceCount * 2);
    let innerSpaceCount = starLineWidth < 2 ? 0 : starLineWidth - 2;
    let line = ' '.repeat(spaceCount) + '*' + ' '.repeat(innerSpaceCount) + '*';
    console.log(line);
  }
}

function diamondHollowBottom(width) {
  const MAX_SPACES = Math.floor(width / 2);

  for (let spaceCount = 1; spaceCount < MAX_SPACES; spaceCount += 1) {
    let starLineWidth = width - (spaceCount * 2);
    let innerSpaceCount = starLineWidth < 2 ? 0 : starLineWidth - 2;
    let line = ' '.repeat(spaceCount) + '*' + ' '.repeat(innerSpaceCount) + '*';
    console.log(line);
  }

  let lastLine = ' '.repeat(MAX_SPACES) + '*';
  console.log(lastLine);
}

diamondHollow(1);
diamondHollow(3);
diamondHollow(9);
