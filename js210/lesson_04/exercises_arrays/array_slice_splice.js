function slice(array, begin, end) {
  begin = begin >= array.length ? array.length : begin;
  end = end >= array.length ? array.length : end;
  let newArray = [];
  for (let index = begin; index < end; ++index) {
    newArray.push(array[index]);
  }

  return console.log(newArray);
}

slice([1, 2, 3], 1, 2);               // [2]
slice([1, 2, 3], 2, 0);               // []
slice([1, 2, 3], 5, 1);               // []
slice([1, 2, 3], 0, 5);               // [1, 2, 3]

const arr1 = [1, 2, 3];
slice(arr1, 1, 3);                     // [2, 3]
console.log(arr1);                                  // [1, 2, 3]

function splice(array, start, deleteCount, ...elements) {
const arrayLength = array.length;
const deletedElements = array.slice(start, start + deleteCount);
//   start = start >= arrayLength ? arrayLength : start;
//   deleteCount = deleteCount + start > arrayLength ? arrayLength - start : deleteCount;
// 
//   if (deleteCount === 0 && elements.length > 0) {
//     add(array, start, elements);
//   } else if (deleteCount > 0 && elements.length > 0) {
//     replace(array, start, deleteCount, elements);
//   } else if (deleteCount > 0 && elements.length === 0) {
//     remove(array, start, deleteCount);
//   }
// 
//   return console.log(deletedElements);
// }
// 
// function remove(array, start, deleteCount) {
//   let count = 0;
//   while (count < deleteCount) {
//     let currentIndex = start;
//     while (currentIndex < array.length - 1) {
//       [array[currentIndex], array[currentIndex + 1]] = [array[currentIndex + 1], array[currentIndex]];
//       currentIndex += 1;
//     } 
//     array.pop();
//     count += 1;
//   }
// }
// 
// function add(array, start, elements) {
//   const elementsLength = elements.length;
//   array.length = array.length + elementsLength;
//   let count = 0;
//   while (count < elementsLength) {
//     let currentIndex = array.length - 1;
//     while (currentIndex > start) {
//       [array[currentIndex - 1], array[currentIndex]] = [array[currentIndex], array[currentIndex - 1]];
//       currentIndex -= 1;
//     }
//     count += 1;
//   }
// 
//   for (let index = 0; index < elements.length; ++index) {
//     array[index + start] = elements[index];
//   }
// }
// 
// function replace(array, start, deleteCount, elements) {
//   remove(array, start, deleteCount);
//   add(array, start, elements);
// }

splice([1, 2, 3], 1, 2);              // [2, 3]
splice([1, 2, 3], 1, 3);              // [2, 3]
splice([1, 2, 3], 1, 0);              // []
splice([1, 2, 3], 0, 1);              // [1]
splice([1, 2, 3], 1, 0, 'a');         // []

const arr2 = [1, 2, 3];
splice(arr2, 1, 1, 'two');             // [2]
console.log(arr2);                                 // [1, "two", 3]

const arr3 = [1, 2, 3];
splice(arr3, 1, 2, 'two', 'three');    // [2, 3]
console.log(arr3);                                  // [1, "two", "three"]

const arr4 = [1, 2, 3];
splice(arr4, 1, 0);                    // []
splice(arr4, 1, 0, 'a');               // []
console.log(arr4);                                  // [1, "a", 2, 3]

const arr5 = [1, 2, 3];
splice(arr5, 0, 0, 'a');               // []
console.log(arr5);                                  // ["a", 1, 2, 3]

const arr6 = [1, 2, 3];
splice(arr6, 1, 1, 0, 0);
console.log(arr6);
