function concat(...elements) {
  let newArray = [];

  for (let index = 0; index < elements.length; ++index) {
    let currentElement = elements[index];

    if (Array.isArray(currentElement)) {
      for (let indexElement = 0; indexElement < currentElement.length; ++indexElement) {
        newArray.push(currentElement[indexElement]);
      }
    } else {
      newArray.push(currentElement);
    } 
  }

  return newArray;
}

console.log(concat([1, 2, 3], [4, 5, 6], [7, 8, 9]));    // [1, 2, 3, 4, 5, 6, 7, 8, 9]
console.log(concat([1, 2], 'a', ['one', 'two']));        // [1, 2, "a", "one", "two"]
console.log(concat([1, 2], ['three'], 4));               // [1, 2, "three", 4]
