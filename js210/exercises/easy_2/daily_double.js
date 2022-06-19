function crunch(string) {
  let chars = string.split('');
  chars = chars.filter((char, index) => {
    return char !== string[index - 1];
  });

  return console.log(chars.join(''));
}

crunch('ddaaiillyy ddoouubbllee');    // "daily double"
crunch('4444abcabccba');              // "4abcabcba"
crunch('ggggggggggggggg');            // "g"
crunch('a');                          // "a"
crunch('');                           // ""
