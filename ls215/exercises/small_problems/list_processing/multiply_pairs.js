const numberSort = (num1, num2) => {
  if (num1 < num2) {
    return -1;
  } else if (num1 > num2) {
    return 1;
  } else {
    return 0;
  }
};

function multiplyAllPairs(array1, array2) {
  let newArray = [];

  array1.forEach(number1 => {
    array2.forEach(number2 => newArray.push(number2 * number1));
  });

  return newArray.sort(numberSort);
}

console.log(multiplyAllPairs([2, 4], [4, 3, 1, 2]));    // [2, 4, 4, 6, 8, 8, 12, 16]
