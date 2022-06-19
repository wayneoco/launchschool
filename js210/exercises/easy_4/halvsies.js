function halvsies(array) {
  const middleIndex = Math.ceil(array.length / 2);
  const first = array.slice(0, middleIndex);
  const second = array.slice(middleIndex);

  return [first, second];
}

console.log(halvsies([1, 2, 3, 4]));       // [[1, 2], [3, 4]]
console.log(halvsies([1, 5, 2, 4, 3]));    // [[1, 5, 2], [4, 3]]
console.log(halvsies([5]));                // [[5], []]
console.log(halvsies([]));                 // [[], []]
