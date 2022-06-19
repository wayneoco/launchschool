function logOddNumbers(n) {
  for (let currentNumber = 2; currentNumber <= n; ++currentNumber) {
    if (currentNumber % 2 === 0) continue;
    console.log(currentNumber);
  }
}

logOddNumbers(19);
