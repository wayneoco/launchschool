function doubleConsonants(string) {
  let consonantRegExp = /[^aeiou]/gi;
  return string.replace(consonantRegExp, match => match + match);
}

console.log(doubleConsonants('String'));          // "SSttrrinngg"
console.log(doubleConsonants('Hello-World!'));    // "HHellllo-WWorrlldd!"
console.log(doubleConsonants('July 4th'));        // "JJullyy 4tthh"
console.log(doubleConsonants(''));                // ""
