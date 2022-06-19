function startsWith(string, searchString) {
  let searchStringLength = searchString.length;
  for (index = 0; index < searchStringLength; ++index) {
    if (string[index] !== searchString[index]) {
      return console.log(false);
    }
  }

  console.log(true);
}

let str = 'We put comprehension and mastery above all else';
startsWith(str, 'We');              // true
startsWith(str, 'We put');          // true
startsWith(str, '');                // true
startsWith(str, 'put');             // false

let longerString = 'We put comprehension and mastery above all else!';
startsWith(str, longerString);      // false
