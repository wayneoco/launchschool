const rlSync = require('readline-sync');
const noun = rlSync.question('Enter a noun: ');
const verb = rlSync.question('Enter a verb: ');
const adjective = rlSync.question('Enter an adjective: ');
const adverb = rlSync.question('Enter an adverb: ')
const libs = [
  `Do you ${verb} your ${adjective} ${noun} ${adverb}? That's hilarious!`,
  `Never ${verb} ${adverb} with a ${adjective} ${noun}.`,
  `Sometimes you just want to ${adverb} ${verb} while watching a ${adjective} ${noun} sing.`
];

let libIndex = Math.floor(Math.random() * libs.length);
console.log(libs[libIndex]);
