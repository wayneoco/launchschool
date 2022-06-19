function isRealPalindrome(string) {
  const testString = removeNonAlphaNumericChars(string).toLowerCase();

  return isPalindrome(testString);
}

function removeNonAlphaNumericChars(string) {
  return string.replace(/[^a-z0-9]/gi, '');
}

function isPalindrome(string) {
  return string === string.split('').reverse().join('');
}


console.log(isRealPalindrome('madam'));               // true
console.log(isRealPalindrome('Madam'));               // true (case does not matter)
console.log(isRealPalindrome("Madam, I'm Adam"));     // true (only alphanumerics matter)
console.log(isRealPalindrome('356653'));              // true
console.log(isRealPalindrome('356a653'));             // true
console.log(isRealPalindrome('123ab321'));            // false
