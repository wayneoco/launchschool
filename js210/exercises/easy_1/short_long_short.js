function shortLongShort(string1, string2) {
  let strings = [string1, string2].sort((a, b) => a.length - b.length);
  let shortString = strings[0];
  let longString = strings[1];

  return console.log(shortString.concat(longString).concat(shortString));
}

shortLongShort('abc', 'defgh');    // "abcdefghabc"
shortLongShort('abcde', 'fgh');    // "fghabcdefgh"
shortLongShort('', 'xyz');         // "xyz"
