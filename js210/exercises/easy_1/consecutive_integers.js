let operation;

function computeSumArray(numbers) {
  operation = 'sum';
  return numbers.reduce((sum, num) => {
    return sum + num;
  });
}

function computeProductArray(numbers) {
  operation = 'product';
  return numbers.reduce((sum, num) => {
    return sum * num;
  });
}

function createNumbersArray(numbers) {
  return numbers.split(' ').map(number => {
    return Number(number);
  });
}

function validIntegers(numbers) {
  numbers = createNumbersArray(numbers);
  return numbers.every(validInteger);
}

function validInteger(number) {
  return Number.isInteger(number);
}

const rlSync = require('readline-sync');
let numbers = rlSync.question('Please enter two or more integers greater than 0 (separated by spaces): ');

while (!validIntegers(numbers)) {
  numbers = rlSync.question('Please enter only valid integers: ');
}

numbers = createNumbersArray(numbers);

let operator = rlSync.question('Please select an operation: (s)um or (p)roduct: ', {
  limit: [/sum|s|product|p/i],
  limitMessage: 'Please select a valid operation: (s)um or (p)roduct.'
});

operator = operator.toLowerCase();
let total;

if (operator.startsWith('s')) {
  total = computeSumArray(numbers);
} else if (operator.startsWith('p')) {
  total = computeProductArray(numbers);
}

const min = Math.min(...numbers);
const max = Math.max(...numbers);
console.log(`The ${operation} of the integers between ${min} and ${max} is ${total}.`);
