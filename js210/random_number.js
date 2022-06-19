let tries = 1;

function randomNumberBetween(min, max) {
  let number = Math.floor(Math.random() * (max - min + 1) + min);
  console.log(number);

  if (number > 2) {
    return number;
  } else {
    tries += 1;
    return randomNumberBetween(min, max);
  }
}
// Launch School solution below

// let result = randomNumberBetween(1, 6);
//
// function randomNumberBetween(min, max) {
//   return Math.floor(Math.random() * (max - min + 1) + min);
// }
//
// let tries = 0;
// let result;
//
// do {
//   result = randomNumberBetween(1, 6);
//   tries += 1;
// } while (result <= 2);

console.log(
  'It took ' + String(tries) + ' tries to get a number greater than 2'
);
