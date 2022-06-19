const rlSync = require('readline-sync');
const age = parseInt(rlSync.question('What is your age? '), 10);
const retirementAge = parseInt(rlSync.question('At what age would you like to retire? '), 10);
const workYearsRemaining = retirementAge - age;
const currentYear = new Date().getFullYear();
const retirementYear = currentYear + workYearsRemaining;
const yearsString = workYearsRemaining === 1 ? 'year' : 'years';

console.log(`It's ${currentYear}. You will retire in ${retirementYear}.`);
console.log(`You have only ${workYearsRemaining} ${yearsString} of work to go!`);
