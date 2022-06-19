function splitString(string, delimiter) {
  let tempString = '';
  for (let index = 0; index < string.length; ++index) {
    switch (true) {
      case delimiter === undefined:
        return console.log('ERROR: No delimiter');
      case delimiter === string[index]:
        console.log(tempString);
        tempString = '';
        break;
      case delimiter === '':
        console.log(string[index]);
        break;
      default:
        tempString += string[index];
        break;
    }  
  }

  if (tempString) {
    console.log(tempString);
  }
}

splitString('abc,123,hello world', ',');
// logs:
// abc
// 123
// hello world

splitString('hello');
// logs:
// ERROR: No delimiter

splitString('hello', '');
// logs:
// h
// e
// l
// l
// o

splitString('hello', ';');
// logs:
// hello

splitString(';hello;', ';');
// logs:
//  (this is a blank line)
// hello
