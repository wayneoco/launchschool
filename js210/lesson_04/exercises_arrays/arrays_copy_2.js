let myArray = [1, 2, 3, 4];
const myOtherArray = myArray.slice();

myArray.pop();
console.log(myOtherArray);

let myArray2 = ['a', 'b', 'c', 'd'];
const myOtherArray2 = myArray2.map(el => el);

myArray2.pop();
console.log(myOtherArray2);
