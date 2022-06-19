function isEmpty(value) {
  let type = typeof value;

  if (Array.isArray(value)) {
    return value.length === 0;
  } else if (type === 'string') {
    return value.length === 0;
  } else if (type === 'object') {
    return Object.keys(value).length === 0;
  }
}

// current test cases
console.log(isEmpty({}));                  // true
console.log(isEmpty({ name: 'Janice' }));  // false

console.log(isEmpty(''));                  // true
console.log(isEmpty('Janice'));            // false

console.log(isEmpty([]));                  // true
console.log(isEmpty(['Janice']));          // false

// new test cases
let array = [];
console.log(isEmpty(array));          // true
array.length = 5;
console.log(isEmpty(array));         // false
console.log(array);
