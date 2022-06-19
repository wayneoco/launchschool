function isBalanced(string) {
  let count = 0;
  let leftRegex = /\(/;
  let rightRegex = /\)/;

  for (let index = 0; index < string.length; index += 1) {
    if (leftRegex.test(string[index])) {
      count += 1;
    } else if (rightRegex.test(string[index])) {
      count -= 1;
    }

    if (count < 0) return false;
  }

  return count === 0;
}

console.log(isBalanced('What (is) this?'));        // true
console.log(isBalanced('What is) this?'));         // false
console.log(isBalanced('What (is this?'));         // false
console.log(isBalanced('((What) (is this))?'));    // true
console.log(isBalanced('((What)) (is this))?'));   // false
console.log(isBalanced('Hey!'));                   // true
console.log(isBalanced(')Hey!('));                 // false
console.log(isBalanced('What ((is))) up('));       // false
