/* eslint-disable */

/*

# Problem
- input: string
- output: string

- rules:
  - each rail has only 1 letter
  - start downward, then upward
  - spaces between letters:
    - starting at 0, add 2 up to N times
  - pattern:
    - 1st row starts at index 0, 3 spaces between letters
    - 2nd row starts at index 1, 1 space between letters
    - 3rd row starts at index 2, 3 spaces between letters

    - center row letter count = length of word / 2 (rounded down)
    - top row letter count = (length of word - center row letter count) / 2 (rounded up)
    - bottom row letter count = length of word - (center row + top row)


HI WAYNE, 2
H.W.Y.E
.I.A.N

HWYEIAN

HI WAYNE, 3
H...Y
.I.A.N
..W...E

WE ARE DISCOVERED FLEE AT ONCE, 4
W.....I.....R.....E.....E
.E...D.S...E.E...E.A...C
..A.E...C.V...D.L...T.N
...R.....O.....F.....O

*/

/* eslint-enable */

function railEncode(string, rails) {
  string = string.replace(/[^a-z]/gi, '');
  let encodedWord = initializeRails(rails);
  let count = 0;

  while (count < string.length) {
    for (let index = 0; index < rails; index += 1) {
      encodedWord[index].push(string[count]);
      count += 1;
    }

    for (let index = rails - 2; index > 0; index -= 1) {
      encodedWord[index].push(string[count]);
      count += 1;
    }
  }

  return encodedWord.flatMap(letters => letters.join('')).join('');
}

function initializeRails(rails) {
  let arrays = [];

  for (let index = 0; index < rails; index += 1) {
    arrays.push([]);
  }

  return arrays;
}

let string = 'WE ARE DISCOVERED FLEE AT ONCE';
console.log(railEncode(string, 3) === 'WECRLTEERDSOEEFEAOCAIVDEN');
console.log(railEncode(string, 4));

string = 'HI WAYNE';
console.log(railEncode(string, 2) === 'HWYEIAN');

function railDecode(string, rails) {
  let decodedWord = initializeRails(rails);
  let spaceCount = findSpaceCount(rails);
  let stringIndex = 0;

  for (let index = 0; index < rails; index += 1) {
    decodedWord[index] = decodedWord[index] || '';
    decodedWord[index] += '.'.repeat(index);

    for (let i = 0; decodedWord[index].length < string.length; i += 1) {
      decodedWord[index] += string[stringIndex];

      if (decodedWord[index].length < 25) {
        decodedWord[index] += '.'.repeat(spaceCount);
      }

      stringIndex += 1;
    }

    spaceCount = spaceCount - 2 < 0 ? 0 : spaceCount - 2;
  }

  return decodedWord;
}

function findSpaceCount(rails) {
  let count = 1;

  for (let index = 1; index < rails - 1; index += 1) {
    count += 2;
  }

  return count;
}

string = 'WECRLTEERDSOEEFEAOCAIVDEN';
console.log(railDecode(string, 3)); //=== ' WE ARE DISCOVERED FLEE AT ONCE');

//string = 'WIREEEDSEEEACAECVDLTNROFO';
//console.log(railDecode(string, 4));
