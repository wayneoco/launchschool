function wordSizes(string) {
  let sizeCount = {};
  const words = string.split(' ');

  words.forEach(word => {
    let testWord = word.replace(/[^a-z]/gi, '');
    let wordLength = testWord.length;

    sizeCount[wordLength] = sizeCount[wordLength] || 0;
    sizeCount[wordLength] += 1;
  });

  return sizeCount;
}

console.log(wordSizes('Four score and seven.'));                       // { "3": 1, "4": 1, "5": 2 }
console.log(wordSizes('Hey diddle diddle, the cat and the fiddle!'));  // { "3": 5, "6": 3 }
console.log(wordSizes("What's up doc?"));                              // { "5": 1, "2": 1, "3": 1 }
console.log(wordSizes(''));                                            // {}
