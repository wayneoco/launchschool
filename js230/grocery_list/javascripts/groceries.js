'use strict';

class GroceryList {
  constructor(listContainerElement) {
    this.list = document.querySelector(listContainerElement);
  }

  addItem(name, quantity) {
    const listItem = document.createElement('li');
    listItem.append(`${quantity} ${name}`);

    this.list.append(listItem);
  }
}

document.addEventListener('DOMContentLoaded', () => {
  const groceryList = new GroceryList('#grocery-list');
  const getValue = (selector) => form.querySelector(selector).value;

  const form = document.querySelector('form');
  form.addEventListener('submit', e => {
    e.preventDefault();

    const name = getValue('#name');
    const quantity = getValue('#quantity') || '1';

    groceryList.addItem(name, quantity);
    form.reset();
  });
});
