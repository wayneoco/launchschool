let rlSync = require('readline-sync');
let phrase = rlSync.question('Please enter a phrase: ');
let phraseLettersOnly = phrase.replace(/[^a-zA-Z]/gi, '');

console.log(`There are ${phraseLettersOnly.length} alphabetic characters in "${phrase}."`);
