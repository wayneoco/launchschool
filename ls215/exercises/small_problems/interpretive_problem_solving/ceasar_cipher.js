/* eslint-disable */

/*

## Problem Description ###
Write a function that implements the Caesar Cipher. The Caesar Cipher is one of the earliest and simplest ways to encrypt plaintext so that a message can be transmitted securely. It is a substitution cipher in which each letter in a plaintext is substituted by the letter located a given number of positions away in the alphabet. For example, if the letter 'A' is right-shifted by 3 positions, it will be substituted with the letter 'D'. This shift value is often referred to as the key. The "encrypted plaintext" (ciphertext) can be decoded using this key value.

The Caesar Cipher only encrypts letters (including both lower and upper case). Any other character is left as is. The substituted letters are in the same letter case as the original letter. If the key value for shifting exceeds the length of the alphabet, it wraps around from the beginning.

### Problem ###
- input:
  - string (text to be encrypted)
  - integer (encryption key)
- output:
  - string (encrypted text)
- rules:
  - explicit:
    - each letter character in a string is substituted with the character N positions to the right
    - if current character position + N is greater than the length of the alphabet, the 'shifting' movement wraps to the beginning of the alphabet
    - new characters retain the case of the character being substituted
    - non-letter characters are left as-is
- questions:
  - what if the input key is negative?

### Data Structures ###
- input:
  - string
  - integer
- working with input
  - array
    - because the output string will be the same length as the input string, and because we are essentially transforming input letters into output letters, an array is a good candidate for working with the input
- requirements
  - array (of letters as a reference key)
- output:
  - string


### Algorithm ###
- create an Array of 26 letters
- if the input key is greater than 26, the value of the key should be key - 26.
- split input string into an array of characters
- iterate over the array of input string characters, transforming the characters as follows:
  - for non-letter characters, return the character as-is
  - for each letter character:
    - identify the character K positions to the right using the reference array created above
      - if the current character position + K is greater than 26, the value of K is K - 26
      - if the current character is lowercase, return the reference character as lowercase and vice versa for uppercase
- join the transformed array into a string
- return the string


*/


/* eslint-enable */

const LETTERS = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';

function caesarEncrypt(string, key) {
  let chars = string.split('').map(char => {
    if (/[^a-z]/i.test(char)) return char;

    let index = LETTERS.indexOf(char.toUpperCase());
    let newIndex = index + key;
    newIndex = newIndex > 25 ? normalizeIndex(newIndex) : newIndex;

    let encryptedLetter = LETTERS[newIndex];

    return /[a-z]/.test(char) ? encryptedLetter.toLowerCase() : encryptedLetter;
  });

  return chars.join('');
}

function normalizeIndex(index) {
  while (index > 25) {
    index -= 26;
  }

  return index;
}

// simple shift
console.log(caesarEncrypt('A', 0));       // "A"
console.log(caesarEncrypt('A', 3));       // "D"

// wrap around
console.log(caesarEncrypt('y', 5));       // "d"
console.log(caesarEncrypt('a', 47));      // "v"

// all letters
console.log(caesarEncrypt('ABCDEFGHIJKLMNOPQRSTUVWXYZ', 25));
// "ZABCDEFGHIJKLMNOPQRSTUVWXY"
console.log(caesarEncrypt('The quick brown fox jumps over the lazy dog!', 5));
// "Ymj vznhp gwtbs ktc ozrux tajw ymj qfed itl!"

// many non-letters
console.log(caesarEncrypt('There are, as you can see, many punctuations. Right?; Wrong?', 2602));
// "Vjgtg ctg, cu aqw ecp ugg, ocpa rwpevwcvkqpu. Tkijv?; Ytqpi?"
