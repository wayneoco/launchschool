function palindromes(string) {
  return substrings(string).filter(isPalindrome);
}

function isPalindrome(word) {
  return word.length > 1 && word === word.split('').reverse().join('');
}

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

console.log(palindromes('abcd'));       // []
console.log(palindromes('madam'));      // [ "madam", "ada" ]

console.log(palindromes('hello-madam-did-madam-goodbye'));
console.log(palindromes('knitting cassettes'));
