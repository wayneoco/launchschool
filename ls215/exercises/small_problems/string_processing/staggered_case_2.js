function staggeredCase(string) {
  let chars = string.split('');
  let index = 0;

  chars = chars.map(char => {
    if (index % 2 === 0 && /[a-z]/i.test(char)) {
      index += 1;
      return char.toUpperCase();
    } else if (/[a-z]/i.test(char)) {
      index += 1;
      return char.toLowerCase();
    } else {
      return char;
    }
  });

  return chars.join('');
}

console.log(staggeredCase('I Love Launch School!'));        // "I lOvE lAuNcH sChOoL!"
console.log(staggeredCase('ALL CAPS'));                     // "AlL cApS"
console.log(staggeredCase('ignore 77 the 444 numbers'));    // "IgNoRe 77 ThE 444 nUmBeRs"
