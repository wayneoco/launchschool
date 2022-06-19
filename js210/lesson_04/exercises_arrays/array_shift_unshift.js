function shift(array) {
  if (array.length === 0) return console.log(undefined);

  const shiftedElement = array[0];
  for (let index = 0; index < array.length - 1; ++index) {
    array[index] = array[index + 1];
  }
  
  array.length = array.length - 1;

  return console.log(shiftedElement);
}

function unshift(array, ...elements) {
  const numberOfElements = elements.length;
  const arrayCopy = [...array];

  for (let index = 0; index < numberOfElements; ++index) {
    array[index] = elements[index];
  }

  for (let index = 0; index < arrayCopy.length; ++index) {
    array[numberOfElements + index] = arrayCopy[index];
  }

  return console.log(array.length);
}

shift([1, 2, 3]);                // 1
shift([]);                       // undefined
shift([[1, 2, 3], 4, 5]);        // [1, 2, 3]

unshift([1, 2, 3], 5, 6);        // 5
unshift([1, 2, 3]);              // 3
unshift([4, 5], [1, 2, 3]);      // 3

const testArray = [1, 2, 3];
shift(testArray);                // 1
console.log(testArray);                       // [2, 3]
unshift(testArray, 5);           // 3
console.log(testArray);                       // [5, 2, 3]
