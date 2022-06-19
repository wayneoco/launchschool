const array1 = ['Moe', 'Larry', ['Curly', 'Shemp', 'Harpo'], 'Chico', 'Groucho', 'Zeppo'];
const array2 = array1

console.log(`Array1: ${array1}`);
console.log(`Array2 Before: ${array2}`);

for (let i = 0; i < array1.length; i += 1) {
  let currentElement = array1[i];

  if (Array.isArray(currentElement)) {
    for (let x = 0; x < currentElement.length; ++x) {
      if (currentElement[x].startsWith('C')) {
        currentElement[x] = currentElement[x].toUpperCase();
      }
    }
  } else if (currentElement.startsWith('C')) {
      currentElement = currentElement.toUpperCase();
  }
}

console.log(`Array1 After: ${array1}`);
console.log(`Array2 After: ${array2}`);
