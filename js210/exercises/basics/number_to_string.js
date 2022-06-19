function integerToString(number) {
  let numberString = '';

  while (number > 0) {
    let remainder = number % 10;
    numberString = remainder + numberString;
    number = (number - remainder) / 10;
  }

  numberString = numberString.length === 0 ? '0' : numberString;

  return numberString;
}

console.log(integerToString(4321));      // "4321"
console.log(integerToString(0));         // "0"
console.log(integerToString(5000));      // "5000"
