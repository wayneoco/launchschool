function multiplesOfThreeAndFive(startNumber, endNumber) {
  for (let currentNumber = startNumber; currentNumber <= endNumber; ++currentNumber) {
    if (currentNumber % 3 === 0 && currentNumber % 5 === 0) {
      console.log(parseInt(currentNumber, 10) + '!');
    } else if (currentNumber % 3 === 0 || currentNumber % 5 === 0) {
      console.log(currentNumber);
    }
  }
}

multiplesOfThreeAndFive(3, 12);
