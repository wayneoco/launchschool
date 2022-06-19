function newStack() {
  let stack = [];
  return {
    push(value) {
      stack.push(value);
      return stack.length;
    },
    pop() {
      return stack.pop();
    },
    printStack() {
      for (let index = stack.length - 1; index >= 0; index -= 1) {
        console.log(stack[index]);
      }
    },
  };
}

let stack = newStack();
stack.push(7);
stack.push(3);
stack.push(9);
stack.printStack();
stack.pop();
stack.printStack();
