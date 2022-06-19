function findLastNumber(...numbers) {
  const lastNumber = numbers.pop();

  if (numbers.indexOf(lastNumber) > -1) {
    return console.log(`The number ${lastNumber} appears in ${numbers}.`);
  } else {
    return console.log(`The number ${lastNumber} does not appear in ${numbers}.`);
  }
}

findLastNumber(1, 2, 3, 4, 5, 3);
findLastNumber(1, 2, 3, 4, 5, 6);
