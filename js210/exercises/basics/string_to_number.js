const numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];

function stringToInteger(string) {
  let number = 0;
  let multiplier = 0;

  for (let index = string.length - 1; index >= 0; --index) {
    let currentStringNumber = string[index];
    let currentNumber = numbers[currentStringNumber];

    number += currentNumber * (10 ** multiplier);
    multiplier += 1;
  }

  return number;
}

console.log(stringToInteger('4321'));      // 4321
console.log(stringToInteger('570'));       // 570
