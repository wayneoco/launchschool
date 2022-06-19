function substr(string, start, length) {
  let stringLength = string.length;
  start = start < 0 ? stringLength + start : start;

  let substring = '';
  for (index = start; index < start + length; ++index) {
    if (string[index] === undefined) break;

    substring += string[index];
  }

  return console.log(substring);
}

let string = 'hello world';

substr(string, 2, 4);      // "llo "
substr(string, -3, 2);     // "rl"
substr(string, 8, 20);     // "rld"
substr(string, 0, -20);    // ""
substr(string, 0, 0);      // ""
