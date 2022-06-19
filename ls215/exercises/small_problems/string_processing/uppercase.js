function isUppercase(string) {
  for (let index = 0; index < string.length; index += 1) {
    if (string[index].match(/[a-z]/)) {
      return false;
    }
  }

  return true;
}

console.log(isUppercase('t'));               // false
console.log(isUppercase('T'));               // true
console.log(isUppercase('Four Score'));      // false
console.log(isUppercase('FOUR SCORE'));      // true
console.log(isUppercase('4SCORE!'));         // true
console.log(isUppercase(''));                // true
