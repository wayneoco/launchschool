function login() {
  let password = 'password';
  let rlSync = require('readline-sync');
  for (let guessCount = 1; guessCount <= 3; ++guessCount) {
    let guess = rlSync.question('What is the password: ');
    if (guess == password) return console.log('You have successfully logged in.');
  }

  console.log('You have been denied access.');
}

login();
