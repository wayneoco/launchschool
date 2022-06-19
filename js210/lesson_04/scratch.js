function missing(arr) {
  let sequence = [];
  let currentNum = arr[0];
  while (currentNum <= arr[arr.length - 1]) {
    sequence.push(currentNum);
    currentNum += 1;
  }

  let missingNums = [];
  for (let index = 0; index < sequence.length; ++index) {
    if (arr.indexOf(sequence[index]) === -1) {
      missingNums.push(sequence[index]);
    }
  }

  return console.log(missingNums);
}

missing([-3, -2, 1, 5]);                  // [-1, 0, 2, 3, 4]
missing([1, 2, 3, 4]);                    // []
missing([1, 5]);                          // [2, 3, 4]
missing([6]);                             // []
