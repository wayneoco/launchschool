const numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];

function stringToSignedInteger(string) {
  let number = 0;
  let negativeNumber;

  if (/(-|\+)/.test(string[0])) {
    if (string.slice(0, 1) === '-') {
      negativeNumber = true;
    }
    string = string.slice(1);
  }

  for (let index = 0; index < string.length; ++index) {
    let currentNumber = string[index];
    number *= 10;
    number += numbers[currentNumber];
  }

  if (negativeNumber) {
    number *= -1;
  }

  return number;
}

console.log(stringToSignedInteger('4321'));      // 4321
console.log(stringToSignedInteger('-570'));      // -570
console.log(stringToSignedInteger('+100'));      // 100
