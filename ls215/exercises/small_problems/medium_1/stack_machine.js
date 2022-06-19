/* eslint-disable */

/*
 ### Problem ###
 - input: string
 - output: integer
 - rules:
  - explicit:
    - a REGISTER and a STACK is used to execute a program
      - REGISTER stores a single value; consider this to be a current value
      - stack stores an array of 0 or more values; the values stored in the stack are used to interact with the register value via specific commands
    - when a command interacts with the stack, it interacts with the topmost (last added) value in the stack
    - input string represents a program, which is a series of commands
      - N: place a value, n, in the register
      - PUSH: push the register value onto the stack; keep value in the register
      - ADD: pop a value from the stack, ADD it to the register value and replace the register value with the new value
      - SUB: pop a value from the stack, SUBTRACT it from the register value and replace the register value with the new value
      - MULT: pop a value from the stack, MULTIPLY it by the register value and replace the register value with the new value
      - DIV: pop a value from the stack, DIVIDE the register by it and replace the register value
      - REMAINDER: pop a value from the stack, DIVIDE the register by it and replace the register value with the REMAINDER
      - POP: remove the topmost item from the stack and replace the register value with it
      - PRINT: print the register value
    - all operations are INTEGER operations
    - all input programs are valid programs
    - initialize stack and register to [] and 0

### Data Structures ###
- input: string
- working with input:
  - array and integer, per problem requirements
- output: integer

### Algorithm ###
- define functions for required operations
  - PUSH:
    - arguments: stack, register
    - pushes register value onto stack
  - ADD:
    - arguments: stack, register
    - pop value from stack, add to register
    - return new value


*/

/* eslint-enable */

function minilang(program) {
  let stack = [];
  let register = 0;

  program.split(' ').forEach(command => {
    if (/[0-9]/g.test(command)) {
      register = parseInt(command, 10);
    } else {
      command = getCommand(command);
      register = command(register, stack);
    }
  });

  return program;
}

function getCommand(command, register, stack) {
  switch (command) {
    case 'PUSH':
      return (register, stack) => pushTo(register, stack);
    case 'ADD':
      return (register, stack) => add(register, stack);
    case 'SUB':
      return (register, stack) => sub(register, stack);
    case 'MULT':
      return (register, stack) => mult(register, stack);
    case 'DIV':
      return (register, stack) => div(register, stack);
    case 'REMAINDER':
      return (register, stack) => remainder(register, stack);
    case 'POP':
      return (register, stack) => pop(register, stack);
    case 'PRINT':
      return (register, stack) => print(register, stack);
  }
}

function pushTo(register, stack) {
  stack.push(register);
  return register;
}

function add(register, stack) {
  let value = stack.pop();
  return register + value;
}

function sub(register, stack) {
  let value = stack.pop();
  return register - value;
}

function mult(register, stack) {
  let value = stack.pop();
  return register * value;
}

function div(register, stack) {
  let value = stack.pop();
  return Math.floor(register / value);
}

function remainder(register, stack) {
  let value = stack.pop();
  return Math.floor(register % value);
}

function pop(_, stack) {
  return stack.pop();
}

function print(register) {
  console.log(register);
  return register;
}

minilang('PRINT');
// 0

minilang('5 PUSH 3 MULT PRINT');
// 15

minilang('5 PRINT PUSH 3 PRINT ADD PRINT');
// 5
// 3
// 8

minilang('5 PUSH POP PRINT');
// 5

minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT');
// 5
// 10
// 4
// 7

minilang('3 PUSH PUSH 7 DIV MULT PRINT');
// 6

minilang('4 PUSH PUSH 7 REMAINDER MULT PRINT');
// 12

minilang('-3 PUSH 5 SUB PRINT');
// 8

minilang('6 PUSH');
// (nothing is printed because the `program` argument has no `PRINT` commands)
