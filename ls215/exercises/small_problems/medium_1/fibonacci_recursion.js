/* eslint-disable */

/*
### Problem ###
- input: integer
- output: integer
- rules:
  - explicit:
    - F(n) = F(n - 1) + F(n - 2) where n > 2
      - 1st: 1
      - 2nd: 1
      - 3rd: 2 (1 + 1)
      - 4th: 3 (1 + 2)
      - 5th: 5 (2 + 3)
      - 6th: 8 (3 + 5)
    - recursive algorithm only applied when n is less than 2
    - next F number is the sum of the two previous numbers

### Data Structures ###
- input: integer
- working with input: integer
- output: integer

### Algorithm ###
- if input is less than or equal to 2, return 1
- return:
  - n = fibonacci(n - 1) + fibonacci(n - 2)
e.g.,
- n = 4
  - fibonacci(4 - 1) + fibonacci(4 - 2)
    - fibonacci(3) + fibonacci(2)
      - ((fibonacci(3 - 1) + fibonacci(3 - 2)) + 1
        - (fibonacci(2) + fibonacci(1)) + 1
          - 1 + 1 + 1
            - 3
- n = 5
  - f(5 - 1) + f(5 - 2)
    - f(4) + f(3)
      - (f(4 - 1) + f(4 - 2)) + (f(3 - 1) + f(3 - 2))
        - (f(3) + f(2)) + (f(2) + f(1))
          - (f(3 - 1) + f(3 - 2) + 1 + 1 + 1)
            - (f(2) +f(1) + 1 + 1 + 1)
              - 1 + 1 + 1 + 1 + 1
                - 5

*/

/* eslint-enable */

function fibonacci(number) {
  if (number <= 2) return 1;

  return fibonacci(number - 1) + fibonacci(number - 2);
}

console.log(fibonacci(0));
console.log(fibonacci(1));       // 1
console.log(fibonacci(2));       // 1
console.log(fibonacci(3));       // 2
console.log(fibonacci(4));       // 3
console.log(fibonacci(5));       // 5
console.log(fibonacci(12));      // 144
console.log(fibonacci(20));      // 6765
