function indexOf(firstString, secondString) {
  let firstLength = firstString.length;
  let secondLength = secondString.length;
  let firstIndex;

  let substringMatch = () => {
    for (firstIndex = 0; firstIndex <= firstLength - secondLength; ++firstIndex) {
      let matchingStringLength = 0;
      for (let secondIndex = 0; secondIndex < secondLength; ++secondIndex) {
        if (firstString[firstIndex + secondIndex] === secondString[secondIndex]) {
          matchingStringLength += 1;
        }

        if (matchingStringLength === secondLength) return true;
      }
    }
  };

  substringMatch() ? console.log(firstIndex) : console.log(-1);
}

function lastIndexOf(firstString, secondString) {
}

indexOf('Some strings', 's');                      // 5
indexOf('Blue Whale', 'Whale');                    // 5
indexOf('Blue Whale', 'Blute');                    // -1
indexOf('Blue Whale', 'leB');                      // -1

lastIndexOf('Some strings', 's');                  // 11
lastIndexOf('Blue Whale, Killer Whale', 'Whale');  // 19
lastIndexOf('Blue Whale, Killer Whale', 'all');    // -1
