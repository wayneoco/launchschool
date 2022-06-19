function stringy(length) {
  let string = '10'.repeat(length / 2);

  if (length % 2 === 1) {
    string += '1';
  }

  return console.log(string);
}

stringy(6);    // "101010"
stringy(9);    // "101010101"
stringy(4);    // "1010"
stringy(7);    // "1010101"
stringy(2);    // "10"
stringy(1);    // "1"
