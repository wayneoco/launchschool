function isPrime(n) {
  if (n === 0 || n === 1) return console.log(false);

  for (let currentNum = 2; currentNum < n; ++currentNum) {
    if (n % currentNum === 0) return console.log(false);
  }

  return console.log(true);
}

isPrime(1);
isPrime(2);
isPrime(3);
isPrime(43);
isPrime(55);
isPrime(0); 
