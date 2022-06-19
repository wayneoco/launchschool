function multisum(number) {
  let sum = 0;
  for (let currentNum = 1; currentNum <= number; ++currentNum) {
    if (isMultiple(currentNum, 3) || (isMultiple(currentNum, 5))) {
      sum += currentNum;
    }
  }

  return console.log(sum);
}

function isMultiple(number, divisor) {
  return number % divisor === 0;
}

multisum(3);       // 3
multisum(5);       // 8
multisum(10);      // 33
multisum(1000);    // 234168
