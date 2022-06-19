function sequence(number) {
  let numbers = [];

  for (let currentNumber = 1; currentNumber <= number; currentNumber += 1) {
    numbers.push(currentNumber);
  }

  return numbers;
}

console.log(sequence(5));    // [1, 2, 3, 4, 5]
console.log(sequence(3));    // [1, 2, 3]
console.log(sequence(1));    // [1]
