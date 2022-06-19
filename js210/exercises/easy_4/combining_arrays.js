function union(array1, array2) {
  let combinedArray = [...array1];

  array2.forEach(el => {
    if (!combinedArray.includes(el)) {
      combinedArray.push(el);
    }
  });

  return combinedArray;
}

console.log(union([1, 3, 5], [3, 6, 9]));    // [1, 3, 5, 6, 9]
