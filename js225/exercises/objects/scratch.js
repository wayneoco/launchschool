function objectsEqual(obj1, obj2) {
  const obj1Entries = Object.entries(obj1).sort();
  const obj2Entries = Object.entries(obj2).sort();

  if (obj1Entries.length !== obj2Entries.length) return false;

  for (let index = 0; index < 1; index += 1) {
    if (!arraysEqual(obj1Entries[index], obj2Entries[index])) return false;
  }

  return true;
}

function arraysEqual(arr1, arr2) {
  if (arr1.length !== arr2.length) return false;

  for (let index = 0; index < arr1.length; index += 1) {
    if (arr1[index] !== arr2[index]) return false;
  }

  return true;
}

console.log(objectsEqual({a: 'foo'}, {a: 'foo'}));                      // true
console.log(objectsEqual({a: 'foo', b: 'bar'}, {a: 'foo'}));            // false
console.log(objectsEqual({}, {}));                                      // true
console.log(objectsEqual({a: 'foo', b: undefined}, {a: 'foo', c: 1}));  // false
