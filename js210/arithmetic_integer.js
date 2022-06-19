function getNumber(prompt) {
  let rlSync = require('readline-sync');
  return parseFloat(rlSync.question(prompt), 10);
}

function add(first, second) {
  return first + second;
}

function subtract(first, second) {
  return first - second;
}

function multiply(first, second) {
  return first * second;
}

function divide(first, second) {
  return first / second;
}

function remainder(first, second) {
  return first % second;
}

function power(number, exponent) {
  return number ** exponent;
}

let firstNumber = getNumber('Enter the first number: ');
let secondNumber = getNumber('Enter the second number: ');

console.log(add(firstNumber, secondNumber));
console.log(subtract(firstNumber, secondNumber));
console.log(multiply(firstNumber, secondNumber));
console.log(divide(firstNumber, secondNumber));
console.log(remainder(firstNumber, secondNumber));
console.log(power(firstNumber, secondNumber));
