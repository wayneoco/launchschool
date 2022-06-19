function gcd(...numbers) {
  function lastNum() {
    nums = [numbers[numbers.length - 2], numbers[numbers.length - 1]].sort((a, b) => b - a);

    let temp;
    while (nums[1] !== 0) {
      temp = nums[1];
      nums[1] = nums[0] % nums[1];
      nums[0] = temp;
    }

    return nums[0];
  }

  let numbersLength = numbers.length;
  while (numbersLength > 2) {
    let lastNumber = lastNum();
    numbers = numbers.slice(0, -2).concat(lastNumber);
    numbersLength = numbers.length;
  }

  let gCD = lastNum();

  console.log(gCD);
}

gcd(12, 4, 8);
gcd(10, 15, 20, 45);
gcd(2, 9);
