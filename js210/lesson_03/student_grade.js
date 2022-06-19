//let rlSync = require('readline-sync');
//let score1 = Number(rlSync.question('Enter score 1: '));
//let score2 = Number(rlSync.question('Enter score 2: '));
//let score3 = Number(rlSync.question('Enter score 3: '));
//let avgScore = Math.round((score1 + score2 + score3) / 3);
//let grade
//
//switch (true) {
//  case (avgScore >= 90):
//    grade = 'A';
//    break;
//  case (avgScore >= 70):
//    grade = 'B';
//    break;
//  case (avgScore >= 50):
//    grade = 'C';
//    break;
//  default:
//    grade = 'F';
//    break;
//}
//
//console.log(`Based on the average of your 3 scores (${avgScore}) your letter grade is ${grade}.`);

let rlSync = require('readline-sync');
let scores = [];

let numberOfScores = rlSync.question('Enter the number of scores to enter: ');
for (let currentScore = 1; currentScore <= numberOfScores; ++currentScore) {
  let score = Number(rlSync.question('Enter score: '));
  scores.push(score);
}

let totalScores = scores.reduce(
  (previousValue, currentValue) => previousValue + currentValue,
  0
);
let avgScore = Math.round(totalScores / numberOfScores);

let grade;
switch (true) {
  case (avgScore >= 90):
    grade = 'A';
    break;
  case (avgScore >= 70):
    grade = 'B';
    break;
  case (avgScore >= 50):
    grade = 'C';
    break;
  default:
    grade = 'F';
    break;
}

console.log(`Based on the average of your ${numberOfScores} scores (${avgScore}), your letter grade is ${grade}.`);

