function reverse(inputForReversal) {
  if (Array.isArray(inputForReversal)) {
    return reverseArray(inputForReversal);
  } else {
    return reverseString(inputForReversal)
  }
}

function reverseArray(array) {
  let reversed = [];
  for (let index = array.length - 1; index >= 0; --index) {
    reversed.push(array[index]);
  }

  return reversed;
}

function reverseString(string) {
  let reversed = '';
  for (let index = string.length - 1; index >= 0; --index) {
    reversed += string[index];
  }

  return reversed;
}

reverse('Hello');           // "olleH"
reverse('a');               // "a"
reverse([1, 2, 3, 4]);      // [4, 3, 2, 1]
reverse([]);                // []

const array = [1, 2, 3];
reverse(array);             // [3, 2, 1]
console.log(array);                      // [1, 2, 3]
