const myArray = [5, 5];
myArray[-1] = 5;
myArray[-2] = 5;

function average(array) {
  let sum = 0;
  let keysLength = Object.keys(array).length;

  for (let i = -2; i < array.length; i += 1) {
    sum += array[i];
  }

  return sum / keysLength;
}

console.log(average(myArray));
