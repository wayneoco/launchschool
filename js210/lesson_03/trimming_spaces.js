//function trim(string) {
//  let tempString = '';
//  let firstIndex;
//  for (firstIndex = 0; firstIndex < string.length; ++firstIndex) {
//    if (string[firstIndex] === ' ') continue;
//    else {
//      tempString += string[firstIndex];
//      break;
//    }
//  }
//
//  for (let secondIndex = firstIndex + 1; secondIndex < string.length; ++secondIndex) {
//    tempString += string[secondIndex];
//  }
//
//  if (tempString[tempString.length - 1] !== '') return console.log(tempString);
//
//  let finalString = '';
//  let thirdIndex;
//  for (let thirdIndex = string.length - 1; thirdIndex > 0; --thirdIndex) {
//    if (tempString[thirdIndex] === ' ') continue;
//    else {
//      finalString += tempString[thirdIndex];
//      break;
//    }
//  }
//
//  for (let lastIndex = thirdIndex - 1; lastIndex > 0; --lastIndex) {
//    finalString += tempString[lastIndex];
//  }
//
//  return console.log(finalString);
//}

function trim(string) {
  let tempString = '';

  for (let index = 0; index < string.length; ++index) {
    if (string[index] === ' ') {
      continue;
    } else {
      for (index; index < string.length; ++index) {
        tempString += string[index];
      }

      break;
    }
  }

  let finalString = '';

  for (let index = tempString.length - 1; index > 0; --index) {
    if (tempString[index] === ' ' && copyMode === false) {
      continue;
    } else {
      for (let secondIndex = 0; secondIndex <= index; ++secondIndex) {
        finalString += tempString[secondIndex];
      }
      
      break;
    }
  }

  return console.log(finalString);
}

trim('  abc  ');  // "abc"
trim('abc   ');   // "abc"
trim(' ab c');    // "ab c"
trim(' a b  c');  // "a b  c"
trim('      ');   // ""
trim('');         // ""
