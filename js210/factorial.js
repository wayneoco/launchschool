function factorial(n) {
  let result = 1
  for (currentNum = 1; currentNum <= n; ++currentNum) {
    result *= currentNum;
  }
  return result;
}

console.log(factorial(1));     // => 1
console.log(factorial(2));     // => 2
console.log(factorial(3));     // => 6
console.log(factorial(4));     // => 24
console.log(factorial(5));     // => 120
console.log(factorial(6));     // => 720
console.log(factorial(7));     // => 5040
console.log(factorial(8));     // => 40320

function factorialRecursion(n) {
  if (n === 1) return 1;

  return n * factorialRecursion(n - 1);
}

console.log(factorialRecursion(1));     // => 1
console.log(factorialRecursion(2));     // => 2
console.log(factorialRecursion(3));     // => 6
console.log(factorialRecursion(4));     // => 24
console.log(factorialRecursion(5));     // => 120
console.log(factorialRecursion(6));     // => 720
console.log(factorialRecursion(7));     // => 5040
console.log(factorialRecursion(8));     // => 40320

