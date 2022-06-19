function utf16Value(string) {
  if (string.length === 0) return console.log(0);

  let chars = string.split('');
  let utfValues = chars.map(char => {
    return char.charCodeAt();
  });

  let sum = utfValues.reduce((sum, num) => sum + num);
  return console.log(sum);
}

utf16Value('Four score');         // 984
utf16Value('Launch School');      // 1251
utf16Value('a');                  // 97
utf16Value('');                   // 0
