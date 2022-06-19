/* eslint-disable */

/*


*/

/* eslint-enable */

function fibonacci(number) {
  let first = 1;
  let second = 1;
  let current;
  for (let index = 2; index < number; index += 1) {
    current = first + second;
    first = second;
    second = current;
  }

  return current;
}

console.log(fibonacci(20));       // 6765
console.log(fibonacci(50));       // 12586269025
console.log(fibonacci(75));       // 2111485077978050
