/* eslint-disable */

/*
### Problem Description ###
Given a collection of spelling blocks:

B:O  X:K  D:Q  C:P  N:A
G:T  R:E  F:S  J:W  H:U
V:I  L:Y  Z:M

Where:
- words can be spelled with only one letter from each block, not both
- each block can be used only once


Write a function that takes a word string as an argument, and returns true if the word can be spelled using the set of blocks, or false otherwise. You can consider the letters to be case-insensitive when you apply the rules.

### Problem ###
- input: string
- output: boolean
- rules:
  - explicit:
    - each block has two letters
    - if one letter is used from a block, the other letter cannot be used
    - a block can be used only once
    - letter matching is case insensitive
  - implicit:
    - empty string returns false (no letters match)
    - a string with non-letter characters returns false

### Data Structure ###
- input: string
- rules:
  - nested arrays to represent available letters / blocks
- output: boolean

### Algorithm ###
Approach:
  - iterate over each letter of an input string
  - if a letter matches either letter of a 2-letter block, delete the block and continue to the next letter of the input string
  - if a letter does not match any letters of any blocks, return false
  - if the iteration completes to the end of the input string without returning false, return true

*/

/* eslint-enable */


function isBlockWord(word) {
  if (!word) return false;

  let BLOCKS = ['BO', 'XK', 'DQ', 'CP', 'NA', 'GT', 'RE', 'FS', 'JW', 'HU', 'VI', 'LY', 'ZM'];

  for (let index = 0; index < word.length; index += 1) {
    let char = word[index].toUpperCase();

    if (BLOCKS.some(block => block.includes(char))) {
      let blockIndex = BLOCKS.findIndex(block => block.includes(char));
      BLOCKS.splice(blockIndex, 1);
    } else {
      return false;
    }
  }

  return true;
}

console.log(isBlockWord('BATCH'));      // true
console.log(isBlockWord('BUTCH'));      // false
console.log(isBlockWord('jest'));       // true
console.log(isBlockWord(''));           // false
console.log(isBlockWord());             // false

