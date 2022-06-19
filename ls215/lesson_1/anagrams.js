function anagram(word, list) {
  return list.filter(candidate => areAnagrams(candidate, word));
}

function areAnagrams(candidate, word) {
  let candidateLetters = candidate.split('');
  let wordLetters = word.split('');

  return compareArrays(candidateLetters, wordLetters);
}

function compareArrays(array1, array2) {
  if (array1.length !== array2.length) return false;

  let array1Copy = array1.slice();

  for (let i = 0; i < array1.length; i += 1) {
    let charIndex = array2.indexOf(array1[i]);

    if (charIndex > -1) {
      array1Copy.splice(charIndex, charIndex);
    } else {
      return false;
    }
  }

  return true;
}

console.log(anagram('listen', ['enlists', 'google', 'inlets', 'banana']));  // [ "inlets" ]
console.log(anagram('listen', ['enlist', 'google', 'inlets', 'banana']));   // [ "enlist", "inlets" ]
