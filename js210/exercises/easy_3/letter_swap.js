function switchFirstAndLastLetters(word) {
  return word.replace(/(^.)(.*)(.$)/, '$3$2$1' );
}

function swap(text) {
  return text.split(' ').map(switchFirstAndLastLetters).join(' ');
}

console.log(swap('Oh what a wonderful day it is'));  // "hO thaw a londerfuw yad ti si"
console.log(swap('Abcde'));                          // "ebcdA"
console.log(swap('a'));                              // "a"
