function generatePattern(size) {
  let staticNum = '';
  let tempNum = '';
  let finalNum = () => {
    for (let currentNum = 1; currentNum <= size; ++currentNum)
      tempNum += String(currentNum);
  };

  let length = tempNum.length;

  for (currentNum = 1; currentNum <= size; ++currentNum) {
    staticNum += String(currentNum);
    console.log(staticNum.padEnd(length, '*'));
  }
}

generatePattern(7);
generatePattern(9);
generatePattern(20);
