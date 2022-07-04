'use strict';

const getValue = (selector) => $(selector).val();
const calculateResult = {
  '+': (firstNumber, secondNumber) => firstNumber + secondNumber,
  '-': (firstNumber, secondNumber) => firstNumber - secondNumber,
  '*': (firstNumber, secondNumber) => firstNumber * secondNumber,
  '/': (firstNumber, secondNumber) => firstNumber / secondNumber
};

$(function() {
  $('form').submit(function(e) {
    e.preventDefault();

    const firstNumber = +getValue('#first-number');
    const secondNumber = +getValue('#second-number');
    const operator = getValue('#operator');

    let result = calculateResult[operator](firstNumber, secondNumber);

    const $resultDisplay = $('#result');
    $resultDisplay.text(result);
  });
});


/*

# Problem
Taking two integers and a mathematical operator as input, perform the specified mathematical operation.

- input:
  - strings (representing integers)
  - mathematical operator
- output:
  - integer

# Algorithm
- add 'submit' event listener to 'form' element
  - capture form data as FormData object
  - convert FormData object to plain Object
  - assign form input to variables (input1, input2, operator)
  - assign return value of operation to variable
  - update H1 DOM element textContent with new value
  - clear form
*/
