function leadingSubstrings(string) {
  const chars = string.split('');

  return chars.map((char, index) => {
    return chars.slice(0, index + 1).join('');
  });
}

function substrings(string) {
  const chars = string.split('');

  return chars.flatMap((char, index) => {
    return leadingSubstrings(chars.slice(index).join(''));
  });
}

console.log(substrings('abcde'));

// returns
[ "a", "ab", "abc", "abcd", "abcde",
  "b", "bc", "bcd", "bcde",
  "c", "cd", "cde",
  "d", "de",
  "e" ]
