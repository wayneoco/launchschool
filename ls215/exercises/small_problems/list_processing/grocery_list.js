// function buyFruit(list) {
//   return list.flatMap(expandItem);
// }
// 
// function expandItem(item) {
//   let items = [];
//   for (let index = 0; index < item[1]; index += 1) {
//     items.push(item[0]);
//   }
// 
//   return items;
// }

function buyFruit(list) {
  return list.flatMap(item => {
    item.length = item[1];
    return item.fill(item[0], 1, item.length);
  });
}

console.log(buyFruit([['apple', 3], ['orange', 1], ['banana', 2]]));
// returns ["apple", "apple", "apple", "orange", "banana", "banana"]
