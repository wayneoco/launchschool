function pop(array) {
  if (array.length === 0) return console.log(undefined);

  let lastElement = array[array.length - 1];
  array.length -= 1;

  return console.log(lastElement);
}

function push(array, ...elements) {
  for (let index = 0; index < elements.length; ++index) {
    array[array.length] = elements[index];
  }

  return console.log(array.length);
}


// pop
const array1 = [1, 2, 3];
pop(array1);                        // 3
console.log(`array1: ${array1}`);                // [1, 2]
pop([]);                           // undefined
pop([1, 2, ['a', 'b', 'c']]);      // ["a", "b", "c"]

// push
const array2 = [1, 2, 3];
push(array2, 4, 5, 6);              // 6
console.log(`array2: ${array2}`);                // [1, 2, 3, 4, 5, 6]
push([1, 2], ['a', 'b']);          // 3
push([], 1);                       // 1
push([]);                          // 0
