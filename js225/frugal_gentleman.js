/* 
You were tasked with making a list of every makeup item your local pharmacy had in stock. You created a very long array of each item, with each element having both a name and brand property. Now you're looking to simplify the list by combining duplicate items, and adding a count property to everything.

Notes

There will always be one or more elements in the given array.
All duplicates will be displayed in order.
Empty elements should be skipped.

# Mental Model
- iterate over the input array
- if the current element exists in a results array, increment the element's count property by 1
- otherwise, add a count property to the current element and add the element to the results array

*/

function simplifyList(list) {
  return list.reduce((newList, currentItem) => {
    if (Object.keys(currentItem).length === 0) return newList;

    const previousItem = newList[newList.length - 1];

    if (isDuplicate(previousItem, currentItem)) {
      previousItem.count += 1;
    } else {
      currentItem.count = 1;
      newList.push(currentItem);
    }

    return newList;
  }, []);
}

function isDuplicate(obj1, obj2) {
  if (obj1 === undefined) return false;

  return obj1.brand === obj2.brand && obj1.name === obj2.name;
}

// 
//   for (let index = 0; index < list.length; index += 1) {
//     let brand = list[index].brand;
//     let name = list[index].name;
//     let lastIndex = newList.length - 1;
// 
//     if (brand === undefined && name === undefined) {
//       continue;
//     } else if (newList.length === 0) {
//       newList.push({ brand, name, count: 1 });
//     } else if (newList[lastIndex].brand === brand &&
//         newList[lastIndex].name === name) {
//       newList[lastIndex].count += 1;
//     } else {
//       newList.push({ brand, name, count: 1 });
//     }
//   }
// 
//   return newList;
// }

// happy path
console.log(simplifyList([
  { brand: "NARS", name: "Cosmetics Voyageur Pallete" },
  { brand: "NARS", name: "Cosmetics Voyageur Pallete" },
  { brand: "Urban Decay", name: "Naked Honey Pallete" },
  { brand: "Stila", name: "Stay All Day Liquid Lipstick" },
  { brand: "Stila", name: "Stay All Day Liquid Lipstick" },
  { brand: "Stila", name: "Stay All Day Liquid Lipstick" }
])); // ➞ [
//  { brand: "NARS", name: "Cosmetics Voyageur Pallete", count: 2 },
//  { brand: "Urban Decay", name: "Naked Honey Pallete", count: 1 },
//  { brand: "Stila", name: "Stay All Day Liquid Lipstick", count: 3 }
// ]

// single brand with multiple product names
console.log(simplifyList([
  { brand: "NARS", name: "Cosmetics Voyageur Pallete" },
  { brand: "NARS", name: "Essence" },
  { brand: "Urban Decay", name: "Naked Honey Pallete" },
  { brand: "Stila", name: "Stay All Day Liquid Lipstick" },
  { brand: "Stila", name: "Stay All Day Liquid Lipstick" },
  { brand: "Stila", name: "Stay All Day Liquid Lipstick" }
]));  // -> [
//  { brand: "NARS", name: "Cosmetics Voyageur Pallete", count: 1 },
//  { brand: "NARS", name: "Essence", count: 1 },
//  { brand: "Urban Decay", name: "Naked Honey Pallete", count: 1 },
//  { brand: "Stila", name: "Stay All Day Liquid Lipstick", count: 3 }
// ]

// multiple brands with products with the same name
console.log(simplifyList([
  { brand: "NARS", name: "Cosmetics Voyageur Pallete" },
  { brand: "NARS", name: "Cosmetics Voyageur Pallete" },
  { brand: "Urban DC", name: "Cosmetics Voyageur Pallete" },
  { brand: "Stila", name: "Stay All Day Liquid Lipstick" },
  { brand: "Stila", name: "Stay All Day Liquid Lipstick" },
  { brand: "Stila", name: "Stay All Day Liquid Lipstick" }
])); // ➞ [
//  { brand: "NARS", name: "Cosmetics Voyageur Pallete", count: 2 },
//  { brand: "Urban Decay", name: "Naked Honey Pallete", count: 1 },
//  { brand: "Stila", name: "Stay All Day Liquid Lipstick", count: 3 }
// ]

// undefined value
console.log(simplifyList([
  { brand: "NARS", name: "Cosmetics Voyageur Pallete" },
  { brand: "NARS", name: "Cosmetics Voyageur Pallete" },
  { brand: undefined, name: "Naked Honey Pallete" },
  { brand: "Stila", name: "Stay All Day Liquid Lipstick" },
  { brand: "Stila", name: "Stay All Day Liquid Lipstick" },
  { brand: "Stila", name: "Stay All Day Liquid Lipstick" }
]));  // -> [
//  { brand: "NARS", name: "Cosmetics Voyageur Pallete", count: 2 },
//  { brand: undefined, name: "Naked Honey Pallete", count: 1 },
//  { brand: "Stila", name: "Stay All Day Liquid Lipstick", count: 3 }
// ]
//
// // null value
console.log(simplifyList([
  { brand: "NARS", name: "Cosmetics Voyageur Pallete" },
  { brand: "NARS", name: "Cosmetics Voyageur Pallete" },
  { brand: null, name: "Naked Honey Pallete" },
  { brand: "Stila", name: "Stay All Day Liquid Lipstick" },
  { brand: "Stila", name: "Stay All Day Liquid Lipstick" },
  { brand: "Stila", name: "Stay All Day Liquid Lipstick" }
]));  // -> [
//  { brand: "NARS", name: "Cosmetics Voyageur Pallete", count: 2 },
//  { brand: undefined, name: "Naked Honey Pallete", count: 1 },
//  { brand: "Stila", name: "Stay All Day Liquid Lipstick", count: 3 }
// ]

// undefined value
console.log(simplifyList([
  { brand: "NARS", name: "Cosmetics Voyageur Pallete" },
  { brand: "NARS", name: "Cosmetics Voyageur Pallete" },
  { brand: undefined, name: undefined },
  { brand: "Stila", name: "Stay All Day Liquid Lipstick" },
  { brand: "Stila", name: "Stay All Day Liquid Lipstick" },
  { brand: "Stila", name: "Stay All Day Liquid Lipstick" }
]));  // -> [
//  { brand: "NARS", name: "Cosmetics Voyageur Pallete", count: 2 },
//  { brand: undefined, name: "undefined", count: 1 },
//  { brand: "Stila", name: "Stay All Day Liquid Lipstick", count: 3 }
// ]

// one empty object
console.log(simplifyList([
  { brand: "NARS", name: "Cosmetics Voyageur Pallete" },
  { brand: "NARS", name: "Cosmetics Voyageur Pallete" },
  { brand: "Stila", name: "Stay All Day Liquid Lipstick" },
  {},
  { brand: "Stila", name: "Stay All Day Liquid Lipstick" }
])); // -> [
// { brand; "NARS", name: "Cosmetics Voyageur Pallete", count: 2 },
// { brand: "Stila", name" Stay All Day Liquid Lipstick", count: 2 },
// ]

// all empty objects
console.log(simplifyList([{}, {}, {}])); // []

// empty array
console.log(simplifyList([])); // []
