function repeater(string) {
  let doubleString = '';

  for (let index = 0; index < string.length; index += 1) {
    let currentChar = string[index];
    doubleString = doubleString.concat(currentChar, currentChar);
  }

  return doubleString;
}

console.log(repeater('Hello'));        // "HHeelllloo"
console.log(repeater('Good job!'));    // "GGoooodd  jjoobb!!"
console.log(repeater(''));             // ""
