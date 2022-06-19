function toLowerCase(string) {
  let lowerCaseString = ''
  for (index = 0; index < string.length; ++index) {
    let currentChar = string[index];

    if (/[A-Z]/.test(currentChar)) {
      let charCode = string.charCodeAt(index) + 32;
      currentChar = String.fromCharCode(charCode);
    }

    lowerCaseString += currentChar;
  }

  return console.log(lowerCaseString);
}

toLowerCase('ALPHABET');    // "alphabet"
toLowerCase('123');         // "123"
toLowerCase('abcDEF');      // "abcdef"
toLowerCase('abc;deF');
