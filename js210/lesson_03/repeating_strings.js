function repeat(string, times) {
  switch (true) {
    case times === 0:
      return console.log('');
    case times === 1:
      return console.log(string);
    case times > 1:
      let tempString = '';
      for (let index = 0; index < times; ++index) {
        tempString += string;
      }
      return console.log(tempString);
    default:
      return console.log(undefined);
  }
}

repeat('abc', 1);       // "abc"
repeat('abc', 2);       // "abcabc"
repeat('abc', -1);      // undefined
repeat('abc', 0);       // ""
repeat('abc', 'a');     // undefined
repeat('abc', false);   // undefined
repeat('abc', null);    // undefined
repeat('abc', '  ');    // undefined
