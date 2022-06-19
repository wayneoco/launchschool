function cleanUp(string) {
  let newString = '';
  
  for (let index = 0; index < string.length; ++index) {
    let currentChar = string[index];

    if (isLetter(currentChar)) {
      newString += currentChar;
    } else if (noDoubleSpaces(newString)) {
      newString += ' ';
    }
  }

  return console.log(newString);
}

function isLetter(char) {
  return /[a-z]/i.test(char);
}

function noDoubleSpaces(string) {
  return string[string.length - 1] !== ' ';
}

cleanUp("---what's my +*& line?");    // " what s my line "
