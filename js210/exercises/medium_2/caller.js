function makeDoubler(caller) {
  return function(number) {
    console.log(`This function was called by ${caller}.`);
    return number * 2;
  }
}

const doubler = makeDoubler('Victor');
console.log(doubler(5));                             // returns 10
// logs:
// This function was called by Victor.
