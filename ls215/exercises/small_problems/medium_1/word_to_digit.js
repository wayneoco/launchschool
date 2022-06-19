function wordToDigit(string) {
  const NUMBERS = ['zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine'];
  let newString = string;

  NUMBERS.forEach(number => {
    let numberRegex = new RegExp(number, 'g');
    newString = newString.replace(numberRegex, NUMBERS.indexOf(number));
  });

  return newString;
}

console.log(wordToDigit('Please call me at five five five one two three four. Thanks.'));
// "Please call me at 5 5 5 1 2 3 4. Thanks."
