let rlSync = require('readline-sync');
let age = Number(rlSync.question("What's your age?\n"));

console.log(`Your age is ${age}.`);

for (let years = 10; years <= 30; years += 10) {
  console.log(`Your age in ${years} years will be ${age + years}.`);
}
