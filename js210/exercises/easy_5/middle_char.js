function centerOf(string) {
  const stringLength = string.length;
  const centerOdd = Math.floor(stringLength / 2);
  const centerEven = centerOdd - 1;
  let middle;

  if (stringLength % 2 === 0) {
    middle = string.slice(centerEven, centerEven + 2);
  } else {
    middle = string.slice(centerOdd, centerOdd + 1);
  }

  return middle;
}

console.log(centerOf('I Love JavaScript')); // "a"
console.log(centerOf('Launch School'));     // " "
console.log(centerOf('Launch'));            // "un"
console.log(centerOf('Launchschool'));      // "hs"
console.log(centerOf('x'));                 // "x"
