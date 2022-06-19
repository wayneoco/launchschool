/* # Problem
  * Rules:
  *   - if both `start` and `end` are:
  *     - positive integers
  *     - start is less than end
  *     - both are within the boundary of the string
  *     - return the substring from start (inclusive) to end (exclusive)
  *   - if start is greater than end:
  *     - swap the values, i.e., end = start, start = end
  *   - if start = end, return an empty string
  *   - if end is omitted, return a substring through the end of the input string
  *   - if either start or end < 0 or NaN, treat it as 0.
  *   - if either start or end = string.length, treat it as equal to string.length

*/

function substring(string, start, end) {
  switch (true) {
    case end === undefined || end > string.length:
      end = string.length;
      break;
    case isNaN(end) || end < 0:
      end = 0;
      break;
  }

  switch (true) {
    case isNaN(start) || start < 0:
      start = 0;
      break;
    case start > string.length:
      start = string.length;
      break;
    case start > end:
      [start, end] = [end, start];
      break;
  }

  let substring = '';
  for (index = start; index < end; ++index) {
    substring += string[index];
  }

  return console.log(substring);
}

let string = 'hello world';

substring(string, 2, 4);    // "ll"
substring(string, 4, 2);    // "ll"
substring(string, 0, -1);   // ""
substring(string, 2);       // "llo world"
substring(string, 'a');     // "hello world"
substring(string, 8, 20);   // "rld"
