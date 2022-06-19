function sum(number) {
  let digits = String(number).split('');

  return digits.reduce((sum, digit) => sum + Number(digit), 0);
}

console.log(sum(23));           // 5
console.log(sum(496));          // 19
console.log(sum(123456789));    // 45
