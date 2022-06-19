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

function signedIntegerToString(number) {
  let negativeNumber;

  if (number * -1 > 0) {
    negativeNumber = true;
    number *= -1;
  }

  let numberString = integerToString(number);

  if (numberString === '0') {
    return numberString;
  } else if (negativeNumber) {
    return '-' + numberString;
  } else {
    return '+' + numberString;
  }
}

console.log(signedIntegerToString(4321));      // "+4321"
console.log(signedIntegerToString(-123));      // "-123"
console.log(signedIntegerToString(0));         // "0"
