function oddNumbers(start, limit) {
  for (let currentNum = start; currentNum <= limit; ++currentNum) {
    if (currentNum % 2 === 1) console.log(currentNum);
  }
}

oddNumbers(1, 99);
oddNumbers(2, 32);
