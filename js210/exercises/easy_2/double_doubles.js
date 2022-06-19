function twice(number) {
  if (isDoubleNumber) {
    return console.log(number);
  } else {
    return console.log(number * 2);
  }
}

function isDoubleNumber(number) {
  const numberString = String(number);
  const center = numberString.length / 2;
  const firstHalf = number.slice(0, center);
  const secondHalf = number.slice(center);

  return firstHalf === secondHalf;
}

twice(37);          // 74
twice(44);          // 44
twice(334433);      // 668866
twice(444);         // 888
twice(107);         // 214
twice(103103);      // 103103
twice(3333);        // 3333
twice(7676);        // 7676
