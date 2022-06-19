function totalPayable(item, quantity) {
  return startingBalance + (item * quantity);
}

let startingBalance = 1;
const chicken = 5;
const chickenQuantity = 7;

startingBalance = 5;
console.log(totalPayable(chicken, chickenQuantity));

startingBalance = 10;
console.log(totalPayable(chicken, chickenQuantity));
