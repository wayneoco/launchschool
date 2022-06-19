function countOccurrences(array) {
  let count = {};

  for (let index = 0; index < array.length; index += 1) {
    let currentElement = array[index];

    count[currentElement] = count[currentElement] || 0;
    count[currentElement] += 1;
  }

  for (let key in count) {
    console.log(`${key} => ${count[key]}`);
  }
}

const vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck',
                'motorcycle', 'motorcycle', 'car', 'truck'];

countOccurrences(vehicles);

// console output
// car => 4
// truck => 3
// SUV => 1
// motorcycle => 2
