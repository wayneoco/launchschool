function letterCaseCount(string) {
  const chars = string.split('');
  let counter = { lowercase: 0, uppercase: 0, neither: 0 };

  chars.forEach(char => {
    switch (true) {
      case /[a-z]/.test(char):
        counter.lowercase += 1;
        break;
      case /[A-Z]/.test(char):
        counter.uppercase += 1;
        break;
      default:
        counter.neither += 1;
    }
  });

  return counter;
}

console.log(letterCaseCount('abCdef 123'));  // { lowercase: 5, uppercase: 1, neither: 4 }
console.log(letterCaseCount('AbCd +Ef'));    // { lowercase: 3, uppercase: 3, neither: 2 }
console.log(letterCaseCount('123'));         // { lowercase: 0, uppercase: 0, neither: 3 }
console.log(letterCaseCount(''));            // { lowercase: 0, uppercase: 0, neither: 0 }
