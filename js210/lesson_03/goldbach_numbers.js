function checkGoldbach(expectedSum) {
  if (expectedSum % 2 === 1 || expectedSum < 4) return console.log(null);

  let num1 = 1;
  let num2;

  while (num1 !== num2) {
    num1 += 1;
    num2 = expectedSum - num1;
    if (isPrime(num1) && isPrime(num2)) {
      console.log(num1, num2);
    }
  }
}

function isPrime(n) {
  if (n === 0 || n === 1) return console.log(false);

  for (let currentNum = 2; currentNum < n; ++currentNum) {
    if (n % currentNum === 0) return false;
  }

  return true;
}


checkGoldbach(3);
// logs: null

checkGoldbach(4);
// logs: 2 2

checkGoldbach(12);
// logs: 5 7

checkGoldbach(100);
// logs:
// 3 97
// 11 89
// 17 83
// 29 71
// 41 59
// 47 53
