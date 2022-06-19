function repeatedCharacters(string) {
  let charCounts = {};
  string = string.toLowerCase();
  
  for (let index = 0; index < string.length; ++index) {
    let currentChar = string[index];

    if (string.indexOf(currentChar) === string.lastIndexOf(currentChar)) {
      continue;
    } else if (charCounts[currentChar]) {
      charCounts[currentChar] += 1;
    } else {
      charCounts[currentChar] = 1;
    }
  }

  return charCounts;
}

console.log(repeatedCharacters('Programming'));    // { r: 2, g: 2, m: 2  }
console.log(repeatedCharacters('Combination'));    // { o: 2, i: 2, n: 2  }
console.log(repeatedCharacters('Pet'));     // {}
console.log(repeatedCharacters('Paper'));     // { p: 2  }
console.log(repeatedCharacters('Baseless'));     // { s: 3, e: 2  }
