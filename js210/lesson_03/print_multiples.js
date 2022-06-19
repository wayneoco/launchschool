//function logMultiples(n) {
 // let largestMultiple = Math.floor(100 / n) * n;
  //for (currentNumber = 100; currentNumber > 0; --currentNumber)
   // if (currentNumber % 2 === 1 && currentNumber % n === 0) {
    //  console.log(currentNumber);
    //}
//}

//logMultiples(17);
//logMultiples(21);

function logMultiples(n) {
  let largestMultiple = Math.floor(100 / n) * n;
  for (let currentNumber = largestMultiple; currentNumber > 0; currentNumber -= n) {
    if (currentNumber % 2 === 1 && currentNumber % n === 0) {
      console.log(currentNumber);
    }
  }
}

logMultiples(17);
logMultiples(21);
