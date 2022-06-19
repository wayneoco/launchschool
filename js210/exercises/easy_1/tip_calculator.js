const rlSync = require('readline-sync');

console.log('What is the bill?');
const bill = rlSync.prompt();
bill = parseFloat(bill, 10);

console.log('What is the tip percentage?');
let tipPercentage = rlSync.prompt();
tipPercentage = parseFloat(tipPercentage, 10) / 100;

let tip = bill * tipPercentage
let total = bill + tip;

console.log(`The tip is $${tip.toFixed(2)}`);
console.log(`The total is $${total.toFixed(2)}`);
